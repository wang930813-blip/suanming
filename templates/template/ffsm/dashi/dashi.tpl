      <!DOCTYPE html>
<html>
<head>
<title>亲算首页</title>
<!-- 模板测试标记：20251203_001 -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Cache-Control" content="no-cache" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0" />
<meta name="copyright" content=",网,版权所有">
<link href="dashi/css/index.css" rel="stylesheet" type="text/css">
<link href="dashi/css/swiper.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="dashi/css/header_rem.css">
<link href="dashi/css/layer.css" rel="stylesheet" type="text/css" />
<link href="dashi/css/font-awesome.min.css" rel="stylesheet">
<script src="dashi/js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="dashi/js/resizeevts.js"></script>
<script type="text/javascript">
function showQrcode() {
	var bg = document.querySelector('.scProd_popBg');
	var box = document.querySelector('.scProd_popBox');
	if(bg && box) {
		bg.style.display = 'block';
		box.style.display = 'block';
	}
}

function closepopBox() {
	var bg = document.querySelector('.scProd_popBg');
	var box = document.querySelector('.scProd_popBox');
	if(bg && box) {
		bg.style.display = 'none';
		box.style.display = 'none';
	}
}
</script>
<link rel="stylesheet" href="dashi/css/pingjia.css">
<link href="dashi/css/calendar.css" rel="stylesheet" type="text/css">

<link href="dashi/css/pay_rem_new.css" rel="stylesheet" type="text/css">


<script type="text/javascript" src="dashi/js/swiper.min.js"></script>
<style>
    .swiper-slide .active{
        border-bottom: solid .04rem #9e733c;
        color: #bc7d3f;
    }
    .indexTeacher .note {
		width: 100%;
		float: left;
		border-top: solid 1px #f0f0f0;
		padding: .25rem 0 0 0;
		margin: .25rem 0 0 0;
	}
	.indexTeacher .note a {
		width: 33.33%;
		float: left;
		line-height: .4rem;
		font-size: .3rem;
		text-align: center;
		color: #bfc3cf;
	}
	.indexTeacher .note a img {
		height: .25rem;
		vertical-align: middle;
		margin: -.05rem 0 0 0;
	}
	.indexTeacher .intro .con .name .b1 {
    	float: right;
    	color: #928687;
    	text-decoration:line-through
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

<!--banner跑马灯-->
	<!--<section class="inbanner">
        <div class="swiper-container" id="tag-swiper" style="width:100%;height: 2.44rem;">
            <div class="swiper-wrapper">
                                <div class="swiper-slide">
                    <a href="/subject/2024bouble11/" style="display: block;"><img src="dashi/picture/700a0dc3bf88f7c14e382ca53c502b75.jpg" alt="" style="width: 100%;display: block;"/></a>
                </div>
                                <div class="swiper-slide">
                    <a href="/maestro/detail.php?num=PF062" style="display: block;"><img src="dashi/picture/1830a251f1c79cdc5eb2ea4c0e1fbc67.jpg" alt="" style="width: 100%;display: block;"/></a>
                </div>
                                <div class="swiper-slide">
                    <a href="/subject/aiqingqinsuan/" style="display: block;"><img src="dashi/picture/2dde19923d1cb9fd1e15b941a9318fe7.jpg" alt="" style="width: 100%;display: block;"/></a>
                </div>
                            </div>
        </div>
	</section>-->
<!--banner跑马灯-->

<!--main开始-->
<section class="main">
  	<!--本月人气老师-->
  	<div class="indexCmsTags" style="margin: 0 0 0.3rem 0;">
	  	<a href="/?ac=dashi&xm=1">
	  		<img src="dashi/picture/sam.png" alt=""/>
	  	</a>
  	</div>
  	<!--本月人气老师-->
  	
  	<!--老师咨询命名指南+在线客服-->
  	<section class="indexGuide">
    	<a href=""><img src="dashi/picture/icon01.png" alt=""/> 老师咨询、命名指南</a>
    	<a class="show_tc" href="javascript:void(0);" onclick="showQrcode();return false;"><img src="dashi/picture/icon02.png" alt=""/> 咨询老师助理</a>
 	</section>
  	<!--老师咨询命名指南+在线客服-->
  
  
  	<div class="indexTitle">老师咨询</div>
  	<div class="indexFocus">
	    <ul>
	      	<li><img src="dashi/picture/icon03.png" alt=""><br>服务保障</li>
	      	<li><img src="dashi/picture/icon04.png" alt=""><br>保护隐私</li>
	      	<li><img src="dashi/picture/icon05.png" alt=""><br>二次提问</li>
	      	<li><img src="dashi/picture/icon06.png" alt=""><br>好评如潮</li>
	    </ul>
  	</div>
  
  	<!--老师咨询-->
  	<{foreach from=$dsyy_row item=v}>
  	<section class="indexTeacher">
	    <a href="/?ac=dashi&xm=<{$v.id}>">
	    <div class="intro">
	      <div class="pic"><img src="<{$v.images}>" alt=""/></div>                          
	      <div class="con">
	        <div class="name">
	        	<{$v.teacher}> <b>
	        	特惠价:￥<{$v.money}></b>
	        </div>
	        <div class="name">
	        	<em>擅长工具：</em><span><{$v.project}></span> 
	        </div>
	        <div class="year"><{$v.title}></div>
	        <div class="label">
	        </div>
	      </div>
	    </div>
	    <div class="txt"><{$v.centent}></div>
	    </a>
  	</section>
  	<{/foreach}>
  	<!--老师咨询-->
  
  	<!--用户心声-->
  	<div class="indexTitle">用户心声</div>
  	<{foreach from=$dsyy_row item=v name=heartfelt}>
  	<{if $smarty.foreach.heartfelt.index < 2}>
  	<section class="indexHeartfelt">
	    <div class="pic"><img src="dashi/picture/icon07.png" alt=""></div>
	    <div class="txt">老师你说的很对，我们两个的矛盾最近确实比较多，出事也有些过于激动，我会好好理性处理我们两个的感情的，毕竟在一起不容易，相聚便是缘分，谢谢老师的提醒。<br><span>——范** </span></div>
	    <div class="ask">
	      	<div class="avator"><img src="<{$v.images}>" alt=""></div>
	      	<div class="name"><{$v.teacher}><br><span><{$v.position}></span></div>
	      	<div class="btn"><a href="/?ac=dashi&xm=<{$v.id}>">向TA咨询</a></div>
	    </div>
	    <div class="num"><i class="fa fa-thumbs-up"></i> <{if $v.rating >= 5}>99.98%<{else}>99.9<{$v.rating}>%<{/if}>好评</div>
  	</section>
  	<{/if}>
  	<{/foreach}>
  	<!--用户心声-->
</section>
<!--main结束-->

<!------->
</section>

<link rel="stylesheet" type="text/css" href="dashi/css/popup.css"/>
<div class="scProd_popBg" style="display: none;"></div>
<section class="scProd_popBox" style="display: none;top: 10%;">
  	<div class="pic" style="width: 100%;float: left;padding: 0 .3rem;">
		<img style="width: 100%;float: left;" src="<{$qrcode_img}>" alt="">
  	</div>
  	<div class="popClose"><a href="javascript:closepopBox()"><img src="dashi/picture/popclose.png" alt=""></a></div>
</section>
<script type="text/javascript" src="dashi/js/clipboard.min.js"></script>
<a name="save" id="save"></a>

<style>
    #carousel_container {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 20px;
        line-height: 20px;
        background: rgba(30, 12, 12, 0.6);
        z-index: 1001;
        overflow: hidden;
        font-size: 14px;
        color: #FFFFFF;
    }
    #_carousel_test{
        left: 400px;
        overflow: hidden;
        position: absolute;
    }
    .p_top{
        margin-top: 20px;
    }
    .remheader{
        margin-top: 20px;
    }

		<script type="text/javascript">

            function carousel_run(){
                var left =  parseInt($('#_carousel_test').css('left').split('p')[0]) ;
                left -=  1.5 ;
                if (left < -$('#_carousel_test').width() ){
                    left = 200 ;
                }
                $('#_carousel_test').css('left',left + 'px')
            }
            setInterval("carousel_run()",40)
        </script>


<!--产品尾部-->
<!--产品尾部-->

<script src="dashi/js/layer.js" merge="true"></script>
<script type="text/javascript" src="dashi/js/layermenu.js"></script>
        <script type="text/javascript" src="dashi/js/mainpublicv1.1.8.js"></script>
            <script type="text/javascript" src="dashi/js/history_v1.js"></script>



<script>
    //导航栏轮播事件
    function navBlockActive($index) {
        $('#swiper-container .block.active').removeClass('active');
        $('#swiper-container .block').eq($index).addClass('active');
    }
    $(function(){
        var mySwiper2 = new Swiper('#swiper-container',{
            watchSlidesProgress : true,
            watchSlidesVisibility : false,
            spaceBetween: 10,
            slidesPerView : 4,
            on:{
                tap: function(){
                    console.log(mySwiper2.clickedIndex);
                    navBlockActive(mySwiper2.clickedIndex);
                    i=mySwiper2.clickedIndex;
                },
            },
        });
        $('.moretype').on('click',function(){
            mySwiper2.slideTo(7, 500, false);//切换到指定slide，速度为1秒
        });
    });

function show_teacher_list(type){
    $('#'+type).show();
    $('#'+type).siblings('.inteacon').hide();
}
     tagSwiper = new Swiper('#tag-swiper', {
        spaceBetween: 30,
        centeredSlides: true,
        loop: true,
        autoplay: {
            delay: 3500,
            disableOnInteraction: false,
        },
        pagination: {
            el: '.swiper-pagination',
            clickable: true,
        }
    });

    $(function(){
        loopSlide($('.swiper_text'));
        function loopSlide(target) {
            var $ul = target.find('ul');
            var liLength=$ul.find('li').length;
            var singleHeight=$ul.height()/liLength;
            $last= $ul.find('li:last').clone();
            $ul.prepend($last);
            $tempBox= $('<div class="tempBox" style="height:'+singleHeight+'px;overflow:hidden;position:relative;"></div>');
            newUl = $ul.clone();
            $tempBox.html(newUl);
            target.html($tempBox);
            newUl.css({
                'padding':'0',
                'margin':'0',
                'position':'relative',
                'top':'0'
            });
            createInterval(newUl,liLength,singleHeight)
        }

        function createInterval(newUl,liLength,singleHeight) {
            newUl.num=0;
            setInterval(function () {
                mySlide();
            },4000);
            function mySlide() {
                newUl.num=newUl.num+1;
                newUl.num=(newUl.num%(liLength+1));
                if(newUl.num==0){
                    newUl.css('top','0');
                    newUl.num=newUl.num+1;
                }
                newUl.animate({'top':-(newUl.num)*singleHeight+'px'},2000)
            }
        }
    });
</script>


<script type="text/javascript">
// 点击遮罩层关闭弹窗
$(function(){
	$('.scProd_popBg').click(function() {
		closepopBox();
	});
});
</script>
</body>
</html>