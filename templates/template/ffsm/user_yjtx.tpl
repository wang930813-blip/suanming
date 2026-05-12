<!DOCTYPE html>
<html>
<head>
<title>佣金提现-<{$zhanming}></title>
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
    <div class="header-title">佣金提现</div>
    <div class="header-right"></div>
</div>

<!-- 统计卡片 -->
<div class="stat-card">
    <div class="stat-value"><{$member.dl_syjf}>元</div>
    <div class="stat-label">可提现佣金</div>
</div>

<!-- 提现表单 -->
<div class="content-card">
    <h3>提现申请</h3>
    
    <form action="/?ac=user_yjtx" method="post">
        <input type="hidden" name="tx" value="1">
        
        <div class="form-group">
            <label class="form-label">提现方式 <span style="color:#f5a623;">*</span></label>
            <select name="tx_type" class="form-input">
                <option value="1">支付宝</option>
                <option value="2">微信</option>
                <option value="3">银行卡</option>
            </select>
        </div>
        
        <div class="form-group">
            <label class="form-label">提现金额 <span style="color:#f5a623;">*</span></label>
            <input type="number" name="tx_money" class="form-input" placeholder="请输入提现金额" step="0.01" min="1" max="<{$member.dl_syjf}>" required>
        </div>
        
        <div class="form-group">
            <label class="form-label">收款账号 <span style="color:#f5a623;">*</span></label>
            <input type="text" name="tx_account" class="form-input" placeholder="支付宝/微信/银行卡账号" required>
        </div>
        
        <div class="form-group">
            <label class="form-label">收款姓名 <span style="color:#f5a623;">*</span></label>
            <input type="text" name="tx_name" class="form-input" placeholder="请输入真实姓名" required>
        </div>
        
        <div class="form-group">
            <label class="form-label">备注说明</label>
            <textarea name="tx_remark" class="form-textarea" placeholder="选填，如银行名称、开户行等"></textarea>
        </div>
        
        <div class="info-box">
            <p>📌 提现说明：</p>
            <p>• 最低提现金额：1元</p>
            <p>• 审核时间：1-3个工作日</p>
            <p>• 到账时间：审核通过后24小时内</p>
            <p>• 提现费用：免手续费</p>
        </div>
        
        <button type="submit" class="btn btn-primary btn-block">提交申请</button>
    </form>
</div>

<div style="height:20px;"></div>

</body>
</html>
