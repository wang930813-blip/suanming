<?php
require 'config.php';
require_once __DIR__ . '/vendor/autoload.php';

// 设置Stripe API密钥
\Stripe\Stripe::setApiKey($stripe_config['secret_key']);

$session_id = isset($_GET['session_id']) ? $_GET['session_id'] : '';
$order_id = isset($_GET['order_id']) ? $_GET['order_id'] : '';

if (!$session_id || !$order_id) {
    echo '参数错误';
    exit;
}

try {
    // 验证支付会话
    $session = \Stripe\Checkout\Session::retrieve($session_id);
    
    if ($session->payment_status === 'paid') {
        // 支付成功，跳转到订单完成页面
        header('Location: /?ct=pay&ac=notify_stripe&out_trade_no=' . $order_id . '&trade_no=' . $session->payment_intent);
        exit;
    } else {
        echo '支付未完成';
    }
} catch(Exception $e) {
    echo '验证支付状态失败：' . $e->getMessage();
} 