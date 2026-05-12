<!DOCTYPE html>
<html>
<head>
<title>提现明细-<{$zhanming}></title>
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
    <div class="header-title">提现明细</div>
    <div class="header-right"></div>
</div>

<!-- 提现记录 -->
<{if $result}>
    <{foreach key=k item=i from=$result}> 
    <div class="content-card">
        <div style="display:flex; justify-content:space-between; align-items:center; margin-bottom:10px;">
            <span style="font-size:18px; font-weight:600; color:#f5a623;"><{$i.tx_money}>元</span>
            <{if $i.status==0}>
                <span class="badge badge-warning">审核中</span>
            <{elseif $i.status==1}>
                <span class="badge badge-success">已通过</span>
            <{elseif $i.status==2}>
                <span class="badge badge-danger">已拒绝</span>
            <{/if}>
        </div>
        
        <div class="list-item">
            <span class="list-label">提现方式</span>
            <span class="list-value">
                <{if $i.tx_type==1}>支付宝
                <{elseif $i.tx_type==2}>微信
                <{elseif $i.tx_type==3}>银行卡
                <{else}>其他
                <{/if}>
            </span>
        </div>
        
        <div class="list-item">
            <span class="list-label">收款账号</span>
            <span class="list-value"><{$i.tx_account}></span>
        </div>
        
        <div class="list-item">
            <span class="list-label">收款姓名</span>
            <span class="list-value"><{$i.tx_name}></span>
        </div>
        
        <div class="list-item">
            <span class="list-label">申请时间</span>
            <span class="list-value"><{$i.addtime|date_format:'%Y-%m-%d %H:%M:%S'}></span>
        </div>
        
        <{if $i.check_time}>
        <div class="list-item">
            <span class="list-label">审核时间</span>
            <span class="list-value"><{$i.check_time|date_format:'%Y-%m-%d %H:%M:%S'}></span>
        </div>
        <{/if}>
        
        <{if $i.tx_remark}>
        <div class="text-muted" style="margin-top:8px; padding:8px; background:#f8f9fa; border-radius:6px;">
            备注：<{$i.tx_remark}>
        </div>
        <{/if}>
        
        <{if $i.check_remark}>
        <div class="text-muted" style="margin-top:8px; padding:8px; background:#fff3e0; border-radius:6px; color:#FF9800;">
            审核说明：<{$i.check_remark}>
        </div>
        <{/if}>
    </div>
    <{/foreach}>
    
    <!-- 分页 -->
    <div class="content-card" style="text-align:center;">
        <a href="/?ac=user_txmx&page=<{$pagepre}>" class="btn btn-secondary" style="margin:0 5px; text-decoration:none;">上一页</a>
        <a href="/?ac=user_txmx&page=<{$pagenext}>" class="btn btn-secondary" style="margin:0 5px; text-decoration:none;">下一页</a>
    </div>
<{else}>
    <div class="empty-state">
        <p style="font-size:48px; margin-bottom:10px;">💸</p>
        <p>暂无提现记录</p>
        <a href="?ac=user_yjtx" class="btn btn-primary" style="margin-top:20px; text-decoration:none;">去提现</a>
    </div>
<{/if}>

</body>
</html>
