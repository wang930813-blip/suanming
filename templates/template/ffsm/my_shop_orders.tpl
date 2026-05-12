<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<title>我的商城订单-<{$zhanming}></title>
<meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link href="css/shop.css" rel="stylesheet" type="text/css">
<style>
.orders-page {
    padding: 15px;
    background: #f5f7fa;
    min-height: 100vh;
}
.order-item {
    background: #fff;
    border-radius: 12px;
    padding: 15px;
    margin-bottom: 15px;
    box-shadow: 0 2px 8px rgba(0,0,0,0.06);
}
.order-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding-bottom: 10px;
    border-bottom: 1px solid #f0f0f0;
    margin-bottom: 10px;
}
.order-no {
    font-size: 13px;
    color: #666;
}
.order-status {
    font-size: 12px;
}
.status-badge {
    display: inline-block;
    padding: 3px 10px;
    border-radius: 10px;
    font-size: 12px;
}
.status-unpay {
    background: #fff3cd;
    color: #856404;
}
.status-paid {
    background: #d1ecf1;
    color: #0c5460;
}
.status-shipped {
    background: #d4edda;
    color: #155724;
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
.order-footer {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding-top: 10px;
    border-top: 1px solid #f0f0f0;
    margin-top: 10px;
}
.order-total {
    font-size: 14px;
    color: #333;
}
.order-total-price {
    font-size: 16px;
    color: #f5576c;
    font-weight: bold;
}
.order-actions {
    display: flex;
    gap: 8px;
}
.btn-action {
    padding: 6px 15px;
    border-radius: 15px;
    font-size: 13px;
    text-decoration: none;
    border: 1px solid #ddd;
    color: #666;
}
.btn-pay {
    background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
    color: #fff;
    border: none;
}
.btn-detail {
    color: #667eea;
    border-color: #667eea;
}
.empty-tip {
    text-align: center;
    padding: 50px 20px;
    color: #999;
}
.empty-tip img {
    width: 120px;
    margin-bottom: 20px;
}
</style>
</head>
<body class="shop-page">
<{include file='./ffsm/header.tpl'}>

<div class="orders-page">
    <{if $order_list}>
        <{foreach from=$order_list item=order}>
        <div class="order-item">
            <div class="order-header">
                <div class="order-no">订单号：<{$order.order_no}></div>
                <div class="order-status">
                    <{if $order.pay_status == 0}>
                    <span class="status-badge status-unpay">待支付</span>
                    <{else}>
                    <span class="status-badge status-paid">已支付</span>
                    <{/if}>
                    
                    <{if $order.ship_status == 0}>
                    <span class="status-badge status-unpay">待发货</span>
                    <{elseif $order.ship_status == 1}>
                    <span class="status-badge status-shipped">已发货</span>
                    <{else}>
                    <span class="status-badge status-shipped">已收货</span>
                    <{/if}>
                </div>
            </div>
            
            <div class="goods-list">
                <{foreach from=$order.goods_list item=goods}>
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
            
            <div class="order-footer">
                <div class="order-total">
                    合计：<span class="order-total-price">¥<{$order.total_price}></span>
                </div>
                <div class="order-actions">
                    <a href="/?ct=shop&ac=order_detail&order_no=<{$order.order_no}>" class="btn-action btn-detail">查看详情</a>
                    <{if $order.pay_status == 0}>
                    <a href="/?ct=shop&ac=pay&order_no=<{$order.order_no}>" class="btn-action btn-pay">立即付款</a>
                    <{/if}>
                </div>
            </div>
        </div>
        <{/foreach}>
    <{else}>
        <div class="empty-tip">
            <p>暂无商城订单</p>
            <a href="/?ac=shop" style="color: #667eea;">去商城逛逛</a>
        </div>
    <{/if}>
</div>

</body>
</html>
