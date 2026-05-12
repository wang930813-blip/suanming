<!doctype html>
<html>
<head>
<title>确认订单支付页</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Cache-Control" content="no-cache" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0" />
<link href="dashi/css/index.css" rel="stylesheet" type="text/css">
<link href="dashi/css/calendar.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="dashi/js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="dashi/js/resizeevts.js"></script>
<link href="/statics/ffsm/dashi/dashi.css" rel="stylesheet" type="text/css"/>
<style type="text/css">
	.wrapper .title1 {
		position: relative;
		float: left;
		width: 100%;
		background: linear-gradient(to right, #b28850, #81511c);
		line-height: 1rem;
		font-size: .36rem;
		color: #fff;
		font-weight: bold;
		text-align: center;
	}
	.wrapper .title1 a {
		position: absolute;
		left: 0;
		width: 1rem;
		color: #fff;
		text-align: center;
	}
	.confirmNotice .phone .row .con span {
		float: left;
		width: auto;
		padding: 0 .1rem 0 0;
		margin: unset;
		border-right: solid 1px #333;
		line-height: .5rem;
	}
	.confirmNotice .phone .row .con input {
		float: left;
		width: 47%;
		border: none;
		background: none;
		outline: none;
		height: .5rem;
		text-indent: .2rem;
	}
	.confirmNotice .phone .row .con a {
		float: right;
		width: 1.6rem;
		background: #fe7517;
		border-radius: .1rem;
		line-height: .5rem;
		font-size: .22rem;
		color: #fff;
		text-align: center;
	}
	.show_san {
		position: absolute;
	    right: 0.2rem;
	    top: 0;
	    width: 0.25rem;
	    height: 0.25rem;
	    background: #ffd275;
	    border-radius: 50%;
	    line-height: .25rem;
	    font-size: .25rem;
	    color: #a57942;
	    text-align: center;
	}
</style>
<{$page_meta}>
</head>
<body>

  	<!--服务信息-->
  	<div class="confirmTitle">服务信息</div>
  	<section class="whitebox">
  		<form id="_to_next_form" name="to_next_form" method="post" action="https://pay.ibazi.cn/pay/weixin_ysfx_pc/pay_mbz.php?remote_id=2024111521435713e742c5fd2a9b" target="_self">
		    <input type="hidden" name="serveid" id="serveid" value="300208" />
	    	<input type="hidden" name="pay_ways"  id="pay_ways" value="weixin"/>
		  	<input type="hidden" name="uid"  value="0" />
	    	<input type="hidden" name="remote_id" id="remote_id" value="2024111521435713e742c5fd2a9b" />
		    
		    <div class="confirmSam">
		      	<div class="pic"><img src="dashi/picture/sam.png" alt=""/></div>
		      	<div class="txt">张盛舒-线上咨询服务<br><span>付款成功后，我将在3~5个工作日给您书面回复。7日内可进行二次提问。</span></div>
		    </div>
		    <div class="confirmOrder">
		    			    		
		    	 
		    </div>
	    </form>
  	</section>
  	<!--服务信息-->
  	<!--咨询信息-->
  	<div class="confirmTitle">咨询信息 <i class="fa fa-star"></i></div>
  	<section class="whitebox">

  	  	<div class="price">
      <p class="tit1 tcenter">预约金额<{$money}>元</p>
      <div class="clearfix inner">
        <ul class="pay-type">
          <{if $sys_pay_type==0 || $sys_pay_type==1 || $sys_pay_type==3}>
          <a class="weixin" target="_self" href="/?ct=pay&ac=go&oid=<{$oid}>&type=1"><li class="on" id="wx_zf">
            <span class="pay-icon icon-wechat"></span>
            <span>微信支付</span>
            <span class="gopaywx">立即支付</span>
          </li></a>
            <{/if}>
          <{if $sys_pay_type==0 || $sys_pay_type==2 || $sys_pay_type==3}>
              <a class="alipay" target="_self" href="/?ct=pay&ac=go&oid=<{$oid}>&type=2"><li id="zfb_zf">
            <span class="pay-icon icon-zfb"></span>
            <span>支付宝支付</span>
            <span class="gopayzfb">立即支付</span>
          </li></a>
            <{/if}>
		<{if $sys_pay_type==0 || $sys_pay_type==4}>
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
          <{if $sys_pay_type==0 || $sys_pay_type==5}>
           <a class="alipay" target="_self" href="/?ct=pay&ac=paypal_go&oid=<{$oid}>"><li id="zfb_zf">
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
          </li></a>
          <{/if}>
        </ul>
      </div>
    </div>

<div class="scsm-box">
    <h1>预约说明</h1>
    <p>预约项目：<{$names.title}></p>
    <p>请确保联系方式正确，方便我们与您取得联系。</p>
    <p>付款后也可获取为您分配的大师联系方式，可主动联系预约大师。</p>
</div>
  
<div class="ainuo_foot_nav cl" id="testFixedBtn" style="display: none;">
    <ul>
     <li><a href="/"><i class="shouye_1"></i><p>测算首页</p></a></li>
     <li><a href="/?ac=history"><i class="wddd_1"></i><p>订单查询</p></a></li>
     <li><a href="#submit2"class="botpost"><em><i class="lijics_1"></i></em><p>立即预约</p></a></li>
     <li><a href="/"><i class="gengduo_1"></i><p>更多测算</p></a></li>
     <li><a href="/?ac=member"><i class="grzx_1"></i><p>个人中心</p></a></li>
    </ul>
</div>
<style type="text/css">
.ainuo_foot_nav{display: block; padding: 2px 0; background:#d6b168; position: fixed; bottom: 0; width: 100%; z-index: 99999;max-width: 640px;}
.ainuo_foot_nav li{width: 20%; text-align: center; float: left;}
.ainuo_foot_nav li a{width: 100%; display: block;}
.ainuo_foot_nav .foothover i{color: #f13030;}
.ainuo_foot_nav li i{display: block; line-height: 25px; height: 25px; margin: auto; padding: 0; width: 25px; overflow: hidden; background-size: 100%;}
.ainuo_foot_nav li a.botpost{position: relative; margin-top: -11px; background-color: rgba(0,0,0,0.0);}
.ainuo_foot_nav li a.botpost em{background: #ffffff; padding: 2px; border: 1px solid #d6b168; display: block; border-radius: 50%; width: 30px; height: 30px; margin: 0 auto; margin-bottom: 2px;padding-bottom: 0px;}
.ainuo_foot_nav li p{overflow: hidden; font-size: 12px; height: 16px; line-height: 16px; color: #fff; font-weight: 400;}
.shouye_1{background: url(/statics/ffsm/public/images/shouye.png) no-repeat;}
.wddd_1{background: url(/statics/ffsm/public/images/dingdan.png) no-repeat;}
.lijics_1{background: url(/statics/ffsm/dashi/images/yu.png) no-repeat;width: 28px!important;}
.gengduo_1{background: url(/statics/ffsm/public/images/gengduo.png) no-repeat;}
.grzx_1{background: url(/statics/ffsm/public/images/grzx.png) no-repeat;}
</style>
<script>
    //测算底部悬浮
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
</script>
<script type="text/javascript">
  //支付后检测跳转
  <{if $yz_pay==1}>
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
  <{/if}>
</script>
<script type="text/javascript">
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
<div style="height: 0.7rem;"></div>
<{include file='./ffsm/footers.tpl'}>
<{include file='./ffsm/dl_ck.tpl'}>
</body>
</html>