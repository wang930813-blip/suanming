<?php
header('Content-Type: text/html; charset=utf-8');
error_reporting(E_ALL);
ini_set('display_errors', 1);

// 定义日志文件路径
$logFile = __DIR__ . '/test.log';

function writeLog($message) {
    global $logFile;
    file_put_contents($logFile, date('Y-m-d H:i:s') . " - " . $message . "\n", FILE_APPEND);
    echo $message . "\n";
}

writeLog("开始测试 Stripe SDK...");

try {
    writeLog("正在加载 autoload.php...");
    require_once __DIR__ . '/vendor/autoload.php';
    writeLog("autoload.php 加载成功");
    
    writeLog("设置 API Key...");
    \Stripe\Stripe::setApiKey('sk_test_51Q7XLqP3L2CZkfONBIc2y1qjEGUmLhxdsaUBILBgByFl0Ylvqm5OQPIQ3TpIFo9XDIB5lezy50Fn7grnDfoF8wKN00a6B5p2o8');
    writeLog("API Key 设置成功");
    
    writeLog("尝试获取账户余额...");
    $balance = \Stripe\Balance::retrieve();
    writeLog("Stripe SDK 安装成功!");
    writeLog("当前账户余额: " . print_r($balance->available, true));
    
} catch (\Exception $e) {
    writeLog("错误: " . $e->getMessage());
    writeLog("错误类型: " . get_class($e));
    writeLog("堆栈跟踪:\n" . $e->getTraceAsString());
}
  