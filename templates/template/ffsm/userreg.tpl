<!doctype html>
<html>
<head>
<title>会员注册-<{$zhanming}></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0"/>
<script src="/statics/user/js/jquery-1.9.1.min.js"></script>
<script src="/statics/user/js/layer.js"></script>
<script language="javascript" src="/statics/user/js/comm.js"></script>
<link rel="shortcut icon" href="/statics/ffsm/favicon.ico"/> 
<style>
* { margin: 0; padding: 0; box-sizing: border-box; }
body { font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif; background: #f5f5f5; min-height: 100vh; }
.header { height: 50px; background: #fff; display: flex; justify-content: space-between; align-items: center; padding: 0 15px; box-shadow: 0 2px 10px rgba(0,0,0,0.1); position: fixed; top: 0; left: 0; right: 0; z-index: 100; }
.header_left { width: 40px; }
.header_left img { width: 24px; height: 24px; }
.header_right { font-size: 18px; font-weight: 600; color: #333; }
.wrap { padding: 70px 15px 20px; max-width: 500px; margin: 0 auto; }
.w10 { background: #fff; border-radius: 15px; padding: 30px 20px; box-shadow: 0 10px 30px rgba(0,0,0,0.1); }
.login_input { margin-bottom: 20px; }
.binput { width: 100%; height: 50px; padding: 0 15px; border: 2px solid #e0e0e0; border-radius: 10px; font-size: 15px; transition: all 0.3s; }
.binput:focus { border-color: #1890ff; outline: none; box-shadow: 0 0 0 3px rgba(24,144,255,0.1); }
.login_zhuctxt { display: flex; justify-content: space-between; margin-top: 15px; font-size: 14px; }
.login_zhuctxt a { color: #1890ff; text-decoration: none; }
.login_btn { margin-top: 30px; }
.qd_dl_an { display: block; width: 100%; height: 50px; line-height: 50px; text-align: center; background: #f5a623; color: #333; border-radius: 8px; font-size: 16px; font-weight: 600; text-decoration: none; margin-bottom: 15px; transition: all 0.3s; border: none; cursor: pointer; }
.qd_dl_an:hover { opacity: 0.9; }
.login_otpic { margin-top: 30px; padding-top: 20px; border-top: 1px solid #e0e0e0; }
.login_otpic ul { display: flex; justify-content: center; gap: 20px; list-style: none; }
.login_otpic li { width: 50px; height: 50px; }
.login_otpic li img { width: 100%; height: 100%; border-radius: 50%; }
.footer_wz { text-align: center; color: #999; font-size: 12px; margin-top: 30px; }
.footer_wz a { color: #1890ff; text-decoration: none; }
.check-tips { font-size: 12px; color: #52c41a; margin-top: 5px; display: none; }
.check-tips.error { color: #f5222d; }
.fl { float: left; }
.fr { float: right; }
</style>
</head>
<body>
<header class="header">
    <div class="header_left">
        <a href="javascript:void(0);" onclick="window.history.back();">
            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                <path d="M19 12H5M12 19l-7-7 7-7"/>
            </svg>
        </a>
    </div>
    <div class="header_right">会员注册</div>
    <div class="header_left"></div>
</header>

<section class="wrap">
    <form name="form1" id="RegForm" method="post" class="w10" action="/?ac=userreg">
        <input type="hidden" name="reg" value="1" />
        <div class="login_input">
            <input type="text" name="username" id="_username" class="binput" placeholder="请输入用户名(3-16位)" onblur="CheckUser()" />
            <div class="check-tips" id="usernameTip"></div>
        </div>
        <div class="login_input">
            <input type="tel" name="mobile" id="_mobile" class="binput" placeholder="请输入11位手机号(必填)" maxlength="11" />
            <div class="check-tips" id="mobileTip"></div>
        </div>
        <div class="login_input">
            <input type="text" name="nickname" id="_nickname" class="binput" placeholder="请输入昵称" />
        </div>
        <div class="login_input">
            <input type="text" name="email" id="_email" class="binput" placeholder="邮箱(可选)" />
        </div>
        <div class="login_input">
            <input type="password" name="password" id="_password" class="binput" maxlength="18" placeholder="请输入密码(6-18位)" />
        </div>
        <div class="login_input">
            <input type="password" name="password1" id="_password1" class="binput" maxlength="18" placeholder="请再次输入密码" />
        </div>
        <div class="login_zhuctxt">
            <a href="/?ac=userlogin" class="fl">已有账号，去登录>></a>
        </div>
        <div class="login_btn">
            <input type="button" id="_BT_Reg" class="qd_dl_an" value="立即注册" />
        </div>
        <div class="login_otpic">
            <ul>
                <li><a href="/?ac=wxlogin"><img src="/statics/user/images/weixin.png"/></a></li>
                <li><a href="/?ac=qqconnect"><img src="/statics/user/images/qqlogin.png"/></a></li>
            </ul>
        </div>
    </form>
</section>

<div class="footer_wz">
    <a href="/?ac=contact">联系我们</a><br>
    <span>Copyright © 2026 <{$zhanming}> 版权所有</span>
</div>

<script>
function CheckUser() {
    var username = $('#_username').val();
    if (username.length < 3 || username.length > 16) {
        $('#usernameTip').html('用户名长度为3-16位').addClass('error').show();
        return false;
    }
    $.get('/?ac=userreg&is_username=' + username, function(data) {
        if (data.indexOf('可以注册') > -1 || data.indexOf('可用') > -1) {
            $('#usernameTip').html('✓ 用户名可用').removeClass('error').show();
        } else {
            $('#usernameTip').html(data).addClass('error').show();
        }
    });
}

// 手机号验证
$('#_mobile').blur(function(){
    var mobile = $(this).val();
    if (mobile && /^1[3-9]\d{9}$/.test(mobile)) {
        $('#mobileTip').html('✓ 手机号格式正确').removeClass('error').show();
    } else if (mobile) {
        $('#mobileTip').html('手机号格式不正确').addClass('error').show();
    } else {
        $('#mobileTip').hide();
    }
});

$('#_BT_Reg').bind('click', function(){
    var _usernameVal = $('#_username').val();
    var _mobileVal = $('#_mobile').val();
    var _nicknameVal = $('#_nickname').val();
    var _pwdVal = $('#_password').val();
    var _pwd1Val = $('#_password1').val();
    
    console.log('开始验证', {
        username: _usernameVal,
        mobile: _mobileVal,
        nickname: _nicknameVal,
        pwd: _pwdVal ? '已填' : '未填'
    });
    
    if (!_usernameVal || _usernameVal.length < 3 || _usernameVal.length > 16){
        layer.open({
            content: '请输入3-16位用户名！',
            skin: 'msg',
            time: 2
        });
        $('#_username').focus();
        return false;
    } else if (!_mobileVal || !/^1[3-9]\d{9}$/.test(_mobileVal)){
        layer.open({
            content: '请输入正确的11位手机号！',
            skin: 'msg',
            time: 2
        });
        $('#_mobile').focus();
        return false;
    } else if (!_nicknameVal){
        layer.open({
            content: '请输入昵称！',
            skin: 'msg',
            time: 2
        });
        $('#_nickname').focus();
        return false;
    } else if (!_pwdVal || _pwdVal.length < 6){
        layer.open({
            content: '密码长度不正确，请输入6-18位密码！',
            skin: 'msg',
            time: 2
        });
        $('#_password').focus();
        return false;
    } else if (_pwdVal !== _pwd1Val){
        layer.open({
            content: '两次输入的密码不一致！',
            skin: 'msg',
            time: 2
        });
        $('#_password1').focus();
        return false;
    } else {
        console.log('所有验证通过，准备提交表单');
        $('#RegForm').submit();
    }
});
</script>
</body>
</html>