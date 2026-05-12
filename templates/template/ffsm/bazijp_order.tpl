<!DOCTYPE html>
<html lang="zh-CN">
    <head>
        <meta charset="UTF-8"/>
        <title>八字精批,八字测终生运</title>
        <meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
        <meta content="yes" name="apple-mobile-web-app-capable"/>
        <meta content="black" name="apple-mobile-web-app-status-bar-style"/>
        <meta content="telephone=no" name="format-detection"/>
        <link rel="shortcut icon" href="/statics/ffsm/favicon.ico"/>
        <link href="/statics/ffsm/public/wap/base.min.css?v=1fbbf8f" rel="stylesheet" type="text/css"/>
        <script src="/statics/ffsm/public/wap/js/libs/jquery-3.4.1.min.js"></script>
        <script src="/statics/ffsm/public/wap/js/libs/require-2.3.6.min.js"></script>
        <script src="/statics/ffsm/public/wap/js/common.min.js?v=aad090e"></script>
        <link href="/statics/ffsm/app/bzzsy/1/style.min.css?v=f202397" rel="stylesheet" type="text/css"/>
         <link rel="stylesheet" href="/statics/new/css/order.css">
         <link href="/statics/quanju.css" rel="stylesheet" type="text/css">
         <style>
.public_pay_box a{
    display: block;
    width: 100%;
    height: 45px;
    line-height: 45px;
    text-align: center;
    font-size: 16px;
    border-radius: 4px;
    margin-bottom: 15px;
    color: #ffffff;
    text-decoration: none;
}
.pay_stripe {
    background: url("/stripe-icon.png") center center no-repeat #6772E5;
    background-size: 120px;
    box-shadow: 0 4px 12px rgba(103, 114, 229, 0.3);
}
.pay_stripe:before {
    display: none;
}
         </style>
    </head>
    <body>
     <{include file='./ffsm/header.tpl'}>
        <div id="pay">
            <div class="main">
                <div class="main-title" id="mainTit"><{$names.username}>的八字终生运排盘</div>
                <ul class="main-content" id="mainCon">
                    <li class="item J_item0">
                        <p class="fade-in delay250">
                            姓名：<{$names.username}><span class="order-sex">性别：<{if $names.gender==1}>男<{else}>女<{/if}></span>
                        </p>
                    </li>
                    <li class="item item1 item-bazi J_item1" style="display:none">
                        <div class="fade-in delay1000 order-bz">
                            <div class="order-bz__sub">
                                <span>年</span>
                                <span class="J_bz1" data-inner="乙" data-outer="亥">*</span>
                            </div>
                        </div>
                        <div class="fade-in delay3000 order-bz">
                            <div class="order-bz__sub">
                                <span>月</span>
                                <span class="J_bz3" data-inner="壬" data-outer="午">*</span>
                            </div>
                        </div>
                        <div class="fade-in delay5000 order-bz">
                            <div class="order-bz__sub">
                                <span>日</span>
                                <span class="J_bz5" data-inner="癸" data-outer="巳">*</span>
                            </div>
                        </div>
                        <div class="fade-in delay7000 order-bz">
                            <div class="order-bz__sub">
                                <span>时</span>
                                <span class="J_bz7" data-inner="壬" data-outer="子">*</span>
                            </div>
                        </div>
                    </li>
                    <li class="item item11 J_item11" style="display:none">
                        <div class="fade-in delay250 order-top-title"><{$names.username}>的终生运势报告</div>
                        <p class="fade-in delay250 order-top-words">欠缺五行：五行缺*</p>
                        <p class="fade-in delay750 order-top-words">姻缘财禄贵荣，尽在终生运势报告</p>
                    </li>
                </ul>
            </div>
            <p class="order-loading" id="orderLoading"></p>
            <div class="order-wheel__wrap" id="orderMask" style="display:none">
                <div class="order-wheel J_order_wheel">
                    <div class="order-wheel__outer J_order_wheel_outer">
                        <span title="子"></span>
                        <span title="丑"></span>
                        <span title="寅"></span>
                        <span title="卯"></span>
                        <span title="辰"></span>
                        <span title="巳"></span>
                        <span title="午"></span>
                        <span title="未"></span>
                        <span title="申"></span>
                        <span title="酉"></span>
                        <span title="戌"></span>
                        <span title="亥"></span>
                    </div>
                    <div class="order-wheel__inner J_order_wheel_inner">
                        <span title="甲"></span>
                        <span title="乙"></span>
                        <span title="丙"></span>
                        <span title="丁"></span>
                        <span title="戊"></span>
                        <span title="己"></span>
                        <span title="庚"></span>
                        <span title="辛"></span>
                        <span title="壬"></span>
                        <span title="癸"></span>
                    </div>
                    <div class="order-wheel__center J_order_wheel_center active"></div>
                </div>
            </div>
            <div id="orderStep2" class="order-wrap" style="display:none">
                <div class="order-pay">
                    <p class="order-pay__title">
                        <img src="/statics/ffsm/app/bzzsy/1/images/1_title_words.png?v=2b081f7" class="m-img"/>
                    </p>
                    <div class="order-pay__con">
                        <div class="opc__top">
                            <div class="opc__left">
                                <div class="money">
                                    <span class="monery-xsyh">限时优惠：</span>
                                    ￥<span class="money-num"><{$money}></span>
                                    元
                                </div>
                                <del>原价￥238元</del>
                            </div>
                            <div class="opc__right">
                                <span>距优惠结束</span>
                                <span class="J_countDown time" data-second="7200">02:00:00</span>
                            </div>
                        </div>
                        <div class="opc__bottom">
                            已有 <span>1831768</span>
                            人购买，<span>98%</span>
                            的用户反馈报告对他们的<span>事业、感情和财富</span>
                            给予了积极的帮助。
                        </div>
                    </div>
                    <div class="public_pay_box">
  <{if $payMethod.wechat}>
<a class="pay_wx" data-method="Wechatpay3" target="_self" href="/?ct=pay&ac=go&oid=<{$oid}>&type=1">微信支付</a>
 <{/if}>
<{if $payMethod.alipay}>
<a class="pay_zfb" data-method="Alipay2" target="_self" href="/?ct=pay&ac=go&oid=<{$oid}>&type=2">支付宝</a>
<{/if}>

<{if $payMethod.stripe}>
<a class="pay_stripe" data-method="Stripe" target="_self" href="/?ct=pay&ac=stripe_go&oid=<{$oid}>">Stripe支付</a>
<{/if}>

<{if $payMethod.other}>
<a class="pay_wx" data-method="Wechatpay3" target="_self" href="/?ct=pay&ac=pay_go&oid=<{$oid}>&type=wxpay">微信支付</a>
<{/if}>
<{if $payMethod.paypal}>
    <a class="paypal" target="_self" href="/?ct=pay&ac=paypal_go&oid=<{$oid}>">
        <div id="zfb_zf" class="btn">
            <span class="pay-icon icon-paypal"></span>
            <span>paypal支付</span>
        </div>
    </a>
<{/if}>	 
			                  
                    </div>
                    <div class="public_pay_tip">微信支付成功后，需返回当前浏览器查看结果！</div>
                </div>
                <div class="order-lock" class="J_payBottomShow">
                    <p class="order-lock__title">
                        <span>支付后你将获得</span>
                    </p>
                    <div class="ol-box">
                        <p class="ol-box__title">一生各时期运势起伏</p>
                        <div class="ol-box__con">
                            <img src="/statics/ffsm/app/bzzsy/1/images/1_img_1.png?v=e666446" class="m-img"/>
                            <a href="javascript:;" class="J_payPopupShow btn"></a>
                        </div>
                    </div>
                    <div class="ol-box">
                        <p class="ol-box__title">一生运势概述和点评</p>
                        <div class="ol-box__con">
                            <div>
                                一生<span class="red">祸福几何</span>
                                ？<span class="red">中年危机</span>
                                如何过渡？<span class="red">晚年生活</span>
                                是否如意？
                            </div>
                            <a href="javascript:;" class="J_payPopupShow btn"></a>
                        </div>
                    </div>
                    <div class="ol-box">
                        <p class="ol-box__title">求财路能否一帆风顺</p>
                        <div class="ol-box__con">
                            <div>
                                <span class="red">发财路</span>
                                在哪里？怎样<span class="red">避免钱财流失</span>
                                ？如何赚<span class="red">更多的钱</span>
                                ？
                            </div>
                            <a href="javascript:;" class="J_payPopupShow btn"></a>
                        </div>
                    </div>
                    <div class="ol-box">
                        <p class="ol-box__title">今生姻缘和感情变化</p>
                        <div class="ol-box__con">
                            <div>
                                适合<span class="red">早婚还是晚婚</span>
                                ，婚前婚后<span class="red">态度变化</span>
                                ，会遇到的<span class="red">变数</span>
                                。
                            </div>
                            <a href="javascript:;" class="J_payPopupShow btn"></a>
                        </div>
                    </div>
                    <div class="ol-box">
                        <p class="ol-box__title">事业方向该如何选择</p>
                        <div class="ol-box__con">
                            <div>
                                <span class="red">事业发展</span>
                                顺利吗？何时会有<span class="red">瓶颈或危机</span>
                                ？什么职业适合我？
                            </div>
                            <a href="javascript:;" class="J_payPopupShow btn"></a>
                        </div>
                    </div>
                    <div class="ol-box">
                        <p class="ol-box__title">困难时期运势和策略</p>
                        <div class="ol-box__con">
                            <div>
                                平时的<span class="red">人际关系</span>
                                ，有无<span class="red">贵人提携</span>
                                ，有没有需要注意的地方？
                            </div>
                            <a href="javascript:;" class="J_payPopupShow btn"></a>
                        </div>
                    </div>
                    <div class="ol-box">
                        <p class="ol-box__title">健康运势和规避</p>
                        <div class="ol-box__con">
                            <div>
                                自身<span class="red">体质强弱</span>
                                ，需要预防哪些<span class="red">易患疾病</span>
                                或<span class="red">身体损伤</span>
                                ？
                            </div>
                            <a href="javascript:;" class="J_payPopupShow btn"></a>
                        </div>
                    </div>
                    <div class="ol-box">
                        <p class="ol-box__title">家庭和睦和健康建议</p>
                        <div class="ol-box__con">
                            <div>
                                家庭<span class="red">幸福和谐</span>
                                吗？不同时期，家人需要注意的健康问题。
                            </div>
                            <a href="javascript:;" class="J_payPopupShow btn"></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="pop_guide_wrap">
            <div class="pop_guide">
                <img class="pop_guide_pic" src="/statics/ffsm/app/bzzsy/1/images/1_img_ds.png?v=1f43644" alt="老师团队">
                <p class="pop_guide_txt">
                    旦夕祸福一次掌握，今年内<span>有何重大变故，爱情、事业、财富</span>
                    等有什么需要特别注意的地方？老师箴言，改变命运！
                </p>
                <a href="javascript:;" class="pop_guide_gb J_close">你确定要放弃这次机会吗？</a>
                <a href="javascript:;" class="pop_guide_btn J_popRightNowBtn">立即查看分析内容</a>
                <i class="J_close pop_guide_close">╳</i>
                <span class="pop_guide_line"></span>
            </div>
        </div>

        <footer class="public_footer_servers">

            <img src="/statics/ffsm/public/wap/images/img_foot_xin.png?v=cce4dd4" alt="诚信、可信网站" class="public_foot_xin"/>
            <img src="/statics/ffsm/public/wap/images/img_foot_al.png?v=769ffef" alt="阿里云提供数据安全保护" class="public_foot_al"/>
        </footer>
       
        <!--start ads:1374.1374-->
        <!--ads:1374.1374 end-->
        <div class="public_pay_popup" id="publicPayPopup">
            <div class="public_pp_box">
                <div class="public_pp_close" id="publicPPClose">X</div>
                <div class="public_pp_tit">一次付费，查看所有结果</div>
                <div class="public_pp_price">
                    <span>统一鉴定价：</span>
                    <strong>￥<{$money}>元</strong>
                </div>
                <div class="public_pay_box">
  <{if $payMethod.wechat}>
<a class="pay_wx" data-method="Wechatpay3" target="_self" href="/?ct=pay&ac=go&oid=<{$oid}>&type=1">微信支付</a>
 <{/if}>
<{if $payMethod.alipay}>
<a class="pay_zfb" data-method="Alipay2" target="_self" href="/?ct=pay&ac=go&oid=<{$oid}>&type=2">支付宝</a>
<{/if}>

<{if $payMethod.stripe}>
<a class="pay_stripe" data-method="Stripe" target="_self" href="/?ct=pay&ac=stripe_go&oid=<{$oid}>">Stripe支付</a>
<{/if}>

<{if $payMethod.other}>
<a class="pay_wx" data-method="Wechatpay3" target="_self" href="/?ct=pay&ac=pay_go&oid=<{$oid}>&type=wxpay">微信支付</a>
<{/if}>
<{if $payMethod.paypal}>
    <a class="paypal" target="_self" href="/?ct=pay&ac=paypal_go&oid=<{$oid}>">
        <div id="zfb_zf" class="btn">
            <span class="pay-icon icon-paypal"></span>
            <span>paypal支付</span>
        </div>
    </a>
<{/if}>	

                </div>
                <div class="public_pay_tip">微信支付成功后，需返回当前浏览器查看结果！</div>
            </div>
        </div>
        <div class="public_paybottom_height"></div>
        <div class="public_pay_bottom" id="publicPayBottom">
            <span>
                <i></i>
                付费解锁所有项
            </span>
        </div>
    </body>
    <script src="/statics/ffsm/app/bzzsy/1/app.min.js?v=44a0224"></script>
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
 
</html>
