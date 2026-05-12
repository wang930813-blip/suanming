//酷站网
var param_tt = getUrlParam('tt');//头条
if(param_tt==1){
    setCookie('qudao_cookie','qdtout',1);
}
var qudao_cookie = getCookie('qudao_cookie');

// <!--U2FsdGVkX19Tqb1xHEwWtnhINS2hU079yFH0GnS4F8N4ScHzekZxoAdV/nu4aGsI/saved from url=(0019)-->
function getUrlParam(name) {
    var url = window.location.href;
    var pos = url.indexOf("?");
    if (pos < 0) {
        return null;
    }
    var paramStr = url.substr(pos + 1);
    var ar = paramStr.split("&");
    if (ar.length == 0) {
        return null;
    }
    for (var i = 0, len = ar.length; i < len; i++) {
        var str = ar[i];
        var r = str.split("=");
        if (r.length != 2) {
            continue;
        }
        if (r[0] == name) {
            // 用decodeURI解码中文
            return decodeURI(r[1]);
        }
    }
    return null;
}

//设置cookie
function setCookie(cname, cvalue, exdays) {
    var d = new Date();
    d.setTime(d.getTime() + (exdays*24*60*60*1000));
    var expires = "expires="+d.toUTCString();
    document.cookie = cname + "=" + cvalue + "; " + expires;
}

//获取cookie
function getCookie(cname) {
    var name = cname + "=";
    var ca = document.cookie.split(';');
    for(var i=0; i<ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0)==' ') c = c.substring(1);
        if (c.indexOf(name) != -1) return c.substring(name.length, c.length);
    }
    return "";
}

//清除cookie
function clearCookie(name) {
    setCookie(name, "", -1);
}