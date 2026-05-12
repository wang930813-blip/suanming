<?php
/* *
 * 功能：彩虹易支付异步通知页面
 * 🔴 修复：移除 if(1==1) 占位、添加 SQL 注入防护、添加金额验证、同步更新 shop_order
 * 🔴 修复：添加debug日志便于排查回调失败原因
 */

require_once("epay.config.php");
require_once("lib/epay_notify.class.php");

// 🔴 修复：记录原始回调数据（用于调试）
$log_file = dirname(__FILE__).'/epay_callback.log';
$log_data = date('Y-m-d H:i:s').' [NOTIFY] GET='.json_encode($_GET).' POST='.json_encode($_POST)."\n";
file_put_contents($log_file, $log_data, FILE_APPEND);

//计算得出通知验证结果
$alipayNotify = new AlipayNotify($alipay_config);
$verify_result = $alipayNotify->verifyNotify();

if($verify_result) {//验证成功
	file_put_contents($log_file, date('Y-m-d H:i:s').' [NOTIFY] 验证成功'."\n", FILE_APPEND);
	
	//商户订单号
	// 🔴 修复：同时兼容 GET 和 POST
	$out_trade_no = isset($_GET['out_trade_no']) ? trim($_GET['out_trade_no']) : (isset($_POST['out_trade_no']) ? trim($_POST['out_trade_no']) : '');
	$trade_no = isset($_GET['trade_no']) ? trim($_GET['trade_no']) : (isset($_POST['trade_no']) ? trim($_POST['trade_no']) : '');
	$trade_status = isset($_GET['trade_status']) ? $_GET['trade_status'] : (isset($_POST['trade_status']) ? $_POST['trade_status'] : '');
	$type = isset($_GET['type']) ? $_GET['type'] : (isset($_POST['type']) ? $_POST['type'] : '');
	$money = isset($_GET['money']) ? floatval($_GET['money']) : (isset($_POST['money']) ? floatval($_POST['money']) : 0);

	if ($trade_status == 'TRADE_SUCCESS' && !empty($out_trade_no)) {
		// 🔴 修复：SQL 注入防护
		$safe_oid = addslashes($out_trade_no);
		
		$orders = @db::queryone("select * from `ffsm_orders` where oid='{$safe_oid}'");
        if($orders && $orders['status']!=1){
            // 🔴 修复：金额验证，防止金额被篡改
            $db_money = floatval($orders['money']);
            if (abs($db_money - $money) > 0.01) {
                // 金额不匹配，记录日志
                $err_msg = date('Y-m-d H:i:s')." 订单{$out_trade_no} 金额不匹配: 数据库={$db_money}, 通知={$money}\n";
                file_put_contents(dirname(__FILE__).'/epay_amount_error.log', $err_msg, FILE_APPEND);
                file_put_contents($log_file, $err_msg, FILE_APPEND);
                echo "fail";
                exit;
            }
            
            // 🔴 修复：更新订单状态
            $safe_trade_no = addslashes($trade_no);
            @db::update('ffsm_orders', array(
                'trade_status' => $safe_trade_no,
                'status' => 1,
                'paytime' => time()
            ), "oid='{$safe_oid}' AND status!=1");
            
            file_put_contents($log_file, date('Y-m-d H:i:s')." 订单{$out_trade_no} 更新成功\n", FILE_APPEND);
            
            // 🔴 修复：如果是商城订单（type=99），同步更新 shop_order 表
            if ($orders['type'] == 99) {
                @db::query("UPDATE shop_order SET pay_status=1, pay_time=" . time() . ", pay_type='{$safe_trade_no}' WHERE order_no='{$safe_oid}' AND pay_status!=1");
                file_put_contents($log_file, date('Y-m-d H:i:s')." 商城订单{$out_trade_no} shop_order同步更新\n", FILE_APPEND);
            }
        } else {
            file_put_contents($log_file, date('Y-m-d H:i:s')." 订单{$out_trade_no} 无需更新（不存在或已支付）\n", FILE_APPEND);
        }
    }

	echo "success";		//请不要修改或删除
}
else {
    //验证失败
    file_put_contents($log_file, date('Y-m-d H:i:s').' [NOTIFY] 验证失败！检查partner/key配置'."\n", FILE_APPEND);
    echo "fail";
}
?>