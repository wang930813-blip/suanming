<!DOCTYPE html>
<html>
<head>
<title>会员中心-<{$zhanming}></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
<script src="/statics/user/js/jquery-1.9.1.min.js"></script>
<script src="/statics/user/js/layer.js"></script>
<link rel="shortcut icon" href="/statics/ffsm/favicon.ico"/>
<style>
* { margin: 0; padding: 0; box-sizing: border-box; }
body { 
    font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif; 
    background: #f5f5f5;
    min-height: 100vh;
    padding-bottom: 10px;
}

/* 头部 */
.header {
    background: #fff;
    padding: 12px 15px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    box-shadow: 0 1px 3px rgba(0,0,0,0.05);
    position: sticky;
    top: 0;
    z-index: 100;
}
.header-left { width: 30px; }
.header-title { font-size: 16px; font-weight: 600; color: #333; }
.header-right { width: 30px; }

/* 用户信息卡片 */
.user-card {
    background: #fff;
    margin: 10px;
    border-radius: 8px;
    padding: 15px;
    box-shadow: 0 2px 8px rgba(0,0,0,0.08);
}
.user-info {
    display: flex;
    align-items: center;
    margin-bottom: 10px;
}
.user-avatar {
    width: 50px;
    height: 50px;
    border-radius: 50%;
    margin-right: 12px;
    border: 2px solid #e0e0e0;
}
.user-details h2 {
    font-size: 16px;
    color: #333;
    margin-bottom: 3px;
}
.user-details p {
    font-size: 12px;
    color: #666;
}
.user-stats {
    display: flex;
    justify-content: space-around;
    padding: 10px 0;
    border-top: 1px solid #f0f0f0;
    margin-top: 10px;
}
.stat-item {
    text-align: center;
}
.stat-value {
    font-size: 18px;
    font-weight: 600;
    color: #333;
    display: block;
}
.stat-label {
    font-size: 11px;
    color: #999;
    margin-top: 3px;
}

/* VIP卡片 */
.vip-card {
    background: #fff;
    margin: 0 10px 10px;
    border-radius: 8px;
    padding: 12px 15px;
    border: 2px solid #f5a623;
    box-shadow: 0 2px 8px rgba(0,0,0,0.08);
}
.vip-card h3 {
    font-size: 14px;
    margin-bottom: 5px;
    color: #333;
}
.vip-card p {
    font-size: 12px;
    color: #666;
}
.vip-btn {
    background: #f5a623;
    border: none;
    color: white;
    padding: 6px 16px;
    border-radius: 15px;
    margin-top: 8px;
    display: inline-block;
    text-decoration: none;
    font-size: 13px;
}

/* 功能菜单 */
.menu-section {
    background: #fff;
    margin: 0 10px 10px;
    border-radius: 8px;
    padding: 5px 0;
    box-shadow: 0 2px 8px rgba(0,0,0,0.08);
}
.menu-item {
    display: flex;
    align-items: center;
    padding: 10px 15px;
    text-decoration: none;
    color: #333;
    border-bottom: 1px solid #f5f5f5;
}
.menu-item:last-child {
    border-bottom: none;
}
.menu-icon {
    width: 35px;
    height: 35px;
    border-radius: 8px;
    display: flex;
    align-items: center;
    justify-content: center;
    margin-right: 12px;
    font-size: 18px;
}
.icon-blue { background: #e3f2fd; color: #2196F3; }
.icon-green { background: #e8f5e9; color: #4CAF50; }
.icon-orange { background: #fff3e0; color: #FF9800; }
.icon-red { background: #ffebee; color: #f44336; }
.icon-purple { background: #f3e5f5; color: #9c27b0; }
.menu-info {
    flex: 1;
}
.menu-title {
    font-size: 14px;
    font-weight: 500;
    margin-bottom: 2px;
}
.menu-desc {
    font-size: 11px;
    color: #999;
}
.menu-arrow {
    color: #ccc;
    font-size: 16px;
}
.menu-value {
    font-size: 13px;
    color: #f5a623;
    font-weight: 600;
    margin-right: 8px;
}

/* 推广卡片 */
.promo-card {
    background: #fff;
    margin: 0 10px 10px;
    border-radius: 8px;
    padding: 15px;
    box-shadow: 0 2px 8px rgba(0,0,0,0.08);
}
.promo-title {
    font-size: 14px;
    font-weight: 600;
    margin-bottom: 10px;
    color: #333;
}
.qrcode-box {
    text-align: center;
    padding: 15px;
    background: #f8f9fa;
    border-radius: 8px;
    margin-bottom: 10px;
}
.link-box {
    background: #f8f9fa;
    padding: 8px;
    border-radius: 6px;
    margin-bottom: 8px;
}
.link-input {
    width: 100%;
    padding: 8px;
    border: 1px solid #e0e0e0;
    border-radius: 5px;
    font-size: 12px;
    margin-bottom: 8px;
}
.copy-btn {
    width: 100%;
    padding: 10px;
    background: #f5a623;
    color: white;
    border: none;
    border-radius: 6px;
    font-size: 14px;
    font-weight: 600;
    cursor: pointer;
}
.copy-btn:active {
    opacity: 0.8;
}
</style>
</head>
<body>

<!-- 头部 -->
<div class="header">
    <div class="header-left">
        <a href="/" style="color: #333; font-size: 20px; text-decoration: none;">←</a>
    </div>
    <div class="header-title">会员中心</div>
    <div class="header-right"></div>
</div>

<!-- 用户信息卡片 -->
<div class="user-card">
    <div class="user-info">
        <img src="<{if $member.headimgurl}><{$member.headimgurl}><{else}>/statics/user/images/userlogo.png<{/if}>" class="user-avatar" alt="">
        <div class="user-details">
            <h2><{$member.nickname}></h2>
            <p><{if $member.class==1}>注册用户<{elseif $member.class==2}>微信用户<{else}>QQ用户<{/if}></p>
            <{if $member.mobile}>
            <p style="margin-top: 5px;">📱 <{$member.mobile}></p>
            <{/if}>
        </div>
    </div>
    <div class="user-stats">
        <div class="stat-item">
            <span class="stat-value"><{$member.dl_syjf}></span>
            <span class="stat-label">佣金(元)</span>
        </div>
        <div class="stat-item">
            <span class="stat-value"><{$member.integral}></span>
            <span class="stat-label">积分</span>
        </div>
        <div class="stat-item">
            <span class="stat-value"><{if $member.vip_type==38 || $member.vip_type==39 || $member.vip_type==40}>已开通<{else}>未开通<{/if}></span>
            <span class="stat-label">VIP状态</span>
        </div>
    </div>
</div>

<!-- VIP卡片 -->
<div class="vip-card">
    <h3>🌟 VIP会员</h3>
    <{if $member.vip_type==38 || $member.vip_type==39 || $member.vip_type==40}>
        <{if $member.vip_time<$times}>
            <p>您的VIP已过期</p>
        <{else}>
            <p>到期时间：<{$member.vip_time|date_format:'%Y-%m-%d %H:%M:%S'}></p>
        <{/if}>
    <{else}>
        <p>开通VIP，免费测算所有项目</p>
        <a href="?ac=vip" class="vip-btn">立即开通</a>
    <{/if}>
</div>

<!-- 佣金相关 -->
<div class="menu-section">
    <a href="?ac=tuiguang" class="menu-item">
        <div class="menu-icon icon-orange">💰</div>
        <div class="menu-info">
            <div class="menu-title">如何赚取佣金</div>
            <div class="menu-desc">佣金和积分均可提现</div>
        </div>
        <span class="menu-arrow">›</span>
    </a>
    
    <a href="?ac=user_tgjl" class="menu-item">
        <div class="menu-icon icon-blue">📊</div>
        <div class="menu-info">
            <div class="menu-title">推广记录</div>
            <div class="menu-desc">查看推广明细</div>
        </div>
        <span class="menu-value"><{$member.dl_syjf}>元</span>
        <span class="menu-arrow">›</span>
    </a>
    
    <a href="?ac=user_jfmxs" class="menu-item">
        <div class="menu-icon icon-green">🎁</div>
        <div class="menu-info">
            <div class="menu-title">积分明细</div>
            <div class="menu-desc">查看积分变动</div>
        </div>
        <span class="menu-value"><{$member.integral}>个</span>
        <span class="menu-arrow">›</span>
    </a>
</div>

<!-- 财务管理 -->
<div class="menu-section">
    <a href="?ac=user_yjtx" class="menu-item">
        <div class="menu-icon icon-orange">💸</div>
        <div class="menu-info">
            <div class="menu-title">佣金提现</div>
            <div class="menu-desc">提现到账</div>
        </div>
        <span class="menu-arrow">›</span>
    </a>
    
    <a href="?ac=user_txmx" class="menu-item">
        <div class="menu-icon icon-blue">📋</div>
        <div class="menu-info">
            <div class="menu-title">提现明细</div>
            <div class="menu-desc">查看提现记录</div>
        </div>
        <span class="menu-arrow">›</span>
    </a>
</div>

<!-- 个人中心 -->
<div class="menu-section">
    <a href="?ac=user_wdcs" class="menu-item">
        <div class="menu-icon icon-purple">🔮</div>
        <div class="menu-info">
            <div class="menu-title">我的测算</div>
            <div class="menu-desc">测算历史记录</div>
        </div>
        <span class="menu-arrow">›</span>
    </a>
    
    <a href="?ct=shop&ac=my_orders" class="menu-item">
        <div class="menu-icon icon-blue">🛍️</div>
        <div class="menu-info">
            <div class="menu-title">我的商城订单</div>
            <div class="menu-desc">查看订单状态</div>
        </div>
        <span class="menu-arrow">›</span>
    </a>
    
    <a href="?ac=user_spacecp" class="menu-item">
        <div class="menu-icon icon-green">⚙️</div>
        <div class="menu-info">
            <div class="menu-title">修改资料</div>
            <div class="menu-desc">个人信息设置</div>
        </div>
        <span class="menu-arrow">›</span>
    </a>
    
    <a href="?ac=loginout" class="menu-item">
        <div class="menu-icon icon-red">🚪</div>
        <div class="menu-info">
            <div class="menu-title">退出登录</div>
        </div>
        <span class="menu-arrow">›</span>
    </a>
</div>

<!-- 推广卡片 -->
<div class="promo-card">
    <div class="promo-title">📢 我的推广</div>
    <div class="qrcode-box">
        <div id="mid-qrcode"></div>
        <p style="margin-top: 8px; font-size: 11px; color: #999;">长按保存图片分享</p>
    </div>
    <div class="link-box">
        <textarea id="sl" class="link-input" readonly rows="1">http://<{$dqurl}>/?dl=<{$member.uid}></textarea>
        <button class="copy-btn" onclick="copyLink()">复制推广链接</button>
    </div>
</div>

<script type="text/javascript" src="/statics/VIP/js/jquery.qrcode.min.js"></script>
<input id="code-url" type="hidden" value="http://<{$dqurl}>/?dl=<{$member.uid}>"/>
<div id="divOne" style="display:none;"></div>

<script>
// 生成二维码和海报
$(function(){
    var qrcode = $('#divOne').qrcode({
        text: $("#code-url").val(),
        width: 150,
        height: 150,
    }).hide();
    
    var canvas = qrcode.find('canvas').get(0);
    var data_codeImg = canvas.toDataURL('image/jpg');
    
    data = [
        '/statics/VIP/beij.png',
        data_codeImg
    ], base64 = [];
    
    function draw(fn) {
        var c = document.createElement('canvas'),
            ctx = c.getContext('2d'),
            len = data.length;
        c.width = 480;
        c.height = 780;
        ctx.rect(0, 0, c.width, c.height);
        ctx.fillStyle = '#fff';
        ctx.fill();
        
        function drawing(n) {
            if (n < len) {
                var img = new Image;
                img.src = data[n];
                img.onload = function () {
                    if (n === 1) {
                        ctx.drawImage(img, c.width/1.78, 293, 150, 150);
                    } else if(n === 0){
                        ctx.drawImage(img, 0, 0, c.width, c.height);
                    }
                    drawing(n + 1);
                }
            } else {
                base64.push(c.toDataURL("data/jpeg", 0.8));
                fn();
            }
        }
        drawing(0);
    }
    
    function hecheng() {
        draw(function () {
            document.getElementById("mid-qrcode").innerHTML = '<img src="'+base64[0]+'" style="max-width:100%; border-radius:10px;">';
        });
    }
    hecheng();
});

// 复制链接
function copyLink() {
    var ele = document.getElementById("sl");
    ele.focus();
    ele.setSelectionRange(0, ele.value.length);
    if(document.execCommand('copy', false, null)){
        // 显示成功提示
        showToast('✓ 复制成功！', 'success');
    } else{
        showToast('✗ 复制失败，请手动复制', 'error');
    }
}

// 自定义提示函数
function showToast(message, type) {
    var toast = document.createElement('div');
    toast.innerHTML = message;
    toast.style.cssText = 'position:fixed;top:50%;left:50%;transform:translate(-50%,-50%);' +
        'background:' + (type === 'success' ? '#4CAF50' : '#f44336') + ';' +
        'color:white;padding:15px 30px;border-radius:8px;font-size:16px;' +
        'z-index:9999;box-shadow:0 4px 12px rgba(0,0,0,0.3);';
    document.body.appendChild(toast);
    
    setTimeout(function() {
        toast.style.opacity = '0';
        toast.style.transition = 'opacity 0.3s';
        setTimeout(function() {
            document.body.removeChild(toast);
        }, 300);
    }, 2000);
}
</script>

</body>
</html>
