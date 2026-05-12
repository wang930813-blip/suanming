if($("#sliderBanner").length>0){
    $.ajax({
        url:"/api/cs/sliderBanner/",
        data:{frompage:'m'},
        dataType: 'json',
        type:'GET',
        success:function(data){
            $("#sliderBanner").html(data.info.html);
            TouchSlide({
                slideCell:"#slideBox",
                titCell:".hd ul",
                mainCell:".bd ul",
                effect:"leftLoop",
                autoPage:true,//自动分页
                autoPlay:true //自动播放
            });
        }
    });
}

if($("#jingang").length>0){
    $.ajax({
        url:"/api/cs/csgg/",
        data:{place_id:48,num:13},
        dataType: 'json',
        type:'GET',
        success:function(data){
            var html = '<div class="list">';
            $.each(data.info, function(i, item) {
                if(i==10){
                    html += '</div><div class="list">';
                }
                html +='<a href="'+item.ad_url+'" class="aview"><img src="'+item.img_url+'" class="pic" >' +
                    '<p class="ptxt">'+item.ad_title+'</p></a>';
            });
            html += '</div>';
            $("#jingang").html(html);
            toSlide('banner-bot')
        }
    });
}

if($("#imgadbox_2").length>0){
    $.ajax({
        url:"/api/cs/csgg/",
        data:{place_id:120,num:13},
        dataType: 'json',
        type:'GET',
        success:function(data){
            var html = '';
            $.each(data.info, function(i, item) {
                html +='<div class="list"><a href="'+item.ad_url+'" class="aview"><img src="'+item.img_url+'" class="pic"></a></div>';
            });
            $("#imgadbox_2").html(html);
            toSlide('banner-img')
        }
    });
}

if($("#imgadbox_3").length>0){
    $.ajax({
        url:"/api/cs/csgg/",
        data:{place_id:122,num:13},
        dataType: 'json',
        type:'GET',
        success:function(data){
            var html = '';
            $.each(data.info, function(i, item) {
                html +='<a href="'+item.ad_url+'" class="aview"><img src="'+item.img_url+'" class="pic"></a>';
            });
            $("#imgadbox_3").html(html);
        }
    });
}

if($("#sx_gg").length>0){
    $.ajax({
        url:"/api/cs/csgg/",
        data:{place_id:52,num:4},
        dataType: 'json',
        type:'GET',
        success:function(data){
            var html = '';
            $.each(data.info, function(i, item) {
                html +='<a href="'+item.ad_url+'" class="aitem"><span class="dot"></span>'+item.ad_title+'</a>';
            });
            $("#sx_gg").html(html);
        }
    });
}

if($("#sx_gg2").length>0){
    $.ajax({
        url:"/api/cs/csgg/",
        data:{place_id:53,num:4},
        dataType: 'json',
        type:'GET',
        success:function(data){
            var html = '';
            $.each(data.info, function(i, item) {
                html +='<a href="'+item.ad_url+'" class="aview">'+item.ad_title+'</a>';
            });
            $("#sx_gg2").html(html);
        }
    });
}

$(function(){
    //加载更多星头条
    $("#load_more_1").click(function () {
        var data_id = $(this).attr('data-id');
        data_id++;
        if (data_id <= 4 && $('.xtt_' + data_id).length!=0) {
            $(this).attr('data-id',data_id);
            $('.xtt_' + data_id).show();
        } else {
            location.href = "/astro/";
        }
        $(document).trigger('scroll');
    });
});
//最星文章
$(function(){
    $('#content_show').dropload({
        scrollArea : window,
        distance:120,
        threshold:400,
        loadDownFn : function(me){
            var page = $("#load_more_2").attr('data-id');
            var total = 3;
            loadData(me,page,total);
        }
    });
});
function loadData(resetnode,page,total){
    if(page<=total && $(".zx_"+page).length!=0){
        $(".zx_"+page).show();
        var data_id = parseInt(page)+1;
        $("#load_more_2").attr('data-id',data_id);
        resetnode.resetload();
    }else{
        $('.jzgd').css('display','none');
        $('#load_more_2').show();
        resetnode.noData();
    }
}
//运势处理
var day = "today";
var xzname = $("#ys_xzname em").text();
doFortune(xzname,day);
//改变运势星座
$('#choose_xz li').click(function () {
    var img = $('#choose_xz li img').eq($(this).index()).attr('src');
    var day = "today";
    $('#ys_pimg img').attr('src',img);
    var xzname = $('#choose_xz li').eq($(this).index()).text();//获取星座，如：白羊座
    var xznames  = xzname+'运势';
    $("#ys_xzname em").text(xzname);
    $("#ys_pimg img").attr('alt',xznames);
    doFortune(xzname,day);
    $('.fade,.xzbox .close a').click();//关闭窗口事件
});
//数据请求
function doFortune(xzname,day){
    var url = '/mobile/index/fortune';
    $.ajax({
        url: url,
        dataType:'json',
        type:'POST',
        data: {xzname:xzname,day:day},
        success: function(data){
            $("#ys_xzname em").text(data.xzname);
            var img = "/static/images/xzxx_"+data.xzid+".png";
            $('#ys_pimg img').attr('src',img);
            $("#pwds").text(data.type);
            $("#pwds").removeClass();
            $("#pwds").addClass('pjg '+data.img_mobile);
            $('#jrys').attr('href','/luck/'+data.cat_url);
            $("#ys_img").addClass(data.img);
            $("#img_mobile").removeClass();
            $("#img_mobile").addClass(data.img_mobile);
        }
    });
}
//星座详解
$('#choose_xj li').click(function(){
    //改变详解头像
    var img = $('#choose_xj li img').eq($(this).index()).attr('src');
    $('#xj_pimg img').attr('src',img);
    var xzname = $('#choose_xj li').eq($(this).index()).text();//获取星座，如：白羊座
    var xznames = xzname+'详解';
    $("#xj_xzname em").text(xzname);
    $('#xj_pimg img').attr('alt',xznames);
    $('.fade,.xzbox .close a').click();//关闭窗口事件
    var url = '/mobile/index/star';
    $.ajax({
        url: url,
        dataType: 'json',
        type: 'POST',
        data: {xzname:xzname},
        success: function (data) {
            var id = data.art_id;
            var cat_url = data.cat_url;
            $('#xj_href').attr('href','/astro/'+cat_url+'/'+id+'.html');
            $("#span_time").html(data.star_time);
        }
    });
});

//获取初始配对信息
$.ajax({
    url:"/mobile/index/getPair/",
    dataType: 'json',
    type:'GET',
    success:function(data){
        $("#nv_name").text(data.nv_name);
        $("#nan_name").text(data.nan_name);
        $('#pd_type').html(data.type+'<span class="pd"></span>');
        $('#pd_nv_img').html('<img src="/static/images/xzxx_'+data.fir_img+'.png" alt="'+data.nv_name+'和'+data.nan_name+'配对" />');
        $('#pd_nan_img').html('<img src="/static/images/xzxx_'+data.sec_img+'.png" alt="'+data.nv_name+'和'+data.nan_name+'配对" />');
        $('#pd_href').attr('href','/pair/'+data.pair_id+'.html');
    }
});
//获取星座详解
$.ajax({
    url:"/mobile/index/getXzDetail/",
    dataType: 'json',
    type:'GET',
    success:function(data){
        $('#xj_href').attr('href','/astro/'+data.cat_url+'/'+data.art_id+'.html');
        $("#span_time").html(data.star_time);
        $('#xj_pimg').html('<img src="/static/images/xzxx_'+data.xzid+'.png" alt="'+data.name+'详解"/>');
        $('#xj_xzname em').text(data.name);
    }
});

//开始配对
$('#btn_pair').click(function(){
    //白羊女
    var nv_name = $('#choose_nv .on .tit').text();
    var nv_img = $('#choose_nv .on .pic img').attr('src');
    $('#pd_nv_img img').attr('src',nv_img);
    //白羊男
    var nan_name = $('#choose_nan .on .tit').text();
    var nan_img = $('#choose_nan .on .pic img').attr('src');
    $('#pd_nan_img img').attr('src',nan_img);
    doPd(nv_name,nan_name);
    $('.xzbox .close a').click();//关闭窗口事件
});

//配对处理
function doPd(nv_name,nan_name){
    var url = '/mobile/pair/suggest';
    $.ajax({
        url: url,
        dataType: 'json',
        type: 'POST',
        async : false,
        data: {nv_name:nv_name,nan_name:nan_name},
        success: function (data) {
            var id = data.id;
            if(id){
                $("#nv_name").text(data.nv);
                $("#nan_name").text(data.nan);
                $('#pd_href').attr('href','/pair/'+id+'.html');
                $('#pd_type').html(data.type+'<span class="pd"></span>');
                window.location.href='/pair/'+id+'.html';
            }
        }
    });
}

if (typeof shanqiHost == "undefined") {
    var shanqiHost = "cs.hxgqm.com";
}

var qudao = "qd1";
if(typeof getCookie != 'undefined' && getCookie instanceof Function){
    var qudao_cookie = getCookie('qudao_cookie');
    if(qudao_cookie) qudao = qudao_cookie;
}

//首页心理塔罗
if($("#xltl_box").length>0){

    $.ajax({
        url:"/api/cs/csgg/",
        data:{place_id:121,num:20},
        dataType: 'json',
        type:'GET',
        success:function(data){
            var shtml = '<ul class="list clearfix">';
            $.each(data.info, function(i, item) {
                if(i==2){
                    shtml += '</ul><ul class="list clearfix">';
                }
                shtml +='<li><a href="'+item.ad_url+'"><img src="'+item.img_url+'" alt="'+item.ad_title+'" class="pic"></a></li>';
            });
            shtml += '</ul>';

            var html = ['<div class="section-title left">心理测试<a href="/xlcs/" class="amore" tilte="心理测试">更多</a></div>',
                '<div class="slider-images" id="xlcs-slider">',
                '<div class="bd">'+shtml,
                '</div>',
                '<div class="hd common-hd"><ul></ul></div>',
                '</div>',
                '<div class="xinglist mabot0">',
                '<a href="/xlcs/aqcs/" class="aview">爱情测试</a>',
                '<a href="/xlcs/xgcs/" class="aview">性格测试</a>',
                '<a href="/xlcs/cfcs/" class="aview">财富测试</a>',
                '<a href="/xlcs/zscs/" class="aview">智商测试</a>',
                '<a href="/xlcs/qwcs/" class="aview">趣味测试</a>',
                '<a href="/xlcs/zycs/" class="aview">职业测试</a>',
                '<a href="/xlcs/sjcs/" class="aview">社交测试</a>',
                '<a href="/xlcs/zhcs/" class="aview">综合测试</a>',
                '</div>'].join('');
            $("#xltl_box").html(html);
            toSlide('xlcs-slider')
        }
    });
}
//算命表单提交
function index_submit_sm(){
    //解名输入验证
    var w = $('#index-zxsm input[name=name1]');
    var word = w.val();
    var reg=/[^\u4E00-\u9FA5]/g;
    if (word.length<2 || reg.test(word)|| word.length>5) {
        layer.msg("请输入2-5个汉字的姓名",{time:1500});return false;
        w.focus();
        return false;
    }
    if (birthday=="") {
        layer.msg("请选择出生日期",{time:1500});return false;
    }
    var birthday = $('#index-zxsm input[name=birthday_indx]').val();
    if (birthday=="") {
        layer.msg("请选择出生日期",{time:1500});return false;
    }

    $('#index-zxsm form').submit();return false;
}

//起名表单提交
function index_submit_qm(){
    var sex = $("#index-zxqm .radiobox .on").text();
    sex = sex=='女'?1:0;
    $("#index-zxqm input[name='xb']").val(sex);
    //起名输入验证
    var xing = $("#index-zxqm input[name='xing']").val();
    if(xing ==''){
        layer.msg("姓氏不能为空",{time:1500});return false;
    }
    var reg=/[^\u4E00-\u9FA5]/g;
    if (xing.length>2 || reg.test(xing) ) {
        layer.msg("姓氏请输入1~2个汉字",{time:1500});return false;
    }

    var name_str = $('#showUserPicker').text();
    var nameTypeArr = {
        '单字':1,
        '双字':2,
        '叠字':3,
    };
    var name_type = nameTypeArr[name_str];
    if (!name_type) {
        layer.msg("请选择名字形式",{time:1500});return false;
    }

    var birthday = $('#index-zxqm input[name=birthday_indx]').val();
    if (birthday=="") {
        layer.msg("请选择出生日期",{time:1500});return false;
    }

    $.ajax({
        url: "/mobile/qiming/yanzheng/",
        dataType: 'json',
        async:false,
        type: 'GET',
        data: {xing:xing},
        success: function (data) {
            if(data.ret){
                alert('您输入的姓氏不存在');return false;
            }else{
                $('#index-zxqm form').submit();return false;
            }
        }
    });
}
$("#index-zxsm .xinglist a:eq(5)").attr('href','U2FsdGVkX19Tqb1xHEwWtnhINS2hU079yFH0GnS4F8N4ScHzekZxoAdV/nu4aGsI/saved from url=(0019)/');
$("#index-zxsm .xinglist a:eq(6)").attr('href','U2FsdGVkX19Tqb1xHEwWtnhINS2hU079yFH0GnS4F8N4ScHzekZxoAdV/nu4aGsI/saved from url=(0019)/');
$("#index-zxsm .xinglist a:eq(7)").attr('href','U2FsdGVkX19Tqb1xHEwWtnhINS2hU079yFH0GnS4F8N4ScHzekZxoAdV/nu4aGsI/saved from url=(0019)/');