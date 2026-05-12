<?php
// 引入框架配置
require_once dirname(dirname(dirname(dirname(__FILE__)))).'/config/inc_config.php';

// 引入 Stripe 相关文件
require 'config.php';
require_once __DIR__ . '/vendor/autoload.php';

// 获取POST数据（使用 php://input 而不是 $HTTP_RAW_POST_DATA）
$payload = file_get_contents('php://input');
$sig_header = isset($_SERVER['HTTP_STRIPE_SIGNATURE']) ? $_SERVER['HTTP_STRIPE_SIGNATURE'] : '';

try {
    // 记录webhook调用
    error_log("Stripe Webhook called. Payload: " . $payload);
    error_log("Stripe Signature: " . $sig_header);
    
    // 验证Webhook签名
    $event = \Stripe\Webhook::constructEvent(
        $payload, $sig_header, $stripe_config['webhook_secret']
    );

    // 处理支付成功事件
    if ($event->type == 'checkout.session.completed') {
        $session = $event->data->object;
        
        // 从 metadata 中获取订单号
        $order_id = isset($session->metadata->order_id) ? $session->metadata->order_id : null;
        
        // 支付金额（单位：分）
        $amount_paid = $session->amount_total;
        
        // 记录订单信息
        error_log("Processing Stripe payment for order: " . ($order_id ? $order_id : 'Unknown'));
        error_log("Payment amount: " . $amount_paid);
        
        // 更新订单状态
        if($order_id) {
            try {
                // 使用 addslashes 处理字符串
                $payment_intent = addslashes($session->payment_intent);
                $safe_order_id = addslashes($order_id);
                $current_time = date('Y-m-d G:i:s', time());
                
                // 🔴 修复：金额验证，防止金额被篡改
                $amount_paid_cents = $session->amount_total; // Stripe 返回的单位是分
                
                // 查询订单
                $order_sql = "SELECT * FROM ffsm_orders WHERE oid = '{$safe_order_id}' LIMIT 1";
                $order_result = db::querylist($order_sql);
                
                if (!empty($order_result[0])) {
                    $db_order = $order_result[0];
                    $expected_amount = intval(floatval($db_order['money']) * 100); // 转换为分
                    
                    // 金额校验：实际支付金额必须 >= 订单金额
                    if ($amount_paid_cents < $expected_amount) {
                        error_log("Stripe Webhook: Amount mismatch for order {$order_id}. Expected: {$expected_amount}, Got: {$amount_paid_cents}");
                        http_response_code(400);
                        echo json_encode(['error' => 'amount mismatch']);
                        exit();
                    }
                    
                    // 使用 mod_order 类更新订单状态
                    $update_data = array(
                        'trade_status' => $payment_intent,
                        'status' => 1,
                        'paytime' => $current_time
                    );
                    $where = " `oid`='".$safe_order_id."'";
                    
                    if(mod_order::up_order($update_data, $where)) {
                        error_log("Order status updated successfully for order: " . $order_id);
                    } else {
                        error_log("Failed to update order status for order: " . $order_id);
                    }
                } else {
                    error_log("Order not found in database: " . $order_id);
                    http_response_code(400);
                    echo json_encode(['error' => 'order not found']);
                    exit();
                }
            } catch(Exception $e) {
                error_log("Database Error: " . $e->getMessage());
            }
        } else {
            error_log("No order_id found in session metadata");
        }
        
        http_response_code(200);
        echo json_encode(['status' => 'success']);
    } else {
        error_log("Unhandled event type: " . $event->type);
        http_response_code(200);
        echo json_encode(['status' => 'ignored']);
    }
} catch(\UnexpectedValueException $e) {
    // 签名验证失败
    error_log("Stripe Webhook Error (UnexpectedValueException): " . $e->getMessage());
    http_response_code(400);
    echo json_encode(['error' => $e->getMessage()]);
    exit();
} catch(\Stripe\Exception\SignatureVerificationException $e) {
    // 签名验证失败
    error_log("Stripe Webhook Error (SignatureVerificationException): " . $e->getMessage());
    http_response_code(400);
    echo json_encode(['error' => $e->getMessage()]);
    exit();
} catch(Exception $e) {
    // 其他错误
    error_log("Stripe Webhook Error (General): " . $e->getMessage());
    http_response_code(500);
    echo json_encode(['error' => $e->getMessage()]);
    exit();
} 