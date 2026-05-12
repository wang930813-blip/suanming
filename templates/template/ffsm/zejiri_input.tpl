<!doctype html>
<html>
<head>
    <title><{$event}></title>
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
    <link href="zeri/css/font-awesome.min-1.css" rel="stylesheet">
    <style>
		.indexInput .link {
			float: left;
			width: 100%;
			margin: .1rem 0 0 0;
			text-align: right;
			font-size: .24rem;
		}
		.indexInput .link a {
			color: #b8741a;
		}
		.indexInput .link a b {
			display: inline-block;
			width: .36rem;
			background: #f9f1e3;
			line-height: .36rem;
			color: #a20012;
			text-align: center;	
		}
	</style>
<{$page_meta}>
</head>
<body>
    <!--M站rem版公用侧边栏-->
    <div class="remsidebar_zhezhao" style="display: none"></div>
    <style type="text/css">
        /**** M站rem版公用侧边栏 ****/
        .remsidebar_zhezhao { width:100%; float:left; max-width:7.5rem; background:#000; height:100%; opacity:.7; position:fixed; top:0; z-index:999; }
        .remsidebar { width:6rem; float:right; height:100%; background:#fff; position:fixed; top:0; left:50%; margin:0 0 0 -1.2rem; z-index:999; }
        .remsidebar_top { width:100%; float:left; background:#845520; padding:.15rem; line-height:.5rem; font-size:.3rem; color:#fff; }
        .remsidebar_top a { color:#fff; }
        .remsidebar_top a.fr { padding:0 .1rem 0 0; }
        .remsidebar_top span { color:#ffc13d; }
        .remsidebar_list { width:100%; float:left; padding:.1rem .25rem; }
        .remsidebar_list a { width:50%; float:left; line-height:.6rem; font-size:.3rem; text-align:center; }
        .remsidebar_list a i { color:#fa6398; }
        .remsidebar_list a.width100 { width:100%; text-align:center; }
        .remsidebar_list a img { width:.38rem; vertical-align:middle; margin:-.03rem 0 0 0; }
        .remsidebar_title { width:100%; float:left; background:#d7bc97; padding:0 0 0 .4rem; line-height:.65rem; font-size:.32rem; color:#79460e; }
        .remsidebar_kefu { width:100%; float:left; background:#d7bc97; line-height:.8rem; font-size:.32rem; text-align:center; position:absolute; bottom:0; }
        .remsidebar_kefu a { display:block;color: #79460e;; }
        .remsidebar_kefu a img { width:.38rem; vertical-align:middle; margin:-.03rem 0 0 0; }
        /**** M站rem版公用侧边栏 ****/
        .sidebarMask {
            width: 100%;
            float: left;
            max-width: 7.5rem;
            height: 100%;
            background: rgb(0, 0, 0, .7);
            position: fixed;
            top: 0;
            z-index: 999;
        }
        .sidebarBox {
            width: 5rem;
            float: right;
            height: 100%;
            background: #fff;
            overflow-y: scroll;
            position: fixed;
            top: 0;
            left: calc(50% - 2.2rem);
            z-index: 10001;
        }
        .sidebarBox_top {
            width: 100%;
            float: left;
            background: #845520;
            padding: .15rem;
            line-height: .5rem;
            color: #fff;
            font-size: .32rem;
        }
        .sidebarBox_top a {
            color: #fff;
        }
        .sidebarBox_member {
            width: 100%;
            float: left;
            padding: .1rem .2rem;
        }
        .sidebarBox_member a {
            width: 50%;
            float: left;
            line-height: .6rem;
            font-size: .3rem;
            text-align: center;
        }
        .sidebarBox_member a img {
            width: .38rem;
            vertical-align: middle;
            margin: -.05rem 0 0 0;
        }
        .sidebarBox_member a:first-child {
            width: 100%;
        }
        .sidebarBox_title {
            width: 100%;
            float: left;
            border-top: 2px solid #e1e1e1;
            padding: .1rem 0 0 0;
            font-size: .3rem;
            color: #000;
        }
        .sidebarBox_title img {
            width: .38rem;
            vertical-align: middle;
            margin: -.05rem 0 0 0;
        }
        .sidebarBox_list {
            width: 100%;
            float: left;
            padding: 0 0 0 .45rem;
        }
        .sidebarBox_list a {
            width: 50%;
            float: left;
            line-height: .6rem;
            font-size: .26rem;
        }
        .sidebarBox_list a.red {
            color: #ff0000;
        }
        .sidebarBox_kefu {
            width: 100%;
            float: left;
        }
        .sidebarBox_kefu a {
            display: flex;
            justify-content: center;
            align-items: center;
            width: 100%;
            color: #79460e;
            background: #d7bc97;
            height: .8rem;
            font-size: .32rem;
        }
        .sidebarBox_kefu a img {
            width: .38rem;
        }
    </style>
    <section class="sidebarBox remsidebar" style="left: 140%;">
        <div class="sidebarBox_title"><img src="zeri/image/icon4.png" alt=""> 精品测试</div>
        <div class="sidebarBox_list">
            <a href="/?ac=zejiri" class="red">择吉日</a>
            <a href="javascript:void(0);">更多测试</a>
        </div>
    </section>
    <!--M站rem版公用侧边栏-->

    <script>
        $(function () {
            var barIsShow=false;
            $('.remheader').click(function () {
                if(!barIsShow){
                    $('.remsidebar_zhezhao').show();
                    $('.remsidebar').animate({
                        'left':'50%'
                    },600,function () {
                        barIsShow=true;
                    })
                }
            })
            $('.remsidebar_zhezhao').on("touchmove",function(e) {
                 e.preventDefault();
            });
            $('.remsidebar_zhezhao').click(function () {
                $(this).hide();
                if(barIsShow){
                    $('body').attr('style','');
                    $('.remsidebar').animate({
                        'left':'140%'
                    },600,function () {
                        barIsShow=false;
                    })
                }
            })
        })
    </script>

    <!-- 引入公共头部 -->
    <{include file="ffsm/header.tpl"}>

    <style>
        /* 让header占满整个屏幕宽度 */
        .common-header{max-width:none !important;}
        .common-header__home{left:0 !important;margin-left:0 !important;}
        .common-header__order{right:0 !important;margin-right:0 !important;}
    </style>

    <section class="wrapper input">
        <section class="main">
            <section class="bigbox">
                <form name="frmMeasure" id="frmMeasure" method="post">
                    <div class="top">
                        <div class="indexTop"><b><{$event}> ▼</b></div>
                    </div>
                    <div class="mid">
                        <div class="con">
                            <div class="innputBox indexInput">
                                <!-- 结婚/订婚/领证类型：双人信息 -->
                                <div class="field-group marriage-fields" style="display:none;">
                                    <div class="row">
                                        <div class="left"><i class="fa fa-male"></i>男方</div>
                                        <div class="right">
                                            <div class="name border"><input type="text" name="NumData" id="NumData" class="finput name-box" placeholder="男方姓名" maxlength="5"/></div>
                                            <div class="birth">
                                                <span id="birthday_my" class="birth-box" hasHour="1" data-text="公历:2000年1月1日0时0分">公历 2000年1月1日0时0分 <i class="fa fa-calendar"></i></span>
                                                <input type="hidden" name="iYear" id="iYear" class="form-input iYear1" value="2000.1.1.0.0" jiavalue="1" jiavalue2="1" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="left"><i class="fa fa-female"></i>女方</div>
                                        <div class="right">
                                            <div class="name border"><input type="text" name="NumData2" id="NumData2" class="finput name-box2" placeholder="女方姓名" maxlength="5"/></div>
                                            <div class="birth">
                                                <span id="birthday_girl_my" class="birth-box" hasHour="1" data-text="公历:2000年1月1日0时0分">公历 2000年1月1日0时0分 <i class="fa fa-calendar"></i></span>
                                                <input type="hidden" name="iYear2" id="iYear2" class="form-input iYear2" value="2000.1.1.0.0" jiavalue="1" jiavalue2="1" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                
                                <!-- 搬家/入宅类型：住户姓名 -->
                                <div class="field-group moving-fields" style="display:none;">
                                    <div class="row">
                                        <div class="left"><i class="fa fa-user"></i>住户姓名</div>
                                        <div class="right">
                                            <div class="name border"><input type="text" name="NumData" id="NumData_move" class="finput name-box" placeholder="请输入住户姓名" maxlength="10"/></div>
                                        </div>
                                    </div>
                                    <div style="padding:.2rem .3rem;font-size:.24rem;color:#999;line-height:.4rem;">
                                        <i class="fa fa-info-circle"></i> 乔迁吉日以住户姓名为准
                                    </div>
                                </div>
                                
                                <!-- 开业类型：公司/店铺名称 -->
                                <div class="field-group business-fields" style="display:none;">
                                    <div class="row">
                                        <div class="left"><i class="fa fa-building"></i>店铺名称</div>
                                        <div class="right">
                                            <div class="name border"><input type="text" name="NumData" id="NumData_business" class="finput name-box" placeholder="请输入公司或店铺名称" maxlength="20"/></div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="left"><i class="fa fa-user"></i>老板姓名</div>
                                        <div class="right">
                                            <div class="name border"><input type="text" name="NumData2" id="NumData_boss" class="finput name-box2" placeholder="老板姓名（选填）" maxlength="5"/></div>
                                        </div>
                                    </div>
                                    <div style="padding:.2rem .3rem;font-size:.24rem;color:#999;line-height:.4rem;">
                                        <i class="fa fa-info-circle"></i> 开业吉日以店铺名称为准，老板姓名可选填
                                    </div>
                                </div>
                                
                                <!-- 装修/动土类型：业主姓名 -->
                                <div class="field-group renovation-fields" style="display:none;">
                                    <div class="row">
                                        <div class="left"><i class="fa fa-user"></i>业主姓名</div>
                                        <div class="right">
                                            <div class="name border"><input type="text" name="NumData" id="NumData_owner" class="finput name-box" placeholder="请输入业主姓名" maxlength="10"/></div>
                                        </div>
                                    </div>
                                </div>
                                
                                <!-- 提车/出行类型：个人信息+生辰 -->
                                <div class="field-group personal-fields" style="display:none;">
                                    <div class="row">
                                        <div class="left"><i class="fa fa-user"></i><span id="personal-label">姓名</span></div>
                                        <div class="right">
                                            <div class="name border"><input type="text" name="NumData" id="NumData_personal" class="finput name-box" placeholder="请输入姓名" maxlength="5"/></div>
                                            <div class="birth">
                                                <span id="birthday_personal" class="birth-box" hasHour="1" data-text="公历:2000年1月1日0时0分">公历 2000年1月1日0时0分 <i class="fa fa-calendar"></i></span>
                                                <input type="hidden" name="iYear" id="iYear_personal" class="form-input iYear1" value="2000.1.1.0.0" jiavalue="1" jiavalue2="1" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                
                                <!-- 签约/其他类型：仅姓名 -->
                                <div class="field-group simple-fields" style="display:none;">
                                    <div class="row">
                                        <div class="left"><i class="fa fa-user"></i><span id="simple-label">姓名</span></div>
                                        <div class="right">
                                            <div class="name border"><input type="text" name="NumData" id="NumData_simple" class="finput name-box" placeholder="请输入姓名" maxlength="10"/></div>
                                        </div>
                                    </div>
                                </div>
                                
                                <!-- 时间范围选择（所有类型共用） -->
                                <div class="row">
                                    <div class="left"><span id="time-label">时间范围</span></div>
                                    <div class="right">
                                        <div class="time">
                                            <select name="queryMonth" id="queryMonth">
                                                <option value="12">近一年内吉日</option>
                                                <option value="18">近十八个月内吉日</option>
                                                <option value="24">近两年内吉日</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="indexBtn"><a href="javascript:void(0);" class="btnMeasure_xp">立即择吉日</a></div>

                            <section class="yinsibox">
                                <div class="yinsiagree">
                                    <a href="javascript:void(0);" id="xieyi" data_xieyi='2'>
                                        <i class="fa fa-circle-o" id="xieyi1" style="display: none;" onclick="xieyiagree(1)"></i>
                                        <i class="fa fa-check-circle-o" id="xieyi2" onclick="xieyiagree(2)"></i>
                                        <span onclick="xieyiagree(parseInt($('#xieyi').attr('data_xieyi')))" style="color: #999">已阅读并同意</span>
                                    </a>
                                    <a href="javascript:void(0);">《用户协议》</a>和<a href="javascript:void(0);">《隐私协议》</a>
                                </div>
                            </section>
                            <style>
                                .yinsibox { width:100%; float:left; margin:.2rem 0 0 0; }
                                .yinsiagree { width:100%; float:left; line-height:.4rem; font-size:.28rem; color:#999; text-align:center; }
                                .yinsiagree a { color:#ef7171; }
                            </style>
                        </div>
                    </div>
                    <input type="hidden" name="event" id="event" value="<{$event}>" />
                </form>
                <div class="down"></div>
            </section>
        </section>
        
        <link href="zeri/css/footer.css" rel="stylesheet" type="text/css">
        <{include file="ffsm/footer_contact.tpl"}>
    </section>

    <script src="zeri/js/layer.js"></script>
    <script type="text/javascript" src="zeri/js/layermenu.js"></script>
    <script type="text/javascript" src="zeri/js/mainminastrov1.1.3.js"></script>
    <script type="text/javascript" src="zeri/js/clipboard.min.js"></script>
    <script type="text/javascript" src="zeri/js/pastedata_xp.js"></script>
    <script type="text/javascript" src="zeri/js/mainminastrov1.1.3-1.js"></script>
    
    <script>
        // 根据事项类型显示对应的表单字段
        $(function() {
            var event = '<{$event}>';
            var eventType = getEventType(event);
            
            // 隐藏所有字段组
            $('.field-group').hide();
            
            // 根据类型显示对应字段
            if (eventType === 'marriage') {
                $('.marriage-fields').show();
                $('#time-label').text('结婚时间');
                initMarriageFields();
            } else if (eventType === 'moving') {
                $('.moving-fields').show();
                $('#time-label').text('乔迁时间');
            } else if (eventType === 'business') {
                $('.business-fields').show();
                $('#time-label').text('开业时间');
            } else if (eventType === 'renovation') {
                $('.renovation-fields').show();
                $('#time-label').text('动工时间');
            } else if (eventType === 'personal') {
                $('.personal-fields').show();
                var label = event.indexOf('提车') !== -1 ? '车主' : event.indexOf('出行') !== -1 ? '出行人' : '姓名';
                $('#personal-label').text(label);
                $('#time-label').text(event.replace('吉日', '时间'));
                initPersonalFields();
            } else {
                $('.simple-fields').show();
                $('#simple-label').text('姓名');
                $('#time-label').text(event.replace('吉日', '时间'));
            }
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
        
        // 初始化结婚类型表单
        function initMarriageFields() {
            initName('NumData', '');
            initName('NumData2', '2');
            lc_initBirthDate_hm2('birthday_my', 'iYear', '');
            lc_initBirthDate_hm2('birthday_girl_my', 'iYear2', '2');
            
            var calendar1 = new lCalendar().init('#birthday_my', '');
            var calendar2 = new lCalendar().init('#birthday_girl_my', '');
            
            $('#birthday_my').attr('data-text','公历:2000年1月1日0时0分');
            $('#birthday_my').html('公历 2000年1月1日0时0分 <i class="fa fa-calendar"></i>');
            $('#iYear').val('2000.1.1.0.0');
            $('#iYear').attr('jiavalue','1').attr('jiavalue2','1');
            
            $('#birthday_girl_my').attr('data-text','公历:2000年1月1日0时0分');
            $('#birthday_girl_my').html('公历 2000年1月1日0时0分 <i class="fa fa-calendar"></i>');
            $('#iYear2').val('2000.1.1.0.0');
            $('#iYear2').attr('jiavalue','1').attr('jiavalue2','1');
        }
        
        // 初始化个人信息类型表单
        function initPersonalFields() {
            initName('NumData_personal', '');
            lc_initBirthDate_hm2('birthday_personal', 'iYear_personal', '');
            
            var calendar = new lCalendar().init('#birthday_personal', '');
            
            $('#birthday_personal').attr('data-text','公历:2000年1月1日0时0分');
            $('#birthday_personal').html('公历 2000年1月1日0时0分 <i class="fa fa-calendar"></i>');
            $('#iYear_personal').val('2000.1.1.0.0');
            $('#iYear_personal').attr('jiavalue','1').attr('jiavalue2','1');
        }

        // 协议效果
        function xieyiagree(re) {
            $('#xieyi i').hide();
            if (re == '1') {
                $('#xieyi').attr('data_xieyi', (re + 1));
                $('#xieyi' + (re + 1)).show();
            } else {
                $('#xieyi').attr('data_xieyi', (re - 1));
                $('#xieyi' + (re - 1)).show();
            }
        }

        // 提交查询
        $('.btnMeasure_xp').click(function() {
            var elementValue = $('#xieyi').attr('data_xieyi');
            if (elementValue == 1) {
                layer.open({
                    content: '请阅读并同意用户协议和隐私协议！',
                    skin: 'msg',
                    time: 2
                });
                return false;
            }

            var event = '<{$event}>';
            var eventType = getEventType(event);
            var man_name = '', woman_name = '', man_birthday = '', woman_birthday = '';
            
            // 根据不同类型收集数据
            if (eventType === 'marriage') {
                man_name = $('#NumData').val().trim();
                woman_name = $('#NumData2').val().trim();
                man_birthday = $('#iYear').val();
                woman_birthday = $('#iYear2').val();
                
                if (!man_name && !woman_name) {
                    layer.open({
                        content: '请至少填写一方姓名',
                        skin: 'msg',
                        time: 2
                    });
                    return;
                }
            } else if (eventType === 'moving') {
                man_name = $('#NumData_move').val().trim();
                if (!man_name) {
                    layer.open({
                        content: '请输入住户姓名',
                        skin: 'msg',
                        time: 2
                    });
                    return;
                }
            } else if (eventType === 'business') {
                man_name = $('#NumData_business').val().trim();
                woman_name = $('#NumData_boss').val().trim();
                if (!man_name) {
                    layer.open({
                        content: '请输入公司或店铺名称',
                        skin: 'msg',
                        time: 2
                    });
                    return;
                }
            } else if (eventType === 'renovation') {
                man_name = $('#NumData_owner').val().trim();
                if (!man_name) {
                    layer.open({
                        content: '请输入业主姓名',
                        skin: 'msg',
                        time: 2
                    });
                    return;
                }
            } else if (eventType === 'personal') {
                man_name = $('#NumData_personal').val().trim();
                man_birthday = $('#iYear_personal').val();
                if (!man_name) {
                    layer.open({
                        content: '请输入姓名',
                        skin: 'msg',
                        time: 2
                    });
                    return;
                }
            } else {
                man_name = $('#NumData_simple').val().trim();
                if (!man_name) {
                    layer.open({
                        content: '请输入姓名',
                        skin: 'msg',
                        time: 2
                    });
                    return;
                }
            }

            // 跳转到支付页面
            var time_range = $('#queryMonth').val();
            
            window.location.href = '/?ac=zejiri_pay&event=' + encodeURIComponent('<{$event}>') +
                '&man_name=' + encodeURIComponent(man_name) +
                '&woman_name=' + encodeURIComponent(woman_name) +
                '&man_birthday=' + encodeURIComponent(man_birthday) +
                '&woman_birthday=' + encodeURIComponent(woman_birthday) +
                '&time_range=' + encodeURIComponent(time_range);
        });

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
