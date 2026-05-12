// new function() {
//     var _self = this;
//     _self.width = 720;
//     _self.fontSize = 100;
//     _self.widthProportion = function() {
//         var p = (document.body && document.body.clientWidth || document.getElementsByTagName("html")[0].offsetWidth) / _self.width;
//         return p > 1 ? 1 : p < 0.3 ? 0.3 : p;
//     };
//     _self.changePage = function() {
//         document.getElementsByTagName("html")[0].setAttribute("style", "font-size:" + _self.widthProportion() * _self.fontSize + "px");
//     }
//     _self.changePage();
//     window.addEventListener('resize', function() {
//         _self.changePage();
//     }, false);
// };


$(function() {
    // 农历日历选择插件
    if ($('.Js_date').length > 0) {
        for (var i = 0, max = $('.Js_date').length; i < max; i++) {
            var calendar1 = new lCalendar().init('#' + $('.Js_date').eq(i).attr('id'));
        }
    }
});

//验证中文字符
function isChinese(str) {
    var badChar = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    badChar += "abcdefghijklmnopqrstuvwxyz";
    badChar += "0123456789";
    badChar += " " + "　"; //半角与全角空格
    badChar += "`~!@#$%^&()-_=+]\\|:;\"\\'<,>?/"; //不包含*或.的英文符号
    if ("" == str) {
        return false;
    }
    for (var i = 0; i < str.length; i++) {
        var c = str.charAt(i); //字符串str中的字符
        if (badChar.indexOf(c) > -1) {
            return false;
        }
    }
    return true;
}

//点击提交按钮的验证
function checkdata(myForm) {
    if (myForm == "form1") {
        if (document.form1.StrName.value.length > 4 || document.form1.StrName.value.length < 2 || isChinese(document.form1.StrName.value) == false) {
            window.alert("请输入二到四个汉字的中文姓名！");
            document.form1.StrName.focus();
            return false;
        }

        var sex = document.getElementsByName("Sex");
        for (i = 0; i < sex.length; i++) {
            if (document.getElementsByName("Sex")[i].checked) {
                document.getElementById("StrSex").value = document.getElementsByName("Sex")[i].value;
            }
        }

        var mandate = document.getElementById("date1").value;
        if (mandate == "") {
            window.alert("请选择出生日期");
            return false;
        } else {
            var str = mandate.split("-");
            var nian = str[0];
            var yue = str[1];
            if (yue < 10) {
                yue = "0" + yue;
            }
            var ri = str[2];
            if (ri < 10) {
                ri = "0" + ri;
            }
            var shi = document.getElementById("hour1").value;
            if (shi < 10) {
                shi = "0" + shi;
            }
            document.form1.StrYear1.value = nian;
            document.form1.StrMonth.value = yue;
            document.form1.StrDay.value = ri;
            document.form1.StrTime.value = shi;
        }

        var y = eval(nian);
        var m = eval(yue);
        var d = eval(ri);
        var h = eval(document.form1.StrTime.value);

        var i = 0;

        m = m - 1;
        d = d - 1;

        var sTermInfo = new Array(0, 21198, 42461, 63813, 85308, 106961, 128806, 150834, 173055, 195433, 217965, 240558, 263215, 285853, 308440, 330912, 353245, 375400, 397371, 419149, 440750, 462193, 483513, 504747);

        function wzc(year, num) {
            var objD = new Date((31556956000 * (year - 1882) + sTermInfo[num] * 60000) + Date.UTC(1882, 0, 5, 18, 0));
            var hh = objD.getUTCHours();
            var mm = objD.getUTCMinutes();
            var ss = objD.getUTCSeconds();
            var s = num + '/(' + (objD.getUTCMonth() + 1) + "月" + objD.getUTCDate() + "日" + hh + ":" + mm + ')';
            return (s);
        }

        function sTerm_d(y, n) {
            var offDate = new Date((31556956000 * (y - 1882) + sTermInfo[n] * 60000) + Date.UTC(1882, 0, 5, 18, 0));
            return (offDate.getUTCDate());
        }

        function sTerm_hi(y, n) {
            var offDate = new Date((31556956000 * (y - 1882) + sTermInfo[n] * 60000) + Date.UTC(1882, 0, 5, 18, 0));
            var hi = offDate.getUTCHours() * 60 + offDate.getUTCMinutes();
            return (hi);
        }

        function sTerm_s(y, n) {
            var offDate = new Date((31556956000 * (y - 1882) + sTermInfo[n] * 60000) + Date.UTC(1882, 0, 5, 18, 0));
            return (offDate);
        }

        var cY, cM, cD, cH;
        if (m < 2) {
            cY = y - 1900 + 36 - 1;
        } else {
            cY = y - 1900 + 36;
        }

        var term2 = sTerm_d(y, 2);
        if (m == 1 && (d + 1) > term2) {
            cY = y - 1900 + 36;
        }

        if (m == 1 && (d + 1) == term2 && (h * 60 + i) >= sTerm_hi(y, 2)) {
            cY = y - 1900 + 36;
        }

        var firstNode = sTerm_d(y, m * 2);
        cM = (y - 1900) * 12 + m + 12;
        var start_term = (Date.UTC(y, m, d + 1, h, i, 0, 0) - sTerm_s(y, m * 2 - 2)) / 1000;
        var start_term1 = wzc(y, m * 2 - 2);
        if (m == 0) {
            start_term = (Date.UTC(y, m, d + 1, h, i, 0, 0) - sTerm_s(y - 1, 22)) / 1000;
            start_term1 = wzc(y - 1, 22);
        }
        var end_term = (sTerm_s(y, m * 2) - Date.UTC(y, m, d + 1, h, i, 0)) / 1000;
        var end_term1 = wzc(y, m * 2);
        if ((d + 1) > firstNode || ((d + 1) == firstNode && (h * 60 + i * 1) >= sTerm_hi(y, m * 2))) {
            cM = (y - 1900) * 12 + m + 13;
            start_term = (Date.UTC(y, m, d + 1, h, i, 0, 0) - sTerm_s(y, m * 2)) / 1000;
            start_term1 = wzc(y, m * 2);
            end_term = (sTerm_s(y, m * 2 + 2) - Date.UTC(y, m, d + 1, h, i, 0)) / 1000;
            end_term1 = wzc(y, m * 2 + 2);
            if (m == 11) {
                end_term = (sTerm_s(y + 1, 0) - Date.UTC(y, m, d + 1, h, i, 0, 0)) / 1000;
                end_term1 = wzc(y + 1, 0);
            }
        }

        if (start_term < 0) start_term = 0;
        if (end_term < 0) end_term = 0;
        var dayCyclical = Date.UTC(y, m, 1, 0, 0, 0, 0) / 86400000 + 25567 + 10;
        cD = dayCyclical + d;
        if (h >= 23) cD = dayCyclical + d + 1;
        var nh;
        if (h == 23 || h == 1 || h == 3 || h == 5 || h == 7 || h == 9 || h == 11 || h == 13 || h == 15 || h == 17 || h == 19 || h == 21) {
            nh = h - 1;
            nh = nh + 2;
        } else {
            nh = h;
        }

        var houseCyclical = (Date.UTC(y, m, d + 1, nh, 0, 0, 0) / 3600000 + 25567 * 24) / 2;
        cH = houseCyclical;

        document.form1.cY.value = cY;
        document.form1.cM.value = cM;
        document.form1.cD.value = cD;
        document.form1.cH.value = cH;

        document.form1.submit();
    } else if (myForm == "form2") {
        if (document.form2.StrName.value.length > 4 || document.form2.StrName.value.length < 2 || isChinese(document.form2.StrName.value) == false) {
            window.alert("请输入二到四个汉字的中文姓名");
            document.form2.StrName.focus();
            return false;
        }

        var sex = document.getElementsByName("Sex");
        for (i = 0; i < sex.length; i++) {
            if (document.getElementsByName("Sex")[i].checked) {
                document.getElementById("StrSex").value = document.getElementsByName("Sex")[i].value;
            }
        }

        var mandate = document.getElementById("date1").value;
        if (mandate == "") {
            window.alert("请选择出生日期");
            return false;
        } else {
            var str = mandate.split("-");
            var nian = str[0];
            var yue = str[1];
            if (yue < 10) {
                yue = "0" + yue;
            }
            var ri = str[2];
            if (ri < 10) {
                ri = "0" + ri;
            }
            var shi = document.getElementById("hour1").value;
            if (shi < 1) {
                shi = "早子(00:00~00:59)";
            } else if (shi > 0 && shi < 3) {
                shi = "丑(01:00~02:59)";
            } else if (shi > 2 && shi < 5) {
                shi = "寅(03:00~04:59)";
            } else if (shi > 4 && shi < 7) {
                shi = "卯(05:00~06:59)";
            } else if (shi > 6 && shi < 9) {
                shi = "辰(07:00~08:59)";
            } else if (shi > 8 && shi < 11) {
                shi = "巳(09:00~10:59)";
            } else if (shi > 10 && shi < 13) {
                shi = "午(11:00~12:59)";
            } else if (shi > 12 && shi < 15) {
                shi = "未(13:00~14:59)";
            } else if (shi > 14 && shi < 17) {
                shi = "申(15:00~16:59)";
            } else if (shi > 16 && shi < 19) {
                shi = "酉(17:00~18:59)";
            } else if (shi > 18 && shi < 21) {
                shi = "戌(19:00~20:59)";
            } else if (shi > 20 && shi < 23) {
                shi = "亥(21:00~22:59)";
            } else if (shi > 22) {
                shi = "晚子(23:00~23:59)";
            }
            document.form2.StrYear1.value = nian;
            document.form2.StrMonth.value = yue;
            document.form2.StrDay.value = ri;
            document.form2.StrTime.value = shi;
        }

        document.form2.submit();
    } else if (myForm == "form3") {
        if (document.form3.StrLName.value.length == 0 || document.form3.StrLName.value.length > 2 || isChinese(document.form3.StrLName.value) == false) {
            window.alert("请输入一个到二个汉字的中文姓");
            document.form3.StrLName.focus();
            return false;
        }

        var UserName = document.form3.StrLName.value;
        ajax_keyword(UserName);
        var zhi = document.getElementById("result").innerHTML;
        if (zhi == "0") {
            window.alert("请输入正确的姓氏");
            document.form3.StrLName.focus();
            return false;
        }

        if (document.form3.StrFName.value.length == 0 || document.form3.StrFName.value.length > 2 || isChinese(document.form3.StrFName.value) == false) {
            window.alert("请输入一个到二个汉字的中文名");
            document.form3.StrFName.focus();
            return false;
        }

        var sex = document.getElementsByName("Sex");
        for (i = 0; i < sex.length; i++) {
            if (document.getElementsByName("Sex")[i].checked) {
                document.getElementById("StrSex").value = document.getElementsByName("Sex")[i].value;
            }
        }

        var mandate = document.getElementById("date1").value;
        if (mandate == "") {
            window.alert("请选择出生日期");
            return false;
        } else {
            var str = mandate.split("-");
            var nian = str[0];
            var yue = str[1];
            if (yue < 10) {
                yue = "0" + yue;
            }
            var ri = str[2];
            if (ri < 10) {
                ri = "0" + ri;
            }
            var shi = document.getElementById("hour1").value;
            if (shi < 10) {
                shi = "0" + shi;
            }
            document.form3.StrYear1.value = nian;
            document.form3.StrMonth.value = yue;
            document.form3.StrDay.value = ri;
            document.form3.StrTime.value = shi;
        }

        document.form3.submit();
    } else if (myForm == "form4") {
        if (document.form4.StrName.value.length > 4 || document.form4.StrName.value.length < 2 || isChinese(document.form4.StrName.value) == false) {
            window.alert("请输入二到四个汉字的中文姓名！");
            document.form4.StrName.focus();
            return false;
        }

        var sex = document.getElementsByName("Sex");
        for (i = 0; i < sex.length; i++) {
            if (document.getElementsByName("Sex")[i].checked) {
                document.getElementById("StrSex").value = document.getElementsByName("Sex")[i].value;
            }
        }

        var mandate = document.getElementById("date1").value;
        if (mandate == "") {
            window.alert("请选择出生日期");
            return false;
        } else {
            var str = mandate.split("-");
            var nian = str[0];
            var yue = str[1];
            if (yue < 10) {
                yue = "0" + yue;
            }
            var ri = str[2];
            if (ri < 10) {
                ri = "0" + ri;
            }
            var shi = document.getElementById("hour1").value;
            if (shi < 10) {
                shi = "0" + shi;
            }
            document.form4.StrYear1.value = nian;
            document.form4.StrMonth.value = yue;
            document.form4.StrDay.value = ri;
            document.form4.StrTime.value = shi;
        }

        document.form4.submit();
    } else if (myForm == "form5") {
        if (document.form5.StrName.value.length > 4 || document.form5.StrName.value.length < 2 || isChinese(document.form5.StrName.value) == false) {
            window.alert("请输入二到四个汉字的中文姓名");
            document.form5.StrName.focus();
            return false;
        }

        var sex = document.getElementsByName("Sex");
        for (i = 0; i < sex.length; i++) {
            if (document.getElementsByName("Sex")[i].checked) {
                document.getElementById("StrSex").value = document.getElementsByName("Sex")[i].value;
            }
        }

        var mandate = document.getElementById("date1").value;
        if (mandate == "") {
            window.alert("请选择出生日期");
            return false;
        } else {
            var str = mandate.split("-");
            var nian = str[0];
            var yue = str[1];
            if (yue < 10) {
                yue = "0" + yue;
            }
            var ri = str[2];
            if (ri < 10) {
                ri = "0" + ri;
            }
            var shi = document.getElementById("hour1").value;
            if (shi < 1) {
                shi = "01";
            } else if (shi > 0 && shi < 3) {
                shi = "02";
            } else if (shi > 2 && shi < 5) {
                shi = "03";
            } else if (shi > 4 && shi < 7) {
                shi = "04";
            } else if (shi > 6 && shi < 9) {
                shi = "05";
            } else if (shi > 8 && shi < 11) {
                shi = "06";
            } else if (shi > 10 && shi < 13) {
                shi = "07";
            } else if (shi > 12 && shi < 15) {
                shi = "08";
            } else if (shi > 14 && shi < 17) {
                shi = "09";
            } else if (shi > 16 && shi < 19) {
                shi = "10";
            } else if (shi > 18 && shi < 21) {
                shi = "11";
            } else if (shi > 20 && shi < 23) {
                shi = "12";
            } else if (shi > 22) {
                shi = "13";
            }
            document.form5.StrYear1.value = nian;
            document.form5.StrMonth.value = yue;
            document.form5.StrDay.value = ri;
            document.form5.StrTime.value = shi;
        }

        document.form5.submit();
    } else if (myForm == "form6") {
        if (document.form6.StrName.value.length > 4 || document.form6.StrName.value.length < 2 || isChinese(document.form6.StrName.value) == false) {
            window.alert("请输入男方二到四个汉字的中文姓名！");
            document.form6.StrName.focus();
            return false;
        }

        var mandate = document.getElementById("date1").value;
        if (mandate == "") {
            window.alert("请选择男方出生日期");
            return false;
        } else {
            var str = mandate.split("-");
            var nian = str[0];
            var yue = str[1];
            if (yue < 10) {
                yue = "0" + yue;
            }
            var ri = str[2];
            if (ri < 10) {
                ri = "0" + ri;
            }
            var shi = document.getElementById("hour1").value;
            if (shi < 10) {
                shi = "0" + shi;
            }
            document.form6.StrYear1.value = nian;
            document.form6.StrMonth.value = yue;
            document.form6.StrDay.value = ri;
            document.form6.StrTime.value = shi;
        }

        if (document.form6.StrNameC.value.length > 4 || document.form6.StrNameC.value.length < 2 || isChinese(document.form6.StrNameC.value) == false) {
            window.alert("请输入女方二到四个汉字的中文姓名！");
            document.form6.StrNameC.focus();
            return false;
        }

        var nvdate = document.getElementById("date2").value;
        if (nvdate == "") {
            window.alert("请选择女方出生日期");
            return false;
        } else {
            var strc = nvdate.split("-");
            var nianc = strc[0];
            var yuec = strc[1];
            if (yuec < 10) {
                yuec = "0" + yuec;
            }
            var ric = strc[2];
            if (ric < 10) {
                ric = "0" + ric;
            }
            var shic = document.getElementById("hour2").value;
            if (shic < 10) {
                shic = "0" + shic;
            }
            document.form6.StrYear1C.value = nianc;
            document.form6.StrMonthC.value = yuec;
            document.form6.StrDayC.value = ric;
            document.form6.StrTimeC.value = shic;
        }

        document.form6.submit();
    } else if (myForm == "form7") {
        if (document.form7.UserName.value.length != 3 || isChinese(document.form7.UserName.value) == false) {
            window.alert("请输入三个汉字!");
            document.form7.UserName.focus();
            return false;
        }
        document.form7.submit();
    } else if (myForm == "form8") {
        if (document.form8.StrName.value.length > 4 || document.form8.StrName.value.length < 2 || isChinese(document.form8.StrName.value) == false) {
            window.alert("请输入二到四个汉字的中文姓名！");
            document.form8.StrName.focus();
            return false;
        }

        var sex = document.getElementsByName("Sex");
        for (i = 0; i < sex.length; i++) {
            if (document.getElementsByName("Sex")[i].checked) {
                document.getElementById("StrSex").value = document.getElementsByName("Sex")[i].value;
            }
        }

        var mandate = document.getElementById("date1").value;
        if (mandate == "") {
            window.alert("请选择出生日期");
            return false;
        } else {
            var str = mandate.split("-");
            var nian = str[0];
            var yue = str[1];
            if (yue < 10) {
                yue = "0" + yue;
            }
            var ri = str[2];
            if (ri < 10) {
                ri = "0" + ri;
            }
            var shi = document.getElementById("hour1").value;
            if (shi < 10) {
                shi = "0" + shi;
            }
            document.form8.StrYear1.value = nian;
            document.form8.StrMonth.value = yue;
            document.form8.StrDay.value = ri;
            document.form8.StrTime.value = shi;
        }

        if (document.form8.jingdu.value == "" && document.form8.province1.value == "") {
            window.alert("请选择出生省份或直接输入出生地经度");
            document.form8.province.focus();
            return false;
        }

        if (document.form8.jingdu.value != "" && document.form8.province1.value != "") {
            window.alert("出生省份和出生地经度只要输入一个");
            document.form8.jingdu.focus();
            return false;
        }

        document.form8.submit();
    }

}

//检查输入姓氏是否存在
function ajax_keyword(username) {
    var xmlhttp;
    try {
        xmlhttp = new XMLHttpRequest();
    } catch (e) {
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.onreadystatechange = function() {
        if (xmlhttp.readyState == 4) {
            if (xmlhttp.status == 200) {
                var data = xmlhttp.responseText;
                //对结果进行unescape解码以防止中文乱码
                document.getElementById("result").innerHTML = unescape(data);
            }
        }
    }
    xmlhttp.open("post", "/app/bzqm_ajax_xing.asp", false);
    xmlhttp.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    xmlhttp.send("StrName=" + escape(username));
}


function ARTwindow(num) {
    for (var i = 1; i <= 7; i++) {
        if (num == i) {
            document.getElementById("data_ppzs_" + i).style.display = "block";
            document.getElementById("artwindow_" + i).className = "article_nav";
        } else {
            document.getElementById("data_ppzs_" + i).style.display = "none";
            document.getElementById("artwindow_" + i).className = "";
        }
    }
}


function wuxing(num) {
    for (var i = 1; i <= 5; i++) {
        if (num == i) {
            document.getElementById("data_wxqs_" + i).style.display = "block";
            document.getElementById("wuxing_" + i).className = "article_nav";
        } else {
            document.getElementById("data_wxqs_" + i).style.display = "none";
            document.getElementById("wuxing_" + i).className = "";
        }
    }
}