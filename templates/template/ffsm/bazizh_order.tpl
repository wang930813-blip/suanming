<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<title>看透你一生的运势-周易国学</title>
<meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no,viewport-fit=cover" />
<meta content="yes" name="apple-mobile-web-app-capable" />
<meta content="yes" name="mobile-web-app-capable">
<meta content="black" name="apple-mobile-web-app-status-bar-style" />
<meta content="telephone=no" name="format-detection" />
<link rel="shortcut icon" href="https://css.ahdahda.com/favicon.ico?v=773ea8f"/>
<meta name="applicable-device" content="pc,mobile">
<meta http-equiv="x-dns-prefetch-control" content="on" />
<meta http-equiv="renderer" content="webkit" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Cache-Control" content="no-transform" />
<link href="bazizh/css/base.min.css" rel="stylesheet" type="text/css" />
<script>window._requireBaseUrl = 'https://css.ahdahda.com/';</script>
<script src="bazizh/js/jquery-3.6.1.min.js"></script>
<script src="bazizh/js/require-2.3.6.min.js"></script>
<script src="bazizh/js/base.min.js"></script>
<link href="bazizh/css/style.min.css" rel="stylesheet" type="text/css"/>
</head>
<body>
    <img class="guide-banner" src="bazizh/picture/1_banner.jpg" alt="">
    <div class="guide-pay">
        <div class="guide-pay__tit">你的八字终身运命书已生成</div>
        <div class="guide-pay__content">
            <div class="txt">资深易学老师根据你的生日量身定制的八字终身运势解析，一人仅此一份，内容娉美千元亲测，涵盖人生方方面面，已有<span>16555801人</span>购买，好评率高达<span>96.48%</span>!</div>
            <img class="timg" src="bazizh/picture/1_tips_img.png" alt="">
            <div class="guide-pay__price">
                <img class="img" src="bazizh/picture/1_pay_tips.png" alt="">
                <div class="name">
                    <p>八字终身运命书</p>
                    <del>原价：168</del>
                </div>
                <div class="price">
                    <p><span>￥</span><{$money}></p>
                    <div>已减¥40.00</div>
                </div>
            </div>
            
<div class="public_pay_box">
<{if $payMethod.wechat}>
    <a class="pay_wx" href="/?ct=pay&ac=go&oid=<{$oid}>&type=1">微信支付</a>
<{/if}>
<{if $payMethod.alipay}>
    <a class="pay_zfb" href="/?ct=pay&ac=go&oid=<{$oid}>&type=2">支付宝支付</a>
<{/if}>
<{if $payMethod.paypal}>
    <a class="pay_zfb" href="/?ct=pay&ac=paypal_go&oid=<{$oid}>">paypal支付</a>
<{/if}>
<{if $payMethod.other}>
    <a class="pay_wx" href="/?ct=pay&ac=pay_go&oid=<{$oid}>&type=wxpay">微信支付</a>
<{/if}>
</div>

        </div>
    </div>
    <div class="guide-info">
        <div class="guide-info__title">用户信息</div>
        <div class="guide-info__content">
            <table class="ginfo-table">
                <tr>
                    <td colspan="4" class="title"><{$names.username}>(<{if $names.gender == 1}>男<{else}>女<{/if}>)</td>
                </tr>
                <tr>
                    <td colspan="4" class="date">
                        <p>公(阳)历：<{$names.y}>年<{$names.m}>月<{$names.d}>日</p>
                        <p>农(阴)历：<{$names.lDate}></p>
                    </td>
                </tr>
            </table>
            <div class="ginfo-get">
                <p>老师根据你的八字命盘，一生大运盘，流年流月盘，为你详细批算一生命运走向，揭秘各方面机缘。</p>
                <img class="J_payPopupShow" src="bazizh/picture/1_guide_btn.png" alt="">
            </div>
        </div>
        <div class="guide-info__bottom"></div>
    </div>
    <div class="guide-img">
        <img src="bazizh/picture/1_img1.jpg" alt="">
        <img src="bazizh/picture/1_img2.jpg" alt="">
        <img src="bazizh/picture/1_img3.jpg" alt="">
        <img src="bazizh/picture/1_img4.jpg" alt="">
        <img src="bazizh/picture/1_img5.jpg" alt="">
        <img src="bazizh/picture/1_img6.jpg" alt="">
        <img src="bazizh/picture/1_img7.jpg" alt="">
        <img src="bazizh/picture/1_img8.jpg" alt="">
        <div class="btn btn1 J_payPopupShow"></div>
        <div class="btn btn2 J_payPopupShow"></div>
        <div class="btn btn3 J_payPopupShow"></div>
        <div class="btn btn4 J_payPopupShow"></div>
        <div class="btn btn5 J_payPopupShow"></div>
        <div class="btn btn6 J_payPopupShow"></div>
        <div class="btn btn7 J_payPopupShow"></div>
        <div class="btn btn8 J_payPopupShow"></div>
    </div>

<div class="public_pay_popup" id="publicPayPopup">
    <div class="public_pp_box">
        <div class="public_pp_close" id="publicPPClose">X</div>
        <div class="public_pp_tit">一次付费，查看所有结果</div>
        <div class="public_pp_price"><span>统一鉴定价：</span><strong>￥<{$money}>元</strong></div>
        
<div class="public_pay_box">
<{if $payMethod.wechat}>
    <a class="pay_wx" href="/?ct=pay&ac=go&oid=<{$oid}>&type=1">微信支付</a>
<{/if}>
<{if $payMethod.alipay}>
    <a class="pay_zfb" href="/?ct=pay&ac=go&oid=<{$oid}>&type=2">支付宝支付</a>
<{/if}>
<{if $payMethod.paypal}>
    <a class="pay_zfb" href="/?ct=pay&ac=paypal_go&oid=<{$oid}>">paypal支付</a>
<{/if}>
<{if $payMethod.other}>
    <a class="pay_wx" href="/?ct=pay&ac=pay_go&oid=<{$oid}>&type=wxpay">微信支付</a>
<{/if}>
</div>

    </div>
</div>
<div class="public_paybottom_height"></div>
<div class="public_pay_bottom" id="publicPayBottom">
    <span><i></i>领取报告</span>
</div>

<footer class="footer-base">
    <a href="https://qywnl.com/"><span>周易国学</span></a>
    <div><span>客服微信：juqian08888</span></div>
</footer>
<div style="display: none">
    <script>
        var _visitjsx = _visitjsx || [];
        (function () {
            var hm = document.createElement("script");
            hm.setAttribute('id', '_visitjsx');
            hm.src = "//visitjsx.juqianwh.com/visitjsx.js?si=1&puid=0&ed=uid%3D%26appid%3D19%26styleid%3D2%26channel%3Dchaxun.ffsmcs.cn";
            var s = document.getElementsByTagName("script")[0];
            s.parentNode.insertBefore(hm, s);
        })();
    </script>
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
            inquiry_lock = 1;
            window.location = data.url;
        }
    }, 'json');
}
</script>
</body>
</html>