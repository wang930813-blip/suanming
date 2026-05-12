<?php
/* * 
 * 功能：彩虹易支付页面跳转同步通知页面
 * 🔴 修复：添加调试日志
 */

require_once("epay.config.php");
require_once("lib/epay_notify.class.php");

// 🔴 修复：记录同步回调数据
$log_file = dirname(__FILE__).'/epay_callback.log';
file_put_contents($log_file, date('Y-m-d H:i:s').' [RETURN] GET='.json_encode($_GET)."\n", FILE_APPEND);

?>
<!DOCTYPE HTML>
<html>
    <head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<?php
//计算得出通知验证结果
$alipayNotify = new AlipayNotify($alipay_config);
$verify_result = $alipayNotify->verifyReturn();
if($verify_result) {//验证成功
    file_put_contents($log_file, date('Y-m-d H:i:s').' [RETURN] 验证成功'."\n", FILE_APPEND);
    
	$out_trade_no = $_GET['out_trade_no'];
	$trade_no = $_GET['trade_no'];
	$trade_status = $_GET['trade_status'];
	$type = $_GET['type'];
	
	$orders = array('out_trade_no'=>$out_trade_no,'trade_no'=>$trade_no,'trade_status'=>$trade_status);
	$gourl = '/?ct=pay&ac=notify_yzf&'.http_build_query($orders);

	header("Location:$gourl");
	die;

    if($_GET['trade_status'] == 'TRADE_SUCCESS') {
    }
    else {
      echo "trade_status=".$_GET['trade_status'];
    }

	echo "验证成功<br />";
}
else {
    file_put_contents($log_file, date('Y-m-d H:i:s').' [RETURN] 验证失败！检查partner/key配置'."\n", FILE_APPEND);
    echo "验证失败";
}
?>
        <title>彩虹易支付即时到账交易接口</title>
	</head>
    <body>
    </body>
</html>