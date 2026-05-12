<?php 
ini_set('date.timezone','Asia/Shanghai');
//error_reporting(E_ERROR);
//require_once "../lib/WxPay.Api.php";
require_once '../lib/WxPay.Data.php';
define('CORE', dirname(__FILE__));
require_once '../../../../config/inc_config.php';

/**
 * 微信扫码支付(Native)成功回调
 * 🔴 修复：替换 mysql_* 为 mysqli，添加错误处理和金额验证
 */

    //获取通知的数据
    $xml = isset($GLOBALS['HTTP_RAW_POST_DATA']) ? $GLOBALS['HTTP_RAW_POST_DATA'] : file_get_contents("php://input");
    
	if(!$xml){
		die('null');
	}

    // 签名验证（WxPayResults::Init 内部会调用 CheckSign）
    try {
        $result = WxPayResults::Init($xml);
    } catch (Exception $e) {
        file_put_contents(dirname(__FILE__).'/native_callback_error.log', date('Y-m-d H:i:s')." 签名验证失败: ".$e->getMessage()."\n", FILE_APPEND);
        die('sign error');
    }
    
    file_put_contents('result.txt',json_encode($result));

    // 🔴 修复：使用 mysqli 替代废弃的 mysql_* 函数
    $db_host = $GLOBALS['config']['db']['host']['master'];
    $db_user = $GLOBALS['config']['db']['user'];
    $db_pass = $GLOBALS['config']['db']['pass'];
    $db_name = $GLOBALS['config']['db']['name'];
    
    $mysqli = @new mysqli($db_host, $db_user, $db_pass, $db_name);
    if ($mysqli->connect_error) {
        file_put_contents(dirname(__FILE__).'/native_callback_error.log', date('Y-m-d H:i:s')." 数据库连接失败: ".$mysqli->connect_error."\n", FILE_APPEND);
        die('db error');
    }
    $mysqli->set_charset('utf8');

    $oid = isset($result['out_trade_no']) ? $result['out_trade_no'] : '';
    $total_fee = isset($result['total_fee']) ? intval($result['total_fee']) : 0;
    $transaction_id = isset($result['transaction_id']) ? $result['transaction_id'] : '';
    
    if($result['return_code']=='SUCCESS' && $result['result_code']=='SUCCESS' && !empty($oid)){
        
        // 🔴 修复：查询订单并验证金额
        $safe_oid = $mysqli->real_escape_string($oid);
        $order_result = $mysqli->query("SELECT `money`, `status` FROM `ffsm_orders` WHERE `oid` = '{$safe_oid}' LIMIT 1");
        
        if ($order_result && $order_row = $order_result->fetch_assoc()) {
            // 金额验证：微信返回的 total_fee 单位是分
            $expected_amount = intval(floatval($order_row['money']) * 100);
            
            if ($total_fee < $expected_amount) {
                // 金额不匹配，拒绝更新
                file_put_contents(dirname(__FILE__).'/native_callback_error.log', 
                    date('Y-m-d H:i:s')." 订单{$oid} 金额不匹配: 期望={$expected_amount}, 实际={$total_fee}\n", FILE_APPEND);
                echo '<xml><return_code><![CDATA[FAIL]]></return_code><return_msg><![CDATA[amount mismatch]]></return_msg></xml>';
                $mysqli->close();
                exit;
            }
            
            // 检查是否已处理过
            if ($order_row['status'] != 1) {
                $safe_transaction_id = $mysqli->real_escape_string($transaction_id);
                $sql = "UPDATE `ffsm_orders` SET 
                    `status` = '1', 
                    `paytype` = '1', 
                    `paytime` = NOW(),
                    `trade_status` = '{$safe_transaction_id}'
                    WHERE `oid` = '{$safe_oid}' AND `status` != '1'";
                
                if ($mysqli->query($sql)) {
                    file_put_contents(dirname(__FILE__).'/native_callback_success.log', 
                        date('Y-m-d H:i:s')." 订单{$oid} 支付成功 交易号:{$transaction_id}\n", FILE_APPEND);
                } else {
                    file_put_contents(dirname(__FILE__).'/native_callback_error.log', 
                        date('Y-m-d H:i:s')." 订单{$oid} 更新失败: ".$mysqli->error."\n", FILE_APPEND);
                }
            }
            
            // 回复微信处理成功
            echo '<xml><return_code><![CDATA[SUCCESS]]></return_code><return_msg><![CDATA[OK]]></return_msg></xml>';
        } else {
            file_put_contents(dirname(__FILE__).'/native_callback_error.log', 
                date('Y-m-d H:i:s')." 订单{$oid} 查询失败或不存在\n", FILE_APPEND);
            echo '<xml><return_code><![CDATA[FAIL]]></return_code><return_msg><![CDATA[order not found]]></return_msg></xml>';
        }
        
        $mysqli->close();
    } else {
        echo '<xml><return_code><![CDATA[FAIL]]></return_code><return_msg><![CDATA[invalid params]]></return_msg></xml>';
    }
