<!DOCTYPE html>
<html>
<head>
<title>修改资料-<{$zhanming}></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
<script src="/statics/user/js/jquery-1.9.1.min.js"></script>
<script src="/statics/user/js/layer.js"></script>
<link rel="stylesheet" href="/static/user_common_style.css">
</head>
<body>

<!-- 头部 -->
<div class="header">
    <div class="header-left">
        <a href="?ac=member">←</a>
    </div>
    <div class="header-title">修改资料</div>
    <div class="header-right"></div>
</div>

<!-- 表单卡片 -->
<div class="content-card">
    <form action="/?ac=user_spacecp" method="post">
        <{if $member.class!=2 && $member.class!=3}>
        <div class="form-group">
            <label class="form-label">账号</label>
            <div class="form-input" style="background:#f8f9fa; color:#999;"><{$member.user_name}></div>
        </div>
        <{/if}>
        
        <div class="form-group">
            <label class="form-label">昵称</label>
            <div class="form-input" style="background:#f8f9fa; color:#999;"><{$member.nickname}></div>
        </div>
        
        <div class="form-group">
            <label class="form-label">手机号 <span style="color:#f5a623;">*</span></label>
            <input type="tel" name="phone" class="form-input" placeholder="请输入手机号" value="<{$member.phone}>" maxlength="11">
        </div>
        
        <div class="form-group">
            <label class="form-label">QQ号</label>
            <input type="text" name="qq" class="form-input" placeholder="请输入QQ号" value="<{$member.qq}>">
        </div>
        
        <div class="divider"></div>
        
        <div class="info-box">
            <p>💰 当前佣金：<strong style="color:#f5a623;"><{$member.dl_syjf}>元</strong></p>
            <p>🎁 当前积分：<strong><{$member.integral}>个</strong></p>
        </div>
        
        <button type="submit" class="btn btn-primary btn-block">保存修改</button>
    </form>
</div>

</body>
</html>
