<?php
defined('SYS_PAYPAL') or exit('error');
//配置目录
$sys_all = @db::fetch_all(@db::query('SELECT * FROM `system`'));
foreach ($sys_all as $key => $sys_vel) {
    if ($sys_vel['name'] == 'paypal_clientId') {
        define('paypal_clientId', $sys_vel['config']);
    }
    if ($sys_vel['name'] == 'paypal_clientSecret') {
        define('paypal_clientSecret', $sys_vel['config']);
    }
    if ($sys_vel['name'] == 'smurl') {
        define('SMURL', $sys_vel['config']);
    }
}
