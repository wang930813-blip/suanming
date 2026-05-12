<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>塔罗问答-<{$zhanming}></title>
    <meta http-equiv="Cache-Control" content="no-cache" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0" />
    <{include file='./ffsm/wx_share.tpl'}>
    <link href="taluo/css/index.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="taluo/css/header_rem.css">
    <link href="taluo/css/layer.css" rel="stylesheet" type="text/css">
    <link href="taluo/css/font-awesome.min.css" rel="stylesheet">
    <link href="static/css/base.min.css" rel="stylesheet" type="text/css">
    <script src="taluo/js/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="taluo/js/resizeevts.js"></script>
    <link href="taluo/css/index2021.css" rel="stylesheet" type="text/css">
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
        .pay_wx {
            background: url("/statics/ffsm/static/icon/wechat.png") center center no-repeat #64ab35;
            background-size: 120px;
        }
        .pay_zfb {
            background: url("/statics/ffsm/static/icon/alipay.png") center center no-repeat #00a0e9;
            background-size: 120px;
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
<{$page_meta}>
</head>
<body>
    <{include file='./ffsm/header.tpl'}>
    <style>
    .common-header{max-width:none !important;}
    .common-header__home{left:0 !important;margin-left:0 !important;}
    .common-header__order{right:0 !important;margin-right:0 !important;}
    </style>
    
    <script>
        window.localStorage["notPayOrder"] = '<{$data.oid}>';
    </script>

    <!-- 支付弹窗 -->
    <div class="public_pay_popup" id="publicPayPopup" style="display:none;">
        <div class="public_pp_box">
            <div class="public_pp_close" id="publicPPClose">X</div>
            <div class="public_pp_tit">解锁查看所有测算结果</div>
            <div class="public_pp_price">
                <span>统一鉴定价：</span><strong>￥<{$data.money}>元</strong>
            </div>
            <div class="public_pay_box">
                <{if $payMethod.wechat}>
                    <a class="pay_wx" data-method="Wechatpay3" target="_self" href="/?ct=pay&ac=go&oid=<{$data.oid}>&type=1">微信支付</a>
                <{/if}>
                <{if $payMethod.alipay}>
                    <a class="pay_zfb" data-method="Alipay2" target="_self" href="/?ct=pay&ac=go&oid=<{$data.oid}>&type=2">支付宝</a>
                <{/if}>
                <{if $payMethod.stripe}>
                    <a class="pay_stripe" data-method="Stripe" target="_self" href="/?ct=pay&ac=stripe_go&oid=<{$data.oid}>">Stripe支付</a>
                <{/if}>
                <{if $payMethod.other}>
                    <a class="pay_wx" data-method="Wechatpay3" target="_self" href="/?ct=pay&ac=pay_go&oid=<{$data.oid}>&type=wxpay">微信支付</a>
                <{/if}>
                <{if $payMethod.paypal}>
                    <a class="paypal" target="_self" href="/?ct=pay&ac=paypal_go&oid=<{$data.oid}>">
                        <div id="zfb_zf" class="btn">
                            <span class="pay-icon icon-paypal"></span>
                            <span>paypal支付</span>
                        </div>
                    </a>
                <{/if}>
                <{if $jf_sys_on==1}>
                    <a class="m-extpay" target="_self" href="/?ac=extgo&oid=<{$data.oid}>">积分支付</a>
                <{/if}>
                <{if $vip_on==1}>
                    <a class="m-vippay" target="_self" href="/?ac=vip_pay&oid=<{$data.oid}>">vip免支付</a>
                <{/if}>
            </div>
            <div class="public_pay_tip">微信支付成功后，需返回当前浏览器查看结果！</div>
        </div>
    </div>

    <!--问题和卡牌展示-->
    <section class="popMask">
        <div class="midpop">
            <div class="midpop_hid">你的问题是：<b><{$data.data.question|default:''}></b></div>
            <div class="main">
                <ul class="midpop_card">
                    <li>是非牌 
                        <img src="taluo/picture/card<{$data.data.cards_array.0|default:'0'}>.png" alt="" class="niwei">
                        <em>是非答案</em>
                    </li>
                    <li>能量牌
                        <img src="taluo/picture/card<{$data.data.cards_array.1|default:'1'}>.png" class="niwei" alt=""/>
                        <em>帮助指引</em>
                    </li>
                </ul>

                <div class="midpop_tip">
                    塔罗师将为你语音解答 <br>如何选择对自己最有利？<br> 在确认选择之后，还需要注意些什么？<br> 怎样往正确方向走？<br>
                    <a href="javascript:void(0);" class="btnPayBank">立即咨询 <img src="taluo/icon4.png" alt=""></a>
                </div>
            </div>
        </div>
    </section>

    <script src="taluo/js/layer.js" merge="true"></script>
    <script type="text/javascript" src="taluo/js/layermenu.js"></script>
    <script type="text/javascript" src="taluo/js/bankv1.2.1.js"></script>
    <script type="text/javascript" src="taluo/js/scrolltop.js"></script>
    <script type="text/javascript" src="taluo/js/middle.js"></script>
    <script type="text/javascript" src="taluo/js/clipboard.min.js"></script>

    <script>
        // 使用延迟确保所有脚本加载完成
        setTimeout(function() {
            // 移除可能存在的旧事件
            $('.btnPayBank').off('click');
            
            // 使用document事件委托，确保能捕获到点击
            $(document).on('click', '.btnPayBank', function(e) {
                e.preventDefault();
                e.stopPropagation();
                
                // 显示支付弹窗
                $('#publicPayPopup').css({
                    'display': 'block',
                    'z-index': '99999'
                });
            });

            // 关闭支付弹窗
            $(document).on('click', '#publicPPClose', function() {
                $('#publicPayPopup').hide();
            });
        }, 500);

        // 支付状态轮询
        var inquiry_lock = 0;
        setInterval(function () {
            inquiry();
        }, 2000);
        
        function inquiry() {
            if (inquiry_lock) {
                return;
            }
            $.get('/?ct=pay&ac=scanquery&oid=<{$data.oid}>', {t: Date.parse(new Date())}, function (data) {
                if (data.status) {
                    inquiry_lock = 1;
                    window.location = data.url;
                }
            }, 'json');
        }

        //验证表单
        function CheckUserInput() {
            return true;
        }
    </script>
</body>
</html>
