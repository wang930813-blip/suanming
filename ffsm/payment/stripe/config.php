<?php
/**
 * Stripe支付配置文件
 */

// 从数据库获取 Stripe 配置
$stripe_secret_key = db::get_one("SELECT config FROM `system` WHERE `name` = 'stripe_secret_key'");
$stripe_public_key = db::get_one("SELECT config FROM `system` WHERE `name` = 'stripe_public_key'");
$stripe_webhook_secret = db::get_one("SELECT config FROM `system` WHERE `name` = 'stripe_webhook_secret'");
$stripe_currency = db::get_one("SELECT config FROM `system` WHERE `name` = 'stripe_currency'");
$stripe_mode = db::get_one("SELECT config FROM `system` WHERE `name` = 'stripe_mode'");

$stripe_config = array(
    // Stripe API密钥
    'secret_key'      => $stripe_secret_key['config'],
    'publishable_key' => $stripe_public_key['config'],
    
    // 支付成功后的回调地址
    'success_url' => 'http://cs.400110.cn/payment/stripe/success.php',
    'cancel_url'  => 'http://cs.400110.cn/payment/stripe/cancel.php',
    
    // 异步通知地址
    'webhook_secret' => $stripe_webhook_secret['config'],
    'webhook_url'    => 'http://cs.400110.cn/payment/stripe/webhook.php',
    
    // 货币设置
    'currency'       => $stripe_currency['config'],
    
    // 其他设置
    'mode'          => $stripe_mode['config'],
); 