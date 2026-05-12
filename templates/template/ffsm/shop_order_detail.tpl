<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<title><{$page_title}>-订单详情-<{$zhanming}></title>
<meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link href="css/shop.css" rel="stylesheet" type="text/css">
<style>
.order-detail {
    padding: 15px;
    background: #f5f7fa;
    min-height: 100vh;
}
.detail-card {
    background: #fff;
    border-radius: 12px;
    padding: 20px;
    margin-bottom: 15px;
    box-shadow: 0 2px 8px rgba(0,0,0,0.06);
}
.detail-card h3 {
    font-size: 16px;
    margin: 0 0 15px 0;
    color: #333;
    border-bottom: 1px solid #eee;
    padding-bottom: 10px;
}
.detail-row {
    display: flex;
    padding: 8px 0;
    font-size: 14px;
}
.detail-label {
    width: 80px;
    color: #666;
}
.detail-value {
    flex: 1;
    color: #333;
}
.goods-list {
    padding: 0;
    margin: 0;
}
.goods-card {
    display: flex;
    gap: 12px;
    padding: 12px;
    background: #fafafa;
    border-radius: 8px;
    margin-bottom: 10px;
}
.goods-card:last-child {
    margin-bottom: 0;
}
.goods-image {
    width: 85px;
    height: 85px;
    flex-shrink: 0;
    border-radius: 6px;
    overflow: hidden;
    background: #fff;
}
.goods-image img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    display: block;
}
.goods-details {
    flex: 1;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    min-width: 0;
}
.goods-title {
    font-size: 14px;
    font-weight: 500;
    color: #333;
    line-height: 1.5;
    margin: 0 0 auto 0;
    display: -webkit-box;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
    overflow: hidden;
}
.goods-meta {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-top: 8px;
}
.goods-price-text {
    font-size: 16px;
    font-weight: 600;
    color: #ff4757;
}
.goods-quantity {
    font-size: 13px;
    color: #999;
}
.status-badge {
    display: inline-block;
    padding: 4px 12px;
    border-radius: 12px;
    font-size: 12px;
}
.status-0 {
    background: #fff3cd;
    color: #856404;
}
.status-1 {
    background: #d1ecf1;
    color: #0c5460;
}
.total-price {
    text-align: right;
    font-size: 16px;
    color: #333;
    font-weight: 500;
    margin-top: 15px;
    padding-top: 15px;
    border-top: 1px solid #eee;
}
.total-price::after {
    content: '';
    display: block;
}
.action-buttons {
    display: flex;
    gap: 12px;
    padding: 20px 0 10px 0;
}
.btn-action {
    flex: 1;
    padding: 15px 20px;
    text-align: center;
    border-radius: 30px;
    text-decoration: none;
    font-size: 16px;
    font-weight: 600;
    transition: all 0.3s ease;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
}
.btn-primary {
    background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
    color: #fff;
    border: none;
    box-shadow: 0 4px 15px rgba(245, 87, 108, 0.4);
}
.btn-primary:active {
    transform: translateY(2px);
    box-shadow: 0 2px 8px rgba(245, 87, 108, 0.3);
}
.btn-secondary {
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    color: #fff;
    border: none;
    box-shadow: 0 4px 15px rgba(102, 126, 234, 0.4);
}
.btn-secondary:active {
    transform: translateY(2px);
    box-shadow: 0 2px 8px rgba(102, 126, 234, 0.3);
}
.btn-back {
    display: block;
    padding: 15px 40px;
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    color: #fff;
    text-align: center;
    border-radius: 30px;
    text-decoration: none;
    border: none;
    font-size: 16px;
    font-weight: 600;
    margin: 15px auto 0;
    box-shadow: 0 4px 15px rgba(102, 126, 234, 0.4);
    transition: all 0.3s ease;
}
.btn-back:active {
    transform: translateY(2px);
    box-shadow: 0 2px 8px rgba(102, 126, 234, 0.3);
}
</style>
<{$page_meta}>
</head>
<body class="shop-page">
<{include file='./ffsm/header.tpl'}>

<div class="order-detail">
    <div class="detail-card">
        <h3>订单信息</h3>
        <div class="detail-row">
            <div class="detail-label">订单号：</div>
            <div class="detail-value"><{$order.order_no}></div>
        </div>
        <div class="detail-row">
            <div class="detail-label">订单状态：</div>
            <div class="detail-value">
                <{if $order.pay_status == 0}>
                <span class="status-badge status-0">待支付</span>
                <{else}>
                <span class="status-badge status-1">已支付</span>
                <{/if}>
                
                <{if $order.ship_status == 0}>
                <span class="status-badge status-0">待发货</span>
                <{elseif $order.ship_status == 1}>
                <span class="status-badge status-1">已发货</span>
                <{else}>
                <span class="status-badge status-1">已收货</span>
                <{/if}>
            </div>
        </div>
        <div class="detail-row">
            <div class="detail-label">下单时间：</div>
            <div class="detail-value"><{$order.create_time_format}></div>
        </div>
        <{if $order.pay_time_format}>
        <div class="detail-row">
            <div class="detail-label">支付时间：</div>
            <div class="detail-value"><{$order.pay_time_format}></div>
        </div>
        <{/if}>
    </div>
    
    <div class="detail-card">
        <h3>收货信息</h3>
        <div class="detail-row">
            <div class="detail-label">收货人：</div>
            <div class="detail-value"><{$order.ship_name}></div>
        </div>
        <div class="detail-row">
            <div class="detail-label">手机号：</div>
            <div class="detail-value"><{$order.ship_mobile}></div>
        </div>
        <div class="detail-row">
            <div class="detail-label">收货地址：</div>
            <div class="detail-value"><{$order.ship_address}></div>
        </div>
        <{if $order.express_company}>
        <div class="detail-row">
            <div class="detail-label">快递公司：</div>
            <div class="detail-value"><{$order.express_company}></div>
        </div>
        <div class="detail-row">
            <div class="detail-label">快递单号：</div>
            <div class="detail-value"><{$order.express_no}></div>
        </div>
        <{/if}>
    </div>
    
    <div class="detail-card">
        <h3>商品清单</h3>
        <div class="goods-list">
            <{foreach from=$goods_list item=goods}>
            <div class="goods-card">
                <div class="goods-image">
                    <img src="<{$goods.goods_thumb|replace:'/ffsm/':''}>" alt="<{$goods.goods_name}>">
                </div>
                <div class="goods-details">
                    <h4 class="goods-title"><{$goods.goods_name}></h4>
                    <div class="goods-meta">
                        <span class="goods-price-text">¥<{$goods.price}></span>
                        <span class="goods-quantity">x<{$goods.num}></span>
                    </div>
                </div>
            </div>
            <{/foreach}>
        </div>
        <div class="total-price">
            合计：<span style="color:#ff4757;font-size:20px;font-weight:bold;">¥<{$order.total_price}></span>
        </div>
    </div>
    
    <{if $order.pay_status == 0}>
    <div class="action-buttons">
        <a href="/?ct=shop&ac=my_orders" class="btn-action btn-secondary">返回订单列表</a>
        <a href="/?ct=shop&ac=pay&order_no=<{$order.order_no}>" class="btn-action btn-primary">立即付款</a>
    </div>
    <{else}>
    <a href="/?ct=shop&ac=my_orders" class="btn-back">返回订单列表</a>
    <{/if}>
</div>

</body>
</html>
