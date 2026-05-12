<!DOCTYPE html>
<html>
<head>
<title>老师详情页</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Cache-Control" content="no-cache" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0" />
<meta name="copyright" content=",网,版权所有">
<link href="dashi/css/index.css" rel="stylesheet" type="text/css">
<link href="dashi/css/layer.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="dashi/css/pingjia.css"/>
<link href="dashi/css/font-awesome.min.css" rel="stylesheet">


<link href="/statics/ffsm/dashi/dashi.css" rel="stylesheet" type="text/css"/>
<{include file='./ffsm/wx_share.tpl'}>
<script src="https://apps.bdimg.com/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="statics/ffsm/public/js/require/require.min.js"></script>
<script src="statics/ffsm/public/js/common.min.js"></script>

<style>
  	.parent {
	    width: 100%;
	    height: 200px;
	    margin: 0 auto;
	    overflow-y: scroll;
  	}
  	/*设置的子盒子高度大于父盒子，产生溢出效果*/
  	.child {
    	height: auto;
  	}
  	.child li {
    	height: 50px;
    	margin: 2px 0;
  	}
  	.detailSpeak {
	    display: flex;
	    width: 100%;
	    align-items: center;
	    font-size: .28rem;
	    text-align: unset;
	    line-height: unset;
   	}
	.list_lh li {
	   	width: 100%;
	   	display: inline-block;
	    margin: .3rem 0 0 0;
	    border-bottom: dotted 1px #ccc;
	    padding: 0 0 .3rem 0;
	}
	.detailBanner.bg1 {
	    background: url(dashi/images/01.jpg) no-repeat;
	    background-size: 100% 100%;
	}
	.detailBanner .num ul li {
		float: left;
	    width: 50%;
	    font-size: .28rem;
	    text-align: center;
	}
</style>
    
<{$page_meta}>
</head>
<body>
  	<div id="order-pop-you" style="position: absolute;right: 0;top: 20%;z-index: 10000;">
    	<a href="/?ac=history" target="_self"><img style="width: 25px;height: auto; display: block;" src="dashi/picture/fubiao1.png" alt=""></a>
  	</div>

<script>
 //location.href     20201125输入页回退强制到列表页     

function huituifun() {
    window.history.replaceState('index', null, document.URL);
    //console.log('点击后退按钮后 state的值：',history.state); 
    if (history.state=='index') {
      window.layer.closeAll();
      window.removeEventListener("popstate",huituifun);
      window.location.href='../'; //index-->list
      
    }
  }

//console.log('增加历史记录前 state的值：',history.state);
  window.addEventListener("popstate",huituifun);
  if (history.state!='index') {
    window.history.pushState('newindex', null, document.URL);
    //console.log('增加历史记录后 state的值：',history.state);  
  }else{
    window.removeEventListener("popstate",huituifun);
  }



</script>




<!--新增邮箱移植到头部-->
        
<section class="wrapper">
	
<!--老师资料 -->
<section class="detailBanner bg1">
  <div class="info">
    <div class="avator"><img src="<{$dsyy_row.images}>" alt=""></div>
    <div class="con"><b><{$dsyy_row.teacher}></b><br/><span style="white-space: pre-line;"><{$dsyy_row.position}></span><br/>主要擅长：<span><{$dsyy_row.project}></span></div>
  </div>
  <div class="num">
    <ul>
      <li><span><{if $dsyy_row.years}><{$dsyy_row.years}><{else}><{$dsyy_row.title}><{/if}></span><br>从业年限</li>
      <!--<li><span>10585</span><br>评价数</li>-->
      <li>
      	<span style="color: #FFD700;">
      		<{if $dsyy_row.rating >= 1}><i class="fa fa-star"></i><{else}><i class="fa fa-star-o"></i><{/if}>
	      	<{if $dsyy_row.rating >= 2}><i class="fa fa-star"></i><{else}><i class="fa fa-star-o"></i><{/if}>
	      	<{if $dsyy_row.rating >= 3}><i class="fa fa-star"></i><{else}><i class="fa fa-star-o"></i><{/if}>
	      	<{if $dsyy_row.rating >= 4}><i class="fa fa-star"></i><{else}><i class="fa fa-star-o"></i><{/if}>
	      	<{if $dsyy_row.rating >= 5}><i class="fa fa-star"></i><{else}><i class="fa fa-star-o"></i><{/if}>
      	</span>
      	<br>好评率
      </li>
    </ul> 	
  </div>
</section>
<!--老师资料 -->

<!--main开始-->
<section class="main marg50"> 
  <!--老师简介-->
  <section class="whitebox"> 
    <div class="detailTitle"><span>平台保障——二十年诚信品牌</span></div>
    <div class="detailLabel">
      <ul>
        <li>服务保障</li>
        <li>保护隐私</li>
        <li>二次提问</li>
        <li>好评如潮</li>
      </ul>
    </div>
    <div class="detailLine"></div>
    <div class="detailTitle"><span>个人介绍</span> <em>擅长工具：<{$dsyy_row.project}></em></div>
    <div class="detailTxt"><{$dsyy_row.centent}></div>
    <div class="detailLine"></div>
    <div class="detailTitle"><span>其他擅长领域</span></div>
    <div class="detailTxt"><{if $dsyy_row.other_skills}><{$dsyy_row.other_skills}><{else}>姓名起名，桃花姻缘，爱情烦恼，婚姻，外遇，离婚，求子，求职转运，创业，合伙，流年分析，生涯规划，婆媳关系，妯娌关系，家族问题，学业进修，留学，亲子沟通，子女教育，事业传承。<{/if}></div>
  </section>
  <!--老师简介-->
  
  <!--老师对你说-->
  <section class="whitebox marg30">
    <div class="detailSpeak" style="">
		<div style="flex: 1;text-align: justify;">
    		顺着天赋做事，逆着个性做人。		</div>
	</div>
  </section>
<p class="pcombtn">
    <span class="bediv spsl">2606测试</span>
    <span class="bediv sppj">5评价</span>
    <span class="bediv sphp">96.78%<lang>好评</lang></span>
</p>
<div class="scsm-box" id="submit2">
    <p>预约说明：</p>
    <p>请提供您的出生信息，专业老师马上为您解答。</p>
    <p>以用户输入的时间为准，提供详细准确的个人信息，对命理分析有很大帮助喔！</p>
</div>
<div class="public_bg_color">
	<form class="J_ajaxForm J_testFixedShow" id="submit1" action="?ac=dashi" name="login" method="post" onSubmit="return checkForm();">
		<div class="public_form_wrap" id="miaodian">
			<ul>
				<li>
				<div class="left">预约金额</div>
				<div class="auto" id="project_sls">
					<div type="text" class="bg_no" id="dsyy_money"/><{$dsyy_row.money}>元</div>
				</div>
				</li>
				<li>
				<div class="left">您的姓名</div>
				<div class="auto">
					<input type="text" class="bg_no" id="username" name="username" placeholder="请输入名字（必须汉字）" value=""/>
				</div>
				</li>
				<li>
				<div class="left">您的性别</div>
				<div class="auto sex sex J_sex">
					<span class="cur" data-value="1"><i></i><font>男</font></span><span data-value="0"><i></i><font>女</font></span><input type="hidden" name="gender" value="1"/>
				</div>
				</li>
				<li>
				<div class="left">出生日期</div>
				<div class="auto">
					<input type="text" id="birthday" data-input-id="b_input" class="Js_date" data-type="0" value="请选择出生日期" placeholder="请选择日期" data-toid-hour="birthday">
				</div>
				</li>
				<li>
				<div class="left">联系电话</div>
				<div class="auto">
					<input type="text" class="bg_no" id="tel" name="tel" placeholder="请输入手机号码" value=""/>
				</div>
				</li>
				<input type="hidden" name="project_id" id="project_id" value="<{$dsyy_row.id}>">
                <input type="hidden" name="h"  class="auto input J-time" id='j_dd'  value="">
                <input type="hidden" name=y  value="0">
                <input type="hidden" name=m  value="0">
                <input type="hidden" name=d  value="0">
                <input type="hidden" name=i  value="0">
                <input type="hidden" name=cY  value="">
                <input type="hidden" name=cM  value="">
                <input type="hidden" name=cD  value="">
                <input type="hidden" name=cH  value="">
                <input type="hidden" name=term1  value="">
                <input type="hidden" name=term2  value="">
                <input type="hidden" name=start_term  value="">
                <input type="hidden" name=end_term  value="">
                <input type="hidden" name=start_term1  value="">
                <input type="hidden" name=end_term1  value="">
                <input type="hidden" name=lDate  value="">
			</ul>
		</div>
		<div class="public_btn_s">
        	<input type="button" value="提交预约" class="J_ajax_submit_btnsub">
		</div>
	</form>
</div>
<div class="fenge"></div>
<div class="colorbox">
  <div class="main-tit clearfix">
    <span class="bediv"><lang>咨询评价</lang>(5)</span></div>
  <div class="cmtlist">
    <dl>
      <dt>
        <img src="/statics/user/picture/mricon.png" alt=""></dt>
      <dd>
        <p class="ptit">138****6098</p>
        <p class="pstar clearfix">
          <span></span>
          <span></span>
          <span></span>
          <span></span>
          <span></span>
        </p>
        <p class="ptxt">本来要结婚的，后面因为一些乱七八糟的事情一直左右摇摆，不知道后面到底会怎样，我仿佛已经没有了信心。老师分析的也很对，我们之间存在的问题都说到了，也谢谢老师的建议，我尽量调整了只能。</p></dd>
    </dl>
    <dl>
      <dt>
        <img src="/statics/user/picture/mricon.png" alt=""></dt>
      <dd>
        <p class="ptit">152****0289</p>
        <p class="pstar clearfix">
          <span></span>
          <span></span>
          <span></span>
          <span></span>
          <span></span>
        </p>
        <p class="ptxt">预测最大的意义就是提醒自己，有时候看看还是挺好的。</p></dd>
    </dl>
    <dl>
      <dt>
        <img src="/statics/user/picture/mricon.png" alt=""></dt>
      <dd>
        <p class="ptit">138****5784</p>
        <p class="pstar clearfix">
          <span></span>
          <span></span>
          <span></span>
          <span></span>
          <span></span>
        </p>
        <p class="ptxt">如老师所说，我真的的就是那种要很努力才能得到自己想要的东西，我会继续努力的，谢谢老师。</p></dd>
    </dl>
  </div>
  <div class="cmtall">
    <a href="/?ac=dashi" class="afdiv">查看全部评价</a></div>
</div>
<div class="fenge"></div>
<div class="lunpan_box" style="display:none;">
	<div class="lunpan">
		<img src="statics/ffsm/bazisyy/1/images/luopan.png" alt="轮盘">
		<img src="statics/ffsm/bazisyy/1/images/zhizheng.png" alt="轮盘">
	</div>
	<div class="lunpan_color"></div>
    <span style="color:#FFF; text-align:center;position:fixed;top:70%;left:29%;z-index:110;margin:0 auto;">正在查询在线大师 请稍后...</span>
</div>
<div class="ainuo_foot_nav cl" id="testFixedBtn" style="display: none;">

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
.lijics_1{background: url(/statics/ffsm/public/images/wen.png) no-repeat;width: 28px!important;}
.gengduo_1{background: url(/statics/ffsm/public/images/gengduo.png) no-repeat;}
.grzx_1{background: url(/statics/ffsm/public/images/grzx.png) no-repeat;}
</style>

<script>
$('.sure').click(function(){
	alert('你没有付费不能评价');
	return false;
});

$('.J_ajax_submit_btnsub').click(function(){
		var phone=/^1[345789]\d{9}$/;
		var tjPhone=$('#tel').val();
		if(tjPhone.match(phone)==null){
			alert("您的手机格式不正确");
			$('#tel').focus();
			return false;
		}
		if (tjPhone==""){
			alert("请手机号码！");
			$('#tel').focus();
			return false;
		}		
		if ($('#project_id').val()==""){
			alert("请选择预约项目！");
			$('#project_tit').focus();
			return false;
		}
        $('.lunpan_box').css('display','block');
            setTimeout(function(){  //使用  setTimeout（）方法设定定时2000毫秒
                    checkForm();
                            document.getElementById("submit1").submit();
                                },2000);
});
</script>

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
<script src="statics/suanming.js"></script>
</body>
</html>