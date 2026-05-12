<?php /* Smarty version 2.6.25, created on 2025-12-05 22:03:54
         compiled from ffsm/shengxiao/shengxiao.tpl */ ?>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<title>2026生肖运势-<?php echo $this->_tpl_vars['zhanming']; ?>
</title>
<meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no,viewport-fit=cover" />
<meta content="yes" name="apple-mobile-web-app-capable" />
<meta content="yes" name="mobile-web-app-capable" >
<meta content="black" name="apple-mobile-web-app-status-bar-style" />
<meta content="telephone=no" name="format-detection" />
<link rel="shortcut icon" href="/statics/ffsm/favicon.ico"/>
<meta name="applicable-device" content="pc,mobile">
<meta http-equiv="x-dns-prefetch-control" content="on" />
<meta name="renderer" content="webkit" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Cache-Control" content="no-transform" />
<link href="shengxiao/css/base.min.css" rel="stylesheet" type="text/css" />
<script src="/statics/ffsm/public/wap/js/libs/jquery-3.4.1.min.js"></script>
<script src="/statics/ffsm/public/wap/js/libs/require-2.3.6.min.js"></script>
<script src="/statics/ffsm/public/wap/js/common.min.js?v=aad090e"></script>
<script src="/statics/suanming.js"></script>
<link href="shengxiao/css/style.min.css" rel="stylesheet" type="text/css"/>
<?php echo $this->_tpl_vars['page_meta']; ?>

</head>
<body>
    
<header class="common-header" id="commonHeader">
    <h1 class="common-header__con"></h1>
    <a class="common-header__home" href="/" >首页</a>
    <a class="common-header__order" href="/?ac=history">订单查询</a>
</header>

<div class="index-banner" id="indexBanner">
    <img src="shengxiao/picture/0_banner.jpg" />
    <div class="index-banner__pan">
        <img src="shengxiao/picture/0_banner_pan.png" />
        <div class="zhen J_zhen"></div>
        <div class="ts shu J_ts J_tsshu"></div>
        <div class="ts niu J_ts J_tsniu"></div>
        <div class="ts tu J_ts J_tstu"></div>
        <div class="ts ma J_ts J_tsma"></div>
    </div>
    <div class=index-banner__bottom>
        <img class="img1" src="shengxiao/picture/0_banner_b1.png" />
        <img class="img2" src="shengxiao/picture/0_banner_b2.png" />
        <img class="img3" src="shengxiao/picture/0_banner_b3.png" />
        <img class="img4" src="shengxiao/picture/0_banner_b4.png" />
        <img class="img5" src="shengxiao/picture/0_banner_b5.png" />
    </div>
</div>

<form class="J_ajaxForm J_testFixedTop" action="/?ac=shengxiao" method="post" name="login" id="submit1">
    <div class="index-form">
        <img class="index-form__bgt" src="shengxiao/picture/0_form_t.jpg" alt="" />
        <ul class="index-form__ul">
            <li class="form-item">
                <div class="label">你的姓名</div>
                <div class="content">
                    <input type="text" name="username" placeholder="请输入姓名（汉字）" value="" />
                </div>
            </li>
            <li class="form-item">
                <div class="label">你的性别</div>
                <div class="content content-sex J_sex">
                    <span data-value="1" class="cur">男</span>
                    <span data-value="0">女</span>
                    <input type="hidden" name="gender" value="1"/>
                </div>
            </li>
            <li class="form-item">
                <div class="label">你的生辰</div>
                <div class="content content-date">
                    <input type="text" id="birthday" name="datetext" nolocal="true" data-toid-date="b_input" data-toid-hour="b_hour" class="J_datepicker" readonly data-type="1" value="" placeholder="请选择出生日期（必填）" />
                    <input type="hidden" name="birthday" id="b_input">
                    <input type="hidden" name="hour" id="b_hour">
                </div>
            </li>

        </ul>
        <input type="hidden" name="dl" id='dl' value="<?php echo $this->_tpl_vars['dl']; ?>
">
        <input type="hidden" name="h" class="auto input J-time" id='j_dd' value="">
        <input type="hidden" name=y value="0">
        <input type="hidden" name=m value="0">
        <input type="hidden" name=d value="0">
        <input type="hidden" name=i value="0">
        <input type="hidden" name=cY value="">
        <input type="hidden" name=cM value="">
        <input type="hidden" name=cD value="">
        <input type="hidden" name=cH value="">
        <input type="hidden" name=term1 value="">
        <input type="hidden" name=term2 value="">
        <input type="hidden" name=start_term value="">
        <input type="hidden" name=end_term value="">
        <input type="hidden" name=start_term1 value="">
        <input type="hidden" name=end_term1 value="">
        <input type="hidden" name=lDate value="">
        <div class="index-form__btn">
            <a href="javascript:;" class="J_ajax_submit_btnsub">立即测算</a>
        </div>
        <div class="index-form__agreement J_testFixedShow">
            <div class="check active J_formCheckbox">
                <input type="checkbox" checked="active" name="privacy_protocol">
            </div>
            <span>已阅读并同意</span>
            <span>《<a href="javascript:;" class="J_protocolShowBtn">服务声明及隐私条款</a>》</span>
        </div>
        <div class="index-form__visitor">已为<b>514421人</b>生成报告</div>
        <img class="index-form__bgb" src="shengxiao/picture/m_box_b.jpg" alt="" />
    </div>
</form>

<div class="index-pic J_testFixedShow">
    <img src="shengxiao/picture/0_img1.jpg" alt="" />
    <img src="shengxiao/picture/0_img2.jpg" alt="" />
    <img src="shengxiao/picture/0_img3.jpg" alt="" />
    <img src="shengxiao/picture/0_img4.jpg" alt="" />
    <img src="shengxiao/picture/0_img5.jpg" alt="" />
    <img src="shengxiao/picture/0_img6.jpg" alt="" />
    <img src="shengxiao/picture/0_img7.jpg" alt="" />
    <img src="shengxiao/picture/0_img8.jpg" alt="" />
    <img src="shengxiao/picture/0_img9.jpg" alt="" />
    <img src="shengxiao/picture/0_img10.jpg" alt="" />
    <img src="shengxiao/picture/0_img11.jpg" alt="" />
</div>

<div class="protocol-popbox" id="protocolPopbox">
    <div class="protocol-popbox__content">
        <ul class="protocol-popbox__title J_tabTitle">
            <li class="active">隐私协议</li>
            <li>服务协议</li>
        </ul>
        <ul class="protocol-popbox__text J_tabText">
            <li class="active">
                <h3>隐私协议</h3>
                <p>欢迎使用本测算服务。我们非常重视您的个人信息保护，特制定本隐私协议：</p>
                <h4>一、信息收集</h4>
                <p>1. 我们仅收集您主动提供的测算信息（姓名、性别、出生日期等），用于为您提供准确的测算服务。</p>
                <p>2. 我们不会收集您的敏感个人信息。</p>
                <h4>二、信息使用</h4>
                <p>1. 您的个人信息仅用于本次测算服务。</p>
                <p>2. 我们不会将您的信息用于其他商业用途。</p>
                <h4>三、信息保护</h4>
                <p>1. 我们采用加密技术保护您的信息安全。</p>
                <p>2. 未经您同意，我们不会向第三方披露您的个人信息。</p>
                <h4>四、信息存储</h4>
                <p>1. 您的测算信息将在本地存储，便于您查看结果。</p>
                <p>2. 您可随时清除浏览器缓存删除相关信息。</p>
                <h4>五、用户权利</h4>
                <p>1. 您有权查询、更正、删除您的个人信息。</p>
                <p>2. 如有疑问，请联系客服。</p>
            </li>
            <li>
                <h3>服务协议</h3>
                <p>欢迎使用本测算服务。在使用前，请仔细阅读以下服务条款：</p>
                <h4>一、服务内容</h4>
                <p>1. 本平台提供基于传统命理学的测算服务。</p>
                <p>2. 测算结果仅供参考，不构成任何决策依据。</p>
                <h4>二、用户义务</h4>
                <p>1. 您应确保提供的信息真实准确。</p>
                <p>2. 您应合理看待测算结果，不可过分依赖。</p>
                <p>3. 禁止将测算结果用于非法用途。</p>
                <h4>三、服务声明</h4>
                <p>1. 测算结果基于传统命理理论，具有一定主观性。</p>
                <p>2. 我们不保证测算结果的绝对准确性。</p>
                <p>3. 测算服务不能替代专业咨询（医疗、法律等）。</p>
                <h4>四、知识产权</h4>
                <p>1. 本平台所有内容（文字、图片、设计等）均受知识产权保护。</p>
                <p>2. 未经授权，不得复制、传播平台内容。</p>
                <h4>五、免责声明</h4>
                <p>1. 因用户提供错误信息导致的测算偏差，平台不承担责任。</p>
                <p>2. 用户因依赖测算结果做出的决策，平台不承担法律责任。</p>
                <h4>六、服务变更</h4>
                <p>1. 我们保留随时修改、中止或终止服务的权利。</p>
                <p>2. 重大变更将通过平台公告通知用户。</p>
            </li>
        </ul>
        <div class="protocol-popbox__close J_close"><b>关闭</b></div>
    </div>
</div>

<div class="common-testfixed" id="testFixedBtn">
    <span>立即测算</span>
</div>

<footer class="footer-base">
    <a href="/" ><span><?php echo $this->_tpl_vars['zhanming']; ?>
</span></a>
    <div><span>客服微信：<?php echo $this->_tpl_vars['lianxifs']; ?>
</span></div>
</footer>

<script>
// 性别选择功能（common.min.js已经处理了日期选择器）
$(document).on('click', '.J_sex span', function() {
    var $this = $(this);
    var value = $this.data('value');
    
    // 移除其他选中状态
    $this.siblings().removeClass('cur');
    // 添加当前选中状态
    $this.addClass('cur');
    // 设置隐藏字段值
    $this.siblings('input[name="gender"]').val(value);
});

// 协议勾选
$(document).on('click', '.J_formCheckbox', function() {
    var $checkbox = $(this).find('input[type="checkbox"]');
    var $parent = $(this);
    
    if ($checkbox.is(':checked')) {
        $checkbox.prop('checked', false);
        $parent.removeClass('active');
    } else {
        $checkbox.prop('checked', true);
        $parent.addClass('active');
    }
});

// 协议弹窗
$(document).on('click', '.J_protocolShowBtn', function(e) {
    e.preventDefault();
    $('#protocolPopbox').show();
});

$(document).on('click', '.protocol-popbox__close, .J_close', function() {
    $('#protocolPopbox').hide();
});

// 协议Tab切换
$(document).on('click', '.J_tabTitle li', function() {
    var index = $(this).index();
    
    // 切换标题active状态
    $(this).addClass('active').siblings().removeClass('active');
    
    // 切换内容active状态
    $('.J_tabText li').eq(index).addClass('active').siblings().removeClass('active');
});

// 固定测算按钮
$(document).on('click', '#testFixedBtn', function() {
    $('html, body').animate({
        scrollTop: 0
    }, 300);
});

// 直接使用bazijb.tpl的逻辑
$('.J_ajax_submit_btnsub').click(function(){
    if ("undefined" == typeof layer) {
        alert("正在准备中，请稍等...");
        $('.lunpan_box').css('display','none');
        document.login.username.focus();
        return false;
    }
    $('.lunpan_box').css('display','block');
    
    setTimeout(function(){
        // 从日期选择器获取真实数据
        var dataDate = $('#birthday').attr('data-date');
        var dataHour = $('#birthday').attr('data-hour');
        var dateText = $('#birthday').val();
        
        // 如果用户没有选择日期，提示用户
        if (!dataDate || !dataHour) {
            $('.lunpan_box').css('display','none');
            layer.msg("请选择出生日期和时辰！");
            return false;
        }
        
        // 解析阳历日期
        var dateParts = dataDate.split('-');
        var year = dateParts[0];
        var month = dateParts[1];
        var day = dateParts[2];
        var hour = dataHour;
        
        // 获取农历信息
        var lDate = $('input[name="lDate"]').val();
        var cY = $('input[name="cY"]').val();
        var cM = $('input[name="cM"]').val();
        var cD = $('input[name="cD"]').val();
        var cH = $('input[name="cH"]').val();
        
        // 判断是否为农历：如果lDate有值，说明是农历
        var isLunar = !!(lDate && lDate.length > 0);
        
        console.log('日期类型检查:', {
            isLunar: isLunar,
            datetext: dateText,
            lDate: lDate,
            cY: cY
        });
        
        // 将数据存储到localStorage，供订单页使用
        var formData = {
            username: $('input[name="username"]').val(),
            gender: $('input[name="gender"]').val(),
            year: year,
            month: month,
            day: day,
            hour: hour,
            datetext: dateText,
            lDate: lDate,
            cY: cY,
            cM: cM,
            cD: cD,
            cH: cH,
            isLunar: isLunar
        };
        localStorage.setItem('shengxiao_form_data', JSON.stringify(formData));
        
        checkForm();
    },1000);
});
</script>

</body>
</html>