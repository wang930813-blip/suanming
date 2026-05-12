<!doctype html>
<html lang="zh-CN">
<head>
<title>八字神煞看翻身运</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Cache-Control" content="no-cache">
<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<link rel="stylesheet" href="bazi/css/header_rem.css">
<link href="bazi/css/layer.css" rel="stylesheet" type="text/css" />
<link href="bazi/css/font-awesome.min.css" rel="stylesheet">
<script src="bazi/js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="bazi/js/resizeevts.js"></script>


<link href="bazi/css/index.css" rel="stylesheet" type="text/css">
</head>
<body>
    <script>
        window.localStorage["notPayOrder"] = '<{$oid}>';
    </script>



<section class="wrapper"> 
  
  <!--main开始-->
  <main class="main"> 
    <!---->
    <section class="bigbox">
      <div class="picTitle"><img src="bazi/picture/top02.png" alt=""></div>
      <div class="picture free"><a href="javascript:void(0);" class="hb_tc"><img src="bazi/picture/img06.png" alt=""></a></div>
      <div class="picture free"><a href="javascript:void(0);" class="hb_tc"><img src="bazi/picture/img07.png" alt=""></a></div>
      <div class="picture free"><a href="javascript:void(0);" class="hb_tc"><img src="bazi/picture/img08.png" alt=""></a></div>
      <div class="picture free"><a href="javascript:void(0);" class="hb_tc"><img src="bazi/picture/img09.png" alt=""></a></div>
      <div class="picture free"><a href="javascript:void(0);" class="hb_tc"><img src="bazi/picture/img10.png" alt=""></a></div>
    </section>
    <!---->
    <div class="button xia"><a href="javascript:void(0);" class="hb_tc">立即解锁内容分析</a></div>
    <!----> 
    <script type="text/javascript" src="bazi/js/clipboard.min.js"></script>


<!--产品尾部-->
<link href="bazi/css/footer.css" rel="stylesheet" type="text/css">
<{assign var="footerIcon" value="bazi/picture/footicon.png"}>
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
                layer.close(index);
                if (is_weixin == true) {
                    location.href = "weixin://";
                }
            }
        });
    });
</script>

<script src="bazi/js/layer.js" merge="true"></script>
<script type="text/javascript" src="bazi/js/layermenu.js"></script>

<script type="text/javascript" src="bazi/js/scrolltop.js"></script>




  </main>
  <!--main结束--> 
  
  <!--浮动按钮-->
  <div class="floatbtn" style="display:none;">
    <div class="button"><a href="javascript:void(0);" class="hb_tc">立即解锁内容分析</a></div>
  </div>
  <!--浮动按钮--> 
  
    <!--弹窗-->
    <div style="display:none;" id="hongbao">
      <section class="popMask popMask1">
        <div class="popClose"><a href="javascript:void(0);" class="paymentPopClose" onclick="$('#hongbao').hide();$('.popMask1').hide();"></a></div>
        <section class="bigbox">
          <div class="picTitle"><img src="bazi/picture/top01.png" alt=""></div>
          <div class="user-info" style="text-align:center; padding:10px 0; color:#333;">
            <p style="margin:5px 0;">姓名：<{if $names.username}><{$names.username}><{else}>未填写<{/if}> &nbsp;&nbsp; 性别：<{if $names.gender==1}>男<{else}>女<{/if}></p>
            <{if $names.y && $names.m && $names.d}>
            <p style="margin:5px 0;">阳历：<{$names.y}>年<{$names.m}>月<{$names.d}>日<{if $names.h}> <{$names.h}>时<{/if}></p>
            <{else}>
            <p style="margin:5px 0;">出生日期：未填写</p>
            <{/if}>
          </div>
          <div class="picture"><img src="bazi/picture/img12.png" alt=""></div>
          <!--支付模块--> 
          
<!--20200628新支付模板-->
<link href="bazi/css/index2021.css" rel="stylesheet" type="text/css">
<section class="payMent2020">
  <div class="tehui">
    <div class="zuo">
      <span>限时优惠价：<b><{$money}></b>元</span><br>
            <del>原价：108元</del>
          </div>
        <div class="you">距优惠结束：<br>
    <span> 
    <span id="prodinfor_m">15</span> : <span id="prodinfor_s">00</span> : <span id="prodinfor_ms">00</span>
    </span>
    </div>
      </div>
  <div class="payway">
<{if $payMethod.wechat}>
    <a class="bank_ways" target="_blank" href="/?ct=pay&ac=go&oid=<{$oid}>&type=1"><img src="bazi/picture/wechat.png" alt=""/> 微信支付 <span>立即支付</span></a>
<{/if}>
<{if $payMethod.alipay}>
    <a class="bank_ways" target="_blank" href="/?ct=pay&ac=go&oid=<{$oid}>&type=2"><img src="bazi/picture/alipay.png" alt=""/> 支付宝支付 <span>立即支付</span></a>
<{/if}>
<{if $payMethod.stripe}>
    <a class="bank_ways" target="_blank" href="/?ct=pay&ac=stripe_go&oid=<{$oid}>"><img src="bazi/picture/paypal.png" alt=""/> Stripe支付 <span>立即支付</span></a>
<{/if}>
<{if $payMethod.paypal}>
    <a class="bank_ways" target="_blank" href="/?ct=pay&ac=paypal_go&oid=<{$oid}>"><img src="bazi/picture/paypal.png" alt=""/> Paypal支付 <span>立即支付</span></a>
<{/if}>
<{if $payMethod.other}>
    <a class="bank_ways" target="_blank" href="/?ct=pay&ac=pay_go&oid=<{$oid}>&type=wxpay"><img src="bazi/picture/wechat.png" alt=""/> 微信支付 <span>立即支付</span></a>
<{/if}>
  </div>
  <div class="tips">报告生成后，只有您自己能查看，请放心领取！</div>
  <div class="tips" style="color:#ff6600; margin-top:10px;">微信支付成功后，需返回当前浏览器查看结果！</div>
</section>

<!-- 20200622更改弹窗样式 --> 
<!--弹窗-遮罩-->
<div class="popbg payPop" style="display:none;"></div>
<!--弹窗-遮罩--> 
<!--弹窗-->
<section class="popBox payPop" style="display:none;">
  <div class="title">提 示 <a href="javascript:void(0);" onclick="popClose()"><img src="bazi/picture/popclose.png" alt=""/></a></div>
  <div class="txt">是否完成支付？</div>
  <div class="btn"><a href="javascript:void(0);" id="payAgain">继续支付</a></div>
  <div class="link"><a href="javascript:void(0);" id="paySucc">已完成支付</a></div>
  <!-- id="paySucc" --> 
</section>
<!--弹窗--> 
<!--弹窗-->
<section class="popBox nopay" style="display:none;">
  <div class="title">提 示 <a href="javascript:void(0);" onclick="popClose()"><img src="bazi/picture/popclose.png" alt=""/></a></div>
  <div class="txt">检测到您未支付订单，请重新支付。</div>
  <div class="btn"><a href="javascript:void(0);" onclick="popClose()">继续支付</a></div>
</section>
<!--弹窗--> 
    </div>
  
</section>

<script>
// 关闭弹窗函数
function popClose(){
  $('.popbg').hide();
  $('.popBox').hide();
}

// 点击遮罩层关闭弹窗
$(document).on('click', '.popbg', function(){
  popClose();
});
</script>

<script>
    //浮动按钮
    window.onscroll = function () {
      var t = document.documentElement.scrollTop || document.body.scrollTop;
      // var h = $('.shang').offset().top;
      var f = $('.xia').offset().top;
      var windowH = $(window).height();
      if (parseInt(t) < parseInt(f) - parseInt(windowH)) {
        $('.floatbtn').show();
      } else {
        $('.floatbtn').hide();
      }
    }
  </script>

<script>
// 显示支付确认弹窗函数
function showPop(){
    $('.payPop').show();
    $('.popbg').show();
}

// 页面加载时检查localStorage
$(function() {
    if(window.localStorage){
        var z_pop = window.localStorage.z_pop;
        // 如果是刚才的订单，显示支付确认弹窗
        if(z_pop == '<{$oid}>'){
            showPop();
        }
    }
});

// 浮动按钮和底部按钮点击处理 - 显示支付弹窗
$('.hb_tc').click(function(){
    $("#hongbao").show();
    $('.popMask1').show();
});

// 点击遮罩层关闭支付弹窗
$('.popMask1').click(function(e){
    if(e.target === this){
        $('#hongbao').hide();
        $('.popMask1').hide();
    }
});

// 支付按钮点击处理
$(document).on('click', '.bank_ways', function(){
    // 保存订单号到localStorage
    if(window.localStorage) { 
        window.localStorage.z_pop = '<{$oid}>';
    }
    
    // 延迟显示支付确认弹窗（等待支付页面在新窗口打开）
    setTimeout(function(){
        showPop();
    }, 1000);
    
    // 允许链接正常跳转
    return true;
});

// 继续支付按钮处理
$('#payAgain,.payPop .title a:last-child').click(function() {
    popClose();
});

// "已完成支付"按钮处理
$('#paySucc').click(function(){
    // 立即检测支付状态
    $.get('/?ct=pay&ac=scanquery&oid=<{$oid}>', {t: Date.parse(new Date())}, function (data) {
        if (data.status) {
            // 支付成功，跳转到结果页
            window.location = data.url;
        } else {
            // 支付未完成
            popClose();
            $('.nopay').show();
            $('.popbg').show();
        }
    }, 'json').fail(function(){
        // 请求失败，显示提示
        popClose();
        $('.nopay').show();
        $('.popbg').show();
    });
});

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
//支付后检测跳转
</script>



</body>
</html>