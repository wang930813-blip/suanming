<?php /* Smarty version 2.6.25, created on 2025-12-05 21:08:42
         compiled from ffsm/taluo/wenda_form.tpl */ ?>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>塔罗问答-<?php echo $this->_tpl_vars['zhanming']; ?>
</title>
    <meta http-equiv="Cache-Control" content="no-cache" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0" />
    <?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => './ffsm/wx_share.tpl', 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
    <link href="taluo/css/index.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="taluo/css/header_rem.css">
    <link href="taluo/css/layer.css" rel="stylesheet" type="text/css" />
    <link href="taluo/css/font-awesome.min.css" rel="stylesheet">
    <script src="taluo/js/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="taluo/js/resizeevts.js"></script>
    <link rel="stylesheet" href="taluo/css/pingjia.css">
    <link href="taluo/css/calendar.css" rel="stylesheet" type="text/css">
    <link href="taluo/css/pay_rem_new.css" rel="stylesheet" type="text/css">
<?php echo $this->_tpl_vars['page_meta']; ?>

</head>

<body>
    <?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => './ffsm/header.tpl', 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
    <style>
    .common-header{max-width:none !important;}
    .common-header__home{left:0 !important;margin-left:0 !important;}
    .common-header__order{right:0 !important;margin-right:0 !important;}
    </style>
    
    <div id="order-pop-you" style="position: absolute;right: 0;top: 20%;z-index: 10000;">
        <a href="/?ac=history" target="_self"><img style="width: 25px;height: auto; display: block;" src="taluo/picture/fubiao1.png" alt=""></a>
    </div>
    
    <div class="floating_div" style="width: 100%;float: left;margin: 20px 0 0 0;display:none;"></div>
    
    <style>
        .qudaoHead {
            display: flex;
            justify-content: space-between;
            float: left;
            width: 100%;
            padding: 0 .2rem;
            margin: .3rem 0 0 0;
            line-height: .6rem;
        }
        .qudaoHead a {
            position:relative; 
            color: #b58e63;
        }
        .qudaoHead a img {
            display: inline-block;
            width: .58rem;
            vertical-align: middle;
            margin: -.05rem 0 0 0;
        }
        .qudaoHead a span {
            position: absolute;
            left: .3rem;
            top: 0;
            width: .3rem;
            background: #f00;
            border-radius: 50%;
            line-height: .3rem;
            font-size: .24rem;
            color: #fff;
            text-align: center;
        }
    </style>
    <script>
        var notPayOrder = window.localStorage["notPayOrder"];
        if (notPayOrder != '' && typeof(notPayOrder) != 'undefined') {
            $('.qudaoHead a span').show();
        }
    </script>

    <!-- 主要内容区域 -->
    <section class="stepWrap">
        <div class="main">
            <div class="bigbox stepone" style="display: none;">你是否陷入纠结、犹豫？或者为会不会，能不能，行不行，之类问题而烦恼？接下来我将通过<em class="col">Yes or No</em>牌阵为你快速做出最佳选择。</div>

            <div class="bigbox steptwo" style="display: none;">
                你可能想问我这些方面的：<br/>
                <ul class="stepTab">
                    <li class="cur" data-type="1">爱情</li>
                    <li data-type="2">事业</li>
                    <li data-type="3">财富</li>
                    <li data-type="5">学业</li>
                    <li data-type="4">健康</li>
                    <li data-type="6">其它</li>
                </ul>
                <div class="stepTip">
                    <span>这里或许有你想问的问题</span> <em><img src="taluo/picture/icon1.png" alt="">换一批</em>
                </div>
                <ul class="stepDoubt">
                    <li>我要和他在一起吗？</li>
                    <li>我要和他复合吗？</li>
                    <li>我要去他的城市发展吗？</li>
                    <li>我该离婚吗？</li>
                    <li>我要主动去找他吗？</li>
                    <li>我该答应他的要求吗？</li>
                </ul>
                <ul class="stepDoubt" style="display: none;">
                    <li>我要跳槽吗？</li>
                    <li>我要提出辞职吗？</li>
                    <li>我要和老板提升职加薪的事吗？</li>
                    <li>我是否可以去创业？</li>
                    <li>这个副业我要去做吗？？</li>
                    <li>我应该去这个公司吗？</li>
                </ul>
                <ul class="stepDoubt" style="display: none;">
                    <li>我可以做这个投资吗？</li>
                    <li>我该买这只股票吗？</li>
                    <li>我应该去贷款吗？</li>
                    <li>今天要去打牌吗？</li>
                    <li>我应该借钱给他吗？</li>
                    <li>生意不好，我该继续坚持吗</li>
                </ul>
                <ul class="stepDoubt" style="display: none;">
                    <li>我该选这个专业吗？</li>
                    <li>我该填报这个学校吗？</li>
                    <li>我应该继续深造吗？</li>
                    <li>我要出国留学吗？</li>
                    <li>我要参加这个培训班吗？</li>
                    <li>我会顺利结业吗？</li>
                </ul>
                <ul class="stepDoubt" style="display: none;">
                    <li>压力太大，我应该去释放一下吗？</li>
                    <li>TA的身体会好转吗？</li>
                    <li>我能扛过这次病痛？</li>
                    <li>这个治疗方案适合我？</li>
                    <li>我可以寻求到其它治疗方法？</li>
                    <li>我要坚持减肥吗？</li>
                </ul>
                <ul class="stepDoubt" style="display: none;">
                    <li>我是否该生二胎？</li>
                    <li>我今年该买房吗？</li>
                    <li>我该相信他的话吗？</li>
                    <li>我还要继续忍耐吗？</li>
                    <li>我和TA还会是朋友吗？</li>
                    <li>这个事情能有结果？</li>
                </ul>
            </div>

            <div class="stepHist"></div>
        </div>
        
        <div class="stepSelect" style="display: none;">
            <a href="javascript:void(0);" class="btnMeasure stepBtn"> <img src="taluo/picture/icon2.png" alt=""> 去抽牌</a>
            <a href="javascript:void(0);" class="stepReset">重新输入问题</a>
        </div>

        <div class="stepIpt" style="display: none;">
            <form name="frmMeasure" id="frmMeasure" method="post" action="">
                <input type="text" name="question" id="question" placeholder="请输入你的问题" value="">
                <input type="hidden" id="Direction" name="Direction" value="1">
            </form>
            <a href="javascript:void(0);">发送</a>
        </div>
    </section>

    <script type="text/javascript" src="taluo/js/middle.js"></script>
    <script type="text/javascript" src="taluo/js/verify.js"></script>
    <script type="text/javascript" src="taluo/js/clipboard.min.js"></script>
    <a name="save" id="save"></a>
    
    <script src="taluo/js/layer.js" merge="true"></script>
    <script type="text/javascript" src="taluo/js/layermenu.js"></script>
    <script type="text/javascript" src="taluo/js/mainpublicv1.1.8.js"></script>
    <script type="text/javascript" src="taluo/js/history_v1.js"></script>

    <script>
        $(".yetouPayBox").hide();
        window.onload = () => {
            $('.stepDoubt li:gt(2)').hide();
        }
        
        // "去抽牌"按钮点击事件
        $('.stepBtn').on('click', function() {
            var question = $('#question').val();
            if(!question || question == '') {
                layer.open({
                    content: '请输入你的问题！',
                    skin: 'msg',
                    time: 2
                });
                return false;
            }
            
            // 提交到后端生成订单
            $.ajax({
                url: '/?ac=userinfosubmit',
                type: "POST",
                data: {
                    'gid': 'wenda',
                    'username': '',
                    'usersex': 0,
                    'y': '',
                    'm': '',
                    'd': '',
                    'h': '',
                    'question': question,
                    'type': 38
                },
                success: function (data) {
                    if(data) {
                        // 跳转到选牌页
                        window.location.href = "/?ac=taluowenda&oid=" + data;
                    } else {
                        layer.open({
                            content: '提交失败，请重试！',
                            skin: 'msg',
                            time: 2
                        });
                    }
                },
                error: function() {
                    layer.open({
                        content: '网络错误，请重试！',
                        skin: 'msg',
                        time: 2
                    });
                }
            });
        });
        
        //验证表单
        function CheckUserInput() {
            var isContent = verifyContent('question');
            if(isContent){
                var xieyi = $('#xieyi').attr('data_xieyi');
                if (xieyi == 1) {
                    layer.open({
                        content: '请阅读并同意用户和隐私协议！',
                        skin: 'msg',
                        time: 2
                    });
                    return false
                } else {
                    $("#frmMeasure").submit();
                }
            } else {
                return false;
            }
        }

        // 分类切换
        $('.stepTab li').on('click', function() {
            let idx = $(this).index();
            $('.stepTab li').removeClass('cur');
            $(this).addClass('cur');
            $('.stepDoubt').hide();
            $('.stepDoubt:eq(' + idx + ')').show();
            $('.stepDoubt:eq(' + idx + ') li:gt(2)').hide();
        });
        
        // 点击问题列表，填入问题
        $('.stepDoubt li').on('click', function() {
            let question = $(this).text();
            $('#question').val(question);
        });
        
        // 换一批
        $('.stepTip em').on('click',function(){
            let idx = $('.stepTab .cur').index();
            let len = $('.stepDoubt:eq('+idx+') li').length;
            console.log(len);
            if(len > 3){
                if($('.stepDoubt:eq('+idx+') li:eq(3)').is(':visible')){
                    $('.stepDoubt:eq('+idx+') li:lt(3)').show();
                    $('.stepDoubt:eq('+idx+') li:gt(2)').hide();
                }else{
                    $('.stepDoubt:eq('+idx+') li:gt(2)').show();
                    $('.stepDoubt:eq('+idx+') li:lt(3)').hide();
                }
            }
        });
    </script>
</body>
</html>