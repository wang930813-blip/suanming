<?php
require 'config.php';
require_once __DIR__ . '/vendor/autoload.php';

// 设置Stripe API密钥
\Stripe\Stripe::setApiKey($stripe_config['secret_key']);

// 获取订单信息
$out_trade_no = isset($_REQUEST['WIDout_trade_no']) ? $_REQUEST['WIDout_trade_no'] : ''; // 订单号
$total_amount = isset($_REQUEST['WIDtotal_amount']) ? $_REQUEST['WIDtotal_amount'] : 0;   // 支付金额
$subject = isset($_REQUEST['WIDsubject']) ? $_REQUEST['WIDsubject'] : '';            // 商品名称
$body = isset($_REQUEST['WIDbody']) ? $_REQUEST['WIDbody'] : '';                  // 商品描述

try {
    // 创建Stripe支付会话
    $session = \Stripe\Checkout\Session::create([
        'payment_method_types' => ['card'],
        'line_items' => [[
            'price_data' => [
                'currency' => $stripe_config['currency'],
                'product_data' => [
                    'name' => $subject,
                    'description' => $body,
                ],
                'unit_amount' => $total_amount,
            ],
            'quantity' => 1,
        ]],
        'mode' => 'payment',
        'success_url' => $stripe_config['success_url'] . '?session_id={CHECKOUT_SESSION_ID}&order_id=' . $out_trade_no,
        'cancel_url' => $stripe_config['cancel_url'] . '?order_id=' . $out_trade_no,
        'metadata' => [
            'order_id' => $out_trade_no,
        ],
    ]);

    // 输出支付页面
    ?>
    <!DOCTYPE html>
    <html>
    <head>
        <title>正在跳转到支付页面 - <?php echo $subject; ?></title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="https://js.stripe.com/v3/"></script>
        <style>
            body { font-family: Arial, sans-serif; margin: 0; padding: 20px; background: #f0f2f5; }
            .container { max-width: 600px; margin: 0 auto; text-align: center; }
            .loading { margin: 20px 0; }
            .message { color: #666; }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="loading">
                <img src="/statics/ffsm/payment/loading.gif" alt="loading">
            </div>
            <p class="message">正在跳转到支付页面，请稍候...</p>
        </div>
        <script>
            var stripe = Stripe('<?php echo $stripe_config['publishable_key']; ?>');
            stripe.redirectToCheckout({
                sessionId: '<?php echo $session->id; ?>'
            }).then(function (result) {
                if (result.error) {
                    alert('支付发起失败：' + result.error.message);
                }
            });
        </script>
    </body>
    </html>
    <?php
} catch(Exception $e) {
    echo '支付发起失败：' . $e->getMessage();
} 