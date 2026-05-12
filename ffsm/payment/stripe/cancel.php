<?php
require 'config.php';

// 获取订单ID
$order_id = $_GET['order_id'] ?? '';

if (!$order_id) {
    echo '参数错误';
    exit;
}

// TODO: 可以在这里添加订单取消的处理逻辑
// 例如：更新订单状态为"已取消"等

// 跳转回订单页面
header('Location: /?ct=pay&ac=order&oid=' . $order_id);
exit;