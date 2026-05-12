<!DOCTYPE html>
<html>
<head>
<title>我的测算-<{$zhanming}></title>
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
    <div class="header-title">我的测算</div>
    <div class="header-right"></div>
</div>

<!-- 测算记录 -->
<{if $result}>
    <{foreach key=k item=i from=$result}> 
    <div class="content-card">
        <div style="display:flex; justify-content:space-between; align-items:center; margin-bottom:10px;">
            <span style="font-size:14px; font-weight:600; color:#333;">[<{$i.type}>]</span>
            <{if $i.status==1}>
                <span class="badge badge-success">已付款</span>
            <{else}>
                <span class="badge badge-warning">未付款</span>
            <{/if}>
        </div>
        
        <{if $i.data.username}>
        <div class="list-item">
            <span class="list-label">姓名</span>
            <span class="list-value"><{$i.data.username}></span>
        </div>
        <{/if}>
        
        <div class="list-item">
            <span class="list-label">订单号</span>
            <span class="list-value" style="font-size:12px;"><{$i.oid}></span>
        </div>
        
        <div class="list-item">
            <span class="list-label">金额</span>
            <span class="list-value" style="color:#f5a623;"><{$i.money}>元</span>
        </div>
        
        <div class="list-item">
            <span class="list-label">测算时间</span>
            <span class="list-value"><{$i.createtime|date_format:'%Y-%m-%d %H:%M:%S'}></span>
        </div>
        
        <a href="<{$i.url}>" class="btn btn-primary btn-block" style="margin-top:10px; text-decoration:none;">查看结果</a>
    </div>
    <{/foreach}>
    
    <!-- 分页 -->
    <{if $endpage > 1}>
    <div class="content-card" style="text-align:center;">
        <a href="/?ac=user_wdcs&page=<{$pagepre}>" class="btn btn-secondary" style="margin:0 5px; text-decoration:none;">上一页</a>
        <a href="/?ac=user_wdcs&page=<{$pagenext}>" class="btn btn-secondary" style="margin:0 5px; text-decoration:none;">下一页</a>
    </div>
    <{/if}>
<{else}>
    <div class="empty-state">
        <p style="font-size:48px; margin-bottom:10px;">🔮</p>
        <p>暂无测算记录</p>
        <a href="/" class="btn btn-primary" style="margin-top:20px; text-decoration:none;">去测算</a>
    </div>
<{/if}>

</body>
</html>
