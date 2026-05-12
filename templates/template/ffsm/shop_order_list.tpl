<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<title>个人中心-<{$zhanming}></title>
<meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta content="yes" name="apple-mobile-web-app-capable">
<meta content="black" name="apple-mobile-web-app-status-bar-style">
<meta content="telephone=no" name="format-detection">
<link rel="shortcut icon" href="/statics/ffsm/favicon.ico">
<link href="/ffsm/css/shop.css" rel="stylesheet" type="text/css">
<script src="ziwei/js/jquery-3.4.1.min.js"></script>
<style>
* { margin: 0; padding: 0; box-sizing: border-box; }
body { background: #f5f5f5; font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif; }
.header { height: 50px; background: #fff; display: flex; align-items: center; justify-content: space-between; padding: 0 15px; box-shadow: 0 2px 10px rgba(0,0,0,0.05); position: sticky; top: 0; z-index: 100; }
.header-back { width: 24px; height: 24px; cursor: pointer; }
.header-title { font-size: 16px; font-weight: 600; color: #333; position: absolute; left: 50%; transform: translateX(-50%); }
.header-right { width: 24px; }
.order-btn { background: #f5a623 !important; color: #333 !important; border-radius: 6px !important; font-weight: 600 !important; }
.order-tabs {
    display: flex;
    background: #fff;
    border-bottom: 1px solid #eee;
}
.order-tab {
    flex: 1;
    padding: 12px 0;
    text-align: center;
    font-size: 14px;
    color: #666;
    border-bottom: 2px solid transparent;
    cursor: pointer;
    transition: all 0.3s;
}
.order-tab.active {
    color: #ff6b6b;
    border-bottom-color: #ff6b6b;
}
</style>
<{$page_meta}>
</head>
<body>
<div class="header">
    <a href="javascript:history.back();" class="header-back">
        <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
            <path d="M19 12H5M12 19l-7-7 7-7"/>
        </svg>
    </a>
    <div class="header-title">个人中心</div>
    <div class="header-right"></div>
</div>

<!-- 订单状态标签 -->
<div class="order-tabs">
    <a href="/?ac=shop&do=order_list" class="order-tab <{if $pay_status == -1}>active<{/if}>">全部</a>
    <a href="/?ac=shop&do=order_list&pay_status=0" class="order-tab <{if $pay_status == 0}>active<{/if}>">待支付</a>
    <a href="/?ac=shop&do=order_list&pay_status=1" class="order-tab <{if $pay_status == 1}>active<{/if}>">已支付</a>
</div>

<!-- 订单列表 -->
<div class="order-list">
    <{if $order_list}>
    <{foreach from=$order_list item=order}>
    <div class="order-item">
        <div class="order-header">
            <div class="order-no">订单号：<{$order.order_no}></div>
            <div class="order-status">
                <{if $order.pay_status == 0}>
                待支付
                <{elseif $order.ship_status == 0}>
                待发货
                <{elseif $order.ship_status == 1}>
                待收货
                <{elseif $order.ship_status == 2}>
                已完成
                <{/if}>
            </div>
        </div>
        
        <div class="order-goods">
            <{foreach from=$order.goods_list item=goods}>
            <div class="order-goods-item">
                <div class="order-goods-thumb">
                    <img src="<{$goods.goods_thumb}>" alt="<{$goods.goods_name}>">
                </div>
                
                <div class="order-goods-info">
                    <div class="order-goods-name"><{$goods.goods_name}></div>
                    <{if $goods.spec_name}>
                    <div class="order-goods-spec"><{$goods.spec_name}></div>
                    <{/if}>
                </div>
                
                <div class="order-goods-price">
                    <div>¥<{$goods.price}></div>
                    <div style="font-size: 12px; color: #999;">x<{$goods.num}></div>
                </div>
            </div>
            <{/foreach}>
        </div>
        
        <div class="order-footer">
            <div class="order-total">
                共<{count($order.goods_list)}>件商品 
                合计: <span class="order-total-price">¥<{$order.pay_price}></span>
            </div>
            
            <div class="order-actions">
                <a href="/?ac=shop&do=order_detail&order_no=<{$order.order_no}>" class="order-btn">查看详情</a>
                
                <{if $order.pay_status == 0}>
                <a href="/?ac=pay&order_no=<{$order.order_no}>" class="order-btn primary">去支付</a>
                <{/if}>
                
                <{if $order.ship_status == 1}>
                <button class="order-btn primary" onclick="confirmReceipt('<{$order.order_no}>')">确认收货</button>
                <{/if}>
            </div>
        </div>
    </div>
    <{/foreach}>
    <{else}>
    <div style="text-align: center; padding: 50px 20px; color: #999;">
        <div style="font-size: 48px; margin-bottom: 10px;">📦</div>
        <div>暂无订单</div>
        <div style="margin-top: 20px;">
            <a href="/?ac=shop" style="background: #ff6b6b; color: #fff; padding: 10px 30px; border-radius: 20px; text-decoration: none; display: inline-block;">去购物</a>
        </div>
    </div>
    <{/if}>
</div>

<script>
// 确认收货
function confirmReceipt(orderNo) {
    if (!confirm('确认已收到货物？')) {
        return;
    }
    
    $.post('/?ac=shop&do=confirm_receipt', {
        order_no: orderNo
    }, function(res) {
        if (res.code == 1) {
            alert('确认收货成功');
            location.reload();
        } else {
            alert(res.msg);
        }
    }, 'json');
}
</script>

<{include file='./ffsm/tabBar.tpl'}>

</body>
</html>
