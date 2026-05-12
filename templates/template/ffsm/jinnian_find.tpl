<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8"/>
<title>2026马年运势详批-<{$zhanming}></title>
<meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
<meta content="yes" name="apple-mobile-web-app-capable"/>
<meta content="black" name="apple-mobile-web-app-status-bar-style"/>
<meta content="telephone=no" name="format-detection"/>
<link rel="shortcut icon" href="/statics/ffsm/favicon.ico"/>
<link href="/statics/ffsm/jinnian/wap.min-v=0817.css" rel="stylesheet" type="text/css"/>
<{include file='./ffsm/wx_share.tpl'}>
<script src="https://apps.bdimg.com/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="https://cdn.staticfile.net/translate.js/3.2.1/translate.js"></script>
<script src="statics/ffsm/public/js/require/require.min.js" data-main="/statics/ffsm/public/js/common.min.js?v=0817"></script>
</head>
<body>
<{include file='./ffsm/header.tpl'}>
  <{include file='./ffsm/tabBar.tpl'}>
<div class="public_banner J_testFixedShow">

<div class="order_sn"  id="submit2">订单号：<{$data.oid}></div></div>
<div class="order_info">
  <div class="oi_data">
    <div class="oi_userinfo">
      <p>服务项目：2026流年运详批</p>
      <p>用户信息：<span><{$data.data.username}>(<{if $data.data.gender==1}>男<{else}>女<{/if}>)</span></p>
      <p>出生日期：<{$data.data.y}>年<{$data.data.m}>月<{$data.data.d}>日 <{$data.data.h}>时</p>
    </div>
  </div>
</div>
<div class="infor-table order_info">
        <p class="key-text">您的五行八字资料</p>
        <table>
          <tbody>
            <tr>
              <th>八字</th>
              <th>年柱</th>
              <th>月柱</th>
              <th>日柱</th>
              <th>时柱</th></tr>
            <tr>
              <td>天干</td>
              <td><{$return.user.bazi.0}></td>
              <td><{$return.user.bazi.2}></td>
              <td><{$return.user.bazi.4}></td>
              <td><{$return.user.bazi.6}></td></tr>
            <tr>
              <td>地支</td>
              <td><{$return.user.bazi.1}></td>
              <td><{$return.user.bazi.3}></td>
              <td><{$return.user.bazi.5}></td>
              <td><{$return.user.bazi.7}></td></tr>
          </tbody>
        </table>
      <div class="solution-box">
        <div class="sol-left">
          <p>本命属<{$cookies.sx}>，<{$nayin.0.layin}>命。<{$wang.wang}><{$wang.que}>；日主天干为<{$nayin.0.layin}><{$wang.wang}><{$wang.que}><{$cookies.bazi.4}>，生于<{$cookies.siji}>季。</p>
        </div>
      </div>
</div>
<ul class="analysis znysOpen">
  <li>
    <div class="analysis-title"><label>您的2026流年运程</label></div>
    <div class="analysis-body">
      <dd>
			<{foreach from=$return.sx.yf item=v}>
			<p class="public_title">
			<{$v.toubu2}>
			</p>
			<div class="public_con_word">
				<p>
					<{$v.liunian}>
				</p>
			</div>
			<{/foreach}>
      </dd>
    </div>
  </li>
  <li>
    <div class="analysis-title"><label>您的2026年流月运程</label></div>
    <div class="analysis-body">
      <dd>
			<{foreach from=$return.sx.yf item=v}>
			<p class="public_title">
				<{$v.m}>月<{$v.toubu}>
			</p>
			<div class="public_con_word">
				<p>
					<{$v.neirong}>
				</p>
			</div>
			<{/foreach}>
      </dd>
    </div>
  </li>
  <li>
    <div class="analysis-title"><label>终生事业运势分析</label></div>
    <div class="analysis-body">
      <dd>
        <li><{$rglm.syfx}></li>
        <p class="public_title">适合的行业</p>
        <li><{$tywh.hyhw}></li>
        <li>3.是否适合<i>跳槽/创业/改行</i>？如何预防躲避？</li>
      </dd>
    </div>
  </li>
  <li>
    <div class="analysis-title"><label>终生财富运势分析</label></div>
    <div class="analysis-body">
      <dd>
        <li><{$rglm.cyfx}></li>
      </dd>
    </div>
  </li>
  <li>
    <div class="analysis-title"><label>终生爱情运势分析</label></div>
    <div class="analysis-body">
      <dd>
        <li><{$rglm.aqfx}></li>
      </dd>
    </div>
  </li>
  <li>
    <div class="analysis-title"><label>未来一年运势分析</label></div>
    <div class="analysis-body">
      <dd>
        <li><{$myq_text}></li>
      </dd>
    </div>
  </li>
</ul>
</div>

<style type="text/css">
.ainuo_foot_nav{display: block; padding: 2px 0; background:#d13036; position: fixed; bottom: 0; width: 100%; z-index: 99999;max-width:720px;}
.ainuo_foot_nav li{width: 20%; text-align: center; float: left;}
.ainuo_foot_nav li a{width: 100%; display: block;}
.ainuo_foot_nav .foothover i{color: #f13030;}
.ainuo_foot_nav li i{display: block; line-height: 25px; height: 25px; margin: auto; padding: 0; width: 25px; overflow: hidden; background-size: 100%;}
.ainuo_foot_nav li a.botpost{position: relative; margin-top: -11px; background-color: rgba(0,0,0,0.0);}
.ainuo_foot_nav li a.botpost em{background: #ffffff; padding: 2px; border: 1px solid #ff5e5e; display: block; border-radius: 50%; width: 30px; height: 30px; margin: 0 auto; margin-bottom: 2px;padding-bottom: 0px;}
.ainuo_foot_nav li p{overflow: hidden; font-size: 12px; height: 16px; line-height: 16px; color: #fff; font-weight: 400;}
.shouye_1{background: url(/statics/ffsm/public/images/shouye.png) no-repeat;}
.wddd_1{background: url(/statics/ffsm/public/images/dingdan.png) no-repeat;}
.lijics_1{background: url(/statics/ffsm/public/images/suan.png) no-repeat;}
.gengduo_1{background: url(/statics/ffsm/public/images/gengduo.png) no-repeat;}
.grzx_1{background: url(/statics/ffsm/public/images/grzx.png) no-repeat;}
</style>
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
 <script>
translate.language.setLocal('chinese_simplified'); 
translate.changeLanguage('<{$lang._changeLanguage}>');
translate.execute();
</script>
<{include file='./ffsm/user_footer.tpl'}>
<{include file='./ffsm/footer.tpl'}>
<{include file='./ffsm/dl_ck.tpl'}>
</body>
</html>