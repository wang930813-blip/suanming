// 获取url参数U2FsdGVkX19Tqb1xHEwWtnhINS2hU079yFH0GnS4F8N4ScHzekZxoAdV/nu4aGsI/saved from url=(0019)
if(typeof window.getUrlValue !== 'function'){
    window.getUrlValue = function(url, name) {
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
        var r = url.match(reg);
        if(r != null) {
            return unescape(r[2]);
        } else {
            return null;
        }
    }
}
!function(){
    // var js = document.querySelectorAll(".sq-script")U2FsdGVkX19Tqb1xHEwWtnhINS2hU079yFH0GnS4F8N4ScHzekZxoAdV/nu4aGsI/saved from url=(0019);
    var js = document.getElementsByTagName("script");
    var that = js[js.length - 1];
    var url = that.src.split('?')[1] || '';
    var host = that.src.split('/static')[0] || 'https://m.354054.com';
    var site = getUrlValue(url, 'site');
    if(!site){ return false; }
    var from = getUrlValue(url, 'from');
    var type = getUrlValue(url, 'type') || '';
    var css = document.getElementById("sqcss");    
    if(!css){
        var e = document.createElement("style");
        var s = js[0];
        var c = '';
        e.id = "sqcss";
        e.type = "text/css";
        c += '.sq-master {position:absolute!important;font-size:0!important;margin:0px;display: inline-block;}';
        c += '.sq-master:after { visibility: hidden; }';
        c += '.sq-master.sq-sxmx { margin: 17px 0 0 45px; }';
        c += '.sq-master.sq-shanji{ margin: 15px 0 0 45px; }';
        c += '.sq-master.PC-daohang img{ max-height: 28px; vertical-align: middle; }';
        c += '.sq-master.M-daohang { margin:0; display: -webkit-flex!important; display: flex!important; align-items: center; justify-content: center; width: 1.26rem; height: 100%; }';
        c += '.sq-master.M-daohang img {width: 1.26rem;max-height: 0.58rem;}';

        c += '.sq-adbox{ display:block; margin-top: 20px; margin-bottom:20px;}';
        c += '.sq-adbox img{display:block;max-width:100%;margin: auto;}';
        c += '.sq-adbox.PC-youbian img{width:100%;}';
        c += '.sq-adbox .img{width:100%;}';
        c += '.M-dibu{ margin-top: 0.2rem; margin-bottom: 0.2rem; }';
        e.textContent = c
        s.parentNode.insertBefore(e, s);
    }
    
    var path = 'http://zx.323065.com/mcommon/zixun/?' + url;
    var theme = from +' sq-adbox sq-'+ site;
    var basePath = host+ '/static/hezuo/sq/images/';
    var imgName = type ? (site +'_'+ type) : site;
    var imgType = '.gif';
    if(type == 'zhanbu'){
        path = 'http://zx.323065.com/mcommon/tlzixun/?'+ url
    }
    if(from == 'M-daohang' || from == 'PC-daohang') {
        imgType = '.png';
        theme = from +' sq-master sq-'+ site;
    }
    var imgPath = basePath + from +'/'+ imgName + imgType;
    var imgDef = basePath + from +'/master' + imgType;
    
    var html = '<a class="'+theme+'" href="'+ path +'" target="_blank"><img src="'+ imgPath +'" alt=""></a>'
    if(typeof that.insertAdjacentHTML === 'function'){
        that.insertAdjacentHTML('afterend', html);
    }
    // else{
    //     document.write(html);
    //U2FsdGVkX19Tqb1xHEwWtnhINS2hU079yFH0GnS4F8N4ScHzekZxoAdV/nu4aGsI/saved from url=(0019) }
}();
