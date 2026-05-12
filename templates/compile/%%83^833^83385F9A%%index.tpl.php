<?php /* Smarty version 2.6.25, created on 2025-12-05 22:21:41
         compiled from index/index.tpl */ ?>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>管理员登录 - 狗凯之家源码网</title>
    <link rel="stylesheet" href="/ffsm/statics/ffsm/kmmb/layui/css/layui.css">
    <style>
        body {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .login-container {
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 15px 35px rgba(0,0,0,0.3);
            width: 400px;
            padding: 40px;
        }
        .login-title {
            text-align: center;
            font-size: 28px;
            font-weight: bold;
            color: #333;
            margin-bottom: 30px;
        }
        .login-subtitle {
            text-align: center;
            color: #999;
            margin-bottom: 30px;
        }
        .login-btn {
            width: 100%;
            height: 44px;
            font-size: 16px;
        }
        .switch-link {
            text-align: center;
            margin-top: 20px;
            color: #666;
        }
        .switch-link a {
            color: #1E9FFF;
            text-decoration: none;
        }
        .switch-link a:hover {
            text-decoration: underline;
        }
    </style>
<?php echo $this->_tpl_vars['page_meta']; ?>

</head>
<body>

<div class="login-container" id="login-form">
    <div class="login-title">后台登录</div>
    <div class="login-subtitle">请输入账号密码登录~</div>
    
    <?php if ($this->_tpl_vars['errmsg']): ?>
    <div class="layui-form-item">
        <div style="color: #FF5722; text-align: center; padding: 10px; background: #fff3e0; border-radius: 4px; margin-bottom: 15px;">
            <i class="layui-icon layui-icon-close-fill"></i> <?php echo $this->_tpl_vars['errmsg']; ?>

        </div>
    </div>
    <?php endif; ?>
    
    <form class="layui-form" action="?ct=index&ac=login" method="post">
        <input type="hidden" name="gourl" value="<?php echo $this->_tpl_vars['gourl']; ?>
" />
        
        <div class="layui-form-item">
            <label class="layui-form-label"><i class="layui-icon layui-icon-username"></i></label>
            <div class="layui-input-block">
                <input type="text" name="username" placeholder="请输入登录帐号" class="layui-input" lay-verify="required">
            </div>
        </div>
        
        <div class="layui-form-item">
            <label class="layui-form-label"><i class="layui-icon layui-icon-password"></i></label>
            <div class="layui-input-block">
                <input type="password" name="password" placeholder="请输入登录密码" class="layui-input" lay-verify="required">
            </div>
        </div>
        
        <div class="layui-form-item">
            <button type="submit" class="layui-btn layui-btn-fluid login-btn" lay-submit lay-filter="login">登 录</button>
        </div>
    </form>
    
    <div class="switch-link">
        还没有代理？<a href="javascript:;" onclick="showRegister()">立即注册</a>
    </div>
</div>

<div class="login-container" id="register-form" style="display:none;">
    <div class="login-title">代理注册</div>
    <div class="login-subtitle">注册成功后可分销获取提成</div>
    
    <form class="layui-form" action="?ct=index&ac=login" method="post">
        <input type="hidden" name="reg" value="1" />
        <input type="hidden" name="gourl" value="<?php echo $this->_tpl_vars['gourl']; ?>
" />
        
        <div class="layui-form-item">
            <div class="layui-input-block">
                <input type="text" name="username" placeholder="请输入登录用户名" class="layui-input" lay-verify="required">
            </div>
        </div>
        
        <div class="layui-form-item">
            <div class="layui-input-block">
                <input type="text" name="nickname" placeholder="请输入昵称（必须汉字）" class="layui-input" lay-verify="required">
            </div>
        </div>
        
        <div class="layui-form-item">
            <div class="layui-input-block">
                <input type="password" name="password" placeholder="请输入登录密码" class="layui-input" lay-verify="required">
            </div>
        </div>
        
        <div class="layui-form-item">
            <div class="layui-input-block">
                <input type="password" name="password2" placeholder="请确认登录密码" class="layui-input" lay-verify="required">
            </div>
        </div>
        
        <div class="layui-form-item">
            <div class="layui-input-block">
                <input type="text" name="email" placeholder="必填（方便找回密码）" class="layui-input" lay-verify="required|email">
            </div>
        </div>
        
        <div class="layui-form-item">
            <div class="layui-input-inline" style="width: 60%;">
                <input type="text" name="yzm" placeholder="请输入验证码" class="layui-input" lay-verify="required">
            </div>
            <div class="layui-input-inline" style="width: 38%;">
                <img src="/acs/gd_sub_num.php" onclick="this.src='/acs/gd_sub_num.php?time='+new Date().getTime()" style="height: 38px; cursor: pointer;">
            </div>
        </div>
        
        <div class="layui-form-item">
            <button type="submit" class="layui-btn layui-btn-fluid login-btn" lay-submit>注 册</button>
        </div>
    </form>
    
    <div class="switch-link">
        已有代理账号？<a href="javascript:;" onclick="showLogin()">返回登录</a>
    </div>
</div>

<script src="/ffsm/statics/ffsm/kmmb/layui/layui.js"></script>
<script>
layui.use('form', function(){
    var form = layui.form;
});

function showRegister() {
    document.getElementById('login-form').style.display = 'none';
    document.getElementById('register-form').style.display = 'block';
}

function showLogin() {
    document.getElementById('register-form').style.display = 'none';
    document.getElementById('login-form').style.display = 'block';
}
</script>
</body>
</html>