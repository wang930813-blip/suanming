<!doctype html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<title>确认订单-<{$zhanming}></title>
<meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<script src="ziwei/js/jquery-3.4.1.min.js"></script>
<style>
* { margin: 0; padding: 0; box-sizing: border-box; }
body { font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif; background: #f5f5f5; padding-bottom: 70px; }
.header { height: 50px; background: #fff; display: flex; align-items: center; padding: 0 15px; box-shadow: 0 2px 10px rgba(0,0,0,0.05); position: sticky; top: 0; z-index: 100; }
.header-back { width: 24px; height: 24px; margin-right: 10px; }
.header-title { font-size: 16px; font-weight: 600; color: #333; }
.card { background: #fff; border-radius: 12px; padding: 15px; margin: 10px 15px; box-shadow: 0 2px 8px rgba(0,0,0,0.05); }
.card-title { font-size: 15px; font-weight: 600; color: #333; margin-bottom: 12px; padding-bottom: 10px; border-bottom: 1px solid #f0f0f0; }
.goods-info { display: flex; align-items: center; padding: 10px 0; }
.goods-info-text { flex: 1; }
.goods-info-text p { font-size: 14px; color: #666; margin: 5px 0; }
.goods-info-text .name { font-size: 15px; color: #333; font-weight: 500; }
.goods-info-text .price { color: #f5a623; font-weight: 600; }
.form-group { margin-bottom: 15px; }
.form-group label { display: block; margin-bottom: 8px; font-size: 14px; color: #333; font-weight: 500; }
.form-input { width: 100%; padding: 12px 15px; border: 2px solid #e0e0e0; border-radius: 10px; font-size: 14px; transition: all 0.3s; }
.form-input:focus { border-color: #f5a623; outline: none; box-shadow: 0 0 0 3px rgba(245,166,35,0.1); }
.form-textarea { min-height: 80px; resize: vertical; font-family: inherit; }
.order-total { text-align: right; padding: 15px 0; }
.order-total-label { font-size: 14px; color: #666; }
.order-total-price { font-size: 22px; color: #f5a623; font-weight: bold; margin-left: 10px; }
.submit-bar { position: fixed; bottom: 0; left: 0; right: 0; background: #fff; padding: 10px 15px; border-top: 1px solid #e0e0e0; }
.submit-btn { width: 100%; padding: 14px; background: #f5a623; color: #333; border: none; border-radius: 8px; font-size: 16px; font-weight: 600; cursor: pointer; transition: all 0.3s; }
.submit-btn:active { opacity: 0.8; }
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
    <div class="header-title">确认订单</div>
</div>

<div class="card">
    <div class="card-title">商品信息</div>
    <div class="goods-info">
        <div class="goods-info-text">
            <p class="name"><{$goods.goods_name}></p>
            <p class="price">¥<{$goods.price}> × <{$num}></p>
        </div>
    </div>
</div>

<form id="orderForm" class="card">
    <div class="card-title">收货信息</div>
    <input type="hidden" name="goods_id" value="<{$goods.id}>">
    <input type="hidden" name="num" value="<{$num}>">
    <input type="hidden" name="spec_id" value="<{$spec_id}>">
    
    <div class="form-group">
        <label>收货人姓名 *</label>
        <input type="text" name="name" class="form-input" required placeholder="请输入收货人姓名">
    </div>
    
    <div class="form-group">
        <label>手机号码 *</label>
        <input type="tel" name="mobile" class="form-input" required placeholder="请输入11位手机号码">
    </div>
    
    <div class="form-group">
        <label>收货地址 *</label>
        <input type="text" name="address" class="form-input" required placeholder="省市区+详细地址">
    </div>
    
    <div class="form-group">
        <label>备注</label>
        <textarea name="remark" class="form-input form-textarea" placeholder="选填，给卖家留言"></textarea>
    </div>
    
    <div class="order-total">
        <span class="order-total-label">合计：</span><span class="order-total-price">¥<{$total_price}></span>
    </div>
</form>

<div class="submit-bar">
    <button class="submit-btn" onclick="submitOrder()">提交订单</button>
</div>

<script>
function submitOrder() {
    var formData = $('#orderForm').serialize();
    
    // 验证必填项
    var name = $('input[name="name"]').val();
    var mobile = $('input[name="mobile"]').val();
    var address = $('input[name="address"]').val();
    
    if (!name) {
        alert('请输入收货人姓名');
        return;
    }
    
    if (!mobile) {
        alert('请输入手机号码');
        return;
    }
    
    if (!/^1[3-9]\d{9}$/.test(mobile)) {
        alert('请输入正确的手机号码');
        return;
    }
    
    if (!address) {
        alert('请输入收货地址');
        return;
    }
    
    // 提交订单
    $.post('/?ct=shop&ac=submit_buy_now', formData, function(res) {
        if (res.code == 1) {
            // 跳转到支付页面
            location.href = '/?ct=shop&ac=pay&order_no=' + res.order_no;
        } else {
            alert(res.msg || '订单提交失败');
        }
    }, 'json').fail(function() {
        alert('网络错误，请稍后重试');
    });
}
</script>

</body>
</html>
