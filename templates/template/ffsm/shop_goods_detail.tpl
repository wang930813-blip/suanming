<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<title><{$goods.goods_name}>-商品详情-<{$zhanming}></title>
<meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta content="yes" name="apple-mobile-web-app-capable">
<meta content="black" name="apple-mobile-web-app-status-bar-style">
<meta content="telephone=no" name="format-detection">
<link rel="shortcut icon" href="/statics/ffsm/favicon.ico">
<link href="css/shop.css" rel="stylesheet" type="text/css">
<script src="ziwei/js/jquery-3.4.1.min.js"></script>
<style>
* { margin: 0; padding: 0; box-sizing: border-box; }
body { background: #f5f5f5; font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif; }
.header { height: 50px; background: #fff; display: flex; align-items: center; justify-content: space-between; padding: 0 15px; box-shadow: 0 2px 10px rgba(0,0,0,0.05); position: sticky; top: 0; z-index: 100; }
.header-back { width: 24px; height: 24px; cursor: pointer; }
.header-title { font-size: 16px; font-weight: 600; color: #333; position: absolute; left: 50%; transform: translateX(-50%); }
.header-right { width: 24px; }
.detail-btn { padding: 12px 24px !important; border-radius: 8px !important; font-size: 15px !important; font-weight: 600 !important; transition: all 0.3s !important; }
.btn-cart { background: #ffe5d1 !important; color: #333 !important; border: none !important; }
.btn-buy { background: #f5a623 !important; color: #333 !important; border: none !important; }
.detail-btn:active { opacity: 0.8 !important; }

/* 商品描述 */
.goods-detail-content { background: #fff; margin: 10px 0; padding: 15px; border-radius: 8px; }
.content-title { font-size: 16px; font-weight: 600; color: #333; padding-bottom: 15px; border-bottom: 1px solid #eee; margin-bottom: 15px; }
.content-body { font-size: 14px; line-height: 1.8; color: #666; }
.content-body img { max-width: 100%; height: auto; display: block; margin: 10px 0; }
</style>
<{$page_meta}>
</head>
<body style="padding-bottom: 70px;">
<div class="header">
    <a href="javascript:history.back();" class="header-back">
        <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
            <path d="M19 12H5M12 19l-7-7 7-7"/>
        </svg>
    </a>
    <div class="header-title">商品详情</div>
    <div class="header-right"></div>
</div>

<!-- 商品图片 -->
<div class="goods-detail-images">
    <img src="<{$goods.thumb|replace:'/ffsm/':''}>" alt="<{$goods.goods_name}>">
    <{if $goods.images}>
        <{foreach from=','|explode:$goods.images item=img}>
        <img src="<{$img|replace:'/ffsm/':''}>" alt="<{$goods.goods_name}>">
        <{/foreach}>
    <{/if}>
</div>

<!-- 商品信息 -->
<div class="goods-detail-info">
    <div class="goods-detail-name"><{$goods.goods_name}></div>
    
    <div class="goods-detail-price">
        <span class="detail-price-current">¥<{$goods.price}></span>
        <{if $goods.market_price > 0}>
        <span class="detail-price-market">¥<{$goods.market_price}></span>
        <{/if}>
    </div>
    
    <div style="display: flex; justify-content: space-between; font-size: 14px; color: #999; margin-bottom: 15px;">
        <span>库存：<{$goods.stock}></span>
        <span>已售：<{$goods.sales}></span>
        <span>浏览：<{$goods.views}></span>
    </div>
    
    <!-- 商品规格 -->
    <{if $goods.specs}>
    <div class="goods-spec-list">
        <div class="spec-title">选择规格</div>
        <div class="spec-items" id="specItems">
            <{foreach from=$goods.specs item=spec}>
            <div class="spec-item" data-id="<{$spec.id}>" data-price="<{$spec.price}>" data-stock="<{$spec.stock}>">
                <{$spec.spec_name}>: <{$spec.spec_value}>
            </div>
            <{/foreach}>
        </div>
    </div>
    <{/if}>
    
    <!-- 数量选择 -->
    <div style="margin-top: 15px;">
        <span style="font-size: 14px; color: #666; margin-right: 10px;">数量</span>
        <div class="cart-num" style="display: inline-flex;">
            <button class="num-btn" onclick="changeNum(-1)">-</button>
            <input type="number" class="num-input" id="buyNum" value="1" min="1" max="<{$goods.stock}>">
            <button class="num-btn" onclick="changeNum(1)">+</button>
        </div>
    </div>
</div>

<!-- 商品描述 -->
<div class="goods-detail-content">
    <div class="content-title">商品描述</div>
    <div class="content-body">
        <{if $goods.goods_desc}>
            <{$goods.goods_desc}>
        <{else}>
            <p style="color: #999; text-align: center; padding: 30px 0;">暂无商品描述</p>
        <{/if}>
    </div>
</div>

<!-- 底部操作栏 -->
<div class="goods-detail-footer">
    <button class="detail-btn btn-buy" onclick="buyNow()" style="width: 100%;">立即购买</button>
</div>

<script>
var goodsId = <{$goods.id}>;
var selectedSpecId = 0;
var currentPrice = <{$goods.price}>;
var maxStock = <{$goods.stock}>;

// 规格选择
$('.spec-item').click(function() {
    $('.spec-item').removeClass('active');
    $(this).addClass('active');
    selectedSpecId = $(this).data('id');
    
    var specPrice = $(this).data('price');
    var specStock = $(this).data('stock');
    
    if (specPrice) {
        currentPrice = specPrice;
        $('.detail-price-current').text('¥' + specPrice);
    }
    
    if (specStock) {
        maxStock = specStock;
        $('#buyNum').attr('max', specStock);
    }
});

// 数量调整
function changeNum(delta) {
    var input = $('#buyNum');
    var currentNum = parseInt(input.val()) || 1;
    var newNum = currentNum + delta;
    
    if (newNum < 1) newNum = 1;
    if (newNum > maxStock) newNum = maxStock;
    
    input.val(newNum);
}

// 立即购买
function buyNow() {
    var num = parseInt($('#buyNum').val()) || 1;
    
    // 直接跳转到支付页面，携带商品信息
    var url = '/?ct=shop&ac=buy_now&goods_id=' + goodsId + '&num=' + num;
    if (selectedSpecId > 0) {
        url += '&spec_id=' + selectedSpecId;
    }
    location.href = url;
}
</script>

</body>
</html>
