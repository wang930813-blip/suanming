<!doctype html>
<html>
<head>
<title>提示信息-<{$zhanming}></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0"/>
<script src="/statics/user/js/jquery-1.9.1.min.js"></script>
<link rel="shortcut icon" href="/statics/ffsm/favicon.ico"/>
<style>
* { margin: 0; padding: 0; box-sizing: border-box; }
body { font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif; background: #f5f5f5; min-height: 100vh; display: flex; align-items: center; justify-content: center; }
.message-box { background: #fff; border-radius: 15px; padding: 40px 30px; box-shadow: 0 10px 30px rgba(0,0,0,0.1); max-width: 400px; width: 90%; text-align: center; }
.icon-success { width: 60px; height: 60px; margin: 0 auto 20px; background: #52c41a; border-radius: 50%; display: flex; align-items: center; justify-content: center; }
.icon-success svg { width: 35px; height: 35px; }
.icon-info { width: 60px; height: 60px; margin: 0 auto 20px; background: #1890ff; border-radius: 50%; display: flex; align-items: center; justify-content: center; }
.icon-info svg { width: 35px; height: 35px; }
.message-title { font-size: 20px; font-weight: 600; color: #333; margin-bottom: 10px; }
.message-text { font-size: 14px; color: #666; margin-bottom: 25px; line-height: 1.6; }
.btn-primary { display: inline-block; padding: 12px 40px; background: #f5a623; color: #333; border-radius: 8px; font-size: 16px; font-weight: 600; text-decoration: none; transition: all 0.3s; }
.btn-primary:hover { opacity: 0.9; }
.countdown { color: #999; font-size: 13px; margin-top: 15px; }
</style>
</head>
<body>
<div class="message-box">
    <{if $relog|strpos:"成功" !== false}>
    <div class="icon-success">
        <svg viewBox="0 0 24 24" fill="none" stroke="white" stroke-width="3">
            <polyline points="20 6 9 17 4 12"></polyline>
        </svg>
    </div>
    <{else}>
    <div class="icon-info">
        <svg viewBox="0 0 24 24" fill="none" stroke="white" stroke-width="2">
            <circle cx="12" cy="12" r="10"></circle>
            <line x1="12" y1="16" x2="12" y2="12"></line>
            <line x1="12" y1="8" x2="12.01" y2="8"></line>
        </svg>
    </div>
    <{/if}>
    
    <div class="message-title"><{$relog}></div>
    <div class="message-text">页面将在 <span id="countdown">3</span> 秒后自动跳转...</div>
    
    <a href="<{if $return_urls}><{$return_urls}><{else}>/?ac=<{$relogurl}><{/if}>" class="btn-primary">立即跳转</a>
</div>

<script>
var countdown = 3;
var targetUrl = '<{if $return_urls}><{$return_urls}><{else}>/?ac=<{$relogurl}><{/if}>';

var timer = setInterval(function(){
    countdown--;
    $('#countdown').text(countdown);
    if(countdown <= 0){
        clearInterval(timer);
        window.location.href = targetUrl;
    }
}, 1000);
</script>
</body>
</html>