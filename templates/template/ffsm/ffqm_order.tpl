<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8"/>
<title>为宝宝起一个好名字-为宝宝一生助力-<{$zhanming}>在线起名</title>
<meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
<meta content="yes" name="apple-mobile-web-app-capable"/>
<meta content="black" name="apple-mobile-web-app-status-bar-style"/>
<meta content="telephone=no" name="format-detection"/>
<link rel="shortcut icon" href="/statics/ffsm/favicon.ico"/>
<link href="statics/ffsm/ffqm/wap.min-v=0817.css" rel="stylesheet" type="text/css"/>
<link href="statics/ffsm/ffqm/index.css" rel="stylesheet" type="text/css"/>
<link href="statics/ffsm/ffqm/style.min.css" rel="stylesheet" type="text/css"/>
 <link href="/statics/quanju.css" rel="stylesheet" type="text/css">
<{include file='./ffsm/wx_share.tpl'}>
<script src="https://apps.bdimg.com/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="statics/ffsm/public/js/require/require.min.js" data-main="/statics/ffsm/public/js/common.min.js?v=0817"></script>
</head>
<body>
<div class="public_banner" id="submit2">
	<img src="statics/ffsm/ffqm/images/pay01.png" alt="宝宝起名">
</div>
<div style="background-color: #ffe7e8;">
<div style="padding:10px;">
        <div class="user_info">
            <p class="u_title">宝宝信息</p>
            <ul class="u_content">
                <li>

                    <span>宝宝姓氏</span>
                    <span><{$names.username}></span>
                </li>
                <li>
                    <span>出生日期</span>
                    <span><{$names.y}>年<{$names.m}>月<{$names.d}>日<{if $names.h>=0}><{$names.h}><{else}>未知<{/if}>时</span>
                </li>
                <li>
                    <span>性别</span>
                    <span><{if $names.gender==1}>男<{elseif $names.gender==2}>未知<{else}>女<{/if}></span>
                </li>
            </ul>
        </div>
    </div>
<div class="container pay" style="padding-bottom:0px;">
    <div class="price">
      <p class="tit1 tcenter">支付方式</p>
      <div class="clearfix inner">
        <ul class="pay-type">
          <{if $payMethod.wechat}>
          <a class="weixin" target="_self" href="/?ct=pay&ac=go&oid=<{$oid}>&type=1"><li class="on" id="wx_zf">
            <span class="pay-icon icon-wechat"></span>
            <span>微信支付</span>
            <span class="gopaywx">立即支付</span>
          </li></a>
            <{/if}>
          <{if $payMethod.alipay}>
              <a class="alipay" target="_self" href="/?ct=pay&ac=go&oid=<{$oid}>&type=2"><li id="zfb_zf">
            <span class="pay-icon icon-zfb"></span>
            <span>支付宝支付</span>
            <span class="gopayzfb">立即支付</span>
          </li></a>
            <{/if}>
		<{if $payMethod.other}>
 			 <a class="weixin" target="_self" href="/?ct=pay&ac=pay_go&oid=<{$oid}>&type=wxpay"><li class="on" id="wx_zf">
            <span class="pay-icon icon-wechat"></span>
            <span>微信支付</span>
            <em class="ico-arrow"></em>
          </li></a>
              <a class="alipay" target="_self" href="/?ct=pay&ac=pay_go&oid=<{$oid}>&type=alipay"><li id="zfb_zf">
            <span class="pay-icon icon-zfb"></span>
            <span>支付宝支付</span>
            <em class="ico-arrow"></em>
          </li></a>
		<{/if}>

		<{if $payMethod.paypal}>
 			 <a class="weixin" target="_self" href="/?ct=pay&ac=paypal_go&oid=<{$oid}>"><li class="on" id="wx_zf">
            <span class="pay-icon icon-paypal"></span>
            <span>paypal支付</span>
            <em class="ico-arrow"></em>
          </li></a>
            
		<{/if}>


		 <{if $jf_sys_on==1}>
 			 <a class="weixin" target="_self" href="/?ac=extgo&oid=<{$oid}>"><li class="on" id="wx_zf">
            <span class="pay-icon icon-extpay"></span>
            <span>积分支付</span>
            <em class="ico-arrow"></em>
          </li></a>
		<{/if}>
		<{if $vip_on==1}>
		 <a class="weixin" target="_self" href="/?ac=vip_pay&oid=<{$oid}>"><li class="on" id="wx_zf">
            <span class="pay-icon icon-vip_pay"></span>
            <span>vip免支付</span>
            <em class="ico-arrow"></em>
          </li></a><{/if}>
        </ul>
      </div>
    </div>
  <div class="wrap">
    <div class="price">
      <p class="tit1">测试项目：起名项目</p>
      <div class="clearfix inner">
        <div class="fl">
          <span class="yh"><lang>限时优惠</lang>￥<{$money}>元</span>
          <s class="gray"><lang>原价：</lang>￥118.00</s></div>
        <div class="fr">
          <p>距优惠结束</p>
          <p class="red">
            <span class="h" id="hour_show">00：</span>
            <span class="f" id="minute_show">57：</span>
            <span class="m" id="second_show">42</span></p>
        </div>
      </div>
    </div>
<div class="know_img">
	<img src="statics/ffsm/ffqm/images/dajiming.png" alt="宝宝起名">
</div> 
</div>
  <{include file='./ffsm/tabBar.tpl'}>
<!--<footer style="padding: 15px 0px;">
    <p class="p4" style="font-size:.24rem;color:white!important;">大师团队倾力打造，
      <a href="/" style="text-decoration: underline;color:#ffe6a7">查看大师团队简介</a></p>
    <p class="p4" style="font-size:.24rem;color:white!important;margin-bottom:.1rem">如需帮助点此
      <a style="color:#e9d39a;text-decoration: underline;" href="/">联系专属售后客服</a></p>
  </footer>-->
</div>
<div class="public_pay_popup" id="publicPayPopup">
	<div class="public_pp_box">
		<div class="public_pp_close" id="publicPPClose">
			X
		</div>
		<div class="public_pp_tit">
			解锁查看所有测试结果
		</div>
		<div class="public_pp_price">
			<span>统一鉴定价：</span><strong>￥<{$money}>元</strong>
		</div>
		<div class="public_pay_box">
			<{if $payMethod.wechat}>
			<a class="weixin" target="_self" href="/?ct=pay&ac=go&oid=<{$oid}>&type=1">微信安全支付</a>
          <{/if}>
             <{if $payMethod.alipay}>
            <a class="alipay" target="_self" href="/?ct=pay&ac=go&oid=<{$oid}>&type=2">支付宝安全支付</a>
          <{/if}>
            <{if $payMethod.other}>
          <a class="weixin" target="_self" href="/?ct=pay&ac=pay_go&oid=<{$oid}>&type=wxpay">微信支付</a>
          <a class="alipay" target="_self" href="/?ct=pay&ac=pay_go&oid=<{$oid}>&type=alipay">支付宝支付</a>
              <{/if}>
		<{if $payMethod.paypal}>
 			 <a class="weixin" target="_self" href="/?ct=pay&ac=paypal_go&oid=<{$oid}>"><li class="on" id="wx_zf">
            <span class="pay-icon icon-paypal"></span>
            <span>paypal支付</span>
            <em class="ico-arrow"></em>
          </li></a>
            
		<{/if}> 
			  <{if $jf_sys_on==1}>
				<a class="m-extpay" target="_self" href="/?ac=extgo&oid=<{$oid}>">积分支付</a>
            <{/if}>
            <{if $vip_on==1}>
				<a class="m-vippay" target="_self" href="/?ac=vip_pay&oid=<{$oid}>">vip免支付</a>
			<{/if}>
		</div>
	</div>
</div>
<script>
    //测试底部悬浮
    (function(){
    	var topShow=$(".J_testFixedShow");
    	if(topShow.length){
            var topShow=topShow.offset().top;
    		var testBtn=$("#testFixedBtn");
    		$(window).scroll(function(){
                var wt=$(window).scrollTop();
                wt>topShow?(testBtn.fadeIn(),$('.public_footer_servers').css('padding-bottom','50px')):(testBtn.fadeOut(),$('.public_footer_servers').css('padding-bottom','20px'));
            });
            testBtn.add('.J_testScrollTop').on('click',function(){$('html,body').scrollTop(topNum)})
    	}
    })()
    //弹出支付功能
    ;(function($){
        $.fn.publicPopup=function(opt){
            var pp=$('#publicPayPopup');
            var ppClose=$('#publicPPClose');
            return this.each(function(){
                var $this=$(this);
                $(window).scroll(function(){
                    var wt=$(window).scrollTop();
                    wt>topShow?$this.fadeIn():$this.fadeOut();
                });
                $this.on('click',function(){
                    pp.show();
                });
                ppClose.on('click',function(){
                    pp.hide();
                })
                ppShow?ppShow.on('click',function(){pp.show()}):'';
            });
        };
    })(jQuery);
    $("#publicPayBottom").publicPopup();
</script>
<script type="text/javascript">
var intDiff = parseInt(5734);//倒計時總秒數量
function timer(intDiff){
	window.setInterval(function(){
	var day=0,
		hour=0,
		minute=0,
		second=0;//時間默認值		
	if(intDiff > 0){
		day = Math.floor(intDiff / (60 * 60 * 24));
		hour = Math.floor(intDiff / (60 * 60)) - (day * 24);
		minute = Math.floor(intDiff / 60) - (day * 24 * 60) - (hour * 60);
		second = Math.floor(intDiff) - (day * 24 * 60 * 60) - (hour * 60 * 60) - (minute * 60);
	}
	if (minute <= 9) minute = '0' + minute;
	if (second <= 9) second = '0' + second;
	$('#day_show').html(day+"天");
	$('#hour_show').html('<s id="h"></s>'+hour+'小時');
	$('#minute_show').html('<s></s>'+minute+'分');
	$('#second_show').html('<s></s>'+second+'秒');
	intDiff--;
	}, 1000);
} 

$(function(){
	timer(intDiff);
});	
  //支付后检测跳转
       var inquiry_lock = 0;
    $(function () {
        setInterval(function () {
            inquiry(); 
        }, 1000);
    });
    function inquiry() {
        if (inquiry_lock) {
            return;
        }
        $.get('/?ct=pay&ac=scanquery&oid=<{$oid}>', {t: Date.parse(new Date())}, function (data) {
            if (data.status) {
                inquiry = 1;
                $('div.weixin .green').html('支付成功');
                window.location = data.url;
            }
        }, 'json');
    }
</script>
<{include file='./ffsm/footer.tpl'}>
<{include file='./ffsm/dl_ck.tpl'}>
</body>
</html>