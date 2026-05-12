<!doctype html>
<html>
<head>
    <title>择吉日支付</title>
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
    <link href="zeri/css/index.css" rel="stylesheet" type="text/css">
    <link href="zeri/css/font-awesome.min-1.css" rel="stylesheet">
    <style>
        /* 修正背景图片路径 */
        .wrapper {
            background: #e7e0d5 url(zeri/image/wrap-bg.jpg) no-repeat !important;
            background-size: 100% auto !important;
        }
        .bigbox .top {
            background: url(zeri/image/top.png) no-repeat !important;
            background-size: 100% 100% !important;
        }
        .bigbox .mid {
            background: url(zeri/image/mid.jpg) repeat-y !important;
            background-size: 100% auto !important;
        }
        .bigbox .down {
            background: url(zeri/image/down.png) no-repeat !important;
            background-size: 100% auto !important;
        }
        
        /* 与输入页面保持一致的wrapper样式 */
        .wrapper.input {
            padding: 1rem 0 0 0;
        }
        
        /* 订单信息卡片 */
        .order-info {
            width: 100%;
            float: left;
            margin: .3rem 0 0 0;
            background: #fff8eb;
            border: solid .02rem #ebc7aa;
            border-radius: .1rem;
            padding: .3rem;
        }
        
        .order-info-title {
            width: 100%;
            float: left;
            line-height: .6rem;
            font-size: .36rem;
            color: #b1311b;
            font-weight: bold;
            text-align: center;
            margin-bottom: .2rem;
        }
        
        .order-info-item {
            width: 100%;
            float: left;
            line-height: .5rem;
            font-size: .3rem;
            color: #333;
            padding: .15rem 0;
            border-bottom: dotted .01rem #eeceb0;
        }
        
        .order-info-item:last-child {
            border-bottom: none;
        }
        
        .order-info-label {
            color: #666;
        }
        
        .order-info-value {
            color: #b1311b;
            font-weight: bold;
        }
        
        /* 价格展示 */
        .price-box {
            width: 100%;
            float: left;
            margin: .3rem 0;
            background: #fff8eb;
            border: solid .02rem #ebc7aa;
            border-radius: .1rem;
            padding: .3rem;
            text-align: center;
        }
        
        .price-label {
            font-size: .28rem;
            color: #666;
            margin-bottom: .15rem;
        }
        
        .price-value {
            font-size: .6rem;
            color: #b1311b;
            font-weight: bold;
        }
        
        .price-value span {
            font-size: .36rem;
        }
        
        /* 支付方式 */
        .pay-methods {
            width: 100%;
            float: left;
            margin: .3rem 0 0 0;
        }
        
        .pay-method-item {
            width: 100%;
            float: left;
            margin: 0 0 .2rem 0;
            border-radius: .1rem;
            overflow: hidden;
        }
        
        .pay-method-btn {
            display: block;
            width: 100%;
            padding: .35rem;
            text-decoration: none;
            font-size: .38rem;
            font-weight: bold;
            text-align: center;
            border-radius: .1rem;
            transition: all 0.3s;
            box-shadow: 0 .04rem .12rem rgba(0,0,0,0.15);
        }
        
        .pay-method-btn:active {
            transform: translateY(.02rem);
            box-shadow: 0 .02rem .08rem rgba(0,0,0,0.2);
        }
        
        /* 微信支付按钮 */
        .pay-wx {
            background: linear-gradient(135deg, #09bb07 0%, #1aad19 100%);
            position: relative;
        }
        
        .pay-wx .pay-method-btn {
            color: #fff;
        }
        
        .pay-wx .pay-method-btn::before {
            content: '';
            display: inline-block;
            width: .5rem;
            height: .5rem;
            background: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="white"><path d="M8.691 2.188C3.891 2.188 0 5.476 0 9.53c0 2.212 1.17 4.203 3.002 5.55a.59.59 0 0 1 .213.665l-.39 1.428c-.019.07-.048.141-.048.213 0 .163.13.295.29.295a.326.326 0 0 0 .167-.054l1.903-1.114a.864.864 0 0 1 .717-.098 10.16 10.16 0 0 0 2.837.403c.276 0 .543-.027.811-.05-.857-2.578.157-4.972 1.932-6.446 1.703-1.415 3.882-1.98 5.853-1.838-.576-3.583-4.196-6.348-8.596-6.348zM5.785 5.991c.642 0 1.162.529 1.162 1.18a1.17 1.17 0 0 1-1.162 1.178A1.17 1.17 0 0 1 4.623 7.17c0-.651.52-1.18 1.162-1.18zm5.813 0c.642 0 1.162.529 1.162 1.18a1.17 1.17 0 0 1-1.162 1.178 1.17 1.17 0 0 1-1.162-1.178c0-.651.52-1.18 1.162-1.18zm5.34 2.867c-1.797-.052-3.746.512-5.28 1.786-1.72 1.428-2.687 3.72-1.78 6.22.942 2.453 3.666 4.229 6.884 4.229.826 0 1.622-.12 2.361-.336a.722.722 0 0 1 .598.082l1.584.926a.272.272 0 0 0 .14.047c.134 0 .24-.111.24-.247 0-.06-.023-.12-.038-.177l-.327-1.191a.49.49 0 0 1 .178-.555c1.529-1.119 2.498-2.828 2.498-4.663 0-3.477-3.211-6.188-7.058-6.188z"/></svg>') center/contain no-repeat;
            margin-right: .15rem;
            vertical-align: middle;
        }
        
        /* 支付宝支付按钮 */
        .pay-zfb {
            background: linear-gradient(135deg, #1677ff 0%, #0958d9 100%);
            position: relative;
        }
        
        .pay-zfb .pay-method-btn {
            color: #fff;
        }
        
        .pay-zfb .pay-method-btn::before {
            content: '';
            display: inline-block;
            width: .5rem;
            height: .5rem;
            background: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1024 1024" fill="white"><path d="M1023.795 701.476c-0.191-3.281-0.397-6.865-0.603-10.635-7.293-116.888-21.879-280.357-21.879-280.357s-3.69-26.934-26.256-38.793c-22.552-11.859-562.754-0.206-562.754-0.206s-24.393-1.448-38.602 21.106c-14.208 22.552-14.986 313.714-14.986 313.714s-1.057 22.361 18.195 38.602c19.266 16.254 572.613 3.69 588.076 2.844 15.476-0.846 58.605-10.65 58.809-46.275z"/><path d="M853.394 614.4L606.72 512c-49.766 63.488-120.423 106.24-200.423 117.76L202.24 819.2c96.017 63.488 210.423 100.352 333.394 100.352 157.44 0 298.24-60.352 404.48-158.72l-86.72-146.432z"/></svg>') center/contain no-repeat;
            margin-right: .15rem;
            vertical-align: middle;
        }
        
        /* 提示信息 */
        .pay-tips {
            width: 100%;
            float: left;
            margin: .3rem 0;
            padding: .2rem;
            background: #fffaed;
            border: solid .01rem #ffd591;
            border-radius: .1rem;
            font-size: .24rem;
            color: #ad6800;
            line-height: .4rem;
        }
        
        .pay-tips i {
            color: #fa8c16;
            margin-right: .1rem;
        }
    </style>
<{$page_meta}>
</head>
<body>
    <!-- 引入公共头部 -->
    <{include file="ffsm/header.tpl"}>

    <section class="wrapper input">
        <section class="main">
            <section class="bigbox">
                <div class="top">
                    <div class="indexTop"><b>确认支付</b></div>
                </div>
                <div class="mid">
                    <div class="con">
                        <!-- 订单信息 -->
                        <div class="order-info">
                            <div class="order-info-title">订单信息</div>
                            <div class="order-info-item">
                                <span class="order-info-label">订单编号：</span>
                                <span class="order-info-value" id="orderNo"><{$order_no}></span>
                            </div>
                            <div class="order-info-item">
                                <span class="order-info-label">服务项目：</span>
                                <span class="order-info-value"><{$event}></span>
                            </div>
                            
                            <!-- 动态显示的信息字段 -->
                            <div id="dynamicFields"></div>
                            
                            <div class="order-info-item">
                                <span class="order-info-label">择日范围：</span>
                                <span class="order-info-value"><{$time_range}></span>
                            </div>
                        </div>

                        <!-- 价格 -->
                        <div class="price-box">
                            <div class="price-label">应付金额</div>
                            <div class="price-value">
                                <span>¥</span><{$price}>
                            </div>
                        </div>

                        <!-- 支付方式 -->
                        <div class="pay-methods">
                            <{if $payMethod.wechat}>
                            <div class="pay-method-item pay-wx">
                                <a href="/?ct=pay&ac=go&oid=<{$order_no}>&type=1" class="pay-method-btn">
                                    微信支付
                                </a>
                            </div>
                            <{/if}>

                            <{if $payMethod.alipay}>
                            <div class="pay-method-item pay-zfb">
                                <a href="/?ct=pay&ac=go&oid=<{$order_no}>&type=2" class="pay-method-btn">
                                    支付宝
                                </a>
                            </div>
                            <{/if}>
                            
                            <{if $payMethod.other}>
                            <div class="pay-method-item pay-wx">
                                <a href="/?ct=pay&ac=pay_go&oid=<{$order_no}>&type=wxpay" class="pay-method-btn">
                                    微信支付
                                </a>
                            </div>
                            <div class="pay-method-item pay-zfb">
                                <a href="/?ct=pay&ac=pay_go&oid=<{$order_no}>&type=alipay" class="pay-method-btn">
                                    支付宝
                                </a>
                            </div>
                            <{/if}>
                        </div>

                        <!-- 提示信息 -->
                        <div class="pay-tips">
                            <i class="fa fa-info-circle"></i>
                            支付成功后，吉日结果将自动推送给您，请耐心等待
                        </div>
                    </div>
                </div>
                <div class="down"></div>
            </section>
        </section>
        
        <link href="zeri/css/footer.css" rel="stylesheet" type="text/css">
        <{include file="ffsm/footer_contact.tpl"}>
    </section>

    <script src="zeri/js/layer.js"></script>
    <script type="text/javascript" src="zeri/js/clipboard.min.js"></script>
    
    <script>
        // 根据事项类型动态显示订单信息
        $(function() {
            var event = '<{$event}>';
            var man_name = '<{$man_name}>';
            var woman_name = '<{$woman_name}>';
            var man_birthday = '<{$man_birthday}>';
            var woman_birthday = '<{$woman_birthday}>';
            
            var html = '';
            var eventType = getEventType(event);
            
            if (eventType === 'marriage') {
                // 结婚/订婚/领证：显示男女双方
                if (man_name) {
                    html += '<div class="order-info-item"><span class="order-info-label">男方姓名：</span><span class="order-info-value">' + man_name + '</span></div>';
                    if (man_birthday && man_birthday != '0.0.0.0.0') {
                        html += '<div class="order-info-item"><span class="order-info-label">男方生辰：</span><span class="order-info-value">' + formatBirthday(man_birthday) + '</span></div>';
                    }
                }
                if (woman_name) {
                    html += '<div class="order-info-item"><span class="order-info-label">女方姓名：</span><span class="order-info-value">' + woman_name + '</span></div>';
                    if (woman_birthday && woman_birthday != '0.0.0.0.0') {
                        html += '<div class="order-info-item"><span class="order-info-label">女方生辰：</span><span class="order-info-value">' + formatBirthday(woman_birthday) + '</span></div>';
                    }
                }
            } else if (eventType === 'moving') {
                // 搬家/入宅：显示住户姓名
                if (man_name) {
                    html += '<div class="order-info-item"><span class="order-info-label">住户姓名：</span><span class="order-info-value">' + man_name + '</span></div>';
                }
            } else if (eventType === 'business') {
                // 开业：显示店铺名称和老板姓名
                if (man_name) {
                    html += '<div class="order-info-item"><span class="order-info-label">店铺名称：</span><span class="order-info-value">' + man_name + '</span></div>';
                }
                if (woman_name) {
                    html += '<div class="order-info-item"><span class="order-info-label">老板姓名：</span><span class="order-info-value">' + woman_name + '</span></div>';
                }
            } else if (eventType === 'renovation') {
                // 装修/动土：显示业主姓名
                if (man_name) {
                    html += '<div class="order-info-item"><span class="order-info-label">业主姓名：</span><span class="order-info-value">' + man_name + '</span></div>';
                }
            } else if (eventType === 'personal') {
                // 提车/出行等：显示姓名和生辰
                var label = event.indexOf('提车') !== -1 ? '车主姓名' : event.indexOf('出行') !== -1 ? '出行人' : '姓名';
                if (man_name) {
                    html += '<div class="order-info-item"><span class="order-info-label">' + label + '：</span><span class="order-info-value">' + man_name + '</span></div>';
                    if (man_birthday && man_birthday != '0.0.0.0.0') {
                        html += '<div class="order-info-item"><span class="order-info-label">生辰八字：</span><span class="order-info-value">' + formatBirthday(man_birthday) + '</span></div>';
                    }
                }
            } else {
                // 其他类型：显示姓名
                if (man_name) {
                    html += '<div class="order-info-item"><span class="order-info-label">姓名：</span><span class="order-info-value">' + man_name + '</span></div>';
                }
            }
            
            $('#dynamicFields').html(html);
        });
        
        // 判断事项类型
        function getEventType(event) {
            if (event.indexOf('结婚') !== -1 || event.indexOf('订婚') !== -1 || event.indexOf('领证') !== -1) {
                return 'marriage';
            } else if (event.indexOf('搬家') !== -1 || event.indexOf('入宅') !== -1) {
                return 'moving';
            } else if (event.indexOf('开业') !== -1 || event.indexOf('开工') !== -1 || event.indexOf('开张') !== -1) {
                return 'business';
            } else if (event.indexOf('装修') !== -1 || event.indexOf('动土') !== -1) {
                return 'renovation';
            } else if (event.indexOf('提车') !== -1 || event.indexOf('出行') !== -1 || event.indexOf('理发') !== -1) {
                return 'personal';
            } else {
                return 'simple';
            }
        }
        
        // 格式化生日显示
        function formatBirthday(birthday) {
            if (!birthday || birthday == '0.0.0.0.0') return '';
            var parts = birthday.split('.');
            if (parts.length >= 3) {
                return parts[0] + '年' + parts[1] + '月' + parts[2] + '日';
            }
            return birthday;
        }
        
        // 支付状态轮询
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
            $.get('/?ct=pay&ac=scanquery&oid=<{$order_no}>', {t: Date.parse(new Date())}, function (data) {
                if (data.status) {
                    inquiry_lock = 1;
                    // 支付成功，跳转到结果页面（自动查询吉日）
                    window.location.href = data.url;
                }
            }, 'json');
        }
        
        // 复制微信号
        var copy_wx = new Clipboard('.copy_wx');
        copy_wx.on('success', function(e) {
            e.clearSelection();
            layer.open({
                content: '微信号复制成功！',
                skin: 'msg',
                time: 2
            });
        });
    </script>
</body>
</html>
