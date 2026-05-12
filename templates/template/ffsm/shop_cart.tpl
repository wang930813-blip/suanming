<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<title>购物车-<{$zhanming}></title>
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
.checkout-btn, .cart-btn { background: #f5a623 !important; color: #333 !important; border-radius: 8px !important; font-weight: 600 !important; }
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
    <div class="header-title">购物车</div>
    <div class="header-right"></div>
</div>

<div class="cart-list">
    <{if $cart_list}>
    <{foreach from=$cart_list item=item}>
    <div class="cart-item" data-id="<{$item.id}>">
        <input type="checkbox" class="cart-checkbox" value="<{$item.id}>" <{if $item.goods_status == 1}>checked<{/if}> <{if $item.goods_status != 1}>disabled<{/if}>>
        
        <a href="/?ac=shop&do=goods_detail&id=<{$item.goods_id}>" class="cart-thumb">
            <img src="<{$item.thumb}>" alt="<{$item.goods_name}>">
        </a>
        
        <div class="cart-info">
            <div class="cart-name">
                <{$item.goods_name}>
                <{if $item.goods_status != 1}>
                <span style="color: #ff6b6b; font-size: 12px;">(已下架)</span>
                <{/if}>
            </div>
            
            <{if $item.spec_info}>
            <div class="cart-spec"><{$item.spec_info.spec_name}>: <{$item.spec_info.spec_value}></div>
            <{/if}>
            
            <div class="cart-bottom">
                <div class="cart-price">¥<{$item.price}></div>
                
                <{if $item.goods_status == 1}>
                <div class="cart-num">
                    <button class="num-btn" onclick="updateNum(<{$item.id}>, -1)">-</button>
                    <input type="number" class="num-input" id="num_<{$item.id}>" value="<{$item.num}>" min="1" max="<{$item.stock}>" readonly>
                    <button class="num-btn" onclick="updateNum(<{$item.id}>, 1)">+</button>
                </div>
                <{else}>
                <button class="order-btn" onclick="deleteCart(<{$item.id}>)">删除</button>
                <{/if}>
            </div>
        </div>
    </div>
    <{/foreach}>
    <{else}>
    <div style="text-align: center; padding: 50px 20px; color: #999;">
        <div style="font-size: 48px; margin-bottom: 10px;">🛒</div>
        <div>购物车还是空的</div>
        <div style="margin-top: 20px;">
            <a href="/?ac=shop" style="background: #ff6b6b; color: #fff; padding: 10px 30px; border-radius: 20px; text-decoration: none; display: inline-block;">去逛逛</a>
        </div>
    </div>
    <{/if}>
</div>

<{if $cart_list}>
<!-- 底部结算栏 -->
<div class="cart-footer">
    <div style="display: flex; align-items: center;">
        <input type="checkbox" id="checkAll" onclick="toggleAll(this)" style="margin-right: 5px;">
        <label for="checkAll" style="font-size: 14px; margin-right: 15px;">全选</label>
        <button onclick="deleteSelected()" style="background: none; border: none; color: #999; font-size: 14px; cursor: pointer;">删除选中</button>
    </div>
    
    <div style="display: flex; align-items: center; gap: 15px;">
        <div class="cart-total">
            合计: <span class="cart-total-price" id="totalPrice">¥0.00</span>
        </div>
        <button class="cart-submit" id="submitBtn" onclick="submitCart()">结算</button>
    </div>
</div>
<{/if}>

<script>
// 计算总价
function calcTotal() {
    var total = 0;
    var count = 0;
    
    $('.cart-checkbox:checked').each(function() {
        var item = $(this).closest('.cart-item');
        var price = parseFloat(item.find('.cart-price').text().replace('¥', ''));
        var num = parseInt(item.find('.num-input').val());
        
        total += price * num;
        count++;
    });
    
    $('#totalPrice').text('¥' + total.toFixed(2));
    $('#submitBtn').prop('disabled', count == 0);
}

// 全选/反选
function toggleAll(checkbox) {
    $('.cart-checkbox:not(:disabled)').prop('checked', checkbox.checked);
    calcTotal();
}

// 监听单个复选框变化
$(document).on('change', '.cart-checkbox', function() {
    var total = $('.cart-checkbox:not(:disabled)').length;
    var checked = $('.cart-checkbox:checked').length;
    $('#checkAll').prop('checked', total > 0 && total == checked);
    calcTotal();
});

// 更新数量
function updateNum(cartId, delta) {
    var input = $('#num_' + cartId);
    var currentNum = parseInt(input.val()) || 1;
    var newNum = currentNum + delta;
    var maxStock = parseInt(input.attr('max'));
    
    if (newNum < 1) newNum = 1;
    if (newNum > maxStock) {
        alert('库存不足');
        return;
    }
    
    input.val(newNum);
    
    $.post('/?ac=shop&do=update_cart', {
        cart_id: cartId,
        num: newNum
    }, function(res) {
        if (res.code == 1) {
            calcTotal();
        } else {
            alert(res.msg);
            input.val(currentNum);
        }
    }, 'json');
}

// 删除购物车商品
function deleteCart(cartId) {
    if (!confirm('确定要删除这件商品吗？')) {
        return;
    }
    
    $.post('/?ac=shop&do=delete_cart', {
        cart_id: cartId
    }, function(res) {
        if (res.code == 1) {
            location.reload();
        } else {
            alert(res.msg);
        }
    }, 'json');
}

// 删除选中
function deleteSelected() {
    var ids = [];
    $('.cart-checkbox:checked').each(function() {
        ids.push($(this).val());
    });
    
    if (ids.length == 0) {
        alert('请选择要删除的商品');
        return;
    }
    
    if (!confirm('确定要删除选中的商品吗？')) {
        return;
    }
    
    var deleted = 0;
    ids.forEach(function(id) {
        $.post('/?ac=shop&do=delete_cart', {
            cart_id: id
        }, function(res) {
            deleted++;
            if (deleted == ids.length) {
                location.reload();
            }
        }, 'json');
    });
}

// 提交购物车
function submitCart() {
    var ids = [];
    $('.cart-checkbox:checked').each(function() {
        ids.push($(this).val());
    });
    
    if (ids.length == 0) {
        alert('请选择要结算的商品');
        return;
    }
    
    // 创建表单提交
    var form = $('<form method="post" action="/?ac=shop&do=checkout"></form>');
    ids.forEach(function(id) {
        form.append('<input type="hidden" name="cart_ids[]" value="' + id + '">');
    });
    $('body').append(form);
    form.submit();
}

// 初始化
$(function() {
    calcTotal();
    
    // 检查是否全选
    var total = $('.cart-checkbox:not(:disabled)').length;
    var checked = $('.cart-checkbox:checked').length;
    if (total > 0 && total == checked) {
        $('#checkAll').prop('checked', true);
    }
});
</script>

</body>
</html>
