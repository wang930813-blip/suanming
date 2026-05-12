<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<title>确认订单-<{$zhanming}></title>
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
.submit-btn { background: #f5a623 !important; color: #333 !important; border-radius: 8px !important; font-weight: 600 !important; }
.address-section {
    background: #fff;
    padding: 15px;
    margin-bottom: 10px;
}
.address-item {
    padding: 15px;
    border: 1px solid #eee;
    border-radius: 8px;
    margin-bottom: 10px;
    cursor: pointer;
    transition: all 0.3s;
}
.address-item.active {
    border-color: #ff6b6b;
    background: #fff5f5;
}
.address-name {
    font-size: 16px;
    font-weight: bold;
    margin-bottom: 5px;
}
.address-phone {
    font-size: 14px;
    color: #666;
    margin-bottom: 5px;
}
.address-detail {
    font-size: 14px;
    color: #333;
}
.add-address-btn {
    display: block;
    width: 100%;
    padding: 10px;
    background: #f5f5f5;
    border: 1px dashed #ddd;
    border-radius: 8px;
    text-align: center;
    color: #666;
    font-size: 14px;
    cursor: pointer;
}
.goods-section {
    background: #fff;
    padding: 15px;
    margin-bottom: 10px;
}
.section-title {
    font-size: 16px;
    font-weight: bold;
    margin-bottom: 15px;
    padding-bottom: 10px;
    border-bottom: 1px solid #eee;
}
.remark-input {
    width: 100%;
    padding: 10px;
    border: 1px solid #ddd;
    border-radius: 4px;
    font-size: 14px;
    outline: none;
    resize: vertical;
    min-height: 60px;
}
.checkout-footer {
    position: fixed;
    bottom: 0;
    left: 0;
    right: 0;
    background: #fff;
    border-top: 1px solid #eee;
    padding: 15px;
    display: flex;
    justify-content: space-between;
    align-items: center;
}
.total-info {
    font-size: 14px;
}
.total-price {
    font-size: 20px;
    color: #ff6b6b;
    font-weight: bold;
}
.submit-order-btn {
    background: #ff6b6b;
    color: #fff;
    border: none;
    padding: 12px 30px;
    border-radius: 20px;
    font-size: 16px;
    cursor: pointer;
}
.submit-order-btn:disabled {
    background: #ccc;
    cursor: not-allowed;
}
</style>
<{$page_meta}>
</head>
<body style="padding-bottom: 80px;">
<div class="header">
    <a href="javascript:history.back();" class="header-back">
        <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
            <path d="M19 12H5M12 19l-7-7 7-7"/>
        </svg>
    </a>
    <div class="header-title">确认订单</div>
    <div class="header-right"></div>
</div>

<!-- 收货地址 -->
<div class="address-section">
    <div class="section-title">收货地址</div>
    
    <{if $address_list}>
    <div id="addressList">
        <{foreach from=$address_list item=addr}>
        <div class="address-item <{if $addr.is_default}>active<{/if}>" data-id="<{$addr.id}>" onclick="selectAddress(this)">
            <div class="address-name"><{$addr.name}> <{$addr.mobile}></div>
            <div class="address-detail">
                <{$addr.province}><{$addr.city}><{$addr.district}><{$addr.address}>
            </div>
            <{if $addr.is_default}>
            <div style="color: #ff6b6b; font-size: 12px; margin-top: 5px;">默认地址</div>
            <{/if}>
        </div>
        <{/foreach}>
    </div>
    <{/if}>
    
    <a href="/?ac=shop&do=address" class="add-address-btn">+ 添加新地址</a>
</div>

<!-- 商品清单 -->
<div class="goods-section">
    <div class="section-title">商品清单</div>
    
    <{foreach from=$goods_list item=item}>
    <div class="cart-item" style="border-bottom: 1px solid #f5f5f5; padding: 10px 0;">
        <div class="cart-thumb">
            <img src="<{$item.thumb}>" alt="<{$item.goods_name}>">
        </div>
        
        <div class="cart-info">
            <div class="cart-name"><{$item.goods_name}></div>
            <{if $item.spec_info}>
            <div class="cart-spec"><{$item.spec_info.spec_name}>: <{$item.spec_info.spec_value}></div>
            <{/if}>
            
            <div class="cart-bottom">
                <div class="cart-price">¥<{$item.price}></div>
                <div style="color: #999; font-size: 14px;">x<{$item.num}></div>
            </div>
        </div>
    </div>
    <{/foreach}>
</div>

<!-- 订单备注 -->
<div class="goods-section">
    <div class="section-title">订单备注</div>
    <textarea class="remark-input" id="orderRemark" placeholder="选填，请输入订单备注"></textarea>
</div>

<!-- 底部结算 -->
<div class="checkout-footer">
    <div class="total-info">
        合计: <span class="total-price">¥<{$total_price}></span>
    </div>
    <button class="submit-order-btn" id="submitBtn" onclick="submitOrder()">提交订单</button>
</div>

<script>
var selectedAddressId = 0;
var cartIds = <{$cart_ids|@json_encode}>;

// 选择地址
function selectAddress(element) {
    $('.address-item').removeClass('active');
    $(element).addClass('active');
    selectedAddressId = $(element).data('id');
    $('#submitBtn').prop('disabled', false);
}

// 提交订单
function submitOrder() {
    if (selectedAddressId == 0) {
        alert('请选择收货地址');
        return;
    }
    
    $('#submitBtn').prop('disabled', true).text('提交中...');
    
    $.post('/?ac=shop&do=submit_order', {
        cart_ids: cartIds,
        address_id: selectedAddressId,
        remark: $('#orderRemark').val()
    }, function(res) {
        if (res.code == 1) {
            alert('订单创建成功');
            // 跳转到支付页面或订单详情
            location.href = '/?ac=shop&do=order_detail&order_no=' + res.data.order_no;
        } else {
            alert(res.msg);
            $('#submitBtn').prop('disabled', false).text('提交订单');
        }
    }, 'json');
}

// 初始化
$(function() {
    // 选中默认地址
    var defaultAddr = $('.address-item.active').first();
    if (defaultAddr.length > 0) {
        selectedAddressId = defaultAddr.data('id');
    } else {
        // 如果没有默认地址，禁用提交按钮
        $('#submitBtn').prop('disabled', true);
    }
});
</script>

</body>
</html>
