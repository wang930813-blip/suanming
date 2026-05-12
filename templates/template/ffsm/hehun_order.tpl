

<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="UTF-8" />
    <title><{$data.username}>和<{$data.girl_username}>合婚测试结果-<{$zhanming}></title>
	<meta name="keywords" content="八字合婚,周易八字配对,在线八字合婚,八字合婚免费测试" />
	<meta name="description" content="<{$zhanming}>提供婚姻测试八字合婚服务，解开婚姻与八字的姻缘关系，普渡每一个善信的有缘人，我们衷心祝愿您拥有幸福的婚姻生活。" />
    <meta
      name="viewport"
      content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"
    />
    <meta content="yes" name="apple-mobile-web-app-capable" />
    <meta content="black" name="apple-mobile-web-app-status-bar-style" />
    <meta content="telephone=no" name="format-detection" />
    <link rel="shortcut icon" href="/statics/ffsm/favicon.ico?v=976ee4e" />
    <script>
      var __staticHost = "";
    </script>
    <link
      href="/statics/ffsm_lg/public/wap/base.min.css?v=70eb712"
      rel="stylesheet"
      type="text/css"
    />
    <script src="/statics/ffsm_lg/public/wap/js/libs/jquery-3.4.1.min.js?v=748b731"></script>
    <script src="/statics/ffsm_lg/public/wap/js/libs/require-2.3.6.min.js?v=59da35f"></script>
    <script src="/statics/ffsm_lg/public/wap/js/common.min.js?v=25b3369"></script>
    <link
      href="/statics/ffsm_lg/app/bazihehun/style.min.css?v=883fc6b"
      rel="stylesheet"
    />
  </head>
  <body>
    <img
      class="m-img"
      src=" /statics/ffsm_lg/app/bazihehun/images/banner.png"
      alt="八字合婚"
    />
    <div class="order-info">
      <div class="order-info__left">
        <span class="order-info__left-price">限时优惠￥<{$money}></span
        ><span class="order-info__original-price">原价：<del>￥168</del></span>
      </div>
      <div class="order-info__right">
        <span class="order-info__right-words">距优惠结束：</span
        ><span
          class="order-info__downtime J_countDown"
          data-second="1800"
          data-html="<i>{H}</i>:<i>{I}</i>:<i>{S}</i>"
          ><i>01</i>:<i>00</i>:<i>00</i></span
        >
      </div>
    </div>
    <div class="order-pay">
      <p class="order-pay__number">
        已有<span>3085596</span>人进行合婚测算，
        <span>98.5%</span>
        的用户反馈合婚后对自己以后的婚姻相处方式有对应的改善方法，使婚姻更幸福。
      </p>
      <p class="order-pay__tip">报告生成后，只有您自己能查看，请放心领取！</p>
      <div class="public_pay_box">
  <{if $sys_pay_type==0 || $sys_pay_type==1 || $sys_pay_type==3}>
<a class="pay_wx" data-method="Wechatpay3" target="_self" href="/?ct=pay&ac=go&oid=<{$oid}>&type=1">微信支付</a>
 <{/if}>
<{if  $sys_pay_type==0 || $sys_pay_type==2 || $sys_pay_type==3}>
<a class="pay_zfb" data-method="Alipay2" target="_self" href="/?ct=pay&ac=go&oid=<{$oid}>&type=2">支付宝</a>
<{/if}>

<{if  $sys_pay_type==0 || $sys_pay_type==4}>
<a class="pay_wx" data-method="Wechatpay3" target="_self" href="/?ct=pay&ac=pay_go&oid=<{$oid}>&type=wxpay">微信支付</a>
<{/if}>
      </div>
      <div class="public_pay_tip">
        微信支付成功后，需返回当前浏览器查看结果！
      </div>
      <p class="order-pay_pic">
        <img
          class="m-img"
          src="/statics/ffsm_lg/app/bazihehun/images/1_img_sofa.png"
          alt="安全"
        />
      </p>
    </div>
    <p class="pay-title J_payBottomShow">支付后您将获得以下结果</p>
    <div class="m-box">
      <div class="m-box__title">你们的婚姻基础</div>
      <div class="order-lock-wrap">
        <div class="order-lock">
          <p class="J_payPopupShow">分析对方性格特点</p>
          <p class="J_payPopupShow">分析对方感情喜忌</p>
          <p class="J_payPopupShow">分析双方性格和谐度</p>
        </div>
        <span class="order-lock-btn J_payPopupShow">立即解锁</span>
      </div>
    </div>
    <div class="m-box">
      <div class="m-box__title">你们的相处情况</div>
      <div class="order-lock-wrap">
        <div class="order-lock">
          <p class="J_payPopupShow">分析双方的恋爱状态</p>
          <p class="J_payPopupShow">分析对方对你的感情</p>
          <p class="J_payPopupShow">分析适合你们的相处模式</p>
        </div>
        <span class="order-lock-btn J_payPopupShow">立即解锁</span>
      </div>
    </div>
    <div class="m-box">
      <div class="m-box__title">你们是否互旺</div>
      <div class="order-lock-wrap">
        <div class="order-lock">
          <p class="J_payPopupShow">分析对方的旺夫/旺妻条件</p>
          <p class="J_payPopupShow">分析你的旺夫/旺妻条件</p>
          <p class="J_payPopupShow">分析你们在一起的互旺指数</p>
        </div>
        <span class="order-lock-btn J_payPopupShow">立即解锁</span>
      </div>
    </div>
    <div class="m-box">
      <div class="m-box__title">你们的婚姻风险</div>
      <div class="order-lock-wrap">
        <div class="order-lock">
          <p class="J_payPopupShow">分析对方是否花心易受诱惑</p>
          <p class="J_payPopupShow">分析对方欲望是否很难知足</p>
          <p class="J_payPopupShow">分析对方的异性缘和出轨几率</p>
        </div>
        <span class="order-lock-btn J_payPopupShow">立即解锁</span>
      </div>
    </div>
    <div class="m-box">
      <div class="m-box__title">老师点评</div>
      <div class="order-lock-wrap">
        <div class="order-lock">
          <p class="J_payPopupShow">你们的婚姻幸福秘籍是什么？</p>
          <p class="J_payPopupShow">怎样促进你们的婚姻和谐？</p>
        </div>
        <span class="order-lock-btn J_payPopupShow">立即解锁</span>
      </div>
    </div>
   
<script>
//支付后检测跳转
  </script>
    <!--ads:1378 end-->
    
<!--产品尾部-->
<style>
.scProd_footer {
    width: 100% !important;
    float: left !important;
    margin: .4rem 0 0 0 !important;
    line-height: 1.5 !important;
    color: #fff !important;
    font-size: .20rem !important;
    text-align: center !important;
}
.scProd_footer * {
    font-size: .20rem !important;
}
.scProd_footer a {
    color: #fff !important;
    text-decoration: none !important;
    font-size: .20rem !important;
}
.scProd_footer img {
    width: .22rem !important;
    vertical-align: middle !important;
    margin: -.05rem 0 0 0 !important;
}
</style>
<{include file="ffsm/footer_contact.tpl"}>
<!--产品尾部-->
    
    <div class="public_footer_servers">

      <img
        src="/statics/ffsm_lg/public/wap/images/img_foot_xin.png"
        alt="诚信、可信网站"
        class="public_foot_xin"
      /><img
        src="/statics/ffsm_lg/public/wap/images/img_foot_al.png"
        alt="阿里云提供数据安全保护"
        class="public_foot_al"
      />
    </div>

    <!--start ads:1374-->
    <script>
      if (
        "www.sm688801.com,sm688801.com,www.sm688802.com,sm688802.com".indexOf(
          location.host
        ) >= 0 &&
        location.pathname == "/"
      ) {
        document.querySelector("body").innerHTML =
          '<div style="text-align: center;padding: 50% 0 0;"><p style="font-size: 32px;color: #989815;">网站升级维护中</p><p style="color: #999;">2021-09-10 ~ 2021-09-18</p></div>';
      }
    </script>
    <!--ads:1374 end-->
    <a href="/?ac=history" class="m-order-history">订单查询</a>
    <div class="public_pay_popup" id="publicPayPopup">
      <div class="public_pp_box">
        <div class="public_pp_close" id="publicPPClose">X</div>
        <div class="public_pp_tit">解锁查看您的结果</div>
        <div class="public_pp_price">
          <span>统一鉴定价：</span><strong>￥<{$money}>
          元</strong>
        </div>
        <div class="public_pay_box">
  <{if $sys_pay_type==0 || $sys_pay_type==1 || $sys_pay_type==3}>
<a class="pay_wx" data-method="Wechatpay3" target="_self" href="/?ct=pay&ac=go&oid=<{$oid}>&type=1">微信支付</a>
 <{/if}>
<{if  $sys_pay_type==0 || $sys_pay_type==2 || $sys_pay_type==3}>
<a class="pay_zfb" data-method="Alipay2" target="_self" href="/?ct=pay&ac=go&oid=<{$oid}>&type=2">支付宝</a>
<{/if}>

<{if  $sys_pay_type==0 || $sys_pay_type==4}>
<a class="pay_wx" data-method="Wechatpay3" target="_self" href="/?ct=pay&ac=pay_go&oid=<{$oid}>&type=wxpay">微信支付</a>
<{/if}>
        </div>
        <div class="public_pay_tip">
          微信支付成功后，需返回当前浏览器查看结果！
        </div>
      </div>
    </div>
    
    <div class="public_paybottom_height"></div>
    <div class="public_pay_bottom" id="publicPayBottom">
      <span><i></i>付费解锁所有项</span>
    </div>
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
//支付后检测跳转
  </script>

  </body>
</html>
