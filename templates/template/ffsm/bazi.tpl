<!doctype html>
<html lang="zh-CN">
<head>
<title>八字神煞看翻身运</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Cache-Control" content="no-cache">
<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<link rel="stylesheet" href="bazi/css/header_rem.css">
<link href="bazi/css/layer.css" rel="stylesheet" type="text/css" />
<link href="bazi/css/font-awesome.min.css" rel="stylesheet">
<script src="bazi/js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="bazi/js/resizeevts.js"></script>
<link rel="stylesheet" href="bazi/css/pingjia.css">
<link href="bazi/css/calendar.css" rel="stylesheet" type="text/css">

<link href="bazi/css/pay_rem_new.css" rel="stylesheet" type="text/css">


<link href="bazi/css/index.css" rel="stylesheet" type="text/css">
</head>
<body>

<{include file='./ffsm/header.tpl'}>

<style>
    /* 让header占满整个屏幕宽度 */
    .common-header{max-width:none !important;}
    .common-header__home{left:0 !important;margin-left:0 !important;}
    .common-header__order{right:0 !important;margin-right:0 !important;}
</style>

  	<div id="order-pop-you" style="position: absolute;right: 0;top: 20%;z-index: 10000;">
    	<a href="/?ac=history" target="_self"><img style="width: 25px;height: auto; display: block;" src="bazi/picture/fubiao1.png" alt=""></a>
  	</div>

<section class="wrapper"> 
  
  <!--banner-->
  <div class="indexBann">
    <ul class="headline"></ul>
    <ul class="shensha">
      <li></li>
      <li></li>
      <li></li>
      <li></li>
      <li></li>
    </ul>
    <ul class="plate"></ul>
    <ul class="text">
      <li></li>
      <li></li>
      <li></li>
      <li></li>
      <li></li>
    </ul>
    <ul class="line">
      <li></li>
    </ul>
  </div>
  <!--banner-->
  
  <!--main开始-->
  <main class="main"> 
    <!---->
    <section class="bigbox">
      <form name="frmMeasure" id="frmMeasure" method="post" action="?ac=bazi" onsubmit="return CheckUserInput();">
        <div class="forminput"> 
          <div class="forminput_hang">
            <div class="forminput_hang_bt">您的姓名：</div>
            <div class="forminput_hang_name"><input type="text" name="username" id="username" placeholder="请输入你的姓名"></div>
          </div>
          <div class="forminput_hang">
            <div class="forminput_hang_bt">您的性别：</div>
            <div class="forminput_hang_sex">
              <a href="javascript:void(0);" class="current sex1 sex" data-type="1">男</a> 
              <a href="javascript:void(0);" class="sex0 sex" data-type="0">女</a>
            </div>
              <input type="hidden" name="iSex" id="iSex" value="1"/>
              <input type="hidden" name="gender" id="gender" value="1"/>
          </div>
          <div class="forminput_hang">
            <div class="forminput_hang_bt">出生日期：</div>
            <div class="forminput_hang_birth">
            <span id="birthday_my" hasHour="1" class="birth-box"  data-text="公历:1990年1月1日早子时">公历 1990年1月1日早子时</span>
            <input type="hidden" name="iYear" id="iYear" class="form-input" value="1990-1-1-00" jiavalue="1"/>
            </div>
          </div>
        </div>
        <input type="hidden" name="birthday_text" id="birthday_text" value="公历1990年1月1日早子时" />
        <input name="page_extra" id="page_extra" type="hidden" >
        <input name="package" id="package" type="hidden" value="1">
        <input name="serveid" type="hidden" value="6122522">
        <input type="hidden" name="posId" value="">
        <input type="hidden" name="dl" id="dl" value="<{$dl}>">
        <input type="hidden" name="h" class="auto input J-time" id="j_dd" value="">
        <input type="hidden" name="y" value="0">
        <input type="hidden" name="m" value="0">
        <input type="hidden" name="d" value="0">
        <input type="hidden" name="i" value="0">
        <input type="hidden" name="cY" value="">
        <input type="hidden" name="cM" value="">
        <input type="hidden" name="cD" value="">
        <input type="hidden" name="cH" value="">
        <input type="hidden" name="term1" value="">
        <input type="hidden" name="term2" value="">
        <input type="hidden" name="start_term" value="">
        <input type="hidden" name="end_term" value="">
        <input type="hidden" name="start_term1" value="">
        <input type="hidden" name="end_term1" value="">
        <input type="hidden" name="lDate" value="">
      </form>
      <div class="button zoom shang"><a href="javascript:void(0);" class="btnMeasure" onclick="document.getElementById('frmMeasure').submit();">立即查看</a></div>
      
       <section class="yinsibox">
   	        <div class="yinsiinfo"><a href="../../yinsi.html"><img src="bazi/picture/xinxi1.png" alt=""></a></div>
      <div class="yinsiagree">
                    <a href="javascript:void(0);" id="xieyi" data_xieyi='2'  >
              <i class="fa fa-circle-o" id="xieyi1"  style="display: none;" onclick="xieyiagree(1)" ></i>
              <i class="fa fa-check-circle-o" id="xieyi2" onclick="xieyiagree(2)"></i>
                    <span onclick="xieyiagree(parseInt($('#xieyi').attr('data_xieyi')))" style="color: #999">已阅读并同意</span>
      </a>
       <a href="../../yonghu.html" >《用户协议》</a>和<a href="../../yinsi.html" id="xieyi_content_btn">《隐私协议》</a>
      </div>
                   <div class="yinsiagree" id="history_content_btn"><a href="/?ac=history" target="_self" style="font-size:.26rem;"><b>查看历史订单></b></a></div>
           </section>
    <style>
    .yinsibox { width:100%; float:left;  margin:.2rem 0 0 0; }
    .yinsiinfo { width:100%; float:left; }
	.yinsiinfo img { width:80%; display:block; margin:0 auto; }
    .yinsiagree { width:100%; float:left; line-height:.4rem; font-size:.28rem; color:#999; text-align:center; }
	.yinsiagree a { color:#ef7171; }
    .yinsiagree a b { text-decoration:underline; font-weight:normal; color:#900; }
    </style>

     
    <script>
    //协议效果
  function xieyiagree(re){     
      $('#xieyi i').hide();  
    if (re=='1') {   
      $('#xieyi').attr('data_xieyi',(re+1));
      $('#xieyi'+(re+1)).show();   
    }else{
        $('#xieyi').attr('data_xieyi',(re-1));    
        $('#xieyi'+(re-1)).show();
    }

  }
    /**
     * 验证协议
     * */
    function verifyXieyi(elementId)
    {
        var elementValue = $('#' + elementId).attr('data_xieyi');

        if(elementValue == 1){

            layer.open({
                content: '请阅读并同意用户协议和隐私协议！',
                skin: 'msg',
                time: 2
            });
            return false;
        }else{
            return true;
        }

    }
</script>


    </section>
    <!---->
    <div class="picture"><img src="bazi/picture/img01.png" alt=""></div>
    <div class="picture"><img src="bazi/picture/img02.png" alt=""></div>
    <div class="picture"><img src="bazi/picture/img03.png" alt=""></div>
    <div class="picture"><img src="bazi/picture/img04.png" alt=""></div>

    <!----> 
    <script type="text/javascript" src="bazi/js/clipboard.min.js"></script>
    <a name="save" id="save"></a>

<!--产品尾部-->
<link href="bazi/css/footer.css" rel="stylesheet" type="text/css">
<{assign var="footerIcon" value="bazi/picture/footicon.png"}>
<{include file="ffsm/footer_contact.tpl"}>
<!--产品尾部-->

<script type="text/javascript">
    //判断微信环境
    function isWeiXin(){
        var ua = window.navigator.userAgent.toLowerCase();
        if(ua.match(/MicroMessenger/i) == 'micromessenger'){
            return true;
        }else{
            return false;
        }
    }
    
    var copy_wx = new Clipboard('.copy_wx');
    var is_weixin = isWeiXin();
    copy_wx.on('success', function(e) {
        e.clearSelection();
        layer.open({
            content: '微信号复制成功！跳转到微信添加客服！',
            btn: ['确定', '取消'],
            yes: function(index) {
                if(!is_weixin){
                    var ua = navigator.userAgent.toLowerCase();
                    if (ua.indexOf('applewebkit') > -1 && ua.indexOf('mobile') > -1 && ua.indexOf('safari') > -1 && ua.indexOf('linux') == -1 && ua.indexOf('android') == -1) {
                        window.location = 'weixin://';
                    }else {
                        layer.open({content: '复制成功,打开微信搜索客服',skin: 'msg',time: 2 });
                    }
                }else{
                    layer.open({content: '复制成功,打开微信搜索客服',skin: 'msg',time: 2 });
                }
            }
        });
    });
    copy_wx.on('error', function (e) {
        layer.open({
            content: '请手动复制后打开微信搜索客服',
            skin: 'msg',
            time: 2
        });
        window.location = 'weixin://';
    });
</script>

<!--产品尾部-->

<script src="bazi/js/layer.js" merge="true"></script>
<script type="text/javascript" src="bazi/js/layermenu.js"></script>
<script type="text/javascript" src="bazi/js/mainpublicv1.1.8.js"></script>
<script type="text/javascript" src="bazi/js/history_v1.js"></script>




  </main>
  <!--main结束--> 
  
  <!--浮动按钮-->
  <div class="floatbtn" style="display:none;">
    <div class="button"><a href="javascript:void(0);" class="btnMeasure">立即查看</a></div>
  </div>
  <!--浮动按钮--> 
  
</section>

<script>
//banner图动画
let num = 0,
	index = 0,
	plate1 = $('.shensha'),
	plate2 = $('.plate'),
	shensha = $('.shensha li'),
	line = $('.line'),
	text = $('.text li');
const rotateani = function() {
	shensha.hide();
	text.hide();
	plate1.css('transform', 'rotate(' + num + 'deg)');
	plate2.css('transform', 'rotate(' + -num + 'deg)');
	if (num == 360 || num == 432 || num == 468 || num == 576 || num == 648) {
		clearInterval(timer);
		setTimeout(() => {
			shensha.eq(index-1).fadeIn();
		}, 200);
		setTimeout(() => {
			line.addClass('height');
		}, 500);
		setTimeout(() => {
			text.eq(index-1).fadeIn();
		}, 1500);
		setTimeout(() => {
			shensha.eq(index-1).fadeOut();
			line.removeClass('height');
			text.eq(index-1).fadeOut();
		}, 3000);
		index++;
		setTimeout(() => {
			strrotateani();
		}, 4000)
	}
	if (num == 648) num = 0;
	if (index == 5) index = 0;
	num++
}
const strrotateani = () => {
	timer = setInterval(rotateani, 4)
}
strrotateani();
</script>
<script>
    $('.yinsiinfo').hide();
    //初始化姓名
    // initName('NumData', '');
    //lc的初始化性别
    lc_initSex('iSex','');
    //初始化生日
    lc_initBirthDate('birthday_my', 'iYear','');
    //验证表单
    function CheckUserInput(){
        //验证姓名    (标签id   类型    序号)
//      var isNumData = verifyElementData('NumData', 'NumData','');
        //验证生日    (标签id   类型    序号)
        var isBirthDay = verifyElementData('iYear', 'iBirthday','');

        //保存性别啊  (标签id  序号)
        saveSexFunction('iSex','');
        //提交表单
        if(isBirthDay){
            // 解析iYear并填充到y、m、d、h字段
            var iYearValue = $('#iYear').val(); // 格式: 1990-1-1-00
            if(iYearValue){
                var parts = iYearValue.split('-');
                if(parts.length >= 4){
                    $('input[name="y"]').val(parts[0]);
                    $('input[name="m"]').val(parts[1]);
                    $('input[name="d"]').val(parts[2]);
                    $('input[name="h"]').val(parts[3]);
                    $('input[name="i"]').val(parts[3]);
                }
            }
            // 更新birthday_text
            $('#birthday_text').val($('#birthday_my').attr('data-text'));
            //协议
            var xieyi = $('#xieyi').attr('data_xieyi');
            if (xieyi==1) {
                layer.open({
                    content: '请阅读并勾选同意用户协议和隐私协议！',
                    skin: 'msg',
                    time: 2
                });
                var target_top = $(".main").offset().top;
                $("html,body").animate({scrollTop: target_top}, 1000);   //带滑动效果的跳转
                return false;
            }else{
                return true;
            }

        }else{
            var target_top = $(".main").offset().top;
            $("html,body").animate({scrollTop: target_top}, 1000);   //带滑动效果的跳转
            return false;
        }
    }

    function keypress(e){
        var e = e||event;
        var currKey = e.keyCode||e.which||e.charCode;
        switch (currKey){
            case 13:
                CheckUserInput();
                break;
        }
    }
    document.onkeypress = keypress;

    $(function(){
        var calendar1 = new lCalendar().init('#birthday_my','');
        
        // 更新y、m、d、h字段的函数
        function updateDateFields(){
            var iYearValue = $('#iYear').val();
            if(iYearValue){
                var parts = iYearValue.split('-');
                if(parts.length >= 4){
                    $('input[name="y"]').val(parts[0]);
                    $('input[name="m"]').val(parts[1]);
                    $('input[name="d"]').val(parts[2]);
                    $('input[name="h"]').val(parts[3]);
                    $('input[name="i"]').val(parts[3]);
                }
            }
        }
        
        // 初始化
        updateDateFields();
        
        // 监听多种事件
        $('#iYear').on('change input propertychange', function(){
            updateDateFields();
        });
        
        // 监听birthday_my点击（用户选择日期时）
        $('#birthday_my').on('click', function(){
            setTimeout(updateDateFields, 500);
        });
        
        // 使用定时器定期检查（作为备用方案）
        var lastValue = $('#iYear').val();
        setInterval(function(){
            var currentValue = $('#iYear').val();
            if(currentValue !== lastValue){
                lastValue = currentValue;
                updateDateFields();
            }
        }, 500);
    });

    //性别选择
    $('.sex').click(function() {
      var type = $(this).attr('data-type');
      var sex = $('#iSex').val();
      if(type != sex) {
        $('.sex').removeClass('current');
        $('.sex' + type).addClass('current');
        $('#iSex').val(type);
        $('#gender').val(type);
      }
    })

 

    function getPageHeight() {
        var body = document.body;
        var html = document.documentElement;
        return Math.max(body.scrollHeight, body.offsetHeight,
            html.clientHeight, html.scrollHeight, html.offsetHeight);
    }

    window.onscroll = function() {
        var heights = getPageHeight();
        var t = document.documentElement.scrollTop || document.body.scrollTop;
        var h = $('.shang').offset().top;
        // var f = $('.xia').offset().top;
        var windowH = $(window).height();
        if (parseInt(t) > parseInt((parseInt(h) + 50)) && parseInt(t) < parseInt(parseInt(heights) - parseInt(windowH) - 50)) {
            $('.floatbtn').show();
        } else{
            $('.floatbtn').hide();
        }
    }
</script>
<{$page_meta}>
</body>
</html>