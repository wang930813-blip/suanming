<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8"/>
<title>姓名配对-<{$zhanming}>付费测试系统</title>
<meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
<meta content="yes" name="apple-mobile-web-app-capable"/>
<meta content="black" name="apple-mobile-web-app-status-bar-style"/>
<meta content="telephone=no" name="format-detection"/>
<link rel="shortcut icon" href="/statics/ffsm/favicon.ico"/>
<link href="/statics/ffsm/public/wap.min.css?v=0817" rel="stylesheet" type="text/css"/>
<link href="/statics/ffsm/xmpeidui/2/style.min.css" rel="stylesheet" type="text/css"/>
  <link href="/statics/quanju.css" rel="stylesheet" type="text/css">
<{include file='./ffsm/wx_share.tpl'}>
<script src="/statics/jquery-3.2.1.min.js"></script>
<script src="/statics/ffsm/public/js/require/require.min.js"></script>
<script src="https://apps.bdimg.com/libs/jquery/1.9.1/jquery.min.js"></script>
</head>
<body>
<div class="order_top">
	<img src="/statics/ffsm/xmpeidui/2/images/banner_result.jpg" alt="">
	<div style="white-space:nowrap"> 
		<lang>订单号</lang>:<{$oid}>
	</div>
</div>
<div class="order_info J_testFixedShow">
	<p class="oi_tit">
		<lang>姓名相合测试部分预告</lang>
	</p>
	<div class="oi_name">
		<div class="oi_left">
			<h4><{$data.malexing}><{$data.malename}></h4>
			<p>
				<lang>男主角</lang>
			</p>
		</div>
		<div class="oi_con">
			<b>VS</b>
			<p>
				<lang>配对</lang>
			</p>
		</div>
		<div class="oi_right">
			<h4><{$data.femalexing}><{$data.femalename}></h4>
			<p>
				<lang>女主角</lang>
			</p>
		</div>
	</div>
	<div class="oi_num">
		<p>
			<lang>匹配契合度</lang>
		</p>
		<div class="start_0">
		</div>
	</div>
	<div class="oi_txt">
		<table>
		<tr>
			<td>
				<img class="img_l" src="/statics/ffsm/xmpeidui/2/images/book.png" alt="">
				<p>
					<lang>你们是天生一对，还是有缘无分</lang>
				</p>
			</td>
		</tr>
		</table>
	</div>
</div>
<div class="box_lock">
	<dl class="J_payPopupShow">
		<dt>男女双方性格</dt>
		<dd>
		<p>
			<i></i><lang>男方的性格解析</lang>
		</p>
		<p>
			<i></i><lang>女方的性格解析</lang>
		</p>
		<p>
			<i></i><lang>追求对方会被拒绝吗？</lang>
		</p>
		<span></span></dd>
	</dl>
	<dl class="J_payPopupShow">
		<dt>你们的爱情宿命</dt>
		<dd>
		<p>
			<i></i><lang>你们是不是命中注定的一对？</lang>
		</p>
		<p>
			<i></i><lang>双方对待爱情的态度如何？</lang>
		</p>
		<p>
			<i></i><lang>哪些因素会干扰你们的爱情</lang>
		</p>
		<span></span></dd>
	</dl>
	<dl class="J_payPopupShow">
		<dt><lang>你们的爱情危机</lang></dt>
		<dd>
		<p>
			<i></i><lang>两人相处时会出现哪些危机？</lang>
		</p>
		<p>
			<i></i><lang>引发危机的原因都有什么</lang>
		</p>
		<p>
			<i></i><lang>如何破除危机，守护爱情</lang>
		</p>
		<span></span></dd>
	</dl>
	<dl class="J_payPopupShow">
		<dt><lang>姓名姻缘五格</lang></dt>
		<dd>
		<p>
			<i></i><lang>双方的姓名五格是怎样的</lang>
		</p>
		<p>
			<i></i><lang>双方的五格是否有利配对</lang>
		</p>
		<p>
			<i></i><lang>双方五格如何影响你们的姻缘</lang>
		</p>
		<span></span></dd>
	</dl>
	<dl class="J_payPopupShow">
		<dt><lang>姓名相合卦象</lang></dt>
		<dd>
		<p>
			<i></i><lang>双方姓名卦象是什么</lang>
		</p>
		<p>
			<i></i><lang>卦象相合等级是高是低</lang>
		</p>
		<p>
			<i></i><lang>准确卦象解析解密双方姻缘</lang>
		</p>
		<span></span></dd>
	</dl>
	<dl class="J_payPopupShow">
		<dt>给你们的爱情建议</dt>
		<dd>
		<p>
			<i></i><lang>未来双方的感情运势纵览</lang>
		</p>
		<p>
			<i></i><lang>针对你们的配对提供爱情赠言</lang>
		</p>
		<p>
			<i></i><lang>推荐方法助力双方姻缘</lang>
		</p>
		<span></span></dd>
	</dl>
</div>
<div class="order_info">
	<p class="test_have">
		 <lang>已有</lang><span>1597324</span>
		 <lang>人进行了测试，测试结果帮助他们掌握了正确的求爱方式，找到了自己的真爱，</lang>
		 <span>96.7%</span><lang>的客户对测试结果表示满意。 </lang>
	</p>
</div>
<div class="order_pay">
	<p class="op_txt">
		付费后为你揭晓以上完整测试内容
	</p>
	<div class="op_price">
		<lang>结缘价</lang>：<span>¥<{$money}></span>
	</div>
	<p class="op_gray">
		请选择喜欢的付款方式
	</p>
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
				<a class="paypal" target="_self" href="/?ct=pay&ac=paypal_go&oid=<{$oid}>">
					<div id="zfb_zf" class="btn">
						<span class="pay-icon icon-paypal"></span>
						<span>paypal支付</span>
					</div>
				</a>
		<{/if}>	 
			<{if $jf_sys_on==1}>
				<a class="m-extpay" target="_self" href="/?ac=extgo&oid=<{$oid}>">积分支付</a>
            <{/if}>
            <{if $vip_on==1}>
				<a class="m-vippay" target="_self" href="/?ac=vip_pay&oid=<{$oid}>">vip免支付</a>
			<{/if}>
	</div>
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
			<span>统一鉴定价:</span><strong>￥<{$money}>元</strong>
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
				<a class="paypal" target="_self" href="/?ct=pay&ac=paypal_go&oid=<{$oid}>">
					<div id="zfb_zf" class="btn">
						<span class="pay-icon icon-paypal"></span>
						<span>paypal支付</span>
					</div>
				</a>
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
<div class="zt_bottom_r">
	<a href="/?ac=xmpd" class="botpost"><img src="/statics\ffsm\xmpeidui\2\images/lapd_index_04.gif" width="100%" border="0"></a>
  </div>

<style type="text/css">
zt_bottom_r{float: left;
    overflow: hidden;display: block; padding: 2px 0; position: fixed; bottom: 0; width: 100%; z-index: 99999;max-width: 640px;}
</style>
<script>
    //底部悬浮
    ;(function($){
        $.fn.publicPopup=function(opt){
            var pp=$('#publicPayPopup');
            var ppClose=$('#publicPPClose');
            var topShow=$(".J_payBottomShow").length>0?$(".J_payBottomShow").offset().top:200;
            var ppShow=$(".J_payPopupShow").length>0?$(".J_payPopupShow"):'';
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
<script>
	var inquiry_lock = 0;
    $(function () {
        setInterval(function () {
            inquiry();
        }, 2000);
    });
    function inquiry() {
        if (inquiry_lock) {
            return;
        }
        $.get('/?ct=pay&ac=scanquery&oid=<{$oid}>', {t: Date.parse(new Date())}, function (data) {
            if (data.status) {
                inquiry = 1;
                window.location = data.url;
            }
        }, 'json');
    }
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
<{include file='./ffsm/dl_ck.tpl'}>
</body>
</html>