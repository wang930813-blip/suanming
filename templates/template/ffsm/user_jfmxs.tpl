<!DOCTYPE html>
<html>
<head>
<title>积分明细-<{$zhanming}></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
<script src="/statics/user/js/jquery-1.9.1.min.js"></script>
<link rel="stylesheet" href="/static/user_common_style.css">
</head>
<body>

<!-- 头部 -->
<div class="header">
    <div class="header-left">
        <a href="?ac=member">←</a>
    </div>
    <div class="header-title">积分明细</div>
    <div class="header-right"></div>
</div>

<!-- 统计卡片 -->
<div class="stat-card">
    <div class="stat-value"><{$member.integral}></div>
    <div class="stat-label">当前积分</div>
</div>

<!-- 明细列表 -->
<{if $result}>
    <{foreach key=k item=i from=$result}> 
    <div class="content-card">
        <div style="display:flex; justify-content:space-between; align-items:center; margin-bottom:10px;">
            <span style="font-size:14px; font-weight:600; color:#333;"><{$i.title}></span>
            <span style="font-size:16px; font-weight:600; color:<{if $i.jf > 0}>#4CAF50<{else}>#f44336<{/if}>;">
                <{if $i.jf > 0}>+<{/if}><{$i.jf}>
            </span>
        </div>
        
        <div class="list-item">
            <span class="list-label">时间</span>
            <span class="list-value"><{$i.addtime|date_format:'%Y-%m-%d %H:%M:%S'}></span>
        </div>
        
        <{if $i.des}>
        <div class="text-muted" style="margin-top:8px; padding:8px; background:#f8f9fa; border-radius:6px;">
            <{$i.des}>
        </div>
        <{/if}>
    </div>
    <{/foreach}>
    
    <!-- 分页 -->
    <div class="content-card" style="text-align:center;">
        <a href="/?ac=user_jfmxs&page=1" class="btn btn-secondary" style="margin:0 5px; text-decoration:none;">首页</a>
        <a href="/?ac=user_jfmxs&page=<{$pagepre}>" class="btn btn-secondary" style="margin:0 5px; text-decoration:none;">上一页</a>
        <a href="/?ac=user_jfmxs&page=<{$pagenext}>" class="btn btn-secondary" style="margin:0 5px; text-decoration:none;">下一页</a>
    </div>
<{else}>
    <div class="empty-state">
        <p style="font-size:48px; margin-bottom:10px;">🎁</p>
        <p>暂无积分明细</p>
        <a href="?ac=member" class="btn btn-primary" style="margin-top:20px; text-decoration:none;">返回首页</a>
    </div>
<{/if}>

</body>
</html>
