<?php
header('Content-Type: text/html; charset=utf-8');
error_reporting(E_ALL);
ini_set('display_errors', 1);

require_once __DIR__ . '/vendor/autoload.php';
require_once __DIR__ . '/config.php';

echo "<pre>\n";
echo "开始测试 Stripe 支付流程...\n";

try {
    \Stripe\Stripe::setApiKey($stripe_config['secret_key']);
    echo "API Key 设置成功\n";
    
    // 创建测试订单数据
    $order_data = array(
        'amount' => 500, // 5 HKD
        'currency' => 'hkd',
        'description' => '测试商品',
        'order_id' => 'TEST' . time()
    );
    
    echo "创建支付会话...\n";
    $session = \Stripe\Checkout\Session::create([
        'payment_method_types' => ['card'],
        'line_items' => [[
            'price_data' => [
                'currency' => $order_data['currency'],
                'product_data' => [
                    'name' => $order_data['description'],
                ],
                'unit_amount' => $order_data['amount'], // 金额单位为分
            ],
            'quantity' => 1,
        ]],
        'mode' => 'payment',
        'success_url' => $stripe_config['success_url'] . '?session_id={CHECKOUT_SESSION_ID}&order_id=' . $order_data['order_id'],
        'cancel_url' => $stripe_config['cancel_url'] . '?order_id=' . $order_data['order_id'],
        'metadata' => [
            'order_id' => $order_data['order_id']
        ],
    ]);
    
    echo "支付会话创建成功!\n";
    echo "会话ID: " . $session->id . "\n";
    echo "\n支付链接生成成功，请点击下面的链接进行支付测试：\n";
    echo "<a href='javascript:void(0)' onclick='startPayment()'>点击这里开始支付测试</a>\n";
    ?>
    <script src="https://js.stripe.com/v3/"></script>
    <script>
        function startPayment() {
            var stripe = Stripe('<?php echo $stripe_config['publishable_key']; ?>');
            stripe.redirectToCheckout({
                sessionId: '<?php echo $session->id; ?>'
            }).then(function (result) {
                if (result.error) {
                    alert(result.error.message);
                }
            });
        }
    </script>
    <?php
    
} catch (\Exception $e) {
    echo "错误: " . $e->getMessage() . "\n";
    echo "错误类型: " . get_class($e) . "\n";
    echo "堆栈跟踪:\n" . $e->getTraceAsString() . "\n";
}
echo "</pre>\n";
?> 