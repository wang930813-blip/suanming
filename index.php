<?php

if(isset($_GET['dl']) && $_GET['dl']!=""){
	$expire=time()+60*60*24;
	setcookie("dl", $_GET['dl'], $expire);
}

header('Content-Type: text/html; charset=utf-8');
$page_start_time = microtime(true); 
// 🔴 修复：使用绝对路径，不受当前工作目录影响
require dirname(__FILE__) . '/core/init.php';
$config_pool_name = $config_appname  =  $config_cp_url = '';

// Legacy H5 templates and DB links often point to /?ac=xxx while the H5
// frontend is mounted at /ffsm/. Route those root-level requests to the H5
// controller so old links do not fall through to ctl_index and render blank.
$h5_actions = array(
	'bazi', 'bazizh', 'bzyy', 'dashi', 'ffqm', 'hehun', 'history', 'jrys',
	'jrys_ajax', 'shengxiao', 'taluowenda', 'xingzuo', 'zejiri', 'ziwei',
	'bazijp'
);
if(req::item('ct') == '' && in_array(req::item('ac'), $h5_actions)){
	$cts = 'ffsm_h5_index';
}

// 商城路由：允许通过 /?ac=shop 访问
if(req::item('ac') == 'shop' && (req::item('ct') == '' || req::item('ct') == 'index')){
	$cts = 'shop';
}

// 只在需要时才设置 ct，不修改已有的 ac
if(isset($cts) && in_array($cts, $cts_arr)){
	req::$forms['ct'] = $cts;
	// 只有当 $cts 是 shop 时才修改 ac
	if($cts == 'shop'){
		req::$forms['ac'] = 'index';
	}
}
run_controller();
