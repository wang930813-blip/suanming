<!DOCTYPE html>
<html lang="zh-CN">
    <head>
        <meta charset="UTF-8"/>
        <title>月老姻缘簿姻缘预测-<{$zhanming}></title>
        <meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
        <meta content="yes" name="apple-mobile-web-app-capable"/>
        <meta content="black" name="apple-mobile-web-app-status-bar-style"/>
        <meta content="telephone=no" name="format-detection"/>
        <link rel="shortcut icon" href="/statics/ffsm/favicon.ico"/>
        <link href="/statics/ffsm/public/wap/base.min.css?v=1fbbf8f" rel="stylesheet" type="text/css"/>
        <script src="/statics/ffsm/public/wap/js/libs/jquery-3.4.1.min.js"></script>
        <script src="/statics/ffsm/public/wap/js/libs/require-2.3.6.min.js"></script>
        <script src="/statics/ffsm/public/wap/js/common.min.js?v=aad090e"></script>
        <link href="/statics/ffsm/app/hongxian/1/style.min.css?v=ce8bddb" rel="stylesheet"/>
 <link href="/statics/quanju.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="/statics/new/css/order.css">
    </head>
    <body>
    <{include file='./ffsm/header.tpl'}>
        <div class="order-page" id="orderPage">
            <div class="order-top">我的一生姻缘簿</div>
            <div class="order-rotate">
                <div class="order-rotate__yuan">
                    <a class="J_showGuideBtn" href="javascript:;">
                        <span>命定良缘</span>
                    </a>
                    <a class="J_showGuideBtn" href="javascript:;">
                        <span>感情劫难</span>
                    </a>
                    <a class="J_showGuideBtn" href="javascript:;">
                        <span>单身因素</span>
                    </a>
                    <a class="J_showGuideBtn" href="javascript:;">
                        <span>爱情秘典</span>
                    </a>
                    <a class="J_showGuideBtn" href="javascript:;">
                        <span>佳偶样貌</span>
                    </a>
                    <a class="J_showGuideBtn" href="javascript:;">
                        <span>良缘时机</span>
                    </a>
                </div>
            </div>
            <a href="javascript:;" class="order-btn J_showGuideBtn">付费解锁全部姻缘簿</a>
        </div>
        <div class="order-pay-page" id="orderPayShow">
            <img class="m-img" src=" /statics/ffsm/app/hongxian/1/images/bzyy_pay_banner.jpg" alt="红线姻缘"/>
            <div class="order-price">
                <div class="order-price__left">
                    ￥<span class="money-words"><{$money}></span>
                    <del>原价:￥168</del>
                </div>
                <div class="order-price__right">
                    距优惠结束 <span class="J_countDown" data-html="<i>{H}</i>:<i>{I}</i>:<i>{S}</i>" data-second="7200">02:00:00</span>
                </div>
            </div>
            <div class="order-visitor">
                已有<span class="red">838445</span>
                名用户购买姻缘报告，<span class="red">98%</span>
                的用户给予好评，解决了他们的感情苦恼！<span class="red">据大数据分析，你2025年姻缘婚姻会出现一些特别重要的情况！请一定要看！</span>
            </div>
            <div class="order-pay">
                <p class="order-pay__title">支付方式</p>
                <div class="order-pay__con">
                    <div class="public_pay_box">
    <{if $payMethod.wechat}>
<a class="pay_wx" data-method="Wechatpay3" target="_self" href="/?ct=pay&ac=go&oid=<{$oid}>&type=1">微信支付</a>
 <{/if}>
<{if $payMethod.alipay}>
<a class="pay_zfb" data-method="Alipay2" target="_self" href="/?ct=pay&ac=go&oid=<{$oid}>&type=2">支付宝</a>
<{/if}>
	 <{if $payMethod.paypal}>
				<a class="paypal" target="_self" href="/?ct=pay&ac=paypal_go&oid=<{$oid}>">
					<div id="zfb_zf" class="btn">
						<span class="pay-icon icon-paypal"></span>
						<span>paypal支付</span>
					</div>
				</a>
		<{/if}>	
<{if $payMethod.other}>
<a class="pay_wx" data-method="Wechatpay3" target="_self" href="/?ct=pay&ac=pay_go&oid=<{$oid}>&type=wxpay">微信支付</a>
<{/if}>

                    </div>
                    <div class="public_pay_tip">微信支付成功后，需返回当前浏览器查看结果！</div>
                </div>
            </div>
            <p class="payment-tit J_payBottomShow">支付后你将获得以下内容</p>
            <div class="order-lock">
                <p class="order-lock__title ">性格对感情的影响</p>
                <div class="order-lock__con">
                    <div class="order-lock__list">
                        <p class="J_payPopupShow">你的感情运势如何</p>
                        <p class="J_payPopupShow">你的潜在感情喜好是怎么样的</p>
                    </div>
                </div>
            </div>
            <div class="order-lock">
                <p class="order-lock__title ">姻缘走势</p>
                <div class="order-lock__con">
                    <div class="order-lock__list">
                        <p class="J_payPopupShow">你什么时候会遇到另一半</p>
                        <p class="J_payPopupShow">未来十年姻缘发展是何种趋势</p>
                    </div>
                </div>
            </div>
            <div class="order-lock">
                <p class="order-lock__title ">命定姻缘</p>
                <div class="order-lock__con">
                    <div class="order-lock__list">
                        <p class="J_payPopupShow">你的命中另一半是个怎么样的人</p>
                        <p class="J_payPopupShow">你们会以何种方式相遇</p>
                    </div>
                </div>
            </div>
            <div class="order-lock">
                <p class="order-lock__title ">姻缘点评</p>
                <div class="order-lock__con">
                    <div class="order-lock__list">
                        <p class="J_payPopupShow">如何提高你遇到良缘的几率</p>
                        <p class="J_payPopupShow">有哪些方法可以让你早点遇到TA</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="public-order-shadow J_public_history_back">
            <div class="public-order-back">
                <span class="J_public_history_back_close public-order-back__close"></span>
                <img class="public-order-back__pic" src="/statics/ffsm/public/wap/images/1_popup_img.png?v=aecd775" alt="大师">
                <p>
                    旦夕祸福一次掌握，今年内<span>有何重大变故，爱情、事业、财富</span>
                    等有什么需要特别注意的地方？老师箴言，改变命运！
                </p>
                <h3>你确定要放弃这次机会吗？</h3>
                <a href="javascript:;" class="J_payPopupShow J_public_history_back_close public-order-back__btn">立即查看分析内容</a>
            </div>
        </div>
       
        <footer class="public_footer_servers">
            <img src="/statics/ffsm/public/wap/images/img_foot_xin.png?v=cce4dd4" alt="诚信、可信网站" class="public_foot_xin">
            <img src="/statics/ffsm/public/wap/images/img_foot_al.png?v=769ffef" alt="阿里云提供数据安全保护" class="public_foot_al">
        </footer>
        <div style="display: none">
            
        </div>
         <a href="/?ac=history" class="m-order-history">订单查询</a>
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
	 <{if $payMethod.paypal}>
				<a class="paypal" target="_self" href="/?ct=pay&ac=paypal_go&oid=<{$oid}>">
					<div id="zfb_zf" class="btn">
						<span class="pay-icon icon-paypal"></span>
						<span>paypal支付</span>
					</div>
				</a>
		<{/if}>	
<{if $payMethod.other}>
<a class="pay_wx" data-method="Wechatpay3" target="_self" href="/?ct=pay&ac=pay_go&oid=<{$oid}>&type=wxpay">微信支付</a>
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
        <script src="/statics/ffsm/app/hongxian/1/app.min.js?v=7736798"></script>
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
   <script>
translate.language.setLocal('chinese_simplified'); 
translate.changeLanguage('<{$lang._changeLanguage}>');
translate.execute();
</script>
    </body>
</html>
