<!DOCTYPE html>
<html>
<head>
<title>推广记录-<{$zhanming}></title>
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
    <div class="header-title">推广记录</div>
    <div class="header-right"></div>
</div>

<!-- 统计卡片 -->
<div class="stat-card">
    <div class="stat-value"><{$member.dl_syjf}>元</div>
    <div class="stat-label">累计佣金</div>
</div>

<!-- 记录列表 -->
<{if $result}>
    <{foreach key=k item=i from=$result}> 
    <{if $i.oid}>
    <div class="content-card">
        <div style="display:flex; justify-content:space-between; align-items:center; margin-bottom:10px;">
            <span style="font-size:14px; font-weight:600; color:#333;">[<{$i.type}>] <{$i.data.username}></span>
            <{if $i.status==1}>
                <span class="badge badge-success">已付款</span>
            <{else}>
                <span class="badge badge-warning">未付款</span>
            <{/if}>
        </div>
        
        <div class="list-item">
            <span class="list-label">订单号</span>
            <span class="list-value" style="font-size:12px;"><{$i.oid}></span>
        </div>
        
        <div class="list-item">
            <span class="list-label">提成金额</span>
            <span class="list-value" style="color:#f5a623;">
                <{if $i.dl_status==1}>已获得<{else}>未获得<{/if}>：<{$i.dl_money}>元
            </span>
        </div>
        
        <div class="list-item">
            <span class="list-label">下单时间</span>
            <span class="list-value"><{$i.createtime|date_format:'%Y-%m-%d %H:%M:%S'}></span>
        </div>
        
        <a href="<{$i.url}>" class="btn btn-primary btn-block" style="margin-top:10px; text-decoration:none;">查看详情</a>
    </div>
    <{/if}>
    <{/foreach}>
    
    <!-- 分页 -->
    <div class="content-card" style="text-align:center;">
        <a href="/?ac=user_tgjl&page=<{$pagepre}>" class="btn btn-secondary" style="margin:0 5px; text-decoration:none;">上一页</a>
        <a href="/?ac=user_tgjl&page=<{$pagenext}>" class="btn btn-secondary" style="margin:0 5px; text-decoration:none;">下一页</a>
    </div>
<{else}>
    <div class="empty-state">
        <p style="font-size:48px; margin-bottom:10px;">📊</p>
        <p>暂无推广记录</p>
        <a href="?ac=member" class="btn btn-primary" style="margin-top:20px; text-decoration:none;">返回首页</a>
    </div>
<{/if}>

</body>
</html>
