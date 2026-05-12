$(function() {
    //shanqi cookie
    var ref = document.referrer; // 来源页
    $.ajax({
        url: "/common/setHttpCookie/",
        dataType: 'json',
        timeount: 2000,
        data: {ref:ref},
        success: function (data) {
            var script = document.createElement("script");
            script.type = "text/javascript";
            script.src = "https://m.695828.com/count/setHttpCookie?httpAgent="+data.httpAgent;
            document.body.appendChild(script);
        }
    });

    if(ref.indexOf(".sogou.com") >=0 ) {
        $.cookie('from_sogo','1', {domain:'1212.com',path:'/'});
    }
    if(ref.indexOf(".sogou.com") >=0 || $.cookie('from_sogo') == 1) {
        $(".xxl-ul [id^='baidugg_']").hide();
        $("#baidu-ad-body").hide();
    }

    // 页尾追加信息

    // tab点击切换
    $('.js-tab').each(function(){
        var $tab = $(this);
        $tab.find('.js-tab-head').children().on('click', function(){
            var $this = $(this);
            $this.addClass('on').siblings().removeClass('on');
            $tab.find('.js-tab-cont').eq($this.index()).addClass('on').siblings().removeClass('on');

            // 触发下滚动事件（资讯lazy图片加载需要）
            $tab.hasClass('news-block') && $(window).trigger("scroll");
        })

        $tab.find('.xttbox_more').on('click', function(){
            $(this).parent().addClass('open');
        })
    })

    // 图片延迟加载
    $("img.lazy").lazyload();

    //友情链接
    $('.linkbox').each(function(){
        var $link = $(this).find('.link');
        $link.find('.a_more').on('click', function(){
            if($link.hasClass('up')){
                $link.removeClass('up').addClass('down');
            }
            else{
                $link.addClass('up').removeClass('down');
            }
        })
    })

    // 搜索
    var $body = $('body');
    $('#searchall').each(function(){
        var $this = $(this);

        // 搜索显示
        window.search = function(){
            $body.removeClass('menu-cover').addClass('search-cover');
            $this.find('#hehe').focus();
        }
        // 搜索关闭
        $this.find('.qx').on('click', function(){
            $body.removeClass('search-cover');
        })
        // 提交搜索
        window.checksubmit = function() {
            var v = $this.find('[name=q]').val().replace(/\s/g, '');
            if(v != ''){
                var url = "/search/?q="+ encodeURI(v);
                window.location.href=encodeURI(url);
            }
            return false;
        }
        // 搜索关键词跳转
        window.myFunction = function(q) {
            var q = encodeURI(q);
            if(q!=""){
                var url = "/search/?q="+ q;
                window.location.href = encodeURI(url);
            }
        }
    })
});


// 滚动事件
$(function() {
    var $win = $(window),
        $html = $('html'),
        $back = $(".back_top");

    var url = location.href.split('.com')[1];
    var isIndex = url == '/' || !url;
    $win.scroll(function(){
        !isIndex && $html.toggleClass('top-ermenue-show', $win.scrollTop() > 100)
        if ($win.scrollTop() > 300){
            $back.css('display','block');
        }
        else {
            $back.fadeOut(300);
        }
    });

    // 回到页面顶部位置
    $back.on("click", function(){
        $('body,html').animate({scrollTop:0}, 500);
    });
});

/*

 $(function top(){
 console.log('=========')

 //当滚动条的位置处于距顶部100像素以下时，跳转链接出现，否则消失
 $(function () {
 // var wd=document.documentElement.clientHeight/2;
 var wd=200,gght=parseInt($('.top').height()/2);
 $(window).scroll(function(){
 if ($(window).scrollTop()>wd){
 jQuery(".back_top").css('display','block');
 }
 else
 {
 jQuery(".back_top").fadeOut(300);
 }
 if ($(window).scrollTop()>gght){
 $('.top').addClass('scon')
 }
 else
 {
 $('.top').removeClass('scon')
 }
 });

 //当点击跳转链接后，回到页面顶部位置

 $(".back_top").click(function(){
 jQuery('body,html').animate({scrollTop:0},500);
 return false;
 });
 });
 });
 $(function(){
 $('.fade').click(function(){
 //头部下拉
 var tp=$('.xlmenu_box').css('display');
 if(tp=='block'){
 $('.xlmenu_box').hide();
 $('.top').removeClass('xlmunu_on');
 $('.top_rg .xlbtn.down').removeClass('down').addClass('up');
 }
 //星座选择弹窗
 $('.xzbox').hide();
 moves()
 })
 })
 // 2 27头部修改
 $(document).ready(function(){
 var tp=$('.heart').height();
 $(window).scroll(function(){
 if ($(window).scrollTop()<tp && $(window).scrollTop()>=0){
 $(".top").removeClass('on');
 }
 else
 {
 $(".top").addClass('on');
 }
 });
 })

 // 3 8头部导航优化
 $(function(){
 $('.top_rg').on('click','.xlbtn.up',function(){
 $('.xlmenu_box').show();
 $('.fade').eq(0).show();
 $('.top').addClass('xlmunu_on');
 $(this).removeClass('up').addClass('down');
 stops()
 });
 $('.top_rg').on('click','.xlbtn.down',function(){
 $('.xlmenu_box').hide();
 $('.fade').hide();
 $('.top').removeClass('xlmunu_on');
 $(this).removeClass('down').addClass('up');
 moves()
 });
 })
 $('.qx').live('click',function(){
 $("#contentall").show();
 $("#searchall").hide();

 if(!document.getElementById('whited')){
 $('body').removeClass('white');
 }
 $(document).scrollTop(documentST); //重置滚动条位置
 })

 $('#searchcontent').live('click',function(){
 documentST = $(document).scrollTop(); //保存当前滚动条位置
 $('body,html').height('100%');
 $("#contentall").hide();
 $("#searchall").show();
 $('body').addClass('white');
 $('body,html').animate({ scrollTop: 0 });
 $('#searchall input[name="q"]').focus();
 })
 //搜索
 var documentST = 0;
 function search() {
 documentST = $(document).scrollTop(); //保存当前滚动条位置
 $("#contentall").hide();
 $("#searchall").show();
 $('.xlmenu_box').hide();
 $('.fade').hide();
 $('body').addClass('white');
 $('#searchall input[name="q"]').focus();
 $('.xlbtn').removeClass('down');
 $('.xlbtn').addClass('up');
 }


 function myFunction(q) {
 var q = encodeURI(q);
 if(q!=""){
 var url = "/search/?q="+ q;
 window.location.href = encodeURI(url);
 }
 }
 */

function adJump(ad_id, param){
    ad_id && $.ajax({
        url:"/api/cs/detailAdLink/",
        data:{ad_id:ad_id,param:param},
        dataType: 'json',
        type:'GET',
        success:function(data){
            if(data.code==200){
                window.location.href = data.info.url+'?'+param;
            }
        }
    });
}
function commonAdJump(ad_id,type){
    var type = type || '';
    ad_id && $.ajax({
        url:"/api/cs/commonAdJump/",
        data:{ad_id:ad_id,type:type},
        dataType: 'json',
        type:'GET',
        success:function(data){
            if(data.code==200){
                window.location.href = data.info.url;
            }
        }
    });
}
function naviAdJump(ad_id){
    ad_id && $.ajax({
        url:"/api/cs/naviAdLink/",
        data:{ad_id:ad_id},
        dataType: 'json',
        type:'GET',
        success:function(data){
            if(data.code==200){
                window.location.href = data.info.url;
            }
        }
    });
}


// 广告
if($("#rmcs_wz").length>0){
    $.ajax({
        url:"/api/cs/csgg/",
        data:{place_id:49,num:4},
        dataType: 'json',
        type:'GET',
        success:function(data){
            var html = '';
            $.each(data.info, function(i, item) {
                html +='<a href="'+item.ad_url+'" class="aitem"><span class="te">'+item.ad_title+'</span>:  '+item.ad_title2+'</a>';
            });
            $("#rmcs_wz").html(html);
        }
    });
}

if($("#rmcs_tw").length>0){
    $.ajax({
        url:"/api/cs/csgg/",
        data:{place_id:50,num:4},
        dataType: 'json',
        type:'GET',
        success:function(data){
            var html = '';
            $.each(data.info, function(i, item) {
                html +='<a href="'+item.ad_url+'" class="aitem"><img src="'+item.img_url+'" class="pic" >' +
                    '<p class="ptxt">'+item.ad_title+'</p></a>';
            });
            $("#rmcs_tw").html(html);
        }
    });
}

if($("#kyyp").length>0){
    $.ajax({
        url:"/api/cs/csgg/",
        data:{place_id:51,num:4},
        dataType: 'json',
        type:'GET',
        success:function(data){
            var html = '';
            $.each(data.info, function(i, item) {
                html +='<a href="'+item.ad_url+'" class="aitem"><span class="tag">'+item.ad_title+'</span>'+item.ad_title2+'</a>';
            });
            $("#kyyp").html(html);
        }
    });
}

if($("#jzcs").length>0){
    $.ajax({
        url:"/api/cs/csgg/",
        data:{place_id:55,num:8},
        dataType: 'json',
        type:'GET',
        success:function(data){
            var html = '';
            $.each(data.info, function(i, item) {
                html +='<li class="viewli"> <a href="'+item.ad_url+'" class="listlink"><img src="'+item.img_url+'" alt="" ></a></li>';
            });
            $("#jzcs").html(html);
        }
    });
}

if($("#jzcs2").length>0){
    $.ajax({
        url:"/api/cs/csgg/",
        data:{place_id:56,num:8},
        dataType: 'json',
        type:'GET',
        success:function(data){
            var html = '';
            $.each(data.info, function(i, item) {
                html +='<a href="'+item.ad_url+'" class="abtn">'+item.ad_title+'</a>';
            });
            $("#jzcs2").html(html);
        }
    });
}

if($("#jzcs3").length>0){
    $.ajax({
        url:"/api/cs/csgg/",
        data:{place_id:58,num:8},
        dataType: 'json',
        type:'GET',
        success:function(data){
            var html = '';
            $.each(data.info, function(i, item) {
                html +='<li><a href="'+item.ad_url+'"><img src="'+item.img_url+'" alt="" /><em>'+item.ad_title+'</em></a></li>';
            });
            $("#jzcs3").html(html);
        }
    });
}

if($("#jzcs4").length>0){
    $.ajax({
        url:"/api/cs/csgg/",
        data:{place_id:59,num:8},
        dataType: 'json',
        type:'GET',
        success:function(data){
            var html = '';
            $.each(data.info, function(i, item) {
                html +='<a href="'+item.ad_url+'">'+item.ad_title+'</a>';
            });
            $("#jzcs4").html(html);
        }
    });
}

if($("#zxcs").length>0){
    $.ajax({
        url:"/api/cs/csgg/",
        data:{place_id:57,num:8},
        dataType: 'json',
        type:'GET',
        success:function(data){
            var html = '';
            $.each(data.info, function(i, item) {
                html +='<a href="'+item.ad_url+'" class="aitem"><span class="text">'+item.ad_title+'</span></a>';
            });
            $("#zxcs").html(html);
        }
    });
}

var qudao = "qd1";
if (typeof getCookie != 'undefined' && getCookie instanceof Function) {
    var qudao_cookie = getCookie('qudao_cookie');
    if (qudao_cookie) qudao = qudao_cookie;
}
if (typeof shanqiHost == "undefined") {
    shanqiHost = "cs.685155.com";
}

if($("#xgtjhfgg").length>0) {
    $.ajax({
        url:"/api/cs/csggByRand/",
        data:{place_id:87,num:1},
        dataType: 'json',
        type:'GET',
        success:function(data){
            var html = '';
            $.each(data.info, function(i, item) {
                html += '<a href="' + item.ad_url + '"><img src="' + item.img_url + '" ></a>';
            });
            $("#xgtjhfgg").html(html);
        }
    });
}

if($("#qgjh_wz").length>0){
    qudao = "qdxzqgjh";
    var html = '';
    html+= '<li class="liview"><a href="https://' + shanqiHost + '/' + qudao + '/bzhhb/" class="aview"><p class="sptag">未来</p><p class="ptitle">姻缘 | 我和Ta适合结婚吗？</p>' +
        '</a></li>';
    html+= '<li class="liview"><a href="https://' + shanqiHost + '/' + qudao + '/mzzdb/" class="aview"><p class="sptag">大家都在问</p><p class="ptitle">命定 | 你命中注定的另一半是谁？</p>' +
        '</a></li>';
    html+= '<li class="liview"><a href="https://' + shanqiHost + '/' + qudao + '/bzyyb/" class="aview"><p class="sptag">天生一对</p><p class="ptitle">配对 ｜ 你与另一半的匹配度有多高？</p>' +
        '</a></li>';
    html+= '<li class="liview"><a href="https://' + shanqiHost + '/' + qudao + '/tltd/" class="aview"><p class="sptag">单身必测</p><p class="ptitle">情感 ｜ 塔罗占卜-3个月内我会脱单吗？</p>' +
        '</a></li>';
    $("#qgjh_wz").html(html);
}

$('#kaiyunyouping1').attr('href','https://shop42752462.youzan.com/v2/showcase/category?alias=6d8p94tb0g&banner_id=f.78197693~image_nav.3~0~n7Msi5fh&reft=1608874623867&spm=f.78197693');
$('#kaiyunyouping2').attr('href','https://shop42752462.youzan.com/v2/showcase/category?alias=F4ksG4NHli&banner_id=f.78197693~image_nav.3~1~PUo6GcKI&reft=1608874677610&spm=f.78197693');
$('#kaiyunyouping3').attr('href','https://shop42752462.youzan.com/v2/showcase/category?alias=glOqfSPAB8&banner_id=f.78197693~image_nav.3~2~32CI77Qg&reft=1608874690378&spm=f.78197693');
$('#kaiyunyouping4').attr('href','https://shop42752462.youzan.com/v2/showcase/category?alias=fwfbrkYZY4&banner_id=f.78197693~image_nav.3~3~HtkfkRAg&reft=1608874700746&spm=f.78197693');

if($("#rmzb").length>0){
    $.ajax({
        url:"/api/cs/csgg/",
        data:{place_id:83,num:5},
        dataType: 'json',
        type:'GET',
        success:function(data){
            var html = '',style = '';
            $.each(data.info, function(i, item) {
                if(i==0){
                    style = '<i class="icon icon-tl-hot"></i>';
                }else if(i==1){
                    style = '<i class="icon icon-tl-new"></i>';
                }else{
                    style = '';
                }
                html +='<a class="item" href="'+item.ad_url+'"><div class="tag">'+item.ad_title2+'</div><div class="tit">'+item.ad_title+style+'</div></a>';
            });
            $("#rmzb").html(html);
        }
    });
}


var getAdHtml = function(id, aid, theme){
    var $ad = $(id);
    if($ad.length){
        $.ajax({
            url:"/api/cs/csggByRand/",
            data:{place_id: aid, num:1},
            dataType: 'json',
            type:'GET',
            success: function(data){
                var html = '';
                $.each(data.info, function(i, item) {
                    var text = item.ad_title2 ? '<span class="t1">'+item.ad_title2+'</span><span class="t2">- '+item.ad_title+'</span>' : item.ad_title;
                    var btn = theme == 'qm' ? '马上起名' : '立即测算';
                    html += '<a class="ad-link '+theme+'" href="'+item.ad_url+'" ><div class="txt">'+text+'</div><div class="btn">'+btn+'</div></a>';
                });
                $ad.html(html);
            }
        });
    }
}
getAdHtml("#sm_ad_1", 84);
getAdHtml("#sm_ad_2", 85);
getAdHtml("#sm_ad_3", 86);
getAdHtml("#sm_ad_88", 88);
getAdHtml("#qm_ad_108", 108, 'qm');
if($("#sm_ad_89").length>0) {
    $.ajax({
        url:"/api/cs/ads/",
        data:{place_id:'89,90,91,92,93,94',num:1},
        dataType: 'json',
        type:'GET',
        success:function(data){
            $.each(data.info, function(i, item) {
                var html = '<a class="ad-link" href="'+item[0].ad_url+'" ><div class="txt"><span class="t1">'+item[0].ad_title2+'</span><span class="t2">- '+item[0].ad_title+'</span></div><div class="btn">立即测算</div></a>';
                $("#sm_ad_"+i).html(html);
            });
        }
    });
}


if($("#grxp-hot").length>0) {
    $.ajax({
        url:"/api/cs/csgg/",
        data:{place_id:106,num:5},
        dataType: 'json',
        type:'GET',
        success:function(data){
            var html = '',style = '';
            $.each(data.info, function(i, item) {
                if(i==0){
                    style = '<i class="icon icon-tl-hot"></i>';
                }else if(i==1){
                    style = '<i class="icon icon-tl-new"></i>';
                }else{
                    style = '';
                }
                html +='<a class="item" href="'+item.ad_url+'"><div class="tag">'+item.ad_title2+'</div><div class="tit">'+item.ad_title+style+'</div></a>';
            });
            $("#grxp-hot").html(html);
        }
    });
}


if($("#pairAd").length>0){
    $.ajax({
        url:"/api/cs/csgg/",
        data:{place_id:135,num:8},
        dataType: 'json',
        type:'GET',
        success:function(data){
            var html = '';
            $.each(data.info, function(i, item) {
                html +='<li><a href="'+item.ad_url+'"><img class="pic" src="'+item.img_url+'"><div class="tit">'+item.ad_title+'</div></a></li>';
            });
            $("#pairAd").html(html);
        }
    });
}





/* Zepto v1.1.6 - zepto event ajax form ie - zeptojs.com/license */
var Zepto=function(){function L(t){return null==t?String(t):j[S.call(t)]||"object"}function Z(t){return"function"==L(t)}function _(t){return null!=t&&t==t.window}function $(t){return null!=t&&t.nodeType==t.DOCUMENT_NODE}function D(t){return"object"==L(t)}function M(t){return D(t)&&!_(t)&&Object.getPrototypeOf(t)==Object.prototype}function R(t){return"number"==typeof t.length}function k(t){return s.call(t,function(t){return null!=t})}function z(t){return t.length>0?n.fn.concat.apply([],t):t}function F(t){return t.replace(/::/g,"/").replace(/([A-Z]+)([A-Z][a-z])/g,"$1_$2").replace(/([a-z\d])([A-Z])/g,"$1_$2").replace(/_/g,"-").toLowerCase()}function q(t){return t in f?f[t]:f[t]=new RegExp("(^|\\s)"+t+"(\\s|$)")}function H(t,e){return"number"!=typeof e||c[F(t)]?e:e+"px"}function I(t){var e,n;return u[t]||(e=a.createElement(t),a.body.appendChild(e),n=getComputedStyle(e,"").getPropertyValue("display"),e.parentNode.removeChild(e),"none"==n&&(n="block"),u[t]=n),u[t]}function V(t){return"children"in t?o.call(t.children):n.map(t.childNodes,function(t){return 1==t.nodeType?t:void 0})}function B(n,i,r){for(e in i)r&&(M(i[e])||A(i[e]))?(M(i[e])&&!M(n[e])&&(n[e]={}),A(i[e])&&!A(n[e])&&(n[e]=[]),B(n[e],i[e],r)):i[e]!==t&&(n[e]=i[e])}function U(t,e){return null==e?n(t):n(t).filter(e)}function J(t,e,n,i){return Z(e)?e.call(t,n,i):e}function X(t,e,n){null==n?t.removeAttribute(e):t.setAttribute(e,n)}function W(e,n){var i=e.className||"",r=i&&i.baseVal!==t;return n===t?r?i.baseVal:i:void(r?i.baseVal=n:e.className=n)}function Y(t){try{return t?"true"==t||("false"==t?!1:"null"==t?null:+t+""==t?+t:/^[\[\{]/.test(t)?n.parseJSON(t):t):t}catch(e){return t}}function G(t,e){e(t);for(var n=0,i=t.childNodes.length;i>n;n++)G(t.childNodes[n],e)}var t,e,n,i,C,N,r=[],o=r.slice,s=r.filter,a=window.document,u={},f={},c={"column-count":1,columns:1,"font-weight":1,"line-height":1,opacity:1,"z-index":1,zoom:1},l=/^\s*<(\w+|!)[^>]*>/,h=/^<(\w+)\s*\/?>(?:<\/\1>|)$/,p=/<(?!area|br|col|embed|hr|img|input|link|meta|param)(([\w:]+)[^>]*)\/>/gi,d=/^(?:body|html)$/i,m=/([A-Z])/g,g=["val","css","html","text","data","width","height","offset"],v=["after","prepend","before","append"],y=a.createElement("table"),x=a.createElement("tr"),b={tr:a.createElement("tbody"),tbody:y,thead:y,tfoot:y,td:x,th:x,"*":a.createElement("div")},w=/complete|loaded|interactive/,E=/^[\w-]*$/,j={},S=j.toString,T={},O=a.createElement("div"),P={tabindex:"tabIndex",readonly:"readOnly","for":"htmlFor","class":"className",maxlength:"maxLength",cellspacing:"cellSpacing",cellpadding:"cellPadding",rowspan:"rowSpan",colspan:"colSpan",usemap:"useMap",frameborder:"frameBorder",contenteditable:"contentEditable"},A=Array.isArray||function(t){return t instanceof Array};return T.matches=function(t,e){if(!e||!t||1!==t.nodeType)return!1;var n=t.webkitMatchesSelector||t.mozMatchesSelector||t.oMatchesSelector||t.matchesSelector;if(n)return n.call(t,e);var i,r=t.parentNode,o=!r;return o&&(r=O).appendChild(t),i=~T.qsa(r,e).indexOf(t),o&&O.removeChild(t),i},C=function(t){return t.replace(/-+(.)?/g,function(t,e){return e?e.toUpperCase():""})},N=function(t){return s.call(t,function(e,n){return t.indexOf(e)==n})},T.fragment=function(e,i,r){var s,u,f;return h.test(e)&&(s=n(a.createElement(RegExp.$1))),s||(e.replace&&(e=e.replace(p,"<$1></$2>")),i===t&&(i=l.test(e)&&RegExp.$1),i in b||(i="*"),f=b[i],f.innerHTML=""+e,s=n.each(o.call(f.childNodes),function(){f.removeChild(this)})),M(r)&&(u=n(s),n.each(r,function(t,e){g.indexOf(t)>-1?u[t](e):u.attr(t,e)})),s},T.Z=function(t,e){return t=t||[],t.__proto__=n.fn,t.selector=e||"",t},T.isZ=function(t){return t instanceof T.Z},T.init=function(e,i){var r;if(!e)return T.Z();if("string"==typeof e)if(e=e.trim(),"<"==e[0]&&l.test(e))r=T.fragment(e,RegExp.$1,i),e=null;else{if(i!==t)return n(i).find(e);r=T.qsa(a,e)}else{if(Z(e))return n(a).ready(e);if(T.isZ(e))return e;if(A(e))r=k(e);else if(D(e))r=[e],e=null;else if(l.test(e))r=T.fragment(e.trim(),RegExp.$1,i),e=null;else{if(i!==t)return n(i).find(e);r=T.qsa(a,e)}}return T.Z(r,e)},n=function(t,e){return T.init(t,e)},n.extend=function(t){var e,n=o.call(arguments,1);return"boolean"==typeof t&&(e=t,t=n.shift()),n.forEach(function(n){B(t,n,e)}),t},T.qsa=function(t,e){var n,i="#"==e[0],r=!i&&"."==e[0],s=i||r?e.slice(1):e,a=E.test(s);return $(t)&&a&&i?(n=t.getElementById(s))?[n]:[]:1!==t.nodeType&&9!==t.nodeType?[]:o.call(a&&!i?r?t.getElementsByClassName(s):t.getElementsByTagName(e):t.querySelectorAll(e))},n.contains=a.documentElement.contains?function(t,e){return t!==e&&t.contains(e)}:function(t,e){for(;e&&(e=e.parentNode);)if(e===t)return!0;return!1},n.type=L,n.isFunction=Z,n.isWindow=_,n.isArray=A,n.isPlainObject=M,n.isEmptyObject=function(t){var e;for(e in t)return!1;return!0},n.inArray=function(t,e,n){return r.indexOf.call(e,t,n)},n.camelCase=C,n.trim=function(t){return null==t?"":String.prototype.trim.call(t)},n.uuid=0,n.support={},n.expr={},n.map=function(t,e){var n,r,o,i=[];if(R(t))for(r=0;r<t.length;r++)n=e(t[r],r),null!=n&&i.push(n);else for(o in t)n=e(t[o],o),null!=n&&i.push(n);return z(i)},n.each=function(t,e){var n,i;if(R(t)){for(n=0;n<t.length;n++)if(e.call(t[n],n,t[n])===!1)return t}else for(i in t)if(e.call(t[i],i,t[i])===!1)return t;return t},n.grep=function(t,e){return s.call(t,e)},window.JSON&&(n.parseJSON=JSON.parse),n.each("Boolean Number String Function Array Date RegExp Object Error".split(" "),function(t,e){j["[object "+e+"]"]=e.toLowerCase()}),n.fn={forEach:r.forEach,reduce:r.reduce,push:r.push,sort:r.sort,indexOf:r.indexOf,concat:r.concat,map:function(t){return n(n.map(this,function(e,n){return t.call(e,n,e)}))},slice:function(){return n(o.apply(this,arguments))},ready:function(t){return w.test(a.readyState)&&a.body?t(n):a.addEventListener("DOMContentLoaded",function(){t(n)},!1),this},get:function(e){return e===t?o.call(this):this[e>=0?e:e+this.length]},toArray:function(){return this.get()},size:function(){return this.length},remove:function(){return this.each(function(){null!=this.parentNode&&this.parentNode.removeChild(this)})},each:function(t){return r.every.call(this,function(e,n){return t.call(e,n,e)!==!1}),this},filter:function(t){return Z(t)?this.not(this.not(t)):n(s.call(this,function(e){return T.matches(e,t)}))},add:function(t,e){return n(N(this.concat(n(t,e))))},is:function(t){return this.length>0&&T.matches(this[0],t)},not:function(e){var i=[];if(Z(e)&&e.call!==t)this.each(function(t){e.call(this,t)||i.push(this)});else{var r="string"==typeof e?this.filter(e):R(e)&&Z(e.item)?o.call(e):n(e);this.forEach(function(t){r.indexOf(t)<0&&i.push(t)})}return n(i)},has:function(t){return this.filter(function(){return D(t)?n.contains(this,t):n(this).find(t).size()})},eq:function(t){return-1===t?this.slice(t):this.slice(t,+t+1)},first:function(){var t=this[0];return t&&!D(t)?t:n(t)},last:function(){var t=this[this.length-1];return t&&!D(t)?t:n(t)},find:function(t){var e,i=this;return e=t?"object"==typeof t?n(t).filter(function(){var t=this;return r.some.call(i,function(e){return n.contains(e,t)})}):1==this.length?n(T.qsa(this[0],t)):this.map(function(){return T.qsa(this,t)}):n()},closest:function(t,e){var i=this[0],r=!1;for("object"==typeof t&&(r=n(t));i&&!(r?r.indexOf(i)>=0:T.matches(i,t));)i=i!==e&&!$(i)&&i.parentNode;return n(i)},parents:function(t){for(var e=[],i=this;i.length>0;)i=n.map(i,function(t){return(t=t.parentNode)&&!$(t)&&e.indexOf(t)<0?(e.push(t),t):void 0});return U(e,t)},parent:function(t){return U(N(this.pluck("parentNode")),t)},children:function(t){return U(this.map(function(){return V(this)}),t)},contents:function(){return this.map(function(){return o.call(this.childNodes)})},siblings:function(t){return U(this.map(function(t,e){return s.call(V(e.parentNode),function(t){return t!==e})}),t)},empty:function(){return this.each(function(){this.innerHTML=""})},pluck:function(t){return n.map(this,function(e){return e[t]})},show:function(){return this.each(function(){"none"==this.style.display&&(this.style.display=""),"none"==getComputedStyle(this,"").getPropertyValue("display")&&(this.style.display=I(this.nodeName))})},replaceWith:function(t){return this.before(t).remove()},wrap:function(t){var e=Z(t);if(this[0]&&!e)var i=n(t).get(0),r=i.parentNode||this.length>1;return this.each(function(o){n(this).wrapAll(e?t.call(this,o):r?i.cloneNode(!0):i)})},wrapAll:function(t){if(this[0]){n(this[0]).before(t=n(t));for(var e;(e=t.children()).length;)t=e.first();n(t).append(this)}return this},wrapInner:function(t){var e=Z(t);return this.each(function(i){var r=n(this),o=r.contents(),s=e?t.call(this,i):t;o.length?o.wrapAll(s):r.append(s)})},unwrap:function(){return this.parent().each(function(){n(this).replaceWith(n(this).children())}),this},clone:function(){return this.map(function(){return this.cloneNode(!0)})},hide:function(){return this.css("display","none")},toggle:function(e){return this.each(function(){var i=n(this);(e===t?"none"==i.css("display"):e)?i.show():i.hide()})},prev:function(t){return n(this.pluck("previousElementSibling")).filter(t||"*")},next:function(t){return n(this.pluck("nextElementSibling")).filter(t||"*")},html:function(t){return 0 in arguments?this.each(function(e){var i=this.innerHTML;n(this).empty().append(J(this,t,e,i))}):0 in this?this[0].innerHTML:null},text:function(t){return 0 in arguments?this.each(function(e){var n=J(this,t,e,this.textContent);this.textContent=null==n?"":""+n}):0 in this?this[0].textContent:null},attr:function(n,i){var r;return"string"!=typeof n||1 in arguments?this.each(function(t){if(1===this.nodeType)if(D(n))for(e in n)X(this,e,n[e]);else X(this,n,J(this,i,t,this.getAttribute(n)))}):this.length&&1===this[0].nodeType?!(r=this[0].getAttribute(n))&&n in this[0]?this[0][n]:r:t},removeAttr:function(t){return this.each(function(){1===this.nodeType&&t.split(" ").forEach(function(t){X(this,t)},this)})},prop:function(t,e){return t=P[t]||t,1 in arguments?this.each(function(n){this[t]=J(this,e,n,this[t])}):this[0]&&this[0][t]},data:function(e,n){var i="data-"+e.replace(m,"-$1").toLowerCase(),r=1 in arguments?this.attr(i,n):this.attr(i);return null!==r?Y(r):t},val:function(t){return 0 in arguments?this.each(function(e){this.value=J(this,t,e,this.value)}):this[0]&&(this[0].multiple?n(this[0]).find("option").filter(function(){return this.selected}).pluck("value"):this[0].value)},offset:function(t){if(t)return this.each(function(e){var i=n(this),r=J(this,t,e,i.offset()),o=i.offsetParent().offset(),s={top:r.top-o.top,left:r.left-o.left};"static"==i.css("position")&&(s.position="relative"),i.css(s)});if(!this.length)return null;var e=this[0].getBoundingClientRect();return{left:e.left+window.pageXOffset,top:e.top+window.pageYOffset,width:Math.round(e.width),height:Math.round(e.height)}},css:function(t,i){if(arguments.length<2){var r,o=this[0];if(!o)return;if(r=getComputedStyle(o,""),"string"==typeof t)return o.style[C(t)]||r.getPropertyValue(t);if(A(t)){var s={};return n.each(t,function(t,e){s[e]=o.style[C(e)]||r.getPropertyValue(e)}),s}}var a="";if("string"==L(t))i||0===i?a=F(t)+":"+H(t,i):this.each(function(){this.style.removeProperty(F(t))});else for(e in t)t[e]||0===t[e]?a+=F(e)+":"+H(e,t[e])+";":this.each(function(){this.style.removeProperty(F(e))});return this.each(function(){this.style.cssText+=";"+a})},index:function(t){return t?this.indexOf(n(t)[0]):this.parent().children().indexOf(this[0])},hasClass:function(t){return t?r.some.call(this,function(t){return this.test(W(t))},q(t)):!1},addClass:function(t){return t?this.each(function(e){if("className"in this){i=[];var r=W(this),o=J(this,t,e,r);o.split(/\s+/g).forEach(function(t){n(this).hasClass(t)||i.push(t)},this),i.length&&W(this,r+(r?" ":"")+i.join(" "))}}):this},removeClass:function(e){return this.each(function(n){if("className"in this){if(e===t)return W(this,"");i=W(this),J(this,e,n,i).split(/\s+/g).forEach(function(t){i=i.replace(q(t)," ")}),W(this,i.trim())}})},toggleClass:function(e,i){return e?this.each(function(r){var o=n(this),s=J(this,e,r,W(this));s.split(/\s+/g).forEach(function(e){(i===t?!o.hasClass(e):i)?o.addClass(e):o.removeClass(e)})}):this},scrollTop:function(e){if(this.length){var n="scrollTop"in this[0];return e===t?n?this[0].scrollTop:this[0].pageYOffset:this.each(n?function(){this.scrollTop=e}:function(){this.scrollTo(this.scrollX,e)})}},scrollLeft:function(e){if(this.length){var n="scrollLeft"in this[0];return e===t?n?this[0].scrollLeft:this[0].pageXOffset:this.each(n?function(){this.scrollLeft=e}:function(){this.scrollTo(e,this.scrollY)})}},position:function(){if(this.length){var t=this[0],e=this.offsetParent(),i=this.offset(),r=d.test(e[0].nodeName)?{top:0,left:0}:e.offset();return i.top-=parseFloat(n(t).css("margin-top"))||0,i.left-=parseFloat(n(t).css("margin-left"))||0,r.top+=parseFloat(n(e[0]).css("border-top-width"))||0,r.left+=parseFloat(n(e[0]).css("border-left-width"))||0,{top:i.top-r.top,left:i.left-r.left}}},offsetParent:function(){return this.map(function(){for(var t=this.offsetParent||a.body;t&&!d.test(t.nodeName)&&"static"==n(t).css("position");)t=t.offsetParent;return t})}},n.fn.detach=n.fn.remove,["width","height"].forEach(function(e){var i=e.replace(/./,function(t){return t[0].toUpperCase()});n.fn[e]=function(r){var o,s=this[0];return r===t?_(s)?s["inner"+i]:$(s)?s.documentElement["scroll"+i]:(o=this.offset())&&o[e]:this.each(function(t){s=n(this),s.css(e,J(this,r,t,s[e]()))})}}),v.forEach(function(t,e){var i=e%2;n.fn[t]=function(){var t,o,r=n.map(arguments,function(e){return t=L(e),"object"==t||"array"==t||null==e?e:T.fragment(e)}),s=this.length>1;return r.length<1?this:this.each(function(t,u){o=i?u:u.parentNode,u=0==e?u.nextSibling:1==e?u.firstChild:2==e?u:null;var f=n.contains(a.documentElement,o);r.forEach(function(t){if(s)t=t.cloneNode(!0);else if(!o)return n(t).remove();o.insertBefore(t,u),f&&G(t,function(t){null==t.nodeName||"SCRIPT"!==t.nodeName.toUpperCase()||t.type&&"text/javascript"!==t.type||t.src||window.eval.call(window,t.innerHTML)})})})},n.fn[i?t+"To":"insert"+(e?"Before":"After")]=function(e){return n(e)[t](this),this}}),T.Z.prototype=n.fn,T.uniq=N,T.deserializeValue=Y,n.zepto=T,n}();window.Zepto=Zepto,void 0===window.$&&(window.$=Zepto),function(t){function l(t){return t._zid||(t._zid=e++)}function h(t,e,n,i){if(e=p(e),e.ns)var r=d(e.ns);return(s[l(t)]||[]).filter(function(t){return!(!t||e.e&&t.e!=e.e||e.ns&&!r.test(t.ns)||n&&l(t.fn)!==l(n)||i&&t.sel!=i)})}function p(t){var e=(""+t).split(".");return{e:e[0],ns:e.slice(1).sort().join(" ")}}function d(t){return new RegExp("(?:^| )"+t.replace(" "," .* ?")+"(?: |$)")}function m(t,e){return t.del&&!u&&t.e in f||!!e}function g(t){return c[t]||u&&f[t]||t}function v(e,i,r,o,a,u,f){var h=l(e),d=s[h]||(s[h]=[]);i.split(/\s/).forEach(function(i){if("ready"==i)return t(document).ready(r);var s=p(i);s.fn=r,s.sel=a,s.e in c&&(r=function(e){var n=e.relatedTarget;return!n||n!==this&&!t.contains(this,n)?s.fn.apply(this,arguments):void 0}),s.del=u;var l=u||r;s.proxy=function(t){if(t=j(t),!t.isImmediatePropagationStopped()){t.data=o;var i=l.apply(e,t._args==n?[t]:[t].concat(t._args));return i===!1&&(t.preventDefault(),t.stopPropagation()),i}},s.i=d.length,d.push(s),"addEventListener"in e&&e.addEventListener(g(s.e),s.proxy,m(s,f))})}function y(t,e,n,i,r){var o=l(t);(e||"").split(/\s/).forEach(function(e){h(t,e,n,i).forEach(function(e){delete s[o][e.i],"removeEventListener"in t&&t.removeEventListener(g(e.e),e.proxy,m(e,r))})})}function j(e,i){return(i||!e.isDefaultPrevented)&&(i||(i=e),t.each(E,function(t,n){var r=i[t];e[t]=function(){return this[n]=x,r&&r.apply(i,arguments)},e[n]=b}),(i.defaultPrevented!==n?i.defaultPrevented:"returnValue"in i?i.returnValue===!1:i.getPreventDefault&&i.getPreventDefault())&&(e.isDefaultPrevented=x)),e}function S(t){var e,i={originalEvent:t};for(e in t)w.test(e)||t[e]===n||(i[e]=t[e]);return j(i,t)}var n,e=1,i=Array.prototype.slice,r=t.isFunction,o=function(t){return"string"==typeof t},s={},a={},u="onfocusin"in window,f={focus:"focusin",blur:"focusout"},c={mouseenter:"mouseover",mouseleave:"mouseout"};a.click=a.mousedown=a.mouseup=a.mousemove="MouseEvents",t.event={add:v,remove:y},t.proxy=function(e,n){var s=2 in arguments&&i.call(arguments,2);if(r(e)){var a=function(){return e.apply(n,s?s.concat(i.call(arguments)):arguments)};return a._zid=l(e),a}if(o(n))return s?(s.unshift(e[n],e),t.proxy.apply(null,s)):t.proxy(e[n],e);throw new TypeError("expected function")},t.fn.bind=function(t,e,n){return this.on(t,e,n)},t.fn.unbind=function(t,e){return this.off(t,e)},t.fn.one=function(t,e,n,i){return this.on(t,e,n,i,1)};var x=function(){return!0},b=function(){return!1},w=/^([A-Z]|returnValue$|layer[XY]$)/,E={preventDefault:"isDefaultPrevented",stopImmediatePropagation:"isImmediatePropagationStopped",stopPropagation:"isPropagationStopped"};t.fn.delegate=function(t,e,n){return this.on(e,t,n)},t.fn.undelegate=function(t,e,n){return this.off(e,t,n)},t.fn.live=function(e,n){return t(document.body).delegate(this.selector,e,n),this},t.fn.die=function(e,n){return t(document.body).undelegate(this.selector,e,n),this},t.fn.on=function(e,s,a,u,f){var c,l,h=this;return e&&!o(e)?(t.each(e,function(t,e){h.on(t,s,a,e,f)}),h):(o(s)||r(u)||u===!1||(u=a,a=s,s=n),(r(a)||a===!1)&&(u=a,a=n),u===!1&&(u=b),h.each(function(n,r){f&&(c=function(t){return y(r,t.type,u),u.apply(this,arguments)}),s&&(l=function(e){var n,o=t(e.target).closest(s,r).get(0);return o&&o!==r?(n=t.extend(S(e),{currentTarget:o,liveFired:r}),(c||u).apply(o,[n].concat(i.call(arguments,1)))):void 0}),v(r,e,u,a,s,l||c)}))},t.fn.off=function(e,i,s){var a=this;return e&&!o(e)?(t.each(e,function(t,e){a.off(t,i,e)}),a):(o(i)||r(s)||s===!1||(s=i,i=n),s===!1&&(s=b),a.each(function(){y(this,e,s,i)}))},t.fn.trigger=function(e,n){return e=o(e)||t.isPlainObject(e)?t.Event(e):j(e),e._args=n,this.each(function(){e.type in f&&"function"==typeof this[e.type]?this[e.type]():"dispatchEvent"in this?this.dispatchEvent(e):t(this).triggerHandler(e,n)})},t.fn.triggerHandler=function(e,n){var i,r;return this.each(function(s,a){i=S(o(e)?t.Event(e):e),i._args=n,i.target=a,t.each(h(a,e.type||e),function(t,e){return r=e.proxy(i),i.isImmediatePropagationStopped()?!1:void 0})}),r},"focusin focusout focus blur load resize scroll unload click dblclick mousedown mouseup mousemove mouseover mouseout mouseenter mouseleave change select keydown keypress keyup error".split(" ").forEach(function(e){t.fn[e]=function(t){return 0 in arguments?this.bind(e,t):this.trigger(e)}}),t.Event=function(t,e){o(t)||(e=t,t=e.type);var n=document.createEvent(a[t]||"Events"),i=!0;if(e)for(var r in e)"bubbles"==r?i=!!e[r]:n[r]=e[r];return n.initEvent(t,i,!0),j(n)}}(Zepto),function(t){function h(e,n,i){var r=t.Event(n);return t(e).trigger(r,i),!r.isDefaultPrevented()}function p(t,e,i,r){return t.global?h(e||n,i,r):void 0}function d(e){e.global&&0===t.active++&&p(e,null,"ajaxStart")}function m(e){e.global&&!--t.active&&p(e,null,"ajaxStop")}function g(t,e){var n=e.context;return e.beforeSend.call(n,t,e)===!1||p(e,n,"ajaxBeforeSend",[t,e])===!1?!1:void p(e,n,"ajaxSend",[t,e])}function v(t,e,n,i){var r=n.context,o="success";n.success.call(r,t,o,e),i&&i.resolveWith(r,[t,o,e]),p(n,r,"ajaxSuccess",[e,n,t]),x(o,e,n)}function y(t,e,n,i,r){var o=i.context;i.error.call(o,n,e,t),r&&r.rejectWith(o,[n,e,t]),p(i,o,"ajaxError",[n,i,t||e]),x(e,n,i)}function x(t,e,n){var i=n.context;n.complete.call(i,e,t),p(n,i,"ajaxComplete",[e,n]),m(n)}function b(){}function w(t){return t&&(t=t.split(";",2)[0]),t&&(t==f?"html":t==u?"json":s.test(t)?"script":a.test(t)&&"xml")||"text"}function E(t,e){return""==e?t:(t+"&"+e).replace(/[&?]{1,2}/,"?")}function j(e){e.processData&&e.data&&"string"!=t.type(e.data)&&(e.data=t.param(e.data,e.traditional)),!e.data||e.type&&"GET"!=e.type.toUpperCase()||(e.url=E(e.url,e.data),e.data=void 0)}function S(e,n,i,r){return t.isFunction(n)&&(r=i,i=n,n=void 0),t.isFunction(i)||(r=i,i=void 0),{url:e,data:n,success:i,dataType:r}}function C(e,n,i,r){var o,s=t.isArray(n),a=t.isPlainObject(n);t.each(n,function(n,u){o=t.type(u),r&&(n=i?r:r+"["+(a||"object"==o||"array"==o?n:"")+"]"),!r&&s?e.add(u.name,u.value):"array"==o||!i&&"object"==o?C(e,u,i,n):e.add(n,u)})}var i,r,e=0,n=window.document,o=/<script\b[^<]*(?:(?!<\/script>)<[^<]*)*<\/script>/gi,s=/^(?:text|application)\/javascript/i,a=/^(?:text|application)\/xml/i,u="application/json",f="text/html",c=/^\s*$/,l=n.createElement("a");l.href=window.location.href,t.active=0,t.ajaxJSONP=function(i,r){if(!("type"in i))return t.ajax(i);var f,h,o=i.jsonpCallback,s=(t.isFunction(o)?o():o)||"jsonp"+ ++e,a=n.createElement("script"),u=window[s],c=function(e){t(a).triggerHandler("error",e||"abort")},l={abort:c};return r&&r.promise(l),t(a).on("load error",function(e,n){clearTimeout(h),t(a).off().remove(),"error"!=e.type&&f?v(f[0],l,i,r):y(null,n||"error",l,i,r),window[s]=u,f&&t.isFunction(u)&&u(f[0]),u=f=void 0}),g(l,i)===!1?(c("abort"),l):(window[s]=function(){f=arguments},a.src=i.url.replace(/\?(.+)=\?/,"?$1="+s),n.head.appendChild(a),i.timeout>0&&(h=setTimeout(function(){c("timeout")},i.timeout)),l)},t.ajaxSettings={type:"GET",beforeSend:b,success:b,error:b,complete:b,context:null,global:!0,xhr:function(){return new window.XMLHttpRequest},accepts:{script:"text/javascript, application/javascript, application/x-javascript",json:u,xml:"application/xml, text/xml",html:f,text:"text/plain"},crossDomain:!1,timeout:0,processData:!0,cache:!0},t.ajax=function(e){var a,o=t.extend({},e||{}),s=t.Deferred&&t.Deferred();for(i in t.ajaxSettings)void 0===o[i]&&(o[i]=t.ajaxSettings[i]);d(o),o.crossDomain||(a=n.createElement("a"),a.href=o.url,a.href=a.href,o.crossDomain=l.protocol+"//"+l.host!=a.protocol+"//"+a.host),o.url||(o.url=window.location.toString()),j(o);var u=o.dataType,f=/\?.+=\?/.test(o.url);if(f&&(u="jsonp"),o.cache!==!1&&(e&&e.cache===!0||"script"!=u&&"jsonp"!=u)||(o.url=E(o.url,"_="+Date.now())),"jsonp"==u)return f||(o.url=E(o.url,o.jsonp?o.jsonp+"=?":o.jsonp===!1?"":"callback=?")),t.ajaxJSONP(o,s);var C,h=o.accepts[u],p={},m=function(t,e){p[t.toLowerCase()]=[t,e]},x=/^([\w-]+:)\/\//.test(o.url)?RegExp.$1:window.location.protocol,S=o.xhr(),T=S.setRequestHeader;if(s&&s.promise(S),o.crossDomain||m("X-Requested-With","XMLHttpRequest"),m("Accept",h||"*/*"),(h=o.mimeType||h)&&(h.indexOf(",")>-1&&(h=h.split(",",2)[0]),S.overrideMimeType&&S.overrideMimeType(h)),(o.contentType||o.contentType!==!1&&o.data&&"GET"!=o.type.toUpperCase())&&m("Content-Type",o.contentType||"application/x-www-form-urlencoded"),o.headers)for(r in o.headers)m(r,o.headers[r]);if(S.setRequestHeader=m,S.onreadystatechange=function(){if(4==S.readyState){S.onreadystatechange=b,clearTimeout(C);var e,n=!1;if(S.status>=200&&S.status<300||304==S.status||0==S.status&&"file:"==x){u=u||w(o.mimeType||S.getResponseHeader("content-type")),e=S.responseText;try{"script"==u?(1,eval)(e):"xml"==u?e=S.responseXML:"json"==u&&(e=c.test(e)?null:t.parseJSON(e))}catch(i){n=i}n?y(n,"parsererror",S,o,s):v(e,S,o,s)}else y(S.statusText||null,S.status?"error":"abort",S,o,s)}},g(S,o)===!1)return S.abort(),y(null,"abort",S,o,s),S;if(o.xhrFields)for(r in o.xhrFields)S[r]=o.xhrFields[r];var N="async"in o?o.async:!0;S.open(o.type,o.url,N,o.username,o.password);for(r in p)T.apply(S,p[r]);return o.timeout>0&&(C=setTimeout(function(){S.onreadystatechange=b,S.abort(),y(null,"timeout",S,o,s)},o.timeout)),S.send(o.data?o.data:null),S},t.get=function(){return t.ajax(S.apply(null,arguments))},t.post=function(){var e=S.apply(null,arguments);return e.type="POST",t.ajax(e)},t.getJSON=function(){var e=S.apply(null,arguments);return e.dataType="json",t.ajax(e)},t.fn.load=function(e,n,i){if(!this.length)return this;var a,r=this,s=e.split(/\s/),u=S(e,n,i),f=u.success;return s.length>1&&(u.url=s[0],a=s[1]),u.success=function(e){r.html(a?t("<div>").html(e.replace(o,"")).find(a):e),f&&f.apply(r,arguments)},t.ajax(u),this};var T=encodeURIComponent;t.param=function(e,n){var i=[];return i.add=function(e,n){t.isFunction(n)&&(n=n()),null==n&&(n=""),this.push(T(e)+"="+T(n))},C(i,e,n),i.join("&").replace(/%20/g,"+")}}(Zepto),function(t){t.fn.serializeArray=function(){var e,n,i=[],r=function(t){return t.forEach?t.forEach(r):void i.push({name:e,value:t})};return this[0]&&t.each(this[0].elements,function(i,o){n=o.type,e=o.name,e&&"fieldset"!=o.nodeName.toLowerCase()&&!o.disabled&&"submit"!=n&&"reset"!=n&&"button"!=n&&"file"!=n&&("radio"!=n&&"checkbox"!=n||o.checked)&&r(t(o).val())}),i},t.fn.serialize=function(){var t=[];return this.serializeArray().forEach(function(e){t.push(encodeURIComponent(e.name)+"="+encodeURIComponent(e.value))}),t.join("&")},t.fn.submit=function(e){if(0 in arguments)this.bind("submit",e);else if(this.length){var n=t.Event("submit");this.eq(0).trigger(n),n.isDefaultPrevented()||this.get(0).submit()}return this}}(Zepto),function(t){"__proto__"in{}||t.extend(t.zepto,{Z:function(e,n){return e=e||[],t.extend(e,t.fn),e.selector=n||"",e.__Z=!0,e},isZ:function(e){return"array"===t.type(e)&&"__Z"in e}});try{getComputedStyle(void 0)}catch(e){var n=getComputedStyle;window.getComputedStyle=function(t){try{return n(t)}catch(e){return null}}}}(Zepto);

Zepto.smartScroll = function(container, selectorScrollable) {
    // 如果没有滚动容器选择器，或者已经绑定了滚动时间，忽略
    if (!selectorScrollable || container.data('isBindScroll')) {
        return;
    }

    // 是否是搓浏览器
    // 自己在这里添加判断和筛选
    var isSBBrowser;

    var data = {
        posY: 0,
        maxscroll: 0
    };

    // 事件处理
    container.on({
        touchstart: function (event) {
            var events = event.touches[0] || event;

            // 先求得是不是滚动元素或者滚动元素的子元素
            var elTarget = $(event.target);

            if (!elTarget.length) {
                return;
            }

            var elScroll;

            // 获取标记的滚动元素，自身或子元素皆可
            if (elTarget.is(selectorScrollable)) {
                elScroll = elTarget;
            } else if ((elScroll = elTarget.parents(selectorScrollable)).length == 0) {
                elScroll = null;
            }

            if (!elScroll) {
                return;
            }

            // 当前滚动元素标记
            data.elScroll = elScroll;

            // 垂直位置标记
            data.posY = events.pageY;
            data.scrollY = elScroll.scrollTop();
            // 是否可以滚动
            data.maxscroll = elScroll[0].scrollHeight - elScroll[0].clientHeight;
        },
        touchmove: function (event) {
            // 如果不足于滚动，则禁止触发整个窗体元素的滚动
            if (data.maxscroll <= 0 || isSBBrowser) {
                // 禁止滚动
                event.preventDefault();
            }
            // 滚动元素
            var elScroll = data.elScroll;
            // 当前的滚动高度
            var scrollTop = elScroll.scrollTop();

            // 现在移动的垂直位置，用来判断是往上移动还是往下
            var events = event.touches[0] || event;
            // 移动距离
            var distanceY = events.pageY - data.posY;

            if (isSBBrowser) {
                elScroll.scrollTop(data.scrollY - distanceY);
                elScroll.trigger('scroll');
                return;
            }

            // 上下边缘检测
            if (distanceY > 0 && scrollTop == 0) {
                // 往上滑，并且到头
                // 禁止滚动的默认行为
                event.preventDefault();
                return;
            }

            // 下边缘检测
            if (distanceY < 0 && (scrollTop + 1 >= data.maxscroll)) {
                // 往下滑，并且到头
                // 禁止滚动的默认行为
                event.preventDefault();
                return;
            }
        },
        touchend: function () {
            data.maxscroll = 0;
        }
    });

    // 防止多次重复绑定
    container.data('isBindScroll', true);
};

(function($) {
    // 头部菜单
    var $body = $('body');
    $('.headerbox').each(function(){
        var $this = $(this);
        var $win = $(window);
        var $top = $this.find('.top');
        var $menu = $this.find('.xlmenu_box');

        $menu.wrapInner('<div class="xlmenu_box_inner"></div>');
        $('.xlbtn').on('click', function(){
            // alert($win.height()+'==='+document.body.offsetHeight)

            if(!$body.hasClass('menu-cover')){
                $body.removeClass('search-cover').addClass('menu-cover');
                $menu.find('.xlmenu_box_inner').height($win.height() - $top.height()).scrollTop(0);
                // Safari浏览器 窗体不滚动处理
                $.smartScroll($menu, '.xlmenu_box_inner');
            }
            else{
                $body.removeClass('menu-cover');
            }

        })
    })
}(Zepto));

function jumpDszb(){
    window.location.href='http://zx.323065.com/mcommon/tlzixun/?site=xzl&from=M-daohang';
}
