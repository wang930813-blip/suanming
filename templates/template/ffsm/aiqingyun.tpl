<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8"/>
<title><{$data.seotitle}></title>
<meta name="keywords" content="<{$data.keywords}>" />
<meta name="description" content="<{$data.description}>" />
<meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
<meta content="yes" name="apple-mobile-web-app-capable"/>
<meta content="black" name="apple-mobile-web-app-status-bar-style"/>
<meta content="telephone=no" name="format-detection"/>
<link rel="shortcut icon" href="/statics/ffsm/favicon.ico"/>
<link href="/statics/ffsm/aiqingyun/common.css" rel="stylesheet" type="text/css"/>
<link href="/statics/ffsm/aiqingyun/wap.min.css" rel="stylesheet" type="text/css"/>
<{include file='./ffsm/wx_share.tpl'}>
<script src="https://apps.bdimg.com/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="statics/ffsm/public/js/require/require.min.js"></script>
<script src="statics/ffsm/public/js/common.min.js"></script>
</head>
<body>
 <{include file='./ffsm/header.tpl'}>
<style type="text/css">
.alert-marquee {height: 2rem !important;line-height: 2rem !important;}
.alert-marquee .inner{font-size: 1rem !important;}
</style>
<{if $gundong}><div class="alert-marquee" id="alertMarquee"><p class="inner"><{$gundong}></p></div><{/if}>
<div class="contents">
  <div class="wrap">

    <div class="main">
      <form class="J_ajaxForm J_testFixedShow" action="?ac=aiqingyun" method="post" id="submit1" name="login" method="post" onSubmit="return checkForm();"> 
        <div class="main-srzl">
          <div class="srzl-box">
            <div class="main-title">
              <span class="srgrzl"></span>
            </div>
            <div class="srzl-bg">
              <div class="srzl-list">
                <span class="sp-lf">姓名:</span>
                <input type="text" class="text" id="username" name="username" placeholder="请输入您的姓名" value=""/>
                <div class="radiobox auto sex J_sex">
                  <span class="pradio cur" data-value="1">男生</span>
                  <span class="pradio" data-value="0">女生</span>
				  <input type="hidden" name="gender" value="1"/>
				 </div>
              </div>
              <div class="srzl-list">
                <span class="sp-lf">生辰:</span>
				<input type="text" id="birthday" data-input-id="b_input" class="text Js_date" data-type="0" value="请选择出生日期" placeholder="请选择出生日期" data-toid-hour="birthday" data-date="1985-7-1">
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
			  </div>
              <div class="srzl-list">
                <span class="sp-lf">现状</span>
                <div class="radiobox xzbox J_sex">
                  <span class="pradio cur" data-value="1">单身者</span>
                  <span class="pradio" data-value="0">交往中</span>
                  <input type="hidden" name="" id="state" value="1"></div>
              </div>
            </div>
          </div>
          <input type="hidden" name="app" id="app" value="">
          <input type="hidden" name="birth_time" value="">
          <div class="srzl-btn" id="srzl-btn">
            <a href="javascript:;" class="abtn J_ajax_submit_btnsub">马上测试</a></div>
        </div>
      </form>
      <div class="box">
        <div class="sec-title">揭秘你们的恋爱匹配度</div>
        <div class="borbox inborbox">
          <p class="pimg">
            <img src="/statics/ffsm/aiqingyun/img/zong.jpg" alt=""></p>
        </div>
      </div>
      <div class="box">
        <div class="sec-title">是否面临这些烦恼</div>
        <div class="borbox inborbox">
          <p class="pimg">
            <img src="/statics/ffsm/aiqingyun/img/jiemi.png" alt=""></p>
        </div>
      </div>
      <div class="box">
        <div class="sec-title">适合哪些人测试</div>
        <div class="borbox inborbox">
          <p class="pimg">
            <img src="/statics/ffsm/aiqingyun/img/biaoge.jpg" alt=""></p>
        </div>
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
</script>
<div class="lunpan_box" style="display:none;">
	<div class="lunpan">
		<img src="statics/ffsm/bazisyy/1/images/luopan.png" alt="轮盘">
		<img src="statics/ffsm/bazisyy/1/images/zhizheng.png" alt="轮盘">
	</div>
	<div class="lunpan_color"></div>
    
</div>
<script>
        $(function(){
            // 服务轮播
            var scrollTop=0;
            var scrollUl=$('#feedbackScroll').children('ul');
            function scrollTip(){
                var top=scrollUl.children('li').eq(0).outerHeight();
                if(Math.abs(scrollTop)==Math.abs(top)){
                    scrollUl.children('li').eq(0).appendTo(scrollUl);
                    scrollUl.css("top",0);
                    scrollTop=0;
                }else{
                    scrollTop--;
                    scrollUl.css("top",scrollTop);
                }
            }
            setInterval(scrollTip,50);
        })
</script>
<script>

$('.sure').click(function(){
	alert('你没有付费不能评价');
	return false;
});

$('.J_ajax_submit_btnsub').click(function(){
        $('.lunpan_box').css('display','block');
            setTimeout(function(){  //使用  setTimeout（）方法设定定时2000毫秒
                    checkForm();
                            document.getElementById("submit1").submit();
                                },2000);
});
</script>
<script src="statics/suanming.js"></script>
<{include file='./ffsm/footer.tpl'}>
<{include file='./ffsm/dl_ck.tpl'}>
<{include file='./ffsm/tabBar.tpl'}>
</body>
</html>