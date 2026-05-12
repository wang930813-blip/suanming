<!DOCTYPE html>
<html>
<head>
<title>开通VIP会员-<{$zhanming}></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
<script src="/statics/user/js/jquery-1.9.1.min.js"></script>
<link rel="stylesheet" href="/static/user_common_style.css">
<style>
.vip-card {
    background: #fff;
    margin: 10px;
    border-radius: 8px;
    padding: 15px;
    box-shadow: 0 2px 8px rgba(0,0,0,0.08);
    border: 2px solid #e0e0e0;
    position: relative;
}
.vip-card.active {
    border-color: #f5a623;
    background: #fffaf0;
}
.vip-card.recommended {
    border-color: #f5a623;
}
.vip-badge {
    position: absolute;
    top: -10px;
    right: 15px;
    background: #f5a623;
    color: white;
    padding: 3px 10px;
    border-radius: 10px;
    font-size: 11px;
    font-weight: 600;
}
.vip-type {
    font-size: 16px;
    font-weight: 600;
    color: #333;
    margin-bottom: 8px;
}
.vip-price {
    font-size: 24px;
    font-weight: 600;
    color: #f5a623;
    margin-bottom: 5px;
}
.vip-price small {
    font-size: 14px;
    color: #999;
    font-weight: normal;
}
.vip-duration {
    font-size: 12px;
    color: #999;
    margin-bottom: 10px;
}
.privilege-list {
    background: #f8f9fa;
    padding: 12px;
    border-radius: 6px;
    margin-top: 15px;
}
.privilege-list h4 {
    font-size: 14px;
    font-weight: 600;
    color: #333;
    margin-bottom: 10px;
}
.privilege-item {
    font-size: 12px;
    color: #666;
    line-height: 1.8;
    padding-left: 20px;
    position: relative;
}
.privilege-item:before {
    content: "✓";
    position: absolute;
    left: 0;
    color: #4CAF50;
    font-weight: 600;
}
</style>
</head>
<body>

<!-- 头部 -->
<div class="header">
    <div class="header-left">
        <a href="?ac=member">←</a>
    </div>
    <div class="header-title">开通VIP会员</div>
    <div class="header-right"></div>
</div>

<{if $uid > 0}>
<!-- VIP套餐 -->
<div class="vip-card recommended">
    <div class="vip-badge">推荐</div>
    <div class="vip-type">🌟 终身VIP会员</div>
    <div class="vip-price">¥<{$money_z}><small>元</small></div>
    <div class="vip-duration">有效期：永久使用</div>
    <a href="?ac=vip&class=3" class="btn btn-primary btn-block" style="text-decoration:none;">立即开通</a>
</div>

<div class="vip-card">
    <div class="vip-type">📅 包年VIP会员</div>
    <div class="vip-price">¥<{$money_y}><small>元</small></div>
    <div class="vip-duration">有效期：365天</div>
    <a href="?ac=vip&class=2" class="btn btn-primary btn-block" style="text-decoration:none;">立即开通</a>
</div>

<div class="vip-card">
    <div class="vip-type">📆 包月VIP会员</div>
    <div class="vip-price">¥<{$money_m}><small>元</small></div>
    <div class="vip-duration">有效期：30天</div>
    <a href="?ac=vip&class=1" class="btn btn-primary btn-block" style="text-decoration:none;">立即开通</a>
</div>

<!-- 尊贵特权 -->
<div class="content-card">
    <div class="privilege-list">
        <h4>🎁 尊贵特权</h4>
        <div class="privilege-item">期间所有测算项目免费</div>
        <div class="privilege-item">一对一专属客服</div>
        <div class="privilege-item">会员专属身份标识</div>
        <div class="privilege-item">提供专业解答服务</div>
        <div class="privilege-item">页面无广告干扰</div>
        <div class="privilege-item">优先享受新功能</div>
    </div>
</div>

<!-- 说明 -->
<div class="content-card">
    <div class="info-box">
        <p>💡 <strong>温馨提示：</strong></p>
        <p>• 开通后立即生效</p>
        <p>• 支持支付宝/微信支付</p>
        <p>• 有任何问题请联系客服</p>
    </div>
</div>

<{else}>
<!-- 未登录提示 -->
<div class="empty-state">
    <p style="font-size:48px; margin-bottom:10px;">🔐</p>
    <p>请先登录后再开通VIP</p>
    <a href="?ac=userlogin" class="btn btn-primary" style="margin-top:20px; text-decoration:none;">立即登录</a>
</div>
<{/if}>

<div style="height:20px;"></div>

</body>
</html>
