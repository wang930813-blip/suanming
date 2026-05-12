<?php
define('SYS_PAYPAL', __DIR__ . '/');
require '../../../core/init.php';
require("config.php");
require("paypal_class.php");
$ac = req::item('ac');
$oid = req::item('oid');
$out_trade_no = req::item('WIDout_trade_no');
$subject      = req::item('WIDsubject');
$total_amount = req::item('WIDtotal_fee');
$Paypal = new Paypal($out_trade_no, $subject, $total_amount, $ac);
if($ac == 'notify'){
    $Paypal->success($oid);
    exit;    
}
$ret = $Paypal->create();
?>
<!doctype html>
<html>

<head>
	<meta charset="utf8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0">
	<title>支付失败</title>
</head>

<body>
	<center>支付失败返回,请重试！</center>
	<script>
		setTimeout(function() {
			// 2秒后执行跳转
			window.location.href = '<?php echo "http://" . SMURL . "/?ac=" . $ac . "&oid=" . $out_trade_no . "&token=" . base64_encode(md5($out_trade_no)); ?>'; // 替换为您想要跳转的URL
		}, 2000); // 2000毫秒后执行
	</script>
</body>

</html>