<?php
/* *
 * 功能：支付宝服务器异步通知页面
 * 版本：2.0
 * 修改日期：2016-11-01
 * 说明：
 * 以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。

 *************************页面功能说明*************************
 * 创建该页面文件时，请留心该页面文件中无任何HTML代码及空格。
 * 该页面不能在本机电脑测试，请到服务器上做测试。请确保外部可以访问该页面。
 * 如果没有收到该页面返回的 success 信息，支付宝会在24小时内按一定的时间策略重发通知
 */
require_once("config.php");
require_once 'wappay/service/AlipayTradeService.php';


$arr=$_POST;
$alipaySevice = new AlipayTradeService($config); 
$alipaySevice->writeLog(var_export($_POST,true));
$result = $alipaySevice->check($arr);

/* 实际验证过程建议商户添加以下校验。
1、商户需要验证该通知数据中的out_trade_no是否为商户系统中创建的订单号，
2、判断total_amount是否确实为该订单的实际金额（即商户订单创建时的金额），
3、校验通知中的seller_id（或者seller_email) 是否为out_trade_no这笔单据的对应的操作方（有的时候，一个商户可能有多个seller_id/seller_email）
4、验证app_id是否为该商户本身。
*/
if($result) {//验证成功
	
	//获取支付宝的通知返回参数
	$out_trade_no = $_POST['out_trade_no'];
	$trade_no = $_POST['trade_no'];
	$trade_status = $_POST['trade_status'];
	$total_amount = $_POST['total_amount'];

	// 引入框架配置，使用框架数据库连接
	define('CORE', dirname(__FILE__));
	require_once dirname(dirname(dirname(dirname(__FILE__)))).'/config/inc_config.php';
	
	// 查询订单，验证金额一致性
	$order_sql = "SELECT * FROM `ffsm_orders` WHERE `oid` = '".addslashes($out_trade_no)."' LIMIT 1";
	$order_query = mysql_query($order_sql);
	$order_row = mysql_fetch_assoc($order_query);
	
	if ($order_row) {
	    // 金额验证：防止金额被篡改
	    $db_amount = floatval($order_row['money']);
	    $notify_amount = floatval($total_amount);
	    
	    if (abs($db_amount - $notify_amount) > 0.01) {
	        // 金额不匹配，记录日志但不返回success（防止支付宝认为处理成功）
	        file_put_contents(dirname(__FILE__).'/amount_mismatch.log', date('Y-m-d H:i:s')." 订单{$out_trade_no} 金额不匹配: 数据库={$db_amount}, 通知={$notify_amount}\n", FILE_APPEND);
	        echo "fail";
	        exit;
	    }
	    
	    // 只在 TRADE_SUCCESS 或 TRADE_FINISHED 时更新订单
	    if ($trade_status == 'TRADE_SUCCESS' || $trade_status == 'TRADE_FINISHED') {
	        // 检查是否已经处理过，避免重复更新
	        if ($order_row['status'] != 1) {
	            $update_sql = "UPDATE `ffsm_orders` SET 
	                `status` = '1', 
	                `paytype` = '2', 
	                `paytime` = NOW(),
	                `trade_status` = '".addslashes($trade_no)."'
	                WHERE `oid` = '".addslashes($out_trade_no)."' AND `status` != '1'";
	            mysql_query($update_sql);
	            
	            // 记录成功日志
	            file_put_contents(dirname(__FILE__).'/notify_success.log', date('Y-m-d H:i:s')." 订单{$out_trade_no} 支付成功，交易号:{$trade_no}\n", FILE_APPEND);
	        }
	    }
	} else {
	    // 订单不存在
	    file_put_contents(dirname(__FILE__).'/notify_error.log', date('Y-m-d H:i:s')." 订单{$out_trade_no} 不存在\n", FILE_APPEND);
	    echo "fail";
	    exit;
	}
	
	echo "success";		//请不要修改或删除
		
} else {
    //验证失败
    echo "fail";	//请不要修改或删除
}

?>

