<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<title>支付订单-<{$zhanming}></title>
<meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link href="css/shop.css" rel="stylesheet" type="text/css">
<link href="/statics/new/css/order.css" rel="stylesheet" type="text/css">
<script src="ziwei/js/jquery-3.4.1.min.js"></script>
<style>
/* 支付按钮样式 - 参考八字精批 */
.public_pay_box {
    padding: 10px 15px;
    background: #fff;
    border-radius: 12px;
    box-shadow: 0 2px 8px rgba(0,0,0,0.06);
    margin-bottom: 15px;
}
.public_pay_box a {
    display: flex;
    align-items: center;
    padding: 16px 18px;
    margin-bottom: 12px;
    border-radius: 12px;
    text-decoration: none;
    transition: all 0.3s ease;
    position: relative;
    overflow: hidden;
}
.public_pay_box a:last-child {
    margin-bottom: 0;
}
.pay_wx {
    background: linear-gradient(135deg, #06ad56 0%, #09bb07 100%);
    box-shadow: 0 4px 15px rgba(6, 173, 86, 0.3);
}
.pay_wx:hover {
    transform: translateY(-2px);
    box-shadow: 0 8px 25px rgba(6, 173, 86, 0.45);
}
.pay_zfb {
    background: linear-gradient(135deg, #1677ff 0%, #4096ff 100%);
    box-shadow: 0 4px 15px rgba(22, 119, 255, 0.3);
}
.pay_zfb:hover {
    transform: translateY(-2px);
    box-shadow: 0 8px 25px rgba(22, 119, 255, 0.45);
}
.pay-icon {
    width: 44px;
    height: 44px;
    display: flex;
    align-items: center;
    justify-content: center;
    background: rgba(255,255,255,0.2);
    border-radius: 50%;
    margin-right: 14px;
    flex-shrink: 0;
}
.pay-icon svg {
    color: #fff;
}
.pay-info {
    flex: 1;
}
.pay-name {
    font-size: 16px;
    color: #ffffff;
    font-weight: 600;
    margin-bottom: 3px;
}
.pay-desc {
    font-size: 12px;
    color: rgba(255,255,255,0.8);
}
.pay-arrow {
    font-size: 13px;
    color: rgba(255,255,255,0.9);
    padding: 6px 14px;
    background: rgba(255,255,255,0.15);
    border-radius: 20px;
    flex-shrink: 0;
    font-weight: 500;
    transition: all 0.3s;
}
.pay_wx:hover .pay-arrow,
.pay_zfb:hover .pay-arrow {
    background: rgba(255,255,255,0.3);
    transform: translateX(3px);
}
.public_pay_tip {
    text-align: center;
    color: #999;
    font-size: 12px;
    margin-top: 5px;
    padding: 5px;
}

.pay-container {
    padding: 15px;
    background: #f5f7fa;
    min-height: 100vh;
}
.pay-order-info {
    background: #fff;
    padding: 20px;
    margin-bottom: 15px;
    border-radius: 12px;
    box-shadow: 0 2px 8px rgba(0,0,0,0.06);
}
.pay-order-info h3 {
    margin: 0 0 15px 0;
    font-size: 18px;
    color: #333;
}
.pay-order-no {
    font-size: 14px;
    color: #666;
    margin-bottom: 10px;
}
.pay-goods-list {
    margin-top: 15px;
}
.pay-goods-item {
    display: flex;
    align-items: center;
    padding: 10px 0;
    border-top: 1px solid #f0f0f0;
}
.pay-goods-thumb {
    width: 60px;
    height: 60px;
    border-radius: 6px;
    overflow: hidden;
    margin-right: 12px;
}
.pay-goods-thumb img {
    width: 100%;
    height: 100%;
    object-fit: cover;
}
.pay-goods-info {
    flex: 1;
}
.pay-goods-name {
    font-size: 14px;
    margin-bottom: 5px;
}
.pay-goods-price {
    font-size: 13px;
    color: #f5576c;
}
.pay-total {
    background: #fff;
    padding: 20px;
    margin-bottom: 15px;
    border-radius: 12px;
    box-shadow: 0 2px 8px rgba(0,0,0,0.06);
    text-align: right;
}
.pay-total-price {
    font-size: 24px;
    color: #f5576c;
    font-weight: bold;
}
.pay-methods {
    background: #fff;
    padding: 20px;
    margin-bottom: 80px;
    border-radius: 12px;
    box-shadow: 0 2px 8px rgba(0,0,0,0.06);
}
.pay-methods h3 {
    margin: 0 0 15px 0;
    font-size: 16px;
    color: #333;
}
.pay-method-item {
    display: flex;
    align-items: center;
    padding: 15px;
    margin-bottom: 10px;
    border: 2px solid #e0e0e0;
    border-radius: 8px;
    cursor: pointer;
    transition: all 0.3s;
}
.pay-method-item.active {
    border-color: #f5576c;
    background: rgba(245, 87, 108, 0.05);
}
.pay-method-icon {
    width: 40px;
    height: 40px;
    margin-right: 12px;
    font-size: 28px;
}
.pay-method-name {
    flex: 1;
    font-size: 15px;
    font-weight: 500;
}
.pay-btn-bar {
    position: fixed;
    bottom: 0;
    left: 0;
    right: 0;
    background: #fff;
    padding: 10px 15px;
    border-top: 1px solid #eee;
    box-shadow: 0 -2px 12px rgba(0,0,0,0.06);
}
.pay-btn {
    width: 100%;
    padding: 14px;
    background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
    color: #fff;
    border: none;
    border-radius: 25px;
    font-size: 16px;
    font-weight: 600;
    cursor: pointer;
}
.pay-btn:disabled {
    background: #ccc;
}

/* 支付成功弹窗 */
.pay-success-overlay {
    position: fixed;
    top: 0; left: 0; right: 0; bottom: 0;
    background: rgba(0,0,0,0.6);
    z-index: 999999;
    display: flex;
    align-items: center;
    justify-content: center;
    animation: fadeIn 0.3s ease;
}
.pay-success-box {
    background: #fff;
    border-radius: 16px;
    padding: 40px 50px;
    text-align: center;
    box-shadow: 0 20px 60px rgba(0,0,0,0.3);
    animation: scaleIn 0.3s ease;
}
.pay-success-icon {
    width: 64px; height: 64px;
    line-height: 64px;
    border-radius: 50%;
    background: linear-gradient(135deg, #09bb07, #1aad19);
    color: #fff;
    font-size: 32px;
    margin: 0 auto 16px;
    text-align: center;
}
.pay-success-text {
    font-size: 20px;
    font-weight: 600;
    color: #333;
    margin-bottom: 8px;
}
.pay-success-loading {
    font-size: 14px;
    color: #999;
}
@keyframes fadeIn {
    from { opacity: 0; }
    to { opacity: 1; }
}
@keyframes scaleIn {
    from { opacity: 0; transform: scale(0.8); }
    to { opacity: 1; transform: scale(1); }
}
</style>
</head>
<body class="shop-page">
<{include file='./ffsm/header.tpl'}>

<div class="pay-container">
    <div class="pay-order-info">
        <h3>订单信息</h3>
        <div class="pay-order-no">订单号：<{$order.order_no}></div>
        <div class="pay-goods-list">
            <{foreach from=$goods_list item=goods}>
            <div class="pay-goods-item">
                <div class="pay-goods-thumb">
                    <img src="<{$goods.goods_thumb|replace:'/ffsm/':''}>" alt="<{$goods.goods_name}>">
                </div>
                <div class="pay-goods-info">
                    <div class="pay-goods-name"><{$goods.goods_name}></div>
                    <div class="pay-goods-price">¥<{$goods.price}> × <{$goods.num}></div>
                </div>
            </div>
            <{/foreach}>
        </div>
    </div>
    
    <div class="pay-total">
        <div style="font-size: 14px; color: #666; margin-bottom: 5px;">订单总额</div>
        <div class="pay-total-price">¥<{$order.total_price}></div>
    </div>
    
    <div class="public_pay_box">
        <a class="pay_wx" href="/?ct=pay&ac=pay_go&oid=<{$order.order_no}>&type=wxpay">
            <div class="pay-icon"><svg viewBox="0 0 24 24" width="28" height="28" fill="currentColor"><path d="M8.5 13.5C7.67 13.5 7 12.83 7 12s.67-1.5 1.5-1.5S10 11.17 10 12s-.67 1.5-1.5 1.5zm7 0c-.83 0-1.5-.67-1.5-1.5s.67-1.5 1.5-1.5S17 11.17 17 12s-.67 1.5-1.5 1.5zM12 2C6.48 2 2 6.48 2 12c0 1.88.52 3.64 1.41 5.14L2 22l5.28-1.5c1.52.79 3.24 1.23 5.14 1.23C17.52 21.72 22 17.2 22 11.84 22 6.48 17.52 2 12 2z"/></svg></div>
            <div class="pay-info">
                <div class="pay-name">微信支付</div>
                <div class="pay-desc">微信安全支付</div>
            </div>
            <div class="pay-arrow">立即支付 →</div>
        </a>
        <a class="pay_zfb" href="/?ct=pay&ac=pay_go&oid=<{$order.order_no}>&type=alipay">
            <div class="pay-icon"><svg viewBox="0 0 24 24" width="28" height="28" fill="currentColor"><path d="M21.422 15.358c-3.22-1.386-6.847-2.408-8.375-4.308 1.793-1.988 3.136-4.05 3.136-6.552 0-1.21-.472-2.408-1.302-3.276h-7.69v1.26h5.423c.183.256.336.543.336.883 0 1.45-1.109 3.134-2.645 4.387C8.565 7.844 6.916 6.14 5.386 3.482H2v1.365h2.814c1.214 1.777 2.898 3.832 4.734 5.223-2.16 1.467-5.208 2.629-8.232 3.612l-.146.384.493.221c2.448-1.24 5.716-2.307 8.21-3.317 1.467 1.214 3.455 1.924 5.538 1.924.45 0 .888-.037 1.32-.1l.088.026c-.53.992-1.426 1.876-2.991 2.389l.008-.003c-2.736.896-5.643.675-7.976.675-3.407 0-5.621.647-6.483 1.715C2.195 17.479 2.975 21 12 21c5.261 0 9.241-2.147 10.46-5.264-.04.022-.214-.146-.278-.188l-.76-.19z"/></svg></div>
            <div class="pay-info">
                <div class="pay-name">支付宝支付</div>
                <div class="pay-desc">支付宝安全支付</div>
            </div>
            <div class="pay-arrow">立即支付 →</div>
        </a>
    </div>
    <div class="public_pay_tip">🔒 支付过程安全加密 · 支付后自动跳转</div>
</div>

<script>
// 支付状态轮询检测
var inquiry_lock = 0;
$(function () {
    setInterval(function () {
        inquiry();
    }, 2000);
});
function inquiry() {
    if (inquiry_lock) {
        return;
    }
    $.get('/?ct=pay&ac=scanquery&oid=<{$order.order_no}>', {t: Date.parse(new Date())}, function (data) {
        if (data.status) {
            inquiry_lock = 1;
            // 显示支付成功提示
            $('body').append('<div class="pay-success-overlay"><div class="pay-success-box"><div class="pay-success-icon">✓</div><div class="pay-success-text">支付成功</div><div class="pay-success-loading">正在跳转...</div></div></div>');
            setTimeout(function () {
                window.location.href = '/?ac=shop';
            }, 1500);
        }
    }, 'json');
}
</script>

</body>
</html>
