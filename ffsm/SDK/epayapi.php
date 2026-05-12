<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>彩虹易支付</title>
</head>
<?php
/* *
 * 功能：即时到账交易接口接入页
 * 
 * 以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 * 该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
 */

require_once("epay.config.php");
require_once("lib/epay_submit.class.php");

/**************************请求参数**************************/
        // 🔴 修复：自动检测 HTTPS
        $http_type = ((isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] == 'on') || 
                      (isset($_SERVER['HTTP_X_FORWARDED_PROTO']) && $_SERVER['HTTP_X_FORWARDED_PROTO'] == 'https') ||
                      (isset($_SERVER['REQUEST_SCHEME']) && $_SERVER['REQUEST_SCHEME'] == 'https')) 
                      ? 'https://' : 'http://';
        $domainName  = $_SERVER['HTTP_HOST'];
        
        // 🔴 修复：根据 smurl 配置和实际域名确定正确的回调URL
        // 优先使用 smurl（后台配置的主域名），确保 Epay 平台可访问
        $smurl_defined = defined('SMURL') && SMURL != '';
        $callback_domain = $smurl_defined ? SMURL : $domainName;
        
        $notify_url = "{$http_type}{$callback_domain}/SDK/notify_url.php";
        $return_url = "{$http_type}{$callback_domain}/SDK/return_url.php";
        
        // 若 smurl 与实际域名不同，增加调试日志
        if ($smurl_defined && $callback_domain != $domainName) {
            file_put_contents(dirname(__FILE__).'/epay_domain_debug.log', 
                date('Y-m-d H:i:s')." smurl={$callback_domain} actual={$domainName}\n", FILE_APPEND);
        }

        //商户订单号
        $out_trade_no = $_REQUEST['WIDout_trade_no'];

		//支付方式
        $type = $_REQUEST['type'];
        //商品名称
        $name = $_REQUEST['WIDsubject'];
		//付款金额
        $money = $_REQUEST['WIDtotal_fee'];
		//站点名称
        $sitename = '易经学在线测算';

/************************************************************/

//构造要请求的参数数组，无需改动
$parameter = array(
		"pid" => trim($alipay_config['partner']),
		"type" => $type,
		"notify_url"	=> $notify_url,
		"return_url"	=> $return_url,
		"out_trade_no"	=> $out_trade_no,
		"name"	=> $name,
		"money"	=> $money,
		"sitename"	=> $sitename
);

//建立请求
$alipaySubmit = new AlipaySubmit($alipay_config);
$html_text = $alipaySubmit->buildRequestForm($parameter);
echo $html_text;

?>
</body>
</html>