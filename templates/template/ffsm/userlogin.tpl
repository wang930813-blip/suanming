<!doctype html>
<html>
<head>
<title>会员登录-<{$zhanming}></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0"/>
<script src="/statics/user/js/jquery-1.9.1.min.js"></script>
<script src="/statics/user/js/layer.js"></script>
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
.qd_dl_an { display: block; width: 100%; height: 50px; line-height: 50px; text-align: center; background: #f5a623; color: #333; border-radius: 8px; font-size: 16px; font-weight: 600; text-decoration: none; margin-bottom: 15px; transition: all 0.3s; border: none; }
.qd_dl_an:hover { opacity: 0.9; }
.qd_dl_an.secondary { background: #ffe5d1; color: #333; }
.login_otpic { margin-top: 30px; padding-top: 20px; border-top: 1px solid #e0e0e0; }
.login_otpic ul { display: flex; justify-content: center; gap: 20px; list-style: none; }
.login_otpic li { width: 50px; height: 50px; }
.login_otpic li img { width: 100%; height: 100%; border-radius: 50%; }
.footer_wz { text-align: center; color: #999; font-size: 12px; margin-top: 30px; }
.footer_wz a { color: #1890ff; text-decoration: none; }
.fl { float: left; }
.fr { float: right; }
.login_tabs { display: flex; margin-bottom: 25px; border-bottom: 2px solid #f0f0f0; }
.login_tab { flex: 1; text-align: center; padding: 12px 0; font-size: 15px; font-weight: 600; color: #999; cursor: pointer; transition: all 0.3s; position: relative; }
.login_tab.active { color: #333; }
.login_tab.active::after { content: ''; position: absolute; bottom: -2px; left: 50%; transform: translateX(-50%); width: 30px; height: 2px; background: #f5a623; }
.login_form { display: none; }
.login_form.active { display: block; }
.captcha_box { display: flex; gap: 10px; }
.captcha_box .binput { flex: 1; }
.send_code_btn { height: 50px; padding: 0 20px; background: #1890ff; color: #fff; border: none; border-radius: 8px; font-size: 14px; font-weight: 600; cursor: pointer; white-space: nowrap; }
.send_code_btn:disabled { background: #ccc; cursor: not-allowed; }
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
    <div class="header_right">会员登录</div>
    <div class="header_left"></div>
</header>

<section class="wrap">
    <div class="w10">
        <!-- 登录方式切换 -->
        <div class="login_tabs">
            <div class="login_tab active" data-tab="pwd">密码登录</div>
            <div class="login_tab" data-tab="sms">短信登录</div>
        </div>
        
        <!-- 密码登录表单 -->
        <form name="form1" id="_LoginForm1" method="post" class="login_form active" action="/?ac=userlogin">
            <input type="hidden" name="islog" value="1">
            <div class="login_input">
                <input type="text" name="username" id="_username" class="binput" placeholder="请输入账号/邮箱/手机" />
            </div>
            <div class="login_input">
                <input type="password" name="password" id="_password" class="binput" maxlength="18" placeholder="密码(6-18位中英文密码)" />
            </div>
            <div class="login_zhuctxt">
                <a href="/?ac=userreg" class="fl">注册>></a>
                <a href="javascript:alert('请联系客服找回密码');" class="fr">忘记密码？</a>
            </div>
            <div class="login_btn">
                <a href="javascript:void(0);" id="_BT_Login" class="qd_dl_an">立即登录</a>
            </div>
        </form>
        
        <!-- 短信登录表单 -->
        <form name="form2" id="_SmsLoginForm" method="post" class="login_form" action="/?ac=sms_login">
            <div class="login_input">
                <input type="text" name="mobile" id="_mobile" class="binput" placeholder="请输入11位手机号" maxlength="11" />
            </div>
            <div class="login_input">
                <div class="captcha_box">
                    <input type="text" name="code" id="_sms_code" class="binput" placeholder="请输入4位短信验证码" maxlength="4" />
                    <button type="button" class="send_code_btn" id="send_code_btn">获取验证码</button>
                </div>
            </div>
            <div class="login_zhuctxt">
                <a href="/?ac=userreg" class="fl">注册>></a>
                <span class="fr" style="color: #999;">未注册手机将自动创建账号</span>
            </div>
            <div class="login_btn">
                <a href="javascript:void(0);" id="_BT_SmsLogin" class="qd_dl_an">立即登录</a>
            </div>
        </form>
        
        <div class="login_otpic">
            <ul>
                <li><a href="/?ac=wxlogin"><img src="/statics/user/images/weixin.png"/></a></li>
                <li><a href="/?ac=qqconnect"><img src="/statics/user/images/qqlogin.png"/></a></li>
            </ul>
        </div>
    </div>
</section>

<div class="footer_wz">
    <a href="/?ac=contact">联系我们</a><br>
    <span>Copyright © 2026 <{$zhanming}> 版权所有</span>
</div>

<script>
$(function(){
console.log('页面加载完成，开始绑定事件');

// 已去掉图形验证码

// 登录方式切换
$('.login_tab').click(function(){
    var tab = $(this).data('tab');
    $('.login_tab').removeClass('active');
    $(this).addClass('active');
    $('.login_form').removeClass('active');
    if (tab === 'pwd') {
        $('#_LoginForm1').addClass('active');
    } else {
        $('#_SmsLoginForm').addClass('active');
    }
});

// 密码登录
$('#_BT_Login').bind('click', function(){
    var _usernameVal = $('#_username')[0].value;
    var _pwdVal = $('#_password')[0].value;
    
    if (!_usernameVal){
        layer.open({
            content: '请输入用户名！',
            skin: 'msg',
            time: 2
        });
        $('#_username')[0].focus();
        return false;
    } else if (!_pwdVal || _pwdVal.length < 6){
        layer.open({
            content: '密码长度不正确，请输入6-18位密码！',
            skin: 'msg',
            time: 2
        });
        $('#_password')[0].focus();
        return false;
    } else {
        $('#_LoginForm1').submit();
    }
});

// 发送短信验证码
var countdown = 0;
console.log('查找发送按钮:', $('#send_code_btn').length > 0 ? '找到了' : '未找到');
$('#send_code_btn').on('click', function(e){
    console.log('点击获取验证码按钮');
    
    // 如果正在倒计时，不处理
    if (countdown > 0) {
        console.log('倒计时中，请等待');
        return false;
    }
    
    var mobile = $('#_mobile').val();
    console.log('手机号:', mobile);
    
    // 验证手机号
    if (!mobile || !/^1[3-9]\d{9}$/.test(mobile)) {
        layer.open({
            content: '请输入正确的11位手机号！',
            skin: 'msg',
            time: 2
        });
        $('#_mobile').focus();
        return false;
    }
    
    // 显示加载中
    var $btn = $(this);
    $btn.text('发送中...').prop('disabled', true);
    
    console.log('开始发送AJAX请求');
    $.ajax({
        url: '/?ac=send_sms_code',
        type: 'POST',
        data: { mobile: mobile },
        dataType: 'json',
        success: function(res) {
            console.log('AJAX请求成功，返回结果:', res);
            
            // 发送成功
            if (res.code == 1) {
                layer.open({
                    content: '✓ 验证码已发送，请查收短信',
                    skin: 'msg',
                    time: 2
                });
                
                // 开始倒计时60秒
                countdown = 60;
                var timer = setInterval(function(){
                    countdown--;
                    $btn.text(countdown + 's 后重新获取').prop('disabled', true);
                    if (countdown <= 0) {
                        clearInterval(timer);
                        $btn.text('获取验证码').prop('disabled', false);
                    }
                }, 1000);
            } 
            // 发送失败
            else {
                // 显示具体错误信息
                var errorMsg = res.msg || '发送失败，请重试';
                layer.open({
                    content: '✗ ' + errorMsg,
                    skin: 'msg',
                    time: 3
                });
                
                // 恢复按钮
                $btn.text('获取验证码').prop('disabled', false);
            }
        },
        error: function(xhr, status, error) {
            console.log('AJAX请求失败:', status, error, xhr);
            
            // 网络错误
            layer.open({
                content: '✗ 网络错误，请检查网络连接',
                skin: 'msg',
                time: 3
            });
            
            // 恢复按钮
            $btn.text('获取验证码').prop('disabled', false);
        }
    });
    
    return false;
});

// 短信登录
$('#_BT_SmsLogin').click(function(){
    var mobile = $('#_mobile').val();
    var code = $('#_sms_code').val();
    
    if (!mobile || !/^1[3-9]\d{9}$/.test(mobile)) {
        layer.open({
            content: '请输入正确的手机号！',
            skin: 'msg',
            time: 2
        });
        return;
    }
    
    if (!code || code.length != 4) {
        layer.open({
            content: '请输入4位短信验证码！',
            skin: 'msg',
            time: 2
        });
        return;
    }
    
    $('#_SmsLoginForm').submit();
});

}); // end of $(function(){})
</script>
</body>
</html>