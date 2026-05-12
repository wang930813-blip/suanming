<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8"/>
<title>联系我们-付费测试联系帮助</title>
<meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
<meta content="yes" name="apple-mobile-web-app-capable"/>
<meta content="black" name="apple-mobile-web-app-status-bar-style"/>
<meta content="telephone=no" name="format-detection"/>
<link rel="shortcut icon" href="/statics/ffsm/favicon.ico"/>
<link href="/statics/ffsm/public/wap.min-v=0817.css" rel="stylesheet" type="text/css"/>
<link href="/statics/ffsm/index/1/index.css" rel="stylesheet" type="text/css"/>
 <link href="/statics/quanju.css" rel="stylesheet" type="text/css">
<{include file='./ffsm/wx_share.tpl'}>
<script src="https://apps.bdimg.com/libs/jquery/1.9.1/jquery.min.js"></script>
</head>
<body>
<{include file='./ffsm/header.tpl'}>
    <div class="tabBar">
        <div class="item  ">
            <a href="/"><i class="home_icon"></i><span>首页</span></a>
        </div>
        <div class="item">
            <a href="/?ac=history"><i class="report_icon"></i><span>报告</span></a>
        </div>
        <div class="item active">
            <a href="/?ac=contact"><i class="service_icon"></i><span>客服</span></a>
        </div>
        <div class="item">
            <a href="/?ac=userlogin"><i class="user_icon"></i><span>我</span></a>
        </div>
    </div>
<header class="public_header">
<h1 class="public_h_con">联系我们</h1>
<a class="public_h_home" href="/"></a><a href="/?ac=history" class="public_h_menu">我的测试</a></header>
<div class="about_content">
	<p class="ac_title">
		关注公众号寻找解答
	</p>
<center><img src="<{$weixintp}>" width="50%" target="_blank"></center>
	<script>
		(function(){
    var num=['<{$weixinhao}>','<{$weixinhao}>',];
    var rNum=parseInt(Math.random()*num.length,10);
    document.write('<div style="text-align: center;margin:10px 0 0;padding:0 0 10px;overflow: hidden;"><p style="font-size: 16px;">请咨询微信公众号：</p><p style="color:#FF6632;padding:6px 0;font-size: 18px">'+num[rNum]+'</p><div style="width: 240px;text-align: left;margin:0 auto;line-height: 24px;"><p style="position: relative;padding-left:24px;"><i style="font-style: normal;position: absolute;width: 20px;height:20px;line-height: 20px;left:2px;top:2px;line-height: 20px;color: #fff;background: #000;text-align: center;border-radius: 50%">1</i>【长按上方数字复制微信号】</p><a href="weixin://" style="position: relative;padding-left:24px;color: #FF6632;display: block;text-decoration: none;"><i style="font-style: normal;position: absolute;width: 20px;height:20px;line-height: 20px;left:2px;top:2px;line-height: 20px;color: #fff;background: #000;text-align: center;border-radius: 50%"">2</i>【点我打开微信】</a></div></div>');
})();
	</script>
	<div class="ac_service">
	<a class="ac_us"href="/?ac=history">
                付款后看不到测试结果请点击这里
		</a>
	</div>
</div>
 
<script type="text/javascript">
$('.contact').addClass('active')
function _resize(){
    var html= document.getElementsByTagName('html')[0];
    var hW = html.offsetWidth > 750 ? 750 : html.offsetWidth;
    var fS = 100/750 * hW;
    html.style.fontSize = fS+"px"
}
_resize();
window.onresize = function(){
    _resize();
};
</script>
<{include file='./ffsm/footer.tpl'}>
<{include file='./ffsm/dl_ck.tpl'}>
</body>
</html>