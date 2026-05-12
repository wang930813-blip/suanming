<?php
// 🔴 修复：切换到根目录，使 ./core/init.php 等相对路径能正确解析
$root_path = dirname(__DIR__);
chdir($root_path);

// 商城路由不在这里处理
if($_REQUEST['ac'] != 'shop' && $_REQUEST['ct']==''){
    $cts = 'ffsm_h5_index';
}
if($_REQUEST['ac']=='rtcaiyun' || $_REQUEST['ac']=='rtcaiyun_example'){
    $cts = 'ffsm_sm_ssys';
}
$ctsff_arr=array('ssxo','ssjf','ssjs','ssjk','ssjj','sslg','ssnvp','ssnnp','ssvvp','sscwy','sssx','sscp');
if(in_array($_REQUEST['ac'], $ctsff_arr)){
    $cts = 'ffsm_sm_'.$_REQUEST['ac'];
}
require_once './index.php';
