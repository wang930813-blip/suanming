<?php /* Smarty version 2.6.25, created on 2025-12-05 21:53:32
         compiled from ffsm/taluo/wenda_order_xuanpai.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'default', 'ffsm/taluo/wenda_order_xuanpai.tpl', 207, false),)), $this); ?>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>塔罗问答-<?php echo $this->_tpl_vars['zhanming']; ?>
</title>
    <meta http-equiv="Cache-Control" content="no-cache">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => './ffsm/wx_share.tpl', 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
    <link href="taluo/index.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="taluo/header_rem.css">
    <link href="taluo/layer.css" rel="stylesheet" type="text/css">
    <link href="taluo/font-awesome.min.css" rel="stylesheet">
    <script src="taluo/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="taluo/js/resizeevts.js"></script>
    <link rel="stylesheet" href="taluo/pingjia.css">
    <link href="taluo/calendar.css" rel="stylesheet" type="text/css">
    <link href="taluo/pay_rem_new.css" rel="stylesheet" type="text/css">
    
    <style type="text/css">
        /* 扇形洗牌动画 */
        .stepBox .tarot {
            cursor: pointer;
            opacity: 0;
            animation: cardSpread 0.6s ease-out forwards;
        }
        
        @keyframes cardSpread {
            0% {
                opacity: 0;
                transform: translate(0%, -50%) rotate(0deg) scale(0.3);
            }
            100% {
                opacity: 1;
                transform: translate(0%, -50%) rotate(var(--rotate-angle)) scale(1);
            }
        }
        
        /* 每张牌的角度和延迟（扇形更宽）*/
        .stepBox .tarot.paipai1 { --rotate-angle: 35deg; animation-delay: 0s; }
        .stepBox .tarot.paipai2 { --rotate-angle: 31.5deg; animation-delay: 0.03s; }
        .stepBox .tarot.paipai3 { --rotate-angle: 28deg; animation-delay: 0.06s; }
        .stepBox .tarot.paipai4 { --rotate-angle: 24.5deg; animation-delay: 0.09s; }
        .stepBox .tarot.paipai5 { --rotate-angle: 21deg; animation-delay: 0.12s; }
        .stepBox .tarot.paipai6 { --rotate-angle: 17.5deg; animation-delay: 0.15s; }
        .stepBox .tarot.paipai7 { --rotate-angle: 14deg; animation-delay: 0.18s; }
        .stepBox .tarot.paipai8 { --rotate-angle: 10.5deg; animation-delay: 0.21s; }
        .stepBox .tarot.paipai9 { --rotate-angle: 7deg; animation-delay: 0.24s; }
        .stepBox .tarot.paipai10 { --rotate-angle: 3.5deg; animation-delay: 0.27s; }
        .stepBox .tarot.paipai11 { --rotate-angle: 0deg; animation-delay: 0.3s; }
        .stepBox .tarot.paipai12 { --rotate-angle: -3.5deg; animation-delay: 0.33s; }
        .stepBox .tarot.paipai13 { --rotate-angle: -7deg; animation-delay: 0.36s; }
        .stepBox .tarot.paipai14 { --rotate-angle: -10.5deg; animation-delay: 0.39s; }
        .stepBox .tarot.paipai15 { --rotate-angle: -14deg; animation-delay: 0.42s; }
        .stepBox .tarot.paipai16 { --rotate-angle: -17.5deg; animation-delay: 0.45s; }
        .stepBox .tarot.paipai17 { --rotate-angle: -21deg; animation-delay: 0.48s; }
        .stepBox .tarot.paipai18 { --rotate-angle: -24.5deg; animation-delay: 0.51s; }
        .stepBox .tarot.paipai19 { --rotate-angle: -28deg; animation-delay: 0.54s; }
        .stepBox .tarot.paipai20 { --rotate-angle: -31.5deg; animation-delay: 0.57s; }
        .stepBox .tarot.paipai21 { --rotate-angle: -35deg; animation-delay: 0.6s; }
        
        /* 选中状态 */
        .stepBox .tarot.cur,
        .stepBox .tarot.current {
            animation: none;
        }
        
        .history_btn {
            font-size:16px;
            line-height:16px;
            position: fixed;
            box-sizing: border-box;
            text-align: right;
            z-index: 1000;
            right: 15px;
            width: 112px;
            bottom: 70px;
            height: 40px;
            border-radius: 20px;
            -webkit-backdrop-filter: blur(5px);
            backdrop-filter: blur(5px);
            background-color: rgba(0, 0, 0, 0.6);
            box-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.1);
            color: #FFF;
            text-decoration: none;
            padding: 12px;
            padding-right: 15px;
        }
        .history_btn::before {
            content: "";
            position: absolute;
            z-index: 1000;
            left: 15px;
            top: 12px;
            width: 12px;
            height: 15px;
            background: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACQAAAAtCAYAAADGD8lQAAAB+UlEQVR4Ae2WNYwdMRCGw9hLYa7SpU0v2Q4zM3bBOoxNeL0bpi7UB/s+nF6hY+a7uRn5nvXegjS790g6W5rFf//5nunNqCwNArUEPPEePNmMZygMfKblO9KMGm6DByvnQyC3gK9Oo+lZE+ok6FWLCmC06LEAiSG786EgWDETfY9ZX8xBuShnFOTeyimYOEg017Id7qrFpDU9I4AZ742/mI7XdYk6yv1851QLhAk/MszPGa1oSgHUOOR/mNGjnwBgNIn388zVPtND8hcbCLUGaJlk6X1xgDMEbaDFfXi5cawxl2fZQKi1o+CJq4zefU/CupDJG5M8vsG9Q+NR84oB84q0iT6Yg3KFvqsbFfurGA308qWoPU76UByndzyPaG/zgYrfHJADqjwQ3Fs5x64sXhwHb9nc4gNZGLux8YO+QajiA2lx1GrSQx0tPlAg12YG8tWa4gMBjMb3N2xRxglTrF13y94B5RlcTz2HaN4BjC46EK2UzKsMV+gI2Idwt82yU2M00i5fdCALlfa/DGHcsnflhys/XPnhlr0DckAVBdKyL7RUL5cNCHOFOqOPgL6GHv4BX14g+pKGyfE3tKN/QSDxyD6odGj5MFcJtlYBTIst5sCXG/FhW+VgsEO02hCa8asW4YtnSPoTzwNlgBgAyuXJp3BPLcxxDAIW7eqU/T4wfwAAAABJRU5ErkJggg==) no-repeat;
            background-size: cover;
        }
    </style>
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
        <a href="/?ac=history" target="_self"><img style="width: 25px;height: auto; display: block;" src="taluo/fubiao1.png" alt=""></a>
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

    <!-- 选牌主体 -->
    <section class="midWrap">
        <div class="main">
            <section class="stepBox">
                <div class="tarot paipai1 tarotClick"><img src="taluo/tarot.png" alt=""></div>
                <div class="tarot paipai2 tarotClick"><img src="taluo/tarot.png" alt=""></div>
                <div class="tarot paipai3 tarotClick"><img src="taluo/tarot.png" alt=""></div>
                <div class="tarot paipai4 tarotClick"><img src="taluo/tarot.png" alt=""></div>
                <div class="tarot paipai5 tarotClick"><img src="taluo/tarot.png" alt=""></div>
                <div class="tarot paipai6 tarotClick"><img src="taluo/tarot.png" alt=""></div>
                <div class="tarot paipai7 tarotClick"><img src="taluo/tarot.png" alt=""></div>
                <div class="tarot paipai8 tarotClick"><img src="taluo/tarot.png" alt=""></div>
                <div class="tarot paipai9 tarotClick"><img src="taluo/tarot.png" alt=""></div>
                <div class="tarot paipai10 tarotClick"><img src="taluo/tarot.png" alt=""></div>
                <div class="tarot paipai11 tarotClick"><img src="taluo/tarot.png" alt=""></div>
                <div class="tarot paipai12 tarotClick"><img src="taluo/tarot.png" alt=""></div>
                <div class="tarot paipai13 tarotClick"><img src="taluo/tarot.png" alt=""></div>
                <div class="tarot paipai14 tarotClick"><img src="taluo/tarot.png" alt=""></div>
                <div class="tarot paipai15 tarotClick"><img src="taluo/tarot.png" alt=""></div>
                <div class="tarot paipai16 tarotClick"><img src="taluo/tarot.png" alt=""></div>
                <div class="tarot paipai17 tarotClick"><img src="taluo/tarot.png" alt=""></div>
                <div class="tarot paipai18 tarotClick"><img src="taluo/tarot.png" alt=""></div>
                <div class="tarot paipai19 tarotClick"><img src="taluo/tarot.png" alt=""></div>
                <div class="tarot paipai20 tarotClick"><img src="taluo/tarot.png" alt=""></div>
                <div class="tarot paipai21 tarotClick"><img src="taluo/tarot.png" alt=""></div>
            </section>
            
            <div class="midTip" style="">依据你的直觉，请选出<span>2张</span>最有感觉的牌</div>
            
            <div class="middleCards">
                <dl>
                    <dt><span class="default"><img src="taluo/tarot.png" alt="" class="niwei"></span></dt>
                    <dd>是非牌</dd>
                </dl>
                <dl>
                    <dt><span class="default"><img src="taluo/08.png" class="niwei" alt=""></span></dt>
                    <dd>能量牌</dd>
                </dl>
            </div>

            <div class="midTxt" style="display: none;">塔罗师已接收到你所选卡牌的信息和能量<br>点击下方按钮开始解牌吧！</div>
        </div>

        <ul class="midMenu" style="display: none;">
            <li>可获得塔罗老师语音解答 <img src="taluo/icon3.png" alt=""><br><em>专业直观 | 是否立判</em></li>
            <li>咨询塔罗师</li>
        </ul>

        <form name="frmMeasure" id="frmMeasure" method="post">
            <input type="hidden" name="question" id="question" value="<?php echo ((is_array($_tmp=@$this->_tpl_vars['data']['question'])) ? $this->_run_mod_handler('default', true, $_tmp, '') : smarty_modifier_default($_tmp, '')); ?>
">
            <input type="hidden" id="Direction" name="Direction" value="1">
            <input type="hidden" id="Number" name="Number" value="14">
        </form>
        <a href="javascript:void(0);" class="btnMeasure"></a>
    </section>

    <a name="save" id="save"></a>
    
    <script type="text/javascript" src="taluo/middle.js"></script>
    <script type="text/javascript" src="taluo/clipboard.min.js"></script>
    <script src="taluo/layer.js" merge="true"></script>
    <script type="text/javascript" src="taluo/layermenu.js"></script>
    <script type="text/javascript" src="taluo//js/mainpublicv1.1.8.js"></script>
    <script type="text/javascript" src="taluo/history_v1.js"></script>

    <script>
        // 选牌逻辑
        let selectedCards = [];
        let maxCards = 2;
        
        // 等待扇形动画完成后再绑定点击事件
        setTimeout(function() {
            $('.tarotClick').off('click').on('click', function() {
                let cardIndex = $(this).index();
            
            if ($(this).hasClass('cur') || $(this).hasClass('current')) {
                // 取消选中
                $(this).removeClass('cur current');
                let idx = selectedCards.indexOf(cardIndex);
                if (idx > -1) {
                    selectedCards.splice(idx, 1);
                    // 恢复默认图片
                    $('.middleCards dl').eq(idx).find('img').attr('src', idx === 0 ? 'taluo/tarot.png' : 'taluo/08.png');
                    $('.middleCards dl').eq(idx).find('dt span').removeClass('moves move').addClass('default');
                    $('.middleCards dl').eq(idx).find('dd').css('opacity', '0.5');
                }
                // 隐藏按钮
                if (selectedCards.length < maxCards) {
                    $('.midTxt').fadeOut();
                    $('.midMenu').fadeOut();
                }
            } else {
                // 选中
                if (selectedCards.length < maxCards) {
                    let position = selectedCards.length; // 0 = 第一张, 1 = 第二张
                    
                    if (position === 0) {
                        $(this).addClass('cur');
                        $('.middleCards dl').eq(0).find('dt span').removeClass('default').addClass('moves');
                        $('.middleCards dl').eq(0).find('dd').css('opacity', '1');
                        // 更新第一张牌的图片
                        $('.middleCards dl').eq(0).find('img').attr('src', 'taluo/picture/card' + cardIndex + '.png');
                    } else {
                        $(this).addClass('current');
                        $('.middleCards dl').eq(1).find('dt span').removeClass('default').addClass('move');
                        $('.middleCards dl').eq(1).find('dd').css('opacity', '1');
                        // 更新第二张牌的图片
                        $('.middleCards dl').eq(1).find('img').attr('src', 'taluo/picture/card' + cardIndex + '.png');
                    }
                    selectedCards.push(cardIndex);
                    
                    // 如果选满2张，显示提示和按钮
                    if (selectedCards.length === maxCards) {
                        $('.midTxt').fadeIn();
                        $('.midMenu').fadeIn();
                    }
                } else {
                    layer.open({
                        content: '最多选择' + maxCards + '张牌！',
                        skin: 'msg',
                        time: 2
                    });
                }
            }
            });
            
            // 点击"咨询塔罗师"按钮
            $('.midMenu li:nth-child(2)').click(function() {
                $('.btnMeasure').click();
            });
        }, 1300); // 等待1.3秒，洗牌动画完成
        
        // 点击底部按钮提交
        $('.btnMeasure').click(function() {
            if (selectedCards.length < maxCards) {
                layer.open({
                    content: '请选择' + maxCards + '张塔罗牌！',
                    skin: 'msg',
                    time: 2
                });
                return false;
            }
            
            // 保存选中的牌到订单
            let oid = '<?php echo ((is_array($_tmp=@$this->_tpl_vars['data']['oid'])) ? $this->_run_mod_handler('default', true, $_tmp, "") : smarty_modifier_default($_tmp, "")); ?>
';
            if (!oid) {
                layer.open({
                    content: '订单信息错误！',
                    skin: 'msg',
                    time: 2
                });
                return false;
            }
            
            $.ajax({
                url: '/?ac=taluowenda_savecard',
                type: 'POST',
                data: {
                    oid: oid,
                    cards: selectedCards.join(',')
                },
                success: function(res) {
                    // 跳转到支付页
                    window.location.href = '/?ac=taluowenda&oid=' + oid + '&pay=1';
                },
                error: function() {
                    layer.open({
                        content: '保存失败，请重试！',
                        skin: 'msg',
                        time: 2
                    });
                }
            });
        });
        
        //验证表单
        function CheckUserInput() {
            return true;
        }
    </script>
</body>
</html>