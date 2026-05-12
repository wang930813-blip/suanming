<!DOCTYPE html>
<html>
<head>
<title>今日运势-<{$zhanming}></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Cache-Control" content="no-cache" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0" />
<link href="jrys/css/public.css" rel="stylesheet" type="text/css">
<link href="jrys/css/scjihe.css" rel="stylesheet" type="text/css">
<link href="jrys/css/calendar.css" rel="stylesheet" type="text/css">
<link href="jrys/css/layer.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="jrys/js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="jrys/js/resizeevts.js"></script>
<script type="text/javascript" src="jrys/js/mainpublicv1.1.8.js"></script>
<script type="text/javascript" src="jrys/js/layer.js"></script>
<{$page_meta}>
</head>
<body>

<section class="wrapper">
  <!--今日黄历-->
  <section class="bigbox">
    <div class="indexTitle"><b>今日黄历</b><img src="jrys/picture/icon05.png" alt=""/><a href="/?ac=zejiri" class="zejiri">择吉日 ></a></div>
    <dl class="yunshiAlmanac">
	  <dt>
          <b><{$huangli.lunar_date}></b>
          <br><span><{$huangli.solar_date}></span>
      </dt>
      <dd>
          <img src="jrys/picture/hlyi.png" alt=""/>
          <{$huangli.yi|default:'暂无数据'}>
          <p></p>
          <img src="jrys/picture/hlji.png" alt=""/>
          <{$huangli.ji|default:'暂无数据'}>
      </dd>
    </dl>
  </section>
  <!--今日黄历-->
  
  <!--2个产品-->
  <div class="indexLikeProd marg10">
    <a href="/?ac=bazi">
      <dl>
        <dt><b>八字批命</b><br><span>你命薄还是命厚？</span></dt>
        <dd><img src="jrys/picture/5ddb649d8922490aa121883bcd87df9b.png" alt=""/></dd>
      </dl>
    </a>
    <a href="/?ac=taluowenda">
      <dl>
        <dt><b>塔罗问答</b><br><span>每日一问.占卜解惑</span></dt>
        <dd><img src="jrys/picture/7e09dd8fb4f32203dfcf01cc9bcf9a90.png" alt=""/></dd>
      </dl>
    </a>
  </div>
  <!--2个产品-->
  
  <!--个人运势-->
  <section class="bigbox">
    <div class="indexTitle"><b>个人运势</b><img src="jrys/picture/icon06.png" alt=""/><a href="javascript:void(0);" class="txzliao">填写资料</a></div>
	<div class="yunshiTips">
        <img src="jrys/picture/icon08.png" alt=""/> 下午好<br>
        <span>※ 以下内容仅为运势示例，填写资料后方可获得你的专属个人运势。</span>
    </div>
	<div class="yunshiTab">
      <a href="javascript:void(0);" class="current">今日运</a>
      <a href="javascript:void(0);">本周运</a>
      <a href="javascript:void(0);">流月运</a>
      <a href="javascript:void(0);">2026年运</a>
      <a href="javascript:void(0);">十年大运</a>
    </div>
    
    <!--今日运-->
    <section class="yunshiBox">
	  <div class="todayDate"><{$huangli.solar_date}></div>
      <{if $today_fortune.ziwei}>
      <div class="todayInfo" style="color:#e74c3c;font-weight:bold;">
          今日你的流日在<{$today_fortune.ziwei.gong}>，流日主星为<{$today_fortune.ziwei.stars}>
      </div>
      <div class="todayText" style="margin-top:10px;"><span>运势解读：</span><{$today_fortune.ziwei.fortune}></div>
      <{else}>
      <div class="todayInfo">※ 填写资料后查看您的专属运势</div>
      <{/if}>
	  <div class="todayBox whole">
        <div class="todayTitle">整体运势：
          <{section name=i loop=$today_fortune.whole.star}>
          <img src="jrys/picture/whole_a.png" alt=""/>
          <{/section}>
          <{section name=j start=$today_fortune.whole.star loop=5}>
          <img src="jrys/picture/whole_b.png" alt=""/>
          <{/section}>
        </div>
        <div class="todayText"><span>行运点评：</span><{$today_fortune.whole.comment}></div>
        <div class="todayText"><span>今日吉时：</span><{$today_fortune.whole.jishi}></div>
        <div class="todayText"><span>今日吉色：</span><{$today_fortune.whole.color.name}> <strong style="color:<{$today_fortune.whole.color.code}>;">●</strong></div>
      </div>
	  <div class="todayBox love">
        <div class="todayTitle">爱情运势：
          <{section name=i loop=$today_fortune.love.star}>
          <img src="jrys/picture/love_a.png" alt=""/>
          <{/section}>
          <{section name=j start=$today_fortune.love.star loop=5}>
          <img src="jrys/picture/love_b.png" alt=""/>
          <{/section}>
        </div>
        <div class="todayText"><span>行运点评：</span><{$today_fortune.love.comment}></div>
        <div class="todayText"><span>贴心指数：</span><b><i style="width:<{$today_fortune.love.close_index}>%;"><{$today_fortune.love.close_index}></i></b></div>
        <div class="todayText"><span>激情指数：</span><b><i style="width:<{$today_fortune.love.passion_index}>%;"><{$today_fortune.love.passion_index}></i></b></div>
      </div>
	  <div class="todayBox work">
        <div class="todayTitle">事业运势：
          <{section name=i loop=$today_fortune.work.star}>
          <img src="jrys/picture/work_a.png" alt=""/>
          <{/section}>
          <{section name=j start=$today_fortune.work.star loop=5}>
          <img src="jrys/picture/work_b.png" alt=""/>
          <{/section}>
        </div>
        <div class="todayText"><span>行运点评：</span><{$today_fortune.work.comment}></div>
        <div class="todayText"><span>人缘指数：</span><b><i style="width:<{$today_fortune.work.relation_index}>%;"><{$today_fortune.work.relation_index}></i></b></div>
        <div class="todayText"><span>压力指数：</span><b><i style="width:<{$today_fortune.work.pressure_index}>%;"><{$today_fortune.work.pressure_index}></i></b></div>
      </div>
	  <div class="todayBox money">
        <div class="todayTitle">财富运势：
          <{section name=i loop=$today_fortune.money.star}>
          <img src="jrys/picture/money_a.png" alt=""/>
          <{/section}>
          <{section name=j start=$today_fortune.money.star loop=5}>
          <img src="jrys/picture/money_b.png" alt=""/>
          <{/section}>
        </div>
        <div class="todayText"><span>行运点评：</span><{$today_fortune.money.comment}></div>
        <div class="todayText"><span>投资指数：</span><b><i style="width:<{$today_fortune.money.invest_index}>%;"><{$today_fortune.money.invest_index}></i></b></div>
        <div class="todayText"><span>消费指数：</span><b><i style="width:<{$today_fortune.money.consume_index}>%;"><{$today_fortune.money.consume_index}></i></b></div>
      </div>
    </section>
    <!--今日运-->
    
    <!--本周运-->
    <section class="yunshiBox" style="display:none;">
	  <div class="todayDate">本周运势</div>
	  <div class="weekChart">
          <div style="width:300px;height:200px;" id="chart01"></div>
      </div>
      <div class="todayText week"><span>行运点评：</span>※ 填写资料后查看详情</div>
    </section>
    <!--本周运-->
    
    <!--流月运-->
    <section class="yunshiBox month" style="display:none;">
      <div class="todayDate">流月运势</div>
      <div class="todayText"><span>提示：</span>填写资料后可查看您的流月运势</div>
    </section>
    <!--流月运-->
    
    <!--年运-->
    <section class="yunshiBox year" style="display:none;">
      <div class="todayDate">2026年运势</div>
      <div class="todayText"><span>提示：</span>填写资料后可查看您的年运势</div>
    </section>
    <!--年运-->
    
    <!--十年大运-->
    <section class="yunshiBox sndy" style="display:none;">
      <div class="todayDate">十年大运</div>
      <div class="todayText"><span>提示：</span>填写资料后可查看您的十年大运</div>
    </section>
    <!--十年大运-->
  </section>
  <!--个人运势-->
  
  <!--运势锦囊-->
  <section class="bigbox yunshiProduct">
    <div class="indexTitle"><b>运势锦囊</b><img src="jrys/picture/icon07.png" alt=""/></div>
	<div class="yunshiJinnang">
      <a href="/?ac=jinnian">
        <dl>
          <dt><img src="jrys/picture/t-asa0115-1.png" alt=""/></dt>
          <dd><b>2026年报告</b><br><span>名师解析2026年八大运程！</span><br><i><img src="jrys/picture/ce.png" alt=""/> 热门测算</i></dd>
        </dl>
      </a>
      <a href="/?ac=bazi">
        <dl>
          <dt><img src="jrys/picture/t-asz0011.png" alt=""/></dt>
          <dd><b>八字批命</b><br><span>八字推演你一生变化！</span><br><i><img src="jrys/picture/ce.png" alt=""/> 热门测算</i></dd>
        </dl>
      </a>
      <a href="/?ac=taluowenda">
        <dl>
          <dt><img src="jrys/picture/7e09dd8fb4f32203dfcf01cc9bcf9a90.png" alt=""/></dt>
          <dd><b>塔罗问答</b><br><span>专业塔罗占卜解惑</span><br><i><img src="jrys/picture/ce.png" alt=""/> 热门测算</i></dd>
        </dl>
      </a>
    </div>
  </section>
  <!--运势锦囊-->
  
  <!--底部浮动菜单-->
  <section class="indexMenu">
    <a href="/">发现</a>
    <a href="/">测算大全</a>
    <a href="javascript:void(0);" class="current">今日运程</a>
  </section>
  <!--底部浮动菜单-->
  
  <!--弹窗-完善个人资料-->
  <section class="yunshiMask data user_info" style="display:none;">
    <div class="yunshiClose"><a href="javascript:void(0);"></a></div>
    <section class="yunshiPopup">
	  <div class="title">完善个人资料</div>
      <div class="tips">※ 正确填写以下资料，方可获得准确运势结果。</div>
      <section class="forminput">
        <div class="forminput_hang">
          <div class="forminput_hang_bt">出生时辰</div> 
          <div class="forminput_hang_birth">
              <span id="birthday_my" class="birth-box" hasHour="1" data-text="公历:1990年1月1日">1990年1月1日</span>
              <input type="hidden" name="iYear" id="iYear" class="form-input" value="<{if $user_data.birthday}><{$user_data.birthday}><{else}>1990-1-1-0<{/if}>" jiavalue="1"/>
          </div>
        </div>
        <div class="forminput_hang">
          <div class="forminput_hang_bt">你的性别</div> 
          <div class="forminput_hang_sex">
              <a href="javascript:void(0)" class="sex0 sex <{if $user_data.sex=='1'}>current<{/if}>" data-sex="1">男</a>
              <a href="javascript:void(0)" class="sex1 sex <{if !$user_data.sex || $user_data.sex=='0'}>current<{/if}>" data-sex="0">女</a>
              <input type="hidden" name="iSex" id="iSex" value="<{if $user_data.sex}><{$user_data.sex}><{else}>0<{/if}>" />
          </div>
        </div>
        <div class="forminput_hang">
          <div class="forminput_hang_bt">感情现状</div> 
          <div class="forminput_hang_status">
              <select id="love">
                  <option value="8" <{if !$user_data.love || $user_data.love=='8'}>selected<{/if}>>单身</option>
                  <option value="9" <{if $user_data.love=='9'}>selected<{/if}>>交往中</option>
                  <option value="11" <{if $user_data.love=='11'}>selected<{/if}>>已婚</option>
              </select>
          </div>
        </div>
        <div class="forminput_hang">
          <div class="forminput_hang_bt">事业现状</div> 
          <div class="forminput_hang_status">
              <select id="job">
                  <option value="2" <{if $user_data.job=='2'}>selected<{/if}>>老板</option>
                  <option value="3" <{if $user_data.job=='3'}>selected<{/if}>>主管</option>
                  <option value="4" <{if !$user_data.job || $user_data.job=='4'}>selected<{/if}>>职员</option>
                  <option value="5" <{if $user_data.job=='5'}>selected<{/if}>>待业中</option>
                  <option value="6" <{if $user_data.job=='6'}>selected<{/if}>>家庭主妇/主男</option>
                  <option value="8" <{if $user_data.job=='8'}>selected<{/if}>>其他</option>
              </select>
          </div>
        </div>
      </section>
      <div class="btn user_info_sub"><a href="javascript:void(0);">确认提交</a></div>
    </section>
  </section>
  <!--弹窗-完善个人资料-->
</section>

<script type="text/javascript" src="jrys/js/echarts.min.js"></script>
<script>
var flag = <{$has_user_info|default:0}>;

lc_initSex('iSex', '');

// 曲线图表初始化
var radarChart1 = null;
var option1 = null;

$(function() {
    // 调试：检查cookie是否存在
    var cookies = document.cookie.split(';');
    var hasCookie = false;
    for(var i=0; i<cookies.length; i++) {
        if(cookies[i].indexOf('user_fortune') >= 0) {
            hasCookie = true;
            console.log('找到user_fortune cookie:', cookies[i]);
        }
    }
    console.log('Cookie检测:', hasCookie ? '已保存' : '未保存', 'flag值:', flag);
    
    // 调试：显示后端传来的用户数据
    console.log('表单初始值:', {
        birthday: $('#iYear').val(),
        sex: $('#iSex').val(),
        job: $('#job').val(),
        love: $('#love').val()
    });
    
    var calendar1 = new lCalendar().init('#birthday_my', '');
    
    // 初始化图表
    radarChart1 = echarts.init(document.getElementById('chart01'));
    option1 = {
        title: { text: '' },
        legend: {
            top:10,
            data:['整体','爱情','事业','财运']
        },
        grid: {
            left: '3%',
            right: '4%',
            bottom: '3%',
            containLabel: true
        },
        xAxis : [{
            type : 'category',
            boundaryGap : false,
            data : ['周日', '周一', '周二', '周三', '周四', '周五', '周六'],
        }],
        yAxis : [{
            type : 'value',
            splitNumber:0,
            min: 1,
            max: 5,
            axisLabel : {
                formatter: function(value) {
                    var dataVal = new Array('', '不佳', '平平', '还行', '不错', '极佳', '');
                    return dataVal[value];
                }
            },
            splitArea : {show : false}
        }],
        series : [
            {
                name:'整体',
                type:'line',
                smooth:true,
                data:[4,2,4,3,3,2,4],
                itemStyle: {
                    normal: {
                        color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [
                            {offset: 0, color: '#FFE680'},
                            {offset: 0.5, color: '#F985FF'},
                            {offset: 1, color: '#FFFFFF'}
                        ]),
                        areaStyle: {type: 'default'}
                    }
                }
            },
            {
                name:'爱情',
                type:'line',
                smooth:true,
                data:[3,1,4,3,2,2,3],
                itemStyle: {
                    normal: {
                        color: '#fd6257'
                    }
                }
            },
            {
                name:'事业',
                type:'line',
                smooth:true,
                data:[4,2,4,3,3,2,4],
                itemStyle: {
                    normal: {
                        color: '#3ebaed'
                    }
                }
            },
            {
                name:'财运',
                type:'line',
                smooth:true,
                data:[3,3,2,3,4,1,4],
                itemStyle: {
                    normal: {
                        color: '#ffc600'
                    }
                }
            }
        ]
    };
    radarChart1.setOption(option1);
});

window.onload = function() {
    // 本周运
    $.post('/?ac=jrys_ajax', {method:"week"}, function(data) {
        if(data && data.text) {
            $('.yunshiBox').eq(1).html(data.text);
            // 更新图表数据
            if(data.chart_data) {
                setTimeout(function() {
                    radarChart1 = echarts.init(document.getElementById('chart01'));
                    option1.series[0].data = data.chart_data.whole;
                    option1.series[1].data = data.chart_data.love;
                    option1.series[2].data = data.chart_data.work;
                    option1.series[3].data = data.chart_data.money;
                    radarChart1.setOption(option1);
                }, 100);
            }
        }
    }, 'json');
    
    // 流月运
    $.post('/?ac=jrys_ajax', {method:"month"}, function(data) {
        if(data && data.text) $('.month').html(data.text);
    }, 'json');
    
    // 年运
    $.post('/?ac=jrys_ajax', {method:"year"}, function(data) {
        if(data && data.text) $('.year').html(data.text);
    }, 'json');
    
    // 十年大运
    $.post('/?ac=jrys_ajax', {method:"sndy"}, function(data) {
        if(data && data.text) $('.sndy').html(data.text);
    }, 'json');
};

// 运势内容切换
$('.yunshiTab a').click(function() {
    if(flag){
        let index = $(this).index();
        $('.yunshiTab a').removeClass('current').eq(index).addClass('current');
        $('.yunshiBox').hide().eq(index).show();
    }else{
        $('.user_info').show();
    }
});

// 性别选择（后端数据已经通过模板设置了，这里不再覆盖）
// 如果没有后端数据，才从localStorage读取
var currentSex = $('#iSex').val();
if(!currentSex || currentSex == '') {
    var local_sex = window.localStorage['sexSaveVal'];
    if (typeof(local_sex) != "undefined") {
        $('.sex').removeClass('current');
        if (local_sex == 0) {
            $('.sex1').addClass('current');
        } else {
            $('.sex0').addClass('current');
        }
        $('#iSex').val(local_sex);
    }
}

$('.sex').click(function() {
    var type = $(this).attr('data-sex');
    $('.sex').removeClass('current');
    if (type == 0) {
        $('.sex1').addClass('current');
    } else {
        $('.sex0').addClass('current');
    }
    $('#iSex').val(type);
});

// 提交资料
$('.user_info_sub a').click(function() {
    let method = 'update';
    let sex = $('#iSex').val();
    let birthday = $('#iYear').val();
    let job = $('#job').val();
    let love = $('#love').val();
    
    console.log('准备提交的数据:', {sex: sex, birthday: birthday, job: job, love: love});
    
    var isBirthDay = verifyElementData('iYear', 'iBirthday', '');
    saveSexFunction('iSex', '');
    
    if (isBirthDay) {
        $.post('/?ac=jrys_ajax', {method: method, sex: sex, love: love, job: job, birthday: birthday}, function(data) {
            console.log('提交返回:', data);
            if(data && data.code == 1) {
                $('.user_info').hide();
                flag = 1; // 设置已填写资料标识
                layer.open({
                    content: '信息提交成功! 正在为您生成专属运势...',
                    skin: 'msg',
                    time: 2
                });
                // 刷新页面以显示紫微斗数个性化运势
                setTimeout(function() {
                    window.location.reload();
                }, 2000);
            } else {
                $('.user_info').hide();
                layer.open({
                    content: data.message || '提交失败，请重试',
                    skin: 'msg',
                    time: 2
                });
            }
        }, 'json').fail(function(xhr, status, error) {
            console.error('提交失败:', status, error);
            layer.open({
                content: '网络错误，请重试',
                skin: 'msg',
                time: 2
            });
        });
    }
});


// 打开关闭弹窗
$('.txzliao').click(function() {
    $('.yunshiMask.data').show();
    
    console.log('打开弹窗时的表单值:', {
        birthday: $('#iYear').val(),
        sex: $('#iSex').val(),
        job: $('#job').val(),
        love: $('#love').val()
    });
    
    // 更新日历显示文本
    var birthdayVal = $('#iYear').val();
    if(birthdayVal && birthdayVal != '1990-1-1-0') {
        var parts = birthdayVal.split('-');
        if(parts.length >= 3) {
            var displayText = parts[0] + '年' + parts[1] + '月' + parts[2] + '日';
            if(parts[3]) {
                var hours = ['子时', '丑时', '寅时', '卯时', '辰时', '巳时', '午时', '未时', '申时', '酉时', '戌时', '亥时'];
                displayText += ' ' + (hours[parseInt(parts[3])] || '子时');
            }
            $('#birthday_my').text(displayText).attr('data-text', '公历:' + displayText);
        }
    }
});

$('.yunshiClose a').click(function() {
    $('body').css({'overflow':''});
	$('.yunshiMask').hide();
});
</script>

</body>
</html>
