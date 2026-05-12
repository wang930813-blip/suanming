<!doctype html>
<html>

<head>
    <title>择吉日</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="Cache-Control" content="no-cache" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0" />
    <link rel="stylesheet" href="zeri/css/header_rem.css">
<link href="zeri/css/layer.css" rel="stylesheet" type="text/css" />
<link href="zeri/css/font-awesome.min.css" rel="stylesheet">
<script src="zeri/js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="zeri/js/resizeevts.js"></script>

<link rel="stylesheet" href="zeri/css/pingjia.css">
<link rel="stylesheet" href="zeri/css/pj_rem.css">
<link href="zeri/css/mobileselect.css" rel="stylesheet" type="text/css">
<link href="zeri/css/calendarminv1.2.0.css" rel="stylesheet" type="text/css">
<link href="zeri/css/pay_rem_new.css" rel="stylesheet" type="text/css">

    <link href="zeri/css/index.css" rel="stylesheet" type="text/css">
<{$page_meta}>
</head>

<body>
    
    <!-- 引入公共头部 -->
    <{include file="ffsm/header.tpl"}>

    <style>
        /* 让header占满整个屏幕宽度 */
        .common-header{max-width:none !important;}
        .common-header__home{left:0 !important;margin-left:0 !important;}
        .common-header__order{right:0 !important;margin-right:0 !important;}
    </style>

    <section class="wrapper">

        <!--banner-->
        <section class="indexBann">
            <ul class="shadow">
                <li></li>
            </ul>
            <ul class="pointer"></ul>
        </section>
        <!--banner-->

        <!--main开始-->
        <section class="main">
            <!---->
            <section class="bigbox">

                <div class="top"></div>
                <div class="mid">
                    <div class="con">
                        <div class="picTitle"><img src="zeri/picture/title01.png" alt=""></div>
                        <div class="indexClass">
                            <a class="sub" data-type="结婚吉日" href="javascript:void(0);"><img src="zeri/picture/class01.png" alt="" /></a>
                            <a class="sub" data-type="订婚吉日" href="javascript:void(0);"><img src="zeri/picture/class02.png" alt="" /></a>
                            <a class="sub" data-type="领证吉日" href="javascript:void(0);"><img src="zeri/picture/class03.png" alt="" /></a>
                            <a class="sub" data-type="搬家吉日" href="javascript:void(0);"><img src="zeri/picture/class04.png" alt="" /></a>
                            <a class="sub" data-type="开业吉日" href="javascript:void(0);"><img src="zeri/picture/class05.png" alt="" /></a>
                            <a class="sub" data-type="入宅(迁新居)吉日" href="javascript:void(0);"><img src="zeri/picture/class06.png" alt="" /></a>
                            <a class="sub" data-type="装修吉日" href="javascript:void(0);"><img src="zeri/picture/class07.png" alt="" /></a>
                            <a class="sub" data-type="出行吉日" href="javascript:void(0);"><img src="zeri/picture/class08.png" alt="" /></a>
                            <a class="sub" data-type="开工吉日" href="javascript:void(0);"><img src="zeri/picture/class09.png" alt="" /></a>
                            <a class="sub" data-type="买车/提车吉日" href="javascript:void(0);"><img src="zeri/picture/class10.png" alt="" /></a>
                            <a class="sub" data-type="动土吉日" href="javascript:void(0);"><img src="zeri/picture/class11.png" alt="" /></a>
                            <a class="sub" data-type="提亲吉日" href="javascript:void(0);"><img src="zeri/picture/class12.png" alt="" /></a>
                            <a class="sub" data-type="买房吉日" href="javascript:void(0);"><img src="zeri/picture/class13.png" alt="" /></a>
                            <a class="sub" data-type="理发吉日" href="javascript:void(0);"><img src="zeri/picture/class14.png" alt="" /></a>
                            <a class="sub" data-type="签约吉日" href="javascript:void(0);"><img src="zeri/picture/class15.png" alt="" /></a>
                        </div>
                    </div>

                </div>
                <div class="down"></div>
            </section>
            <!---->
            <div class="picture"><img src="zeri/picture/img01.png" alt="" /></div>
            <div class="picture"><img src="zeri/picture/img02.png" alt="" /></div>
            <div class="picture"><img src="zeri/picture/img03.png" alt="" /></div>
            <div class="picture"><img src="zeri/picture/img04.png" alt="" /></div>
            <!---->
            <div class="indexBtn">
                <a class="sub" data-type="" href="javascript:void(0);">立即择吉日</a>
            </div>
               <script type="text/javascript" src="zeri/js/clipboard.min.js"></script>
    

<!--产品尾部-->
<link href="zeri/css/footer.css" rel="stylesheet" type="text/css">
<{include file="ffsm/footer_contact.tpl"}>
<!--产品尾部-->

<script type="text/javascript">
    //判断微信环境
    function isWeiXin(){
        var ua = window.navigator.userAgent.toLowerCase();
        if(ua.match(/MicroMessenger/i) == 'micromessenger'){
            return true;
        }else{
            return false;
        }
    }
    
    var copy_wx = new Clipboard('.copy_wx');
    var is_weixin = isWeiXin();
    copy_wx.on('success', function(e) {
        e.clearSelection();
        layer.open({
            content: '微信号复制成功！跳转到微信添加客服！',
            btn: ['确定', '取消'],
            yes: function(index) {
                if(!is_weixin){
                    var ua = navigator.userAgent.toLowerCase();
                    if (ua.indexOf('applewebkit') > -1 && ua.indexOf('mobile') > -1 && ua.indexOf('safari') > -1 && ua.indexOf('linux') == -1 && ua.indexOf('android') == -1) {
                        window.location = 'weixin://';
                    }else {
                        layer.open({content: '复制成功,打开微信搜索客服',skin: 'msg',time: 2 });
                    }
                }else{
                    layer.open({content: '复制成功,打开微信搜索客服',skin: 'msg',time: 2 });
                }
            }
        });
    });
    copy_wx.on('error', function (e) {
        layer.open({
            content: '请手动复制后打开微信搜索客服',
            skin: 'msg',
            time: 2
        });
        window.location = 'weixin://';
    });
</script>

<!--产品尾部-->

<script src="zeri/js/layer.js" merge="true"></script>
<script type="text/javascript" src="zeri/js/layermenu.js"></script>

<script type="text/javascript" src="zeri/js/mainminastrov1.1.3.js"></script>
<script type="text/javascript" src="zeri/js/commaddress.js"></script>
<script type="text/javascript" src="zeri/js/history_v1.js"></script>


<script>
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "//hm.baidu.com/hm.js?6b0d6ef9ed9b5c00711fff404106da25";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})();
</script>
        </section>

        <!--main结束-->

        <!---->
    </section>

    <script>
        window.onscroll = function() {
	        var t = document.documentElement.scrollTop || document.body.scrollTop;
	        var shangElem = $('.shang');
	        var hotRecomElem = $('.scProd_hotRecom');
	        
	        // 检查元素是否存在
	        if (shangElem.length > 0 && hotRecomElem.length > 0) {
	            var h = shangElem.offset().top;
	            var f = hotRecomElem.offset().top;
	            var windowH = $(window).height();
	            if (parseInt(t) > parseInt((parseInt(h) + 50)) && parseInt(t) < parseInt(f) - parseInt(windowH)) {
	                $('.floatbtn').show();
	            } else {
	                $('.floatbtn').hide();
	            }
	        }
	    }
        
        $('.sub').click(function() {
	        var type = $(this).attr('data-type');
	        if(type){
	            // 跳转到信息填写页面
	            window.location.href = '/?ac=zejiri_input&event=' + encodeURIComponent(type);
	        }else {
	            var target_top = $(".indexClass").offset().top;
	            $("html,body").animate({scrollTop: target_top - 50}, 1000);
	            return false;
	        }
	    })
        
    </script>

</body>

</html>