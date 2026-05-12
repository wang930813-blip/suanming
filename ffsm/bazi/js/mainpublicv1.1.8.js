
function initName(u, e) {
    if ($("#" + u).val(""), "NumData" == u) {
        $("#frmMeasure").append('<input type="text" name="name" onkeydown="if(event.keyCode==13) return false;" style="display:none;"/>')
    }
}

function lc_initEmail(u, e) {
    var t = e || "";
    $("#" + u).val(t)
}

function lc_initPlace(u, e) {
    var t = "北京", a = "海淀区", n = null;
    $("#lc_city" + e).citySelect({prov: t, city: a, dist: n, nodata: "none"})
}

function lc_initplaceSlide(u) {
    var r = document.getElementById(u), E = [], i = [], B = [], e = [0, 0, 0], a = [0, 0, 0];

    function n(u, n) {
        u.forEach(function (u, e, t) {
            var a = new Object;
            a.text = u.name, a.value = e, n.push(a)
        })
    }

    n(city, E), city[e[0]].hasOwnProperty("sub") ? n(city[e[0]].sub, i) : i = [{
        text: "",
        value: 0
    }], city[e[0]].sub[e[1]].hasOwnProperty("sub") ? n(city[e[0]].sub[e[1]].sub, B) : B = [{text: "", value: 0}];
    var o = new Picker({data: [E, i, B], selectedIndex: e, title: "地址选择"});
    o.on("picker.select", function (u, e) {
        var t = E[e[0]].text, a = i[e[1]].text, n = B[e[2]] ? B[e[2]].text : "";
        r.innerText = t + " " + a + " " + n
    }), o.on("picker.change", function (u, t) {
        0 === u ? function () {
            i = [], B = [], a[0] = t;
            var u = city[t];
            if (u.hasOwnProperty("sub")) {
                n(u.sub, i);
                var e = city[t].sub[0];
                e.hasOwnProperty("sub") ? n(e.sub, B) : (B = [{text: "", value: 0}], a[2] = 0)
            } else i = [{text: "", value: 0}], B = [{text: "", value: 0}], a[1] = 0, a[2] = 0;
            o.refillColumn(1, i), o.refillColumn(2, B), o.scrollColumn(1, 0), o.scrollColumn(2, 0)
        }() : 1 === u && function () {
            B = [], a[1] = t;
            var u = a[0];
            if (city[u].sub[t].hasOwnProperty("sub")) {
                n(city[u].sub[t].sub, B), o.refillColumn(2, B), o.scrollColumn(2, 0)
            } else B = [{text: "", value: 0}], a[2] = 0, o.refillColumn(2, B), o.scrollColumn(2, 0)
        }()
    }), o.on("picker.valuechange", function (u, e) {
    }), r.addEventListener("click", function () {
        o.show()
    })
}

function lc_initplaceSlide3(u, t, a) {
    var n = new Array, r = 0;
    !function u(e) {
        for (var t = 0; t < e.length; t++) e[t].value == a[r] && (r++, n[n.length] = e[t].id, e[t].childs && u(e[t].childs))
    }(newCityJson);
    new MobileSelect({
        trigger: u,
        title: "出生地点",
        wheels: [{data: newCityJson}],
        position: n || [2, 0],
        transitionEnd: function (u, e) {
        },
        callback: function (u, e) {
            $("#prov" + t).val(e[0].value), $("#city" + t).val(e[1].value), e[2] ? $("#dist" + t).val(e[2].value) : $("#dist" + t).val("")
        }
    })
}

function lc_initHmBirthDate(u, e) {
    $("#" + u).val("1990-01-01-00:00")
}

function lc_initBirthDate(u, e, t) {
    var a = "公历:1990年1月1日早子时";
    $("#" + u).attr("data-text", a);
    var n = "1990-01-01-00";
    if (0 == $("#" + u).attr("hashour") && a) {
        var r = -1;
        a = -1 != a.indexOf("时辰未知") ? (r = a.indexOf("时辰未知"), a.slice(0, r)) : -1 != a.indexOf("早子") ? (r = a.indexOf("早子"), a.slice(0, r)) : -1 != a.indexOf("晚子") ? (r = a.indexOf("晚子"), a.slice(0, r)) : -1 != a.indexOf("时") ? (r = a.indexOf("时"), a.slice(0, r - 1)) : -1 != a.indexOf("日") ? (r = a.indexOf("日"), a.slice(0, r + 1)) : a
    }
    $("#" + u).text(a), $("#" + e).attr("value", n);
    var E = {
        un: 0,
        "00": 1,
        "01": 2,
        "03": 3,
        "05": 4,
        "07": 5,
        "09": 6,
        11: 7,
        13: 8,
        15: 9,
        17: 10,
        19: 11,
        21: 12,
        23: 13
    }[n.split("-")[3]];
    $("#" + e).attr("jiavalue", E)
}

function saveSexFunction(u, e) {
    $("#" + u).val()
}

function changeSex2(u, e) {
    var t = $(".sex-box" + e);
    $("#iSex" + e).val(u);
    t.find(".sex0-yes").hide(), t.find(".sex0-no").show(), t.find(".sex1-yes").hide(), t.find(".sex1-no").show(), t.find(".sex" + u).hide(), t.find(".sex" + u + "-yes").show()
}

function lc_initSex(u, e) {
    initSex(u, e)
}

function initSex(u, e) {
    function t(u, e) {
        $("." + sexString + "-box" + e).find("." + sexString + "0-yes").hide(), $("." + sexString + "-box" + e).find("." + sexString + "0-no").show(), $("." + sexString + "-box" + e).find("." + sexString + "1-yes").hide(), $("." + sexString + "-box" + e).find("." + sexString + "1-no").show(), $("." + sexString + "-box" + e).find("." + sexString + u).hide(), $("." + sexString + "-box" + e).find("." + sexString + u + "-yes").show()
    }

    sexString = "sex", t($("#" + u).val(), e), $("." + sexString + "-btn" + e).bind("click", function () {
        var u = $(this).attr("data-sex");
        t(u, e), $("#iSex" + e).val(u)
    })
}

var is_eighteen = !0, is_eighteen2 = !0, is_eighteen3 = !0;

function verifyElementData(u, e, t) {
    function a(u) {
        var e = ["%u674E%u5F3A", "%u8D75%u4E50%u9645", "%u738B%u6CAA%u5B81", "%u97E9%u6B63", "%u8521%u5947", "%u4E01%u859B%u7965", "%u674E%u5E0C", "%u6BDB%u6DA6%u4E4B", "QQ", "%u5F6D%u4E3D%u5A9B", "%u817E%u8FC5", "%u53F7%u781", "%u7535%u8BDD", "%u7CFB%u7EDF", "%u7BA1%u746", "system", "admin", "%u7AD9%u957F", "%u6DEB%u8CE4", "%u6DEB%u8D31", "%u53BB%u6B7B", "%u543%u5C4E", "%u5988%u7684", "%u5A18%u7684", "%u65E5%u4F60", "%u5C3B", "%u64CD%u4F60", "%u5E72%u6B7B%u4F60", "%u738B%u516B", "%u50BB%u903C", "%u50BBB", "%u8D31%u4EBA", "%u72D7%u5A18", "%u5A4A%u5B50", "%u8868%u5B50", "%u9760%u4F60", "%u53C9%u4F60", "%u53C9%u6B7B", "%u63D2%u4F60", "%u63D2%u6B7B", "%u5E72%u4F60", "%u5E72%u6B7B", "%u65E5%u6B7B", "%u9E21%u5DF4", "%u777E%u4E38", "%u535%u76AE", "%u9F9F%u5934", "%u5C44", "%u8D51", "%u59A3", "%u808F", "%u5976%u5B50", "%u5C4C", "%u6210%u4EBA%u6587%u5B66", "%u6210%u4EBA%u56FE%u7247", "%u6210%u4EBA%u7535%u5F71", "%u6027%u7231%u7535%u5F71", "%u60C5%u8272%u7535%u5F71", "%u5B66%u751F%u59B9", "%u60C5%u8272%u56FE%u7247", "%u60C5%u8272%u8D34%u56FE", "%u65E0%u781%u7535%u5F71", "%u7279%u8096", "%u7981%u8096", "%u6740%u5C3E%u516C%u5FF", "%u6740%u8096%u516C%u5FF", "%u66FE%u9053%u4EBA", "%u7279%u781%u751F%u8096", "%u6CD5%u8F6E%u5927%u6CD5", "%u4FEE%u70BC%u4E4B%u6B4C", "%u5F18%u6CD5%u4F1A", "%u5927%u6CD5%u5F18%u4F20", "%u6CD5%u8F6E%u529F", "%u5927%u6CD5%u4E4B%u58F0", "%u7075%u4FEE%u56E2%u4F53", "%u5B87%u5B99%u670%u9AD8%u6CD5%u746", "%u771F%u5584%u5FCD%u5927%u6CD5", "%u6B63%u6CD5%u6D2A%u6D41", "%u4E94%u5957%u529F%u6CD5", "%u5E8%u5085%u6CD5%u8EAB", "%u5E8%u7236%u6CD5%u8EAB", "%u674E%u6D2A%u5FD7", "%u5927%u6CD5%u5F1F%u5B50", "%u771F%u4FEE%u5F1F%u5B50", "%u5F1F%u5B50%u6B63%u6CD5", "%u5929%u5B89%u95E8%u53D7%u96BE", "%u516D%u56DB%u60E8%u6848", "%u516D%u56DB%u771F%u76F8", "%u516B%u4E5D%u6C11%u8FD0", "%u6C11%u8FD0%u4EBA%u58EB", "%u7EA2%u8272%u6050%u6016", "%u6C11%u4E3B%u8FD0%u52A8", "%u9093%u4E8C%u4E16", "%u5929%u5B89%u95E8%u8840", "%u81EA%u7531%u7F51", "%u66E%u6167%u7F51", "%u6B63%u89C1%u7F51", "%u576%u66E%u7F51", "%u6253%u5370%u673A%u7248", "fawanghuihui", "minghui", "freenet-china", "yuanmingeurope", "secretchina", "%u6C5F%u653F%u5E9C", "%u6C5F%u6CFD%u6C11%u5F53%u5C40", "%u6C5F%u6838%u5FC3", "%u6C5F%u8DEF%u7EBF", "%u6C5F%u6CFD%u6C11%u653F%u6743", "%u6C5F%u8D3C", "%u6C5F%u8D3C%u6C11", "%u6C5F%u66F%u541B", "%u6C5F%u4E8C%u4E16", "%u4E2D%u5171%u5F53%u5C40", "%u5927%u9646%u5F53%u5C40", "%u5927%u9646%u5B98%u5458", "%u4E2D%u5171%u5A92%u4F53", "%u5171%u532A", "%u5171%u4EA7%u4E13%u5236", "%u53E4%u62C9%u683C", "%u5F53%u6743%u805", "%u6076%u8B66", "%u5B97%u6559%u8FEB%u5BB3", "%u5927%u6CD5%u7B2C%u5B50", "%u5929%u5B89%u95E8%u53D7%u96BE%u4EBA", "%u5F0%u609F%u5F1F%u5B50%u6B63%u6CD5", "%u5ABD%u7684", "%u5E79%u6B7B%u4F60", "%u8CE4%u4EBA", "%u5E79%u4F60", "%u5E79%u6B7B", "%u96DE%u5DF4", "%u9F9C%u982D", "%u8D14", "%u6210%u4EBA%u6587%u5B78", "%u6210%u4EBA%u5716%u7247", "%u6210%u4EBA%u96FB%u5F71", "%u6027%u611B%u96FB%u5F71", "%u60C5%u8272%u96FB%u5F71", "%u5B78%u751F%u59B9", "%u60C5%u8272%u5716%u7247", "%u60C5%u8272%u8CBC%u5716", "%u7121%u78BC%u96FB%u5F71", "%u6BBA%u5C3E%u516C%u5FF", "%u6BBA%u8096%u516C%u5FF", "%u7279%u78BC%u751F%u8096", "%u6CD5%u8F2A%u5927%u6CD5", "%u4FEE%u7149%u4E4B%u6B4C", "%u5F18%u6CD5%u673", "%u5927%u6CD5%u5F18%u50B3", "%u6CD5%u8F2A%u529F", "%u5927%u6CD5%u4E4B%u8072", "%u9748%u4FEE%u5718%u9AD4", "%u5E2B%u5085%u6CD5%u8EAB", "%u5E2B%u7236%u6CD5%u8EAB", "%u5929%u5B89%u9580%u53D7%u96E3", "%u516D%u56DB%u6158%u6848", "%u5929%u5B89%u9580%u53D7%u96E3%u4EBA", "%u958B%u609F%u5F1F%u5B50%u6B63%u6CD5", "%u60E1%u8B66", "%u7576%u6BA%u805", "%u5171%u7523%u5C8%u5236", "%u4E2D%u5171%u5A92%u9AD4", "%u5927%u9678%u5B98%u54E1", "%u5927%u9678%u7576%u5C40", "%u4E2D%u5171%u7576%u5C40", "%u6C5F%u6FA4%u6C11%u653F%u6BA", "%u6C5F%u8DEF%u7DDA", "%u6C5F%u6FA4%u6C11%u7576%u5C40", "%u5370%u8868%u6A5F%u7248", "%u5713%u66E%u7DB2", "%u6B63%u898B%u7DB2", "%u66E%u6167%u7DB2", "%u81EA%u7531%u7DB2", "%u5929%u5B89%u9580%u8840", "%u9127%u4E8C%u4E16", "%u7D5%u8272%u6050%u6016", "%u6BDB%u6CFD%u4E1C", "%u6C5F%u6CFD%u6C11", "%u80E1%u9326%u6FE4", "%u6EAB%u5BB6%u5BF6", "%u8CE4B", "%u6BDB%u6FA4%u6771", "%u5468%u6069%u4F86", "%u5171%u7522%u9EE8", "%u64CD%u4F60%u5ABD", "%u9127%u5CF%u5E73", "%u524D%u5217%u817A", "%u88F8%u7167", "AV%u5973%u512A", "%u5F37%u59E6", "%u80E1%u653F%u5E9C", "%u80E1%u9326%u6FE4%u7576%u5C40", "%u80E1%u6838%u5FC3", "%u80E1%u8DEF%u7DDA", "%u80E1%u9326%u6FE4%u653F%u6BA", "%u80E1%u66F%u541B", "%u4E2D%u57B", "%u4E2D%u83EF%u4EBA%u6C11%u5171%u548C%u57B", "%u4E3B%u5E2D", "%u7E3D%u7D71", "%u771%u9577", "%u5433%u90A6%u57B", "%u8CC8%u6176%u6797", "%u674E%u9577%u6625", "%u7FD2%u8FD1%u5E73", "%u674E%u514B%u5F37", "%u8CC0%u57B%u5F37", "%u5468%u6C38%u5EB7", "%u80E1%u9526%u6D9B", "%u6E29%u5BB6%u5B9D", "%u8D31B", "%u5468%u6069%u6765", "%u5171%u4EA7%u515A", "%u64CD%u4F60%u5988", "%u9093%u5CF%u5E73", "AV%u5973%u4F18", "%u5F3A%u5978", "%u80E1%u9526%u6D9B%u5F53%u5C40", "%u80E1%u8DEF%u7EBF", "%u80E1%u9526%u6D9B%u653F%u6743", "%u4E2D%u56FD", "%u4E2D%u534E%u4EBA%u6C11%u5171%u548C%u56FD", "%u603B%u7EDF", "%u771%u957F", "%u5434%u90A6%u56FD", "%u8D3E%u5E86%u6797", "%u674E%u957F%u6625", "%u4E60%u8FD1%u5E73", "%u674E%u514B%u5F3A", "%u8D3A%u56FD%u5F3A", "%u6DF7%u86CB", "%u7121%u6065", "%u4EB%u6D41", "fuck", "mmd", "%u5351%u9119", "%u6D41%u6C13", "sb", "SB", "%u6211%u9760", "%u75DE%u5B50", "%u776A%u4E38", "%u843D%u971E%u7F0", "%u6B7B%u4E0%u8FB9%u53BB", "%u76D6%u5854%u5965", "%u6BCD%u732A", "%u5F3A%u6DEB", "%u6328%u4E86%u4E0%u70AE", "%u9EBB%u53E4", "%u6EDA%u86CB", "%u9ED1%u5582%u72D7", "%u732A%u516C", "%u4E2D%u5171%u4E3B%u5E2D", "%u645%u57FA", "%u5356%u6DEB", "%u9EBB%u679C%u914D", "%u9A9A%u4EBA", "%u95F9%u592A%u5957", "%u5927%u8111%u77ED%u8DEF", "%u85CF%u72EC", "%u9EC4%u6BB5%u5B50", "%u9EBB%u679C%u4E38", "%u9A9A", "%u672C%u5BAB", "%u70C2%u6CE5", "%u7586%u72EC", "%u7B28%u62C9%u706F", "%u64CD%u4E86%u5AC2", "%u9EBB%u5C6%u90F", "%u65B0%u5EFA%u6237", "%u653B%u53D7", "%u5E9F%u6E23", "%u9A6C%u82F1%u4E5D", "%u6218%u4E94%u6E23", "%u64CD%u5AC2%u5B50", "%u9EBB%u9189%u72D7", "%u65B0%u7586%u53DB", "%u5CF%u59BE", "%u4F5C%u5455", "%u6C34%u6241", "%u77EE%u4ED4", "%u63D2%u5C41%u5C41", "%u9EBB%u9189%u67AA", "%u65B0%u7586%u9650", "%u53EF%u653B%u53EF%u53D7", "%u8FDB%u5929%u582", "%u8870%u4EBA", "%u50BB%u4ED4", "%u5BDF%u8C61%u8682", "%u65B0%u91D1%u74F6", "%u4ED%u662F%u4EBA", "%u88F9%u80F8", "%u594%u7537", "%u5978%u592B", "%u6210%u4EBA%u7535", "%u9EBB%u9189%u836F", "%u65B0%u5510%u4EBA", "%u4F55%u5F3%u7597", "%u88F9%u811A%u5E3", "%u9A6C%u514B%u601D", "%u9ED1%u9B3C", "%u6210%u4EBA%u5361%u901A", "%u6BDB%u4E0%u9C9C", "%u59D3%u5FFD%u60A0", "%u571F%u618B", "%u8017%u5B50", "%u5217%u5B81", "%u6D17%u4E86%u6EDA", "%u6210%u4EBA%u804A", "%u7F8E%u8273%u5C11%u5987", "%u6027%u7231%u65E5", "%u7EFF%u8336%u5A4A", "%u4F60%u5416", "%u4E2D%u534E%u4EBA%u6C11", "%u5A3C%u5993", "%u6210%u4EBA%u7247", "%u59B9%u639%u6469", "%u6027%u798F%u60C5", "%u5A4A", "%u7ED1%u5927%u6B3E", "%u5171%u548C%u56FD", "%u732A%u4ED4", "%u6210%u4EBA%u89C6", "%u59B9%u4EA%u95E8", "%u6027%u611F%u5C11", "%u5A4A%u4E86", "%u517B%u5CF%u871C", "%u793E%u4F1A", "%u5565%u8868", "%u6210%u4EBA%u56FE", "%u8499%u6C57%u836F", "%u6027%u63A8%u5E7F%u6B4C", "%u54A%u70B8%u5929", "%u543%u91CC%u6252%u5916", "%u6C11%u4E3B%u515A", "%u959%u6BD9", "%u6210%u4EBA%u6587", "%u8FF7%u5E7B%u578B", "%u80F8%u4E3B%u5E2D", "%u83CA%u82B1", "%u6E85B", "%u7CAA%u4FBF", "%u6210%u4EBA%u5CF", "%u8FF7%u5E7B%u836F", "%u5F90%u7389%u5143", "%u726%u83CA", "%u8DD1%u582%u72D7", "%u6C11%u4E3B", "%u81A3%u5C44", "%u5145%u6C14%u5A3", "%u726%u83CA%u82B1", "%u7279%u5988", "%u7834%u978B", "%u5C3F%u6CE1", "%u50AC%u7720%u6C34", "%u8FF7%u66F%u53E3", "%u4E2B%u7684", "%u65E0%u8282%u64CD", "%u5B37%u75F9", "%u626F%u5DF4%u5B50", "%u5439%u7BAB", "%u50AC%u60C5%u7C89", "%u8FF7%u66F%u836F", "%u6027%u5668", "%u83DC%u9E1F", "%u5A18%u4E2AB%u5FB7", "%u6E9C%u6D3D%u5B50", "%u5E72%u4F60%u5A18", "%u50AC%u60C5%u836F", "%u70DF%u611F%u5668", "%u6CE2%u9738", "B%u53EB", "%u74DC%u54C7%u5B50", "%u5C4C%u4F60%u801%u6BCD", "%u8FF7%u9B42%u9999", "%u4E25%u6653%u73B2", "%u6CE1M", "%u6EDA", "%u9F9F%u513F%u5B50", "%u808F%u4F60%u5988", "%u632B%u4ED1", "%u8FF7%u9B42%u836F", "%u989C%u5C4", "%u6CE1%u599E", "%u6EDA%u56DE%u53BB", "%u81ED%u5A4A%u5B50", "%u6253%u98DE%u673A", "%u52B3%u6559", "%u6BDB%u7247", "%u6EDA%u5E8A%u5355", "%u4E8C%u6D41%u5B50", "%u6CE5%u9A6C", "%u8FF7%u5978%u836F", "%u52B3%u6539%u72AF", "%u597D%u4E2A%u6BDB", "%u9E21%u9E21", "%u9A9A%u8D27", "%u8FF7%u60C5%u6C34", "%u4F60%u59B9", "%u728A%u5B50", "%u7CAA%u80C0", "%u96CF%u5993", "%u8089%u68D2", "%u8FF7%u60C5%u836F", "%u59DA%u66E%u8FDB%u53BB", "%u6BDB%u7EBF", "%u6EDA%u728A%u5B50", "%u6742%u79CD", "%u72D7%u564F", "%u4EE3%u5B55", "%u8FF7%u836F", "%u8981%u5C4%u7CBE%u4E86", "%u50BB%u5E3D", "%u8349%u6B7B%u4F60%u5988", "%u5341%u4E9%u70B9", "%u70C2%u81ED%u978B", "%u6CD5%u8F66%u4ED1", "%u8C1C%u5978%u836F", "%u8981%u5C4%u4E86", "%u50BBX", "%u5E9F%u4E86%u4F60", "%u8BE5%u732A%u543", "%u6076%u72D7", "%u6CD5%u6B63%u5E72", "%u871C%u7A74", "%u8981%u6CC4%u4E86", "%u718A%u6837", "%u6B8B%u5E9F", "%u72D7%u9020%u5316", "%u6076%u68CD", "%u6CD5%u8F6E", "%u5185%u5C4", "%u591C%u6FC0%u60C5", "%u553E%u5F3", "%u5927%u6BD4%u5C94", "%u4F60%u7B97%u801%u51E0", "%u65E0%u8D56", "%u6CD5%u8F6E%u4F5B", "%u5AE9%u7A74", "%u6DB2%u4F53%u70B8", "%u8150%u69D%u8D28", "%u5356%u9A9A", "%u79C0%u9017", "%u8822%u4EBA", "%u6CD5%u7EF4%u6743", "%u5AE9%u9634", "%u4E0%u5CF%u64AE%u522B", "%u88C5B", "%u5356%u5F4", "%u6CA1%u8111%u5B50", "%u8D31%u8D27", "%u6CD5%u4E0%u8F6E", "%u9057%u60C5%u4E66", "%u88C5b", "%u626E%u7EAF", "%u8111%u5B50%u8FDB%u6C34", "%u6CA1%u5C41%u773C", "%u6CD5%u9662%u7ED9%u5E9F", "%u62DF%u6D9B%u54E5", "%u8681%u529B%u795E", "%u5446%u903C", "%u88C5%u7EAF", "%u9A9A%u535", "%u72D7%u5A18%u517B%u7684", "%u4EFF%u771F%u67AA", "%u5A18%u4E24%u817F%u4E4B%u95F4", "%u9634%u95F4%u6765%u7535", "%u8D25%u7C7B", "%u8D31%u76AE%u5B50", "%u8D31%u732A", "%u592B%u59BB%u4EA4%u6362", "%u599E%u4EA%u95E8", "%u9634%u557", "%u4E8C%u903C", "%u89E3%u653E%u519B", "%u8822%u732A", "%u611F%u6251%u514B", "%u6D53%u7CBE", "%u9634%u9053", "%u6B7B%u903C", "damn", "%u5993%u5973", "%u5A4A%u5B50%u517B%u7684", "%u5188%u672C%u771F", "%u5973%u88AB%u4EBA%u5BB6%u641E", "%u9634%u6237", "%u7B28%u86CB", "%u4E11%u89D2", "%u653F%u5E9C", "%u75AF%u72D7", "%u809B%u4EA4", "%u5973%u6FC0%u60C5", "%u6DEB%u9B54%u821E", "%u767D%u75F4", "ET", "%u7F29%u5934%u4E4C%u9F9F", "%u809B%u95E8%u662F%u90BB", "%u5973%u4F18", "%u6DEB%u60C5%u5973", "%u4E8C%u75F4", "%u53D8%u601", "%u56E2%u4F53", "%u5356%u6BD4", "%u70AE%u7684%u5CF%u871C", "%u6DEB%u8089", "%u86CB%u767D%u8D28", "%u51E4%u59D0", "%u6E38%u884C", "%u50BB%u54A", "%u94A2%u9488%u72D7", "%u55B7%u5C3F", "%u6DEB%u9A9A%u59B9", "%u5C41%u80A1", "%u5CF%u65E5%u672C", "%u4EBA%u6A21%u72D7%u6837", "%u94A2%u73E0%u67AA", "%u5AD6%u4FC4%u7F57", "%u6DEB%u517D", "%u4E9%u516B", "MMD", "%u576F%u5B50", "%u6E2F%u6FB3%u535A%u743", "%u5AD6%u9E21", "%u6DEB%u517D%u5B66", "%u4E1C%u65B9%u687%u5FD7", "NND", "%u5927%u9EBB", "%u6B6A%u903C", "%u6E2F%u9A6C%u4F1A", "%u4EC6%u4ED%u6015%u996E", "%u6DEB%u6C34", "%u4E1C%u65B9%u5A4A%u5B50", "%u79BD%u517D", "%u8D77%u4E49", "%u64CD%u903C", "%u6E2F%u946B%u534E", "%u666E%u901A%u56C", "%u6DEB%u7A74", "%u6BD4%u6837%u8FEA", "%u517D", "%u62B5%u5236", "%u88C5%u8471", "%u9AD8%u83BA%u83BA", "%u53EB%u5E8A", "%u548F%u5993", "%u903C%u6837%u7684", "%u4EB%u8D31", "%u62C9%u8428", "%u765E%u86E4%u87C6", "%u641E%u5A9B%u4EA4", "%u8272%u9EC4", "%u5E7D%u8C37%u4E9", "DBF", "%u6B20%u8E39", "%u5F0%u6253", "%u72FC%u5FC3%u72D7%u80BA", "%u5171%u72D7", "%u8272%u9EC4%u56FE", "%u6E38%u7CBE%u4F51", "%u5927%u6CFC%u5987", "%u6B20%u62CD", "%u674E%u767B%u8F89", "%u6328%u520%u7684%u8D27", "%u5171%u738B%u50A8", "%u5947%u6DEB%u6563", "%u679%u5976%u4ED%u4E0", "%u5154%u5D3D%u5B50", "%u6B20%u62E7", "%u9648%u6C34%u6241", "%u6B7B%u4ED%u8981%u8138", "%u72D7%u7CAE", "%u8D31%u6DEB", "%u53F3%u8F6C%u662F%u653F", "%u4ED%u60F3%u6D3B%u5566", "%u6B7B%u76AE%u8D56%u8138", "%u5367%u69FD", "%u5C4E%u5768%u5768", "%u6EDA%u576%u5927%u4E73", "%u6DEB%u8361", "%u5E7C%u9F7F%u7C7B", "%u4ED6%u5976%u5976%u7684", "%u5251%u4EBA", "%u6211%u64E6", "%u56FD%u5BB6%u5993", "%u611A%u6C11%u54C", "%u53BB%u6B7B%u5427%u4F60", "%u9189%u94F6%u5251", "%u5C4C%u726%u4E86", "%u5356%u903C", "%u548C%u72D7%u4EA4", "%u67D4%u80F8%u7C89", "%u611A%u6C11%u653F", "%u7956%u5B97", "%u4EBA%u5251%u548%u4E0", "%u6211%u561E%u4E2A%u53BB", "%u9633%u75FF", "%u548C%u72D7%u6027", "%u8089%u6D1E", "%u4EE%u72D7%u6027", "%u7956%u5B97%u5341%u516B%u4EE3", "%u5316%u7CAA%u6C60", "%u4E8C%u8D27", "%u5BC4%u751F%u866B", "%u548C%u72D7%u505A", "%u8089%u68CD", "%u7389%u84B2%u56E2", "%u8822%u6750", "%u8111%u5F31", "%u50BB%u5B50", "%u7EA2%u8272%u6050", "%u5982%u5395%u6B7B", "%u9E33%u9E2F%u6D17", "%u8822%u8D27", "%u5C71%u5BE8", "%u6B21%u5965", "%u7A9D%u56CA", "%u80E1%u6C5F%u5185%u6597", "%u4E73%u4EA4", "%u78D%u6740", "%u5455%u50CF", "%u6076%u5FC3", "%u86CB%u788E", "%u7A9D%u56CA%u5E9F", "%u80E1%u7D27%u5957", "%u8F6F%u5F31%u7684%u56FD", "%u6740%u4EBA%u72AF", "%u5CF%u599E", "%u8BE5%u6B7B", "%u7C89%u6728%u8033", "%u6B6A%u74DC%u52A3%u67A3", "%u8D5B%u54E%u9A9A", "%u51F6%u6740", "%u801%u5A18", "BT", "%u9ED1%u6728%u8033", "%u80E1%u626F", "%u80E1%u902%u773C", "%u4E9%u632B", "%u8840%u6848", "%u9752%u86D9%u5934", "%u5446%u74DC", "%u641E%u57FA", "%u72D7%u5C41", "%u80E1%u800%u90A6", "%u4E9%u7EA7%u7247", "%u97F5%u5F90%u5A18", "%u9634%u9633%u5931%u8C3", "%u5446%u5B50", "%u64B8%u7BA1", "%u4EC6%u8857", "%u6E56%u6DEB%u5A18", "%u4E9%u79D2%u5012", "%u70B8%u6B7B", "%u6CB3%u9A6C", "dork", "%u8C22%u7279", "%u5357%u671D%u9C9C%u4EBA", "%u864E%u5934%u73E", "%u4E9%u7F51%u53CB", "%u69D%u7269%u51B0", "%u706B%u5C71%u55B7%u53D1", "%u88C5%u903C", "%u54E%u5EAD", "%u534E%u56FD%u95B", "%u4E9%u5511", "%u6B96%u5668%u62A4", "%u5783%u573E%u4EBA", "%u6CFC%u5987", "%u77EE%u7A77%u632B", "%u603B%u746", "%u534E%u95E8%u5F0", "%u9A9A%u5987", "%u60E8%u6848", "%u5783%u573E", "%u6DEB%u7325", "%u6D3B%u6625%u5BAB", "%u6211%u65E5", "%u5439%u8427", "%u9A9A%u6D6A", "%u51F6%u6848", "%u6050%u9F99", "%u516C%u9A74", "%u94F6%u67AA%u5CF%u9738%u738B", "%u5C41%u773C", "%u8FD8%u77B%u9526%u6D9B", "%u9A9A%u7A74", "%u8D2A%u5B98", "%u9752%u86D9", "%u50BB%u74DC", "%u62D4%u54A%u65E0%u60C5", "%u801%u4E8C", "%u6362%u59BB", "%u9A9A%u5634", "%u72D7%u5B98", "%u5E9F%u6750", "%u8822%u9A74", "%u62D4%u5C4C%u65E0%u60C5", "%u97AD%u97AD", "%u6D51%u576%u8C6A%u4E73", "%u626B%u4E86%u7237%u7237", "%u663C%u5C6%u8FD1", "%u5B59%u4E86", "%u795E%u7ECF%u75C5", "%u5C41%u8BDD", "%u6C49%u5978", "%u6FC0%u60C5%u7535", "%u8272%u7535%u5F71", "%u4E3B%u5E2D%u5FCF", "%u88C5%u5B59", "%u9752%u697C", "%u6EDA%u7C97", "%u5F3A%u66B4", "%u6FC0%u60C5%u77ED", "%u8272%u59B9%u59B9", "%u7740%u6D9B%u54E5", "%u88C5%u5B59%u5B50", "%u4FBF%u4FBF", "%u5E9F%u67F4", "%u9489%u5B50%u6237", "%u6FC0%u60C5%u70AE", "%u8272%u5CF%u8BF4", "%u81EA%u7531%u5723", "%u778E%u641E", "%u9A6C%u5C41%u7CBE", "%u6253%u70AE", "%u63E9%u6CB9", "%u6FC0%u60C5%u59B9", "%u8272%u89C6%u9891", "%u81EA%u6170%u7528", "%u626F%u86CB", "%u5927%u4FBF", "%u804A%u9A9A", "%u6076%u726", "%u6025%u970%u5AD6", "%u5C38%u535A", "%u81EA%u7531%u4E9A", "%u4E0%u9640%u7CAA", "%u75F4%u5446", "%u6F6E%u5439", "%u6076%u9738", "%u8150%u8D25", "%u5931%u8EAB%u6C34", "%u679%u6BDB%u75C5", "%u4E0%u9640%u5C4E", "%u725B%u903C%u70D8%u70D8", "%u715E%u7B14", "%u8010%u64CD", "%u6253%u7838%u62A2", "%u5931%u61F%u836F", "%u8349%u535", "%u6CE2%u63A8", "%u9876%u4F60%u4E2A%u80BA", "%u5978%u6210%u763E", "%u72EE%u5B50%u65D7", "%u9760", "%u81EA%u6740", "%u9634%u7ECF", "%u6C5F%u80E1%u5185%u6597", "%u5341%u516B%u7B49", "%u5988%u86CB", "%u8272%u8BF1", "%u516B%u5A46", "%u5CF%u9B3C%u5B50", "%u6C5F%u592A%u4EA", "%u5341%u5927%u8CE", "%u4F5C%u6B7B", "%u65E0%u6027%u751F%u6B96", "%u624B%u6DEB", "%u9E21%u5A46", "%u6C5F%u7CFB%u4EBA", "%u5341%u5927%u7981", "%u505A%u7231", "%u751F%u6B96", "%u4F60%u5927%u59E8%u5988%u7684", "%u62C9%u76AE%u6761", "%u719F%u5987", "%u505A%u7231%u5CF", "%u667A%u969C", "%u5751%u7239", "%u563F%u54BB", "%u5F20%u5FB7%u6C5F", "%u81EA%u6170", "%u8D31%u6C11", "%u5957%u5957", "%u4E11%u964B", "%u5751%u5988", "%u7EA6%u70AE", "%u4FDE%u6B63%u58F0", "%u53EB%u81EA%u6170", "%u592A%u738B%u56DB%u795E", "%u6CC4", "%u81EA%u726", "%u5751%u7237", "%u5A18%u70AE", "%u5218%u4E91%u5C71", "%u59D0%u535%u591C", "%u516D%u56DB", "%u706D%u4E86", "%u5751%u5976%u5976", "%u5C41%u6C11", "%u738B%u6B67%u5C71", "%u59D0%u67D%u52A1", "%u4E1C%u7A81", "%u6B7B%u8FB9%u53BB", "%u57FA%u56E0%u7A81%u53D8", "%u4F60%u679%u75C5", "%u63F4%u4EA4", "%u5F20%u9AD8%u4E3D", "%u59D0%u517C%u804C", "%u63A2%u6D4B%u72D7", "%u5C4C%u4E1D", "%u4F60tmd", "%u6E23%u6ED3", "%u571F%u80A5%u576", "%u674E%u63F4%u671D", "%u59D0%u4EA%u95E8", "%u6D9B%u5171%u4EA7", "%u9E1F", "%u5439%u725Bb", "%u788E%u6E23", "%u57FA%u4F6C", "%u674E%u6E90%u671D", "%u732A%u5934", "%u6D9B%u4E0%u6837%u80E1", "%u9E1F%u4EBA", "%u7FA4%u6BB4", "%u6742%u788E", "%u5B6C%u79CD", "%u535A%u7199%u6765", "%u72D7%u86CB", "%u7279%u781", "%u5C4C%u4EBA", "%u6492%u5B50", "%u6CA1%u7528%u7684%u5BB6%u4F19", "%u597%u80CE", "%u50BB%u86CB", "%u5929%u671D%u7279", "%u8349%u6CE5%u9A6C", "%u81EA%u604B", "%u6C11%u5978", "%u86CB%u75BC", "%u5077%u5077%u8D2A", "%u6CD5%u514B%u7531", "%u5439%u725B", "%u5E9F%u7269", "%u50BB%u5192", "%u64CD%u86CB", "%u63A8%u6CB9%u639", "%u6CD5%u514B", "%u72D7%u773C", "%u755C%u7272", "%u6B47%u83DC", "MLGB", "%u8131%u8863%u8273", "%u54A%u513F%u90CE%u5F53%u7684", "%u72D7%u5634", "%u516B%u56E", "%u6B47%u706B", "%u53BB%u5E74%u4E70%u4E86%u4E2A%u8868", "%u74E6%u65AF%u624B", "%u4ED6%u5988%u7684", "%u77EB%u60C5", "%u7B28%u8111%u5B50", "%u83CA%u82B1%u7D27", "mlgb", "%u889C%u639%u6469", "%u4ED6%u5988", "%u5C41%u98A0", "%u963F%u5446", "%u725BX", "qnmgb", "%u6E29%u5BB6%u5821", "XXOO", "%u9A97%u94B1", "%u75AF%u5B50", "%u6211%u9876%u4F60%u4E2A%u80BA", "%u7CBE%u5B50%u5C4", "%u6E29%u527%u65AF%u7279", "%u4E2B%u6EF4", "%u4F60%u5927%u7237", "%u5351%u8D31", "%u725B%u53C9", "%u5C31%u7231%u63D2", "%u6E29%u5F71%u5E1D", "%u602%u6837", "%u8111%u6B8B%u7247", "%u9EBB%u75F9", "%u5C31%u8981%u8272", "%u8111%u6B8B", "%u5CF%u5077", "%u5976%u5976%u4E2A%u718A", "%u5DE8%u4E73", "%u761F%u52A0%u9971", "%u6B7B%u7FD8%u7FD8", "%u88AB%u9A74%u8E22", "%u9EBB%u5B50%u8138", "%u54B8%u732A%u624B", "%u62C9%u767B%u8BF4", "%u761F%u5047%u9971", "%u5C4E%u6837", "%u801%u5BB6%u4F19", "%u5929%u671D", "%u6D6A%u7A74", "%u7EB9%u4E86%u6BDB", "%u72D7%u5C4E", "%u4F60%u5988%u5988%u7684", "%u8BE5%u6B7B%u7684", "%u9B3C%u755C", "%u9ECE%u9633%u5E73", "%u53F0%u72EC", "%u4E8C%u767E%u4E94", "%u8272%u72FC", "%u62BD%u98CE", "%u4E4C%u8747%u6C34", "%u732A", "250", "%u80A5%u732A", "%u6253%u624B%u67AA", "%u674E%u548F%u66F0", "%u65E0%u803B", "%u9A6CB", "%u5947%u8469", "%u795E%u68CD", "%u5C3C%u739B", "%u9A97%u4E2D%u592E", "%u65E0%u781%u4E13", "%u81ED%u9E21%u86CB", "%u755C%u751F", "%u4E3D%u5A9B%u79BB", "%u897F%u85CF%u9650", "%u5218%u5C11%u5947", "%u8131%u88E4%u5B50", "%u8C46%u8150%u6E23", "%u8282%u64CD%u6389%u4E86", "%u5229%u4ED6%u6797", "%u5EC%u81F", "%u6731%u5FB7", "%u653E%u5C41", "%u5439%u6F6E", "%u8E6D%u70AE", "%u516D%u548%u5F69", "%u4E60%u8FDB%u5E73", "%u5B8B%u5E86%u9F84", "%u62FD", "%u6CD5%u514B%u9C7F", "%u4E71%u5978", "%u4E60%u664B%u5E73", "shit", "%u5C4%u5165", "%u8FBE%u83F2%u9E21", "%u4E71%u4F26%u7C7B", "%u5E2D%u59D%u6D3B", "SHIT", "A%u7247", "%u9A6C%u52D2%u628%u58C1", "%u4E71%u4F26%u5CF", "%u5E2D%u4E34%u7EC8%u524D", "%u4EBA%u6E23", "%u6B20%u62BD", "%u4E2D%u5357%u6D77", "%u4E92%u64B8%u5A3", "%u4E71%u4F26", "%u5E2D%u637%u7740%u62A4", "%u6E23%u7537", "%u627E%u62BD", "%u594%u5973", "%u543%u7FD4", "%u4F26%u746%u5927", "%u6D17%u6FA1%u6B7B", "%u6E23", "%u6B20%u6241", "%u543%u7CBE", "%u726%u51FA%u7FD4", "%u4F26%u746%u6BDB", "%u559C%u8D2A%u8D43", "%u527%u514B%u95F9", "%u632%u4E86", "%u4F60%u5168%u5BB6", "%u6253%u8774%u8776", "%u4F26%u746%u7247", "%u9677%u5BB3%u6848", "%u6765%u6B7B%u72D7", "%u7325%u7410", "%u9EC4%u7247", "%u8D31%u9AA8%u5934", "%u88F8%u804A%u7F51", "%u9677%u5BB3%u7F6A", "%u836F%u836F%u836F", "%u9F8C%u9F8A", "%u65AF%u5927%u6797", "%u5C41%u8F7B", "%u88F8%u821E%u89C6", "%u5CF%u7A74", "%u611A%u6627", "%u963F%u6241", "%u801%u4E9%u801%u56DB", "%u843D%u971E%u7DB4", "%u6B7B%u4E0%u908A%u53BB", "%u84CB%u5854%u5967", "%u6BCD%u8C6C", "%u5F37%u6DEB", "%u6EFE%u86CB", "%u9ED1%u9935%u72D7", "%u8C6C%u516C", "%u652A%u57FA", "%u8CE3%u6DEB", "%u9A37%u4EBA", "%u9B27%u592A%u5957", "%u5927%u8166%u77ED%u8DEF", "%u85CF%u7368", "%u9EC3%u6BB5%u5B50", "%u9A37", "%u672C%u5BAE", "%u721B%u6CE5", "%u7586%u7368", "%u7B28%u62C9%u71C8", "%u9EBB%u5C7%u90F", "%u65B0%u5EFA%u6236", "%u5EE2%u6E23", "%u99AC%u82F1%u4E5D", "%u6230%u4E94%u6E23", "%u4F5C%u5614", "%u9EBB%u9189%u69CD", "%u9032%u5929%u582", "%u5BDF%u8C61%u879E", "%u8655%u7537", "%u59E6%u592B", "%u6210%u4EBA%u96FB", "%u9EBB%u9189%u85E5", "%u4F55%u68C4%u7642", "%u88F9%u8173%u5E3", "%u99AC%u514B%u601D", "%u6BDB%u4E0%u9BAE", "%u5217%u5BE7", "%u6D17%u4E86%u6EFE", "%u7F8E%u8277%u5C11%u5A66", "%u6027%u611B%u65E5", "%u7DA0%u8336%u5A4A", "%u4F60%u4E2B", "%u4E2D%u83EF%u4EBA%u6C11", "%u7D81%u5927%u6B3E", "%u5171%u548C%u57B", "%u8C6C%u4ED4", "%u6210%u4EBA%u8996", "%u59B9%u4EA%u9580", "%u99A%u5CF%u871C", "%u793E%u673", "%u6210%u4EBA%u5716", "%u8499%u6C57%u85E5", "%u6027%u63A8%u5EE3%u6B4C", "%u543%u88E1%u6252%u5916", "%u6C11%u4E3B%u9EE8", "%u92BC%u6583", "%u6FFAB", "%u7CDE%u4FBF", "%u8FF7%u5E7B%u85E5", "%u5145%u6C23%u5A3", "%u7279%u5ABD", "%u7121%u7BC0%u64CD", "%u5B24%u75FA", "%u5439%u7C2B", "%u8FF7%u66F%u85E5", "%u83DC%u9CE5", "%u5A18%u50BB%u5FB7", "%u50AC%u60C5%u85E5", "%u7159%u611F%u5668", "%u56B4%u66C9%u73B2", "%u6EFE", "%u9F9C%u5152%u5B50", "%u808F%u4F60%u5ABD", "%u632B%u4F96", "%u8FF7%u9B42%u85E5", "%u984F%u5C4", "%u6EFE%u56DE%u53BB", "%u6253%u98DB%u6A5F", "%u52DE%u6559", "%u6EFE%u5E8A%u55AE", "%u6CE5%u99AC", "%u8FF7%u59E6%u85E5", "%u52DE%u6539%u72AF", "%u597D%u50B%u6BDB", "%u96DE%u96DE", "%u9A37%u8CA8", "%u72A2%u5B50", "%u7CDE%u8139", "%u96DB%u5993", "%u8FF7%u60C5%u85E5", "%u59DA%u66E%u9032%u53BB", "%u6BDB%u7DDA", "%u6EFE%u72A2%u5B50", "%u96DC%u7A2E", "%u72D7%u5438", "%u8FF7%u85E5", "%u8349%u6B7B%u4F60%u5ABD", "%u5341%u4E9%u9EDE", "%u721B%u81ED%u978B", "%u6CD5%u8ECA%u4F96", "%u8BE%u5978%u85E5", "%u5EE2%u4E86%u4F60", "%u8A72%u8C6C%u543", "%u60E1%u72D7", "%u6CD5%u6B63%u4E7E", "%u8981%u6D29%u4E86", "%u718A%u6A23", "%u6B98%u5EE2", "%u60E1%u68CD", "%u6CD5%u8F2A", "%u5167%u5C4", "%u553E%u68C4", "%u4F60%u7B97%u801%u5E7E", "%u7121%u8CF4", "%u6CD5%u8F2A%u4F5B", "%u6DB2%u9AD4%u70B8", "%u8150%u69D%u8CEA", "%u8CE3%u9A37", "%u6CD5%u7DAD%u6BA", "%u5AE9%u9670", "%u4E0%u5CF%u64AE%u5225", "%u88DDB", "%u8CE3%u5F4", "%u6C92%u8166%u5B50", "%u8CE4%u8CA8", "%u6CD5%u4E0%u8F2A", "%u907A%u60C5%u66F8", "%u88DDb", "%u626E%u7D14", "%u8166%u5B50%u9032%u6C34", "%u6C92%u5C41%u773C", "%u6CD5%u9662%u7D66%u5EE2", "%u64EC%u6FE4%u54E5", "%u87FB%u529B%u795E", "%u592B%u59BB%u4EA4%u63DB", "%u599E%u4EA%u9580", "%u9670%u557", "%u89E3%u653E%u8ECD", "%u8822%u8C6C", "%u611F%u64B2%u514B", "%u6FC3%u7CBE", "%u9670%u9053", "%u5A4A%u5B50%u99A%u7684", "%u5CA1%u672C%u771F", "%u9670%u6236", "%u76B%u72D7", "%u767D%u7661", "%u57B%u8ECD", "%u7E2E%u982D%u70CF%u9F9C", "%u809B%u9580%u662F%u9130", "%u5973%u512A", "%u4E8C%u7661", "%u8B8A%u614B", "%u5718%u9AD4", "%u8CE3%u6BD4", "%u86CB%u767D%u8CEA", "%u9CF3%u59D0", "%u904A%u884C", "%u92FC%u91DD%u72D7", "%u5674%u5C3F", "%u6DEB%u9A37%u59B9", "%u4EBA%u6A21%u72D7%u6A23", "%u92FC%u73E0%u69CD", "%u5AD6%u4FC4%u7F85", "%u6DEB%u7378", "%u9EE8", "%u5AD6%u96DE", "%u6DEB%u7378%u5B78", "%u6771%u65B9%u6A19%u8A8C", "%u6E2F%u99AC%u673", "%u50D5%u4ED%u6015%u98F2", "%u6771%u65B9%u5A4A%u5B50", "%u79BD%u7378", "%u8D77%u7FA9", "%u6E2F%u946B%u83EF", "%u6BD4%u6A23%u8FEA", "%u7378", "%u88DD%u8525", "%u9AD8%u9DAF%u9DAF", "%u8A60%u5993", "%u903C%u6A23%u7684", "%u4EB%u8CE4", "%u62C9%u85A9", "%u7669%u86E4%u87C6", "%u8272%u9EC3", "%u958B%u6253", "%u8272%u9EC3%u5716", "%u5927%u6F51%u5A66", "%u674E%u767B%u8F1D", "%u6328%u520%u7684%u8CA8", "%u5171%u738B%u5132", "%u6B20%u64F0", "%u9673%u6C34%u6241", "%u6B7B%u4ED%u8981%u81C9", "%u72D7%u7CE7", "%u8CE4%u6DEB", "%u53F3%u8F49%u662F%u653F", "%u6B7B%u76AE%u8CF4%u81C9", "%u81E5%u69FD", "%u6EFE%u5713%u5927%u4E73", "%u6DEB%u8569", "%u5E7C%u9F52%u985E", "%u528D%u4EBA", "%u57B%u5BB6%u5993", "%u9189%u9280%u528D", "%u8CE3%u903C", "%u4EBA%u528D%u548%u4E0", "%u6211%u52D2%u50B%u53BB", "%u967D%u75FF", "%u827%u72D7%u6027", "%u5316%u7CDE%u6C60", "%u4E8C%u8CA8", "%u5BC4%u751F%u87F2", "%u7389%u84B2%u5718", "%u8166%u5F31", "%u7D5%u8272%u6050", "%u5982%u5EC1%u6B7B", "%u9D1B%u9D26%u6D17", "%u8822%u8CA8", "%u6B21%u5967", "%u7AA9%u56CA", "%u80E1%u6C5F%u5167%u9B25", "%u78D%u6BBA", "%u5614%u50CF", "%u5641%u5FC3", "%u7AA9%u56CA%u5EE2", "%u80E1%u7DCA%u5957", "%u8EDF%u5F31%u7684%u57B", "%u6BBA%u4EBA%u72AF", "%u8A72%u6B7B", "%u6B6A%u74DC%u52A3%u68D7", "%u8CFD%u5F8C%u9A37", "%u5147%u6BBA", "%u80E1%u9069%u773C", "%u9752%u86D9%u982D", "%u4E9%u7D1A%u7247", "%u97FB%u5F90%u5A18", "%u9670%u967D%u5931%u8ABF", "%u64FC%u7BA1", "%u6CB3%u99AC", "%u8B1D%u7279", "%u5357%u671D%u9BAE%u4EBA", "%u864E%u982D%u7375", "%u4E9%u7DB2%u53CB", "%u706B%u5C71%u5674%u767C", "%u88DD%u903C", "%u5F8C%u5EAD", "%u83EF%u57B%u92D2", "%u6B96%u5668%u8B77", "%u6F51%u5A66", "%u77EE%u7AAE%u632B", "%u7E3D%u746", "%u83EF%u9580%u958B", "%u9A37%u5A66", "%u6158%u6848", "%u6D3B%u6625%u5BAE", "%u5439%u856D", "%u9A37%u6D6A", "%u5147%u6848", "%u6050%u9F8D", "%u516C%u9A62", "%u9280%u69CD%u5CF%u9738%u738B", "%u9084%u77B%u9326%u6FE4", "%u9A37%u7A74", "%u8CAA%u5B98", "%u62D4%u54A%u7121%u60C5", "%u63DB%u59BB", "%u9A37%u5634", "%u5EE2%u6750", "%u8822%u9A62", "%u62D4%u5C4C%u7121%u60C5", "%u6E3E%u5713%u8C6A%u4E73", "%u6383%u4E86%u723A%u723A", "%u665D%u5C7%u8FD1", "%u5B6B%u4E86", "%u795E%u7D93%u75C5", "%u5C41%u8A71", "%u6F22%u5978", "%u6FC0%u60C5%u96FB", "%u8272%u96FB%u5F71", "%u4E3B%u5E2D%u61FA", "%u88DD%u5B6B", "%u9752%u6A13", "%u6EFE%u7C97", "%u5F37%u66B4", "%u8457%u6FE4%u54E5", "%u88DD%u5B6B%u5B50", "%u5EE2%u67F4", "%u91D8%u5B50%u6236", "%u8272%u5CF%u8AAA", "%u81EA%u7531%u8056", "%u99AC%u5C41%u7CBE", "%u8272%u8996%u983B", "%u804A%u9A37", "%u60E1%u726", "%u5C4D%u535A", "%u81EA%u7531%u4E9E", "%u4E0%u9640%u7CDE", "%u7661%u5446", "%u60E1%u9738", "%u8150%u6557", "%u715E%u7B46", "%u6253%u7838%u6436", "%u5931%u61F%u85E5", "%u982%u4F60%u50B%u80BA", "%u5978%u6210%u766E", "%u7345%u5B50%u65D7", "%u81EA%u6BBA", "%u9670%u7D93", "%u6C5F%u80E1%u5167%u9B25", "%u5ABD%u86CB", "%u8272%u8A98", "%u5341%u5927%u8BA", "%u7121%u6027%u751F%u6B96", "%u96DE%u5A46", "%u505A%u611B", "%u4F60%u5927%u59E8%u5ABD%u7684", "%u62C9%u76AE%u689D", "%u719F%u5A66", "%u505A%u611B%u5CF", "%u5F35%u5FB7%u6C5F", "%u8CE4%u6C11", "%u919C%u964B", "%u5751%u5ABD", "%u7D4%u70AE", "%u4FDE%u6B63%u8072", "%u6D29", "%u5751%u723A", "%u5289%u96F2%u5C71", "%u6EC5%u4E86", "%u59D0%u67D%u52D9", "%u6771%u7A81", "%u6B7B%u908A%u53BB", "%u57FA%u56E0%u7A81%u8B8A", "%u5F35%u9AD8%u9E97", "%u59D0%u517C%u8077", "%u63A2%u6E2C%u72D7", "%u5C4C%u7D72", "%u571F%u80A5%u5713", "%u59D0%u4EA%u9580", "%u6FE4%u5171%u7522", "%u9CE5", "%u8C6C%u982D", "%u6FE4%u4E0%u6A23%u80E1", "%u9CE5%u4EBA", "%u7FA4%u6BC6", "%u96DC%u788E", "%u5B6C%u7A2E", "%u535A%u7199%u4F86", "%u7279%u78BC", "%u6C92%u7528%u7684%u50A2%u4F19", "%u5099%u80CE", "%u8349%u6CE5%u99AC", "%u81EA%u620", "%u5077%u5077%u8CAA", "%u5EE2%u7269", "%u812B%u8863%u8277", "%u54A%u5152%u90CE%u7576%u7684", "%u53BB%u5E74%u8CB7%u4E86%u50B%u8868", "%u4ED6%u5ABD%u7684", "%u77EF%u60C5", "%u7B28%u8166%u5B50", "%u83CA%u82B1%u7DCA", "%u896A%u639%u6469", "%u4ED6%u5ABD", "%u5C41%u985B", "%u6EAB%u5BB6%u5821", "%u9A19%u9322", "%u76B%u5B50", "%u6211%u982%u4F60%u50B%u80BA", "%u6EAB%u527%u65AF%u7279", "%u4F60%u5927%u723A", "%u5351%u8CE4", "%u5C31%u611B%u63D2", "%u6EAB%u5F71%u5E1D", "%u616B%u6A23", "%u8166%u6B98%u7247", "%u9EBB%u75FA", "%u8166%u6B98", "%u5976%u5976%u50B%u718A", "%u761F%u52A0%u98FD", "%u6B7B%u7FF9%u7FF9", "%u88AB%u9A62%u8E22", "%u9EBB%u5B50%u81C9", "%u9E79%u8C6C%u624B", "%u62C9%u767B%u8AAA", "%u761F%u5047%u98FD", "%u5C4E%u6A23", "%u801%u50A2%u4F19", "%u7DB%u4E86%u6BDB", "%u4F60%u5ABD%u5ABD%u7684", "%u8A72%u6B7B%u7684", "%u9ECE%u967D%u5E73", "%u53F0%u7368", "%u62BD%u98A8", "%u70CF%u885%u6C34", "%u8C6C", "%u80A5%u8C6C", "%u6253%u624B%u69CD", "%u674E%u8A60%u66F0", "%u99ACB", "%u5C3C%u746A", "%u9A19%u4E2D%u592E", "%u7121%u78BC%u5C8", "%u81ED%u96DE%u86CB", "%u9E97%u5A9B%u96E2", "%u5289%u5C11%u5947", "%u812B%u8932%u5B50", "%u7BC0%u64CD%u6389%u4E86", "%u5EC%u9AD2", "%u7FD2%u9032%u5E73", "%u5B8B%u6176%u9F61", "%u6CD5%u514B%u9B77", "%u4E82%u5978", "%u7FD2%u6649%u5E73", "%u9054%u83F2%u96DE", "%u4E82%u502B%u985E", "%u5E2D%u5FA9%u6D3B", "%u99AC%u52D2%u628%u58C1", "%u4E82%u502B%u5CF", "%u5E2D%u81E8%u7D42%u524D", "%u4E92%u64FC%u5A3", "%u4E82%u502B", "%u5E2D%u637%u8457%u8B77", "%u8655%u5973", "%u502B%u746%u5927", "%u502B%u746%u6BDB", "%u559C%u8CAA%u8D13", "%u527%u514B%u9B27", "%u639B%u4E86", "%u502B%u746%u7247", "%u4F86%u6B7B%u72D7", "%u7325%u7463", "%u9EC3%u7247", "%u8CE4%u9AA8%u982D", "%u88F8%u804A%u7DB2", "%u85E5%u85E5%u85E5", "%u9F77%u9F6A", "%u5C41%u8F15", "%u88F8%u821E%u8996", "%u5171%u7523%u9EE8", "%u8F6E%u6CD5%u529F", "%u4E9%u53BB%u8F66%u4ED1", "%u6C35%u53BB%u8F66%u4ED1", "%u53D1%u8BBA%u5DE5", "%u6CD5x%u529F", "%u6CD5o%u529F", "%u6CD50%u529F", "%u6CD5%u4E0%u8F6E%u4E0%u529F", "%u8F6E%u5B50%u529F", "%u8F66%u4ED1%u5DE5%u529B", "falungong", "%u666E%u8418%u6D1B%u5C14", "%u544B%u585E%u7C73", "%u897F%u5E3%u66F2%u66E", "testosterone", "%u80F0%u5C9B%u7D20%u6837%u751F%u957F%u56E0%u5B50", "%u4FC3%u7EA2%u7EC6%u80DE%u751F%u6210%u7D20", "%u5730%u897F%u6CEE", "%u5C3C%u53EF%u5239%u7C73", "%u7532%u777E%u916E", "adrenaline", "erythropoietin", "%u5730%u5948%u5FB7", "%u83AB%u8FBE%u975E%u5C3C", "%u6C2F%u567B%u55EA", "%u82EF%u5DF4%u6BD4%u59A5", "%u4FC3%u6027%u817A%u6FC0%u7D20", "%u6CFC%u5C3C%u677E", "%u9EBB%u9EC4%u8349", "%u96C4%u70EF%u4E8C%u9187", "%u5730%u585E%u7C73%u677E", "tamoxifen", "strychnine", "androst", "%u65B0%u578B%u6BD2%u54C1", "%u675C%u51B7%u4E1", "mdma", "%u6D77%u6D1B%u56E0", "%u6D77luo%u56E0", "heroin", "diamorphine", "diacetylmorphine", "%u9E26%u7247", "%u963F%u8299%u84C9", "%u5496%u5561%u56E0", "cocain", "%u4E9%u5511%u4ED1", "%u7F8E%u6C99%u916E", "k%u7C89", "%u51EF%u4ED6%u654F", "ketamine", "%u51B0%u6BD2", "%u82EF%u4E19%u80FA", "cannabis", "%u7231%u4ED6%u6B7B", "%u6C2F%u80FA%u916E", "benzodiazepines", "%u7532%u57FA%u5B89%u975E%u4ED6%u66E", "%u5B89%u975E%u4ED6%u547D", "%u5417%u5561", "%u80E1%u7684%u63A5%u73ED%u4EBA", "%u94A6%u5B9A%u63A5%u73ED%u4EBA", "%u5E73%u8FD1%u4E60", "xjp", "%u4E60%u592A%u5B50", "%u4E60%u66E%u6CFD", "%u801%u4E60", "%u6E29%u52A0%u5B9D", "%u6E29x", "%u6E29jia%u5B9D", "%u6E29%u5B9D%u5B9D", "%u6E29%u52A0%u9971", "%u6E29%u52A0%u4FDD", "%u6C11%u6CFD%u6C5F", "%u6C5F%u80E1", "%u6C5F%u54E5", "%u6C5F%u4E3B%u5E2D", "%u6C5F%u4E66%u8BB0", "%u9493%u9C7C%u5C9B", "%u9493%u9C7C%u53F0", "mayingjiu", "%u9648s%u6241", "%u53F0%u6E7E%u72EC%u7ACB", "%u7231%u5973%u4EBA", "%u7231%u6DB2", "%u639%u6469%u68D2", "%u62D4%u51FA%u6765", "%u726%u8349", "%u535%u4E8C%u5976", "%u66B4%u5E72", "%u66B4%u5978", "%u66B4%u4E73", "%u726%u4E73", "%u66B4%u6DEB", "%u88AB%u64CD", "%u88AB%u63D2", "%u88AB%u5E72", "%u903C%u5978", "%u4ED3%u4E95%u7A7A", "%u63D2%u66B4", "%u64CD%u9ED1", "%u64CD%u70C2", "%u808F%u4F60", "%u808F%u6B7B", "%u64CD%u6B7B", "%u64CD%u6211", "%u5395%u5974", "%u63D2%u6BD4", "%u63D2b", "%u63D2%u903C", "%u63D2%u8FDB", "%u63D2%u6211", "%u63D2%u9634", "%u6F6E%u55B7", "%u6210%u4EBAdv", "%u6210%u4EBA%u8BBA%u575B", "%u6210%u4EBA%u5CF%u8BF4", "%u6210%u4EBA%u8272%u60C5", "%u6210%u4EBA%u7F51%u7AD9", "%u8273%u60C5%u5CF%u8BF4", "%u6210%u4EBA%u6E38%u62F", "%u8D64%u88F8", "%u62BD%u63D2", "%u624C%u7531%u63D2", "%u62BD%u4E0%u63D2", "%u6625%u836F", "%u5927%u6CE2", "%u5927%u529B%u62BD%u901", "%u5927%u4E73", "%u8361%u5987", "%u8361%u5973", "%u76D7%u64AE", "%u591A%u4EBA%u8F6E", "%u53D1%u6D6A", "%u653E%u5C3F", "%u80A5%u903C", "%u7C89%u7A74", "%u5C1%u9762%u5973%u90CE", "%u98CE%u678%u5927%u9646", "%u5E72%u7A74", "%u809B%u95E8", "%u88F9%u672C", "%u56FD%u4EA7av", "%u597D%u5AE9", "%u8C6A%u4E73", "%u9ED1%u903C", "%u54E%u7A74", "%u864E%u9A91", "%u82B1%u82B1%u516C%u5B50", "%u6362%u59BB%u4FF1%u4E50%u90E8", "%u51E0%u5427", "%u9E21%u5427", "%u9E21%u5978", "%u5BC2%u5BDE%u7537", "%u5BC2%u5BDE%u5973", "%u6FC0%u60C5", "%u96C6%u4F53%u6DEB", "%u5978%u60C5", "%u811A%u4EA4", "%u91D1%u9CDE%u5C82%u662F%u6C60%u4E2D%u7269", "%u91D1%u9E9F%u5C82%u662F%u6C60%u4E2D%u7269", "%u7CBE%u6DB2", "%u5C31%u53BB%u65E5", "%u5DE8%u5C4C", "%u83CA%u82B1%u6D1E", "%u83CA%u95E8", "%u5DE8%u5976", "%u83CA%u7A74", "%u5F0%u82DE", "%u53E3%u726", "%u53E3%u6D3B", "%u53E3%u4EA4", "%u53E3%u5C4", "%u53E3%u6DEB", "%u88E4%u889C", "%u72C2%u64CD", "%u72C2%u63D2", "%u6D6A%u903C", "%u6D6A%u5987", "%u6D6A%u53EB", "%u6D6A%u5973", "%u72FC%u53CB", "%u804A%u6027", "%u6D41%u6DEB", "%u94C3%u6728%u9EBB", "%u51CC%u8FB1", "%u6FF%u4E73", "%u9732b", "%u4E71%u4EA4", "%u8F6E%u66B4", "%u8F6E%u64CD", "%u8F6E%u5978", "%u88F8%u966A", "%u4E70%u6625", "%u7F8E%u903C", "%u7F8E%u5C11%u5987", "%u7F8E%u4E73", "%u7F8E%u817F", "%u7F8E%u7A74", "%u7F8E%u5E7C", "%u79D8%u557", "%u8FF7%u5978", "%u5BC6%u7A74", "%u871C%u6DB2", "%u6478%u5976", "%u6478%u80F8", "%u6BCD%u5978", "%u5948%u7F8E", "%u7537%u5974", "%u5AE9%u903C", "%u5AE9%u5973", "%u634F%u5F4", "%u70AE%u53CB", "%u7832%u53CB", "%u55B7%u7CBE", "%u54C1%u9999%u582", "%u524D%u51F8%u54E%u7FD8", "%u5F3Ajian", "%u5F3A%u5978%u594%u5973", "%u60C5%u8DA3%u7528%u54C1", "%u60C5%u8272", "%u62F3%u4EA4", "%u5168%u88F8", "%u7FA4%u4EA4", "%u60F9%u706B%u8EAB%u6750", "%u4EBA%u59BB", "%u4EBA%u517D", "%u65E5%u903C", "%u65E5%u70C2", "%u8089%u903C", "%u8089%u557", "%u8089%u7F1D", "%u8089%u83E", "%u8089%u5177", "%u63C9%u4E73", "%u8089%u7A74", "%u8089%u6B32", "%u4E73%u726", "%u4E73%u623F", "%u4E73%u6C9F", "%u4E73%u5934", "%u9A9A%u903C", "%u9A9A%u6BD4", "%u9A9A%u5973", "%u9A9A%u6C34", "%u8272%u903C", "%u8272%u754C", "%u8272%u732B", "%u8272%u76DF", "%u8272%u60C5%u7F51%u7AD9", "%u8272%u533A", "%u8272%u8272", "%u8272%u6B32", "%u8272b", "%u5C11%u5E74%u963F%u5BBE", "%u5C11%u4FEE%u6B63", "%u5C4%u723D", "%u5C4%u989C", "%u98DF%u7CBE", "%u91CA%u6B32", "%u517D%u5978", "%u517D%u4EA4", "%u517D%u6B32", "%u719F%u6BCD", "%u719F%u5973", "%u723D%u7247", "%u723D%u6B7B%u6211%u4E86", "%u53CC%u81C0", "%u4E1D%u889C", "%u4E1D%u8BF1", "%u677E%u5C9B%u67AB", "%u9165%u75D2", "%u6C64%u52A0%u4E3D", "%u5957%u5F4", "%u4F53%u5978", "%u4F53%u4F4D", "%u8214%u811A", "%u8214%u9634", "%u8C3%u6559", "%u5077%u6B22", "%u5077%u62CD", "%u63A8%u6CB9", "%u8131%u5185%u88E4", "%u6587%u505A", "%u6211%u5C31%u8272", "%u65E0%u781", "%u821E%u5973", "%u65E0%u4FEE%u6B63", "%u5438%u7CBE", "%u59F%u5DDD%u7EAF", "%u76F8%u5978", "%u5CF%u903C", "%u6821%u9E21", "%u5CFxue", "%u5199%u771F", "%u6027%u611F%u5996%u5A6", "%u6027%u611F%u8BF1%u60D1", "%u6027%u864E", "%u6027%u9965%u6E34", "%u6027%u6280%u5DE7", "%u6027%u4EA4", "%u6027%u5974", "%u6027%u8650", "%u6027%u606F", "%u6027%u6B32", "%u80F8%u63A8", "%u7A74%u53E3", "%u7A74%u56FE", "%u4E9A%u60C5", "%u9633%u5177", "%u6768%u601D%u654F", "%u591C%u52E4%u75C5%u68B", "%u4E0%u672C%u9053", "%u4E0%u591C%u6B22", "%u4E0%u591C%u60C5", "%u4E0ye%u60C5", "%u9634%u90E8", "%u6DEB%u866B", "%u6DEB%u7535%u5F71", "%u9634%u961C", "%u6DEB%u5987", "%u6DEB%u6CB3", "%u9634%u6838", "%u6DEB%u53EB", "%u6DEB%u6559%u5E8", "%u9634%u83E", "%u9634%u7CBE", "%u6DEB%u6D6A", "%u6DEB%u5A9A", "%u6DEB%u7CDC", "%u6DEB%u9B54", "%u6DEB%u6BCD", "%u6DEB%u5973", "%u6DEB%u8650", "%u6DEB%u59BB", "%u6DEB%u60C5", "%u6DEB%u8272", "%u6DEB%u58F0%u6D6A%u8BED", "%u6DEB%u517D%u5B66%u56ED", "%u6DEB%u4E66", "%u6DEB%u672F%u70BC%u91D1%u58EB", "%u6DEB%u5A3", "%u6DEB%u5A1", "%u6DEB%u4EB5", "%u6DEB%u6837", "%u6DEB%u6DB2", "%u6DEB%u7167", "%u9634b", "%u5E94%u53EC", "%u5E7C%u4EA4", "%u5E7C%u7537", "%u5E7C%u5973", "%u6B32%u706B", "%u6B32%u5973", "%u7389%u5973%u5FC3%u7ECF", "%u7389%u4E73", "%u6B32%u4ED9%u6B32%u6B7B", "%u7389%u7A74", "%u539F%u5473%u5185%u8863", "%u63F4%u52A9%u4EA4%u9645", "%u5F20%u7B71%u96E8", "%u62DB%u9E21", "%u62DB%u5993", "%u4E2D%u5E74%u7F8E%u5987", "%u6293%u80F8", "%u81EA%u62CD", "%u4F5C%u7231", "18%u7981", "99bb", "a4u", "a4y", "adult", "amateur", "anal", "a%u7247", "gay%u7247", "g%u70B9", "g%u7247", "hardcore", "h%u52A8%u753B", "h%u52A8%u6F2B", "incest", "porn", "secom", "sexinsex", "sm%u5973%u738B", "xiao77", "xing%u4F34%u4FA3", "tokyohot", "yin%u8361", "%u5927sb", "%u50BBb", "%u715E%u903C", "%u5239%u7B14", "%u50BB%u6BD4", "%u6C99%u6BD4", "%u6B20%u5E72", "%u6211%u65E5%u4F60", "%u6211%u64CD", "%u6211%u8349", "%u5367%u8279", "%u726%u4F60%u83CA", "%u8279%u4F60", "cao%u4F60", "%u4F60%u4ED6%u5988", "%u771F%u4ED6%u5988", "%u522B%u4ED6%u5417", "%u8349%u4F60%u5417", "%u8349%u4F60%u4E2B", "%u64E6%u4F60%u5988", "%u64CD%u4F60%u5A18", "%u64CD%u4ED6%u5988", "%u65E5%u4F60%u5988", "%u5E72%u4F60%u5988", "%u5A18%u897F%u76AE", "%u72D7%u64CD", "%u72D7%u8349", "%u72D7%u6742%u79CD", "%u72D7%u65E5%u7684", "%u64CD%u4F60%u7956%u5B97", "%u64CD%u4F60%u5168%u5BB6", "%u64CD%u4F60%u5927%u7237", "%u5988%u903C", "%u4F60%u9EBB%u75F9", "%u9EBB%u75F9%u7684", "%u5988%u4E86%u4E2A%u903C", "%u9A6C%u52D2", "%u72D7%u5A18%u517B", "%u8D31%u6BD4", "%u8D31b", "%u6B7B%u5168%u5BB6", "%u5168%u5BB6%u6B7B%u5149", "%u5168%u5BB6%u4ED%u5F97%u597D%u6B7B", "%u5168%u5BB6%u6B7B%u7EDD", "%u6740b", "%u4F60%u5417b", "%u4F60%u5988%u7684", "%u5A9A%u5916", "%u548C%u5F26", "%u517C%u804C", "%u9650%u91CF", "%u94C3%u58F0", "%u6027%u4F34%u4FA3", "%u7537%u516C%u5173", "%u706B%u8FA3", "%u7CBE%u5B50", "%u5C4%u7CBE", "%u8BF1%u5978", "%u6027%u7231", "%u53D1%u751F%u5173%u7CFB", "%u639%u6469", "%u5FEB%u611F", "%u731B%u7537", "%u5C11%u5987", "%u4EB%u4F53", "%u5185%u88E4", "%u6D51%u576", "%u54AA%u54AA", "%u53D1%u60C5", "%u523A%u6FC0", "%u767D%u5AE9", "%u7C89%u5AE9", "%u517D%u6027", "%u98CE%u9A9A", "%u547B%u541F", "sm", "%u969%u5272", "%u9AD8%u6F6E", "%u88F8%u9732", "%u4ED%u7A7F", "%u4E0%u4E1D%u4ED%u632", "%u8131%u5149", "%u6211%u5E72", "%u88D9%u4E2D%u6027%u8FD0%u52A8", "%u4F26%u746%u7535%u5F71", "%u88F8%u804A", "%u88F8%u4F53%u5199%u771F", "%u7F8E%u5973%u88F8%u4F53", "%u7F8E%u5973%u5199%u771F", "%u7F8E%u5973%u4EA%u95E8", "%u8FF7%u5978%u7C89", "%u8FF7%u60C5%u7C89", "%u8272%u60C5%u8868%u6F14", "%u8272%u60C5%u7535%u5F71", "%u8272%u60C5%u67D%u52A1", "%u8272%u60C5%u56FE%u7247", "%u8272%u60C5%u5CF%u8BF4", "%u8272%u60C5%u5F71%u7247", "%u8272%u60C5%u7247", "%u6027%u67D%u52A1", "%u6027%u4F19%u4F34", "%u6027%u4EA4%u89C6%u9891", "%u6027%u4EA4%u56FE%u7247", "%u6027%u5974%u96C6%u4E2D%u8425", "%u9634%u8482", "%u9634%u83E%u589E%u5927", "%u9634%u83E%u52A9%u52C3", "%u9634%u6BDB", "%u6DEB%u8361%u7F8E%u5973", "%u6DEB%u8361%u89C6%u9891", "%u6DEB%u8361%u7167%u7247", "%u6DEB%u4E71", "%u6DEB%u9761", "morphine", "%u6447%u5934%u4E38", "%u4E56%u4E56%u7C89", "narcotic", "%u7CBE%u795E%u836F%u54C1","%u53F7%u7801","%u7BA1%u7406","%u5403%u5C4E","%u5305%u76AE","%u65E0%u7801%u7535%u5F71","%u6740%u5C3E%u516C%u5F0F","%u6740%u8096%u516C%u5F0F","%u7279%u7801%u751F%u8096","%u5B87%u5B99%u6700%u9AD8%u6CD5%u7406","%u5E08%u5085%u6CD5%u8EAB","%u5E08%u7236%u6CD5%u8EAB","%u660E%u6167%u7F51","%u5706%u660E%u7F51","%u6C5F%u660F%u541B","%u5F53%u6743%u8005","%u5F00%u609F%u5F1F%u5B50%u6B63%u6CD5","%u6BBA%u5C3E%u516C%u5F0F","%u6BBA%u8096%u516C%u5F0F","%u5F18%u6CD5%u6703","%u7576%u6B0A%u8005","%u5171%u7523%u5C08%u5236","%u6C5F%u6FA4%u6C11%u653F%u6B0A","%u5713%u660E%u7DB2","%u660E%u6167%u7DB2","%u7D05%u8272%u6050%u6016","%u9127%u5C0F%u5E73","%u80E1%u9326%u6FE4%u653F%u6B0A","%u80E1%u660F%u541B","%u4E2D%u570B","%u4E2D%u83EF%u4EBA%u6C11%u5171%u548C%u570B","%u7701%u9577","%u5433%u90A6%u570B","%u8CC0%u570B%u5F37","%u9093%u5C0F%u5E73","%u80E1%u660F%u541B","%u7701%u957F","%u4E0B%u6D41","%u5403%u5C4E","%u5305%u76AE","%u843D%u971E%u7F00","%u6B7B%u4E00%u8FB9%u53BB","%u6328%u4E86%u4E00%u70AE","%u6405%u57FA","%u9EBB%u5C06%u900F","%u5C0F%u59BE","%u8FDB%u5929%u5802","%u4E0D%u662F%u4EBA","%u5904%u7537","%u4F55%u5F03%u7597","%u88F9%u811A%u5E03","%u6BDB%u4E00%u9C9C","%u59B9%u6309%u6469","%u59B9%u4E0A%u95E8","%u517B%u5C0F%u871C","%u540A%u70B8%u5929","%u5403%u91CC%u6252%u5916","%u9509%u6BD9","%u6210%u4EBA%u5C0F","%u7206%u83CA","%u8DD1%u5802%u72D7","%u5145%u6C14%u5A03","%u7206%u83CA%u82B1","%u8FF7%u660F%u53E3","%u8FF7%u660F%u836F","%u8FF7%u660F%u836F","%u5C4C%u4F60%u8001%u6BCD","%u989C%u5C04","%u989C%u5C04","%u59DA%u660E%u8FDB%u53BB","%u8981%u5C04%u7CBE%u4E86","%u5341%u4E09%u70B9","%u8981%u5C04%u4E86","%u8BE5%u732A%u5403","%u5185%u5C04","%u553E%u5F03","%u4F60%u7B97%u8001%u51E0","%u8150%u690D%u8D28","%u4E00%u5C0F%u64AE%u522B","%u5356%u5F04","%u6CD5%u4E00%u8F6E","%u9A9A%u5305","%u599E%u4E0A%u95E8","%u9634%u5507","%u53D8%u6001","%u70AE%u7684%u5C0F%u871C","%u50BB%u540A","%u5C0F%u65E5%u672C","%u4E09%u516B","%u6E2F%u6FB3%u535A%u7403","%u4E1C%u65B9%u6807%u5FD7","%u4EC6%u4E0D%u6015%u996E","%u666E%u901A%u560C","%u4E0B%u8D31","%u5E7D%u8C37%u4E09","%u5F00%u6253","%u6328%u5200%u7684%u8D27","%u6709%u5976%u4E0D%u4E00","%u6B7B%u4E0D%u8981%u8138","%u4E0D%u60F3%u6D3B%u5566","%u6EDA%u5706%u5927%u4E73","%u611A%u6C11%u540C","%u5C4C%u7206%u4E86","%u4EBA%u5251%u5408%u4E00","%u4E0E%u72D7%u6027","%u780D%u6740","%u5C0F%u599E","%u8D5B%u540E%u9A9A","%u8001%u5A18","%u80E1%u9002%u773C","%u4E09%u632B","%u80E1%u8000%u90A6","%u4E09%u7EA7%u7247","%u9634%u9633%u5931%u8C03","%u4E09%u79D2%u5012","%u864E%u5934%u730E","%u4E09%u7F51%u53CB","%u690D%u7269%u51B0","%u4E0B%u6D41","%u540E%u5EAD","%u534E%u56FD%u950B","%u4E09%u5511","%u603B%u7406","%u534E%u95E8%u5F00","%u94F6%u67AA%u5C0F%u9738%u738B","%u8FD8%u770B%u9526%u6D9B","%u62D4%u540A%u65E0%u60C5","%u8001%u4E8C","%u6D51%u5706%u8C6A%u4E73","%u663C%u5C06%u8FD1","%u8272%u5C0F%u8BF4","%u6076%u7206","%u6025%u9700%u5AD6","%u4E00%u9640%u7CAA","%u6709%u6BDB%u75C5","%u4E00%u9640%u5C4E","%u5931%u610F%u836F","%u8349%u5305","%u5C0F%u9B3C%u5B50","%u6C5F%u592A%u4E0A","%u5341%u5927%u8C0E","%u505A%u7231%u5C0F","%u81EA%u7206","%u59D0%u5305%u591C","%u59D0%u670D%u52A1","%u4F60%u6709%u75C5","%u571F%u80A5%u5706","%u59D0%u4E0A%u95E8","%u6D9B%u4E00%u6837%u80E1","%u7279%u7801","%u5907%u80CE","%u63A8%u6CB9%u6309","%u540A%u513F%u90CE%u5F53%u7684","%u516B%u560E","%u889C%u6309%u6469","%u7CBE%u5B50%u5C04","%u6E29%u5207%u65AF%u7279","%u6002%u6837","%u5C0F%u5077","%u8001%u5BB6%u4F19","%u9093%u5C0F%u5E73","%u65E0%u7801%u4E13","%u5E0C%u810F","%u516D%u5408%u5F69","%u5C04%u5165","%u5E2D%u590D%u6D3B","%u9A6C%u52D2%u6208%u58C1","%u4E71%u4F26%u5C0F","%u4E92%u64B8%u5A03","%u5E2D%u6307%u7740%u62A4","%u5904%u5973","%u5403%u7FD4","%u4F26%u7406%u5927","%u5403%u7CBE","%u7206%u51FA%u7FD4","%u4F26%u7406%u6BDB","%u5207%u514B%u95F9","%u6302%u4E86","%u4F26%u7406%u7247","%u5C0F%u7A74","%u8001%u4E09%u8001%u56DB","%u6B7B%u4E00%u908A%u53BB","%u6328%u4E86%u4E00%u70AE","%u9EBB%u5C07%u900F","%u5C0F%u59BE","%u9032%u5929%u5802","%u4E0D%u662F%u4EBA","%u88F9%u8173%u5E03","%u6BDB%u4E00%u9BAE","%u59B9%u6309%u6469","%u5171%u548C%u570B","%u59B9%u4E0A%u9580","%u990A%u5C0F%u871C","%u793E%u6703","%u540A%u70B8%u5929","%u5403%u88E1%u6252%u5916","%u6210%u4EBA%u5C0F","%u7206%u83CA","%u8DD1%u5802%u72D7","%u5145%u6C23%u5A03","%u7206%u83CA%u82B1","%u8FF7%u660F%u53E3","%u8FF7%u660F%u85E5","%u5A18%u500BB%u5FB7","%u8FF7%u660F%u85E5","%u5C4C%u4F60%u8001%u6BCD","%u984F%u5C04","%u597D%u500B%u6BDB","%u984F%u5C04","%u59DA%u660E%u9032%u53BB","%u8981%u5C04%u7CBE%u4E86","%u5341%u4E09%u9EDE","%u8B0E%u5978%u85E5","%u8981%u5C04%u4E86","%u8A72%u8C6C%u5403","%u5167%u5C04","%u4F60%u7B97%u8001%u5E7E","%u8150%u690D%u8CEA","%u6CD5%u7DAD%u6B0A","%u4E00%u5C0F%u64AE%u5225","%u8CE3%u5F04","%u6CD5%u4E00%u8F2A","%u599E%u4E0A%u9580","%u9670%u5507","%u5A4A%u5B50%u990A%u7684","%u760B%u72D7","%u570B%u8ECD","%u70AE%u7684%u5C0F%u871C","%u50BB%u540A","%u5C0F%u65E5%u672C","%u4E09%u516B","%u6E2F%u6FB3%u535A%u7403","%u6E2F%u99AC%u6703","%u50D5%u4E0D%u6015%u98F2","%u666E%u901A%u560C","%u4E0B%u8CE4","%u5E7D%u8C37%u4E09","%u6328%u5200%u7684%u8CA8","%u6709%u5976%u4E0D%u4E00","%u6B7B%u4E0D%u8981%u81C9","%u4E0D%u60F3%u6D3B%u5566","%u570B%u5BB6%u5993","%u611A%u6C11%u540C","%u5C4C%u7206%u4E86","%u4EBA%u528D%u5408%u4E00","%u6211%u52D2%u500B%u53BB","%u8207%u72D7%u6027","%u7D05%u8272%u6050","%u780D%u6BBA","%u8EDF%u5F31%u7684%u570B","%u5C0F%u599E","%u8001%u5A18","%u4E09%u632B","%u80E1%u8000%u90A6","%u4E09%u7D1A%u7247","%u4E09%u79D2%u5012","%u4E09%u7DB2%u53CB","%u690D%u7269%u51B0","%u4E0B%u6D41","%u83EF%u570B%u92D2","%u4E09%u5511","%u7E3D%u7406","%u9280%u69CD%u5C0F%u9738%u738B","%u9084%u770B%u9326%u6FE4","%u62D4%u540A%u7121%u60C5","%u8001%u4E8C","%u665D%u5C07%u8FD1","%u8272%u5C0F%u8AAA","%u60E1%u7206","%u6025%u9700%u5AD6","%u4E00%u9640%u7CDE","%u6709%u6BDB%u75C5","%u4E00%u9640%u5C4E","%u5931%u610F%u85E5","%u8349%u5305","%u9802%u4F60%u500B%u80BA","%u5171%u548C%u570B","%u5C0F%u9B3C%u5B50","%u6C5F%u592A%u4E0A","%u5341%u5927%u8B0A","%u505A%u611B%u5C0F","%u7D04%u70AE","%u81EA%u7206","%u59D0%u5305%u591C","%u59D0%u670D%u52D9","%u4F60%u6709%u75C5","%u59D0%u4E0A%u9580","%u6FE4%u4E00%u6A23%u80E1","%u81EA%u6200","%u63A8%u6CB9%u6309","%u540A%u5152%u90CE%u7576%u7684","%u516B%u560E","%u53BB%u5E74%u8CB7%u4E86%u500B%u8868","%u896A%u6309%u6469","%u760B%u5B50","%u6211%u9802%u4F60%u500B%u80BA","%u7CBE%u5B50%u5C04","%u6EAB%u5207%u65AF%u7279","%u5C0F%u5077","%u5976%u5976%u500B%u718A","%u8001%u50A2%u4F19","%u7D0B%u4E86%u6BDB","%u9127%u5C0F%u5E73","%u70CF%u8805%u6C34","%u7121%u78BC%u5C08","%u9280%u69CD%u5C0F%u9738%u738B","%u5E0C%u9AD2","%u516D%u5408%u5F69","%u5C04%u5165","%u99AC%u52D2%u6208%u58C1","%u4E82%u502B%u5C0F","%u4E92%u64FC%u5A03","%u5E2D%u6307%u8457%u8B77","%u5403%u7FD4","%u502B%u7406%u5927","%u5403%u7CBE","%u7206%u51FA%u7FD4","%u502B%u7406%u6BDB","%u5207%u514B%u9B27","%u502B%u7406%u7247","%u5C0F%u7A74","%u8001%u4E09%u8001%u56DB","%u4E07%u91CC","%u738B%u82B3","%u738B%u4E50%u6CC9","%u7530%u7EAA%u4E91","%u6C5F%u9752","%u674E%u8499","%u674E%u5EFA%u56FD","%u4F55%u9C81%u4E3D","%u8C37%u7267","%u5B8B%u5E73","%u5B8B%u5065","%u8FDF%u6D69%u7530","%u5F20%u4E07%u5E74","%u5F20%u6625%u6865","%u7F57%u5E72","%u90DD%u5EFA%u79C0","%u59DC%u6625%u4E91","%u5EB7%u751F","%u66F9%u5FD7","%u4E01%u77F3%u5B59","%u4E01%u5173%u6839","%u738B%u9009","%u738B%u6606%u4ED1","%u738B%u5FD7%u73CD","%u53F6%u5723%u9676","%u53F2%u826F","%u534E%u7F57%u5E9A","%u534E%u5EFA%u654F","%u5218%u742A","%u5218%u5EF6%u4E1C","%u5218%u9756%u57FA","%u8BB8%u5609%u7490","%u5B59%u5BB6%u6B63","%u4E25%u96BD%u742A","%u82AE%u674F%u6587","%u674E%u5C9A%u6E05","%u674E%u91D1%u534E","%u5434%u9636%u5E73","%u5F20%u6000%u897F","%u9646%u5B9A%u4E00","%u8305%u4EE5%u5347","%u5B63%u65B9","%u5468%u57F9%u6E90","%u8363%u6BC5%u4EC1","%u80E1%u7EF3","%u80E1%u4E54%u6728","%u5B5F%u5EFA%u67F1","%u66F9%u5EFA%u56FD","%u8D39%u5B5D%u901A","%u987E%u79C0%u83B2","%u94B1%u4F1F%u957F","%u94B1%u660C%u7167","%u5510%u5BB6%u7487","%u76DB%u534E%u4EC1","%u848B%u6811%u58F0","%u738B%u4E19%u4E7E","%u738B%u4EFB%u91CD","%u738B%u5146%u56FD","%u738B%u9E64%u5BFF","%u5218%u5B81%u4E00","%u5B59%u5065","%u674E%u7D20%u6587","%u674E%u9521%u94ED","%u6768%u79C0%u5CF0","%u5434%u5FB7","%u4F55%u52C7","%u5F20%u7ACB%u660C","%u5F90%u51B0","%u5EB7%u4E16%u6069","%u9EC4%u534E","%u5085%u94C1%u5C71","%u9A6C%u53D9%u4F26","%u5389%u65E0%u754F","%u4E54%u77F3","%u5B89%u5B50%u4ECB","%u5B59%u5B5A%u51CC","%u5B59%u6653%u6751","%u4E25%u6D4E%u6148","%u82CF%u6B65%u9752","%u6C88%u5747%u5112","%u6C88%u96C1%u51B0","%u5F20%u6995%u660E","%u9648%u826F%u5B87","%u9648%u53D4%u901A","%u9648%u6155%u534E","%u5468%u5EFA%u4EBA","%u7ECF%u53D4%u5E73","%u80E1%u6108%u4E4B","%u59DA%u6587%u5143","%u94B1%u4E4B%u5149","%u94B1%u6B63%u82F1","%u94B1%u5B66%u68EE","%u5F90%u5321%u8FEA","%u6851%u56FD%u536B","%u9EC4%u83CA","%u5C09%u5EFA%u884C","%u848B%u6B63%u534E","%u97E9%u542F%u5FB7","%u7AE5%u7B2C%u5468","%u66FE%u57F9%u708E","%u8DEF%u752C%u7965","%u8463%u5EFA%u534E","%u80E1%u8000%u90A6","%u6731%u9555%u57FA","%u5F6D%u5FB7%u6000","%u7F57%u8363%u6853","%u8D3A%u9F99","%u7C9F%u88D5","%u9648%u8D53","%u8096%u52B2%u5149","%u9EC4%u514B%u8BDA","%u8C2D%u653F","%u738B%u9707","%u4EFB%u5F3C%u65F6","%u9676%u94F8","%u674E%u5BCC%u6625","%u8C2D%u9707%u6797","%u738B%u9996%u9053","%u6BDB%u81F4%u7528","%u9093%u529B%u7FA4","%u6210%u601D%u5371","%u6C5F%u534E","%u82CF%u632F%u534E","%u674E%u94C1%u6620","%u674E%u70DB%u5C18","%u674E%u7EF4%u6C49","%u6768%u52C7","%u6768%u5F97%u5FD7","%u8096%u514B","%u4F55%u957F%u5DE5","%u5B8B%u4EFB%u7A77","%u5B8B%u65F6%u8F6E","%u5F20%u9707","%u6797%u4F2F%u6E20","%u6B27%u9633%u94A6","%u5468%u5149%u53EC","%u5468%u8C37%u57CE","%u803F%u98D9","%u9676%u5CD9%u5CB3","%u5F6D%u4F69%u4E91","%u7A0B%u6F5C","%u8C22%u89C9%u54C9","%u8521%u7545","%u5ED6%u6C49%u751F","%u6ED5%u4EE3%u8FDC","%u4EE4%u8BA1%u5212","%u8584%u7199%u6765","%u8584%u4E00%u6CE2","%u534E%u56FD%u950B","%u5F90%u5411%u524D","%u5F6D%u771F","%u5085%u4F5C%u4E49","%u59EC%u9E4F%u98DE","%u7EAA%u767B%u594E","%u4EFB%u5EFA%u65B0","%u674E%u96EA%u5CF0","%u9648%u6C38%u8D35","%u8463%u5176%u6B66","%u7A0B%u5B50%u534E","%u9093%u9896%u8D85","%u8BB8%u4E16%u53CB","%u9648%u5B97%u5174","%u674E%u5FB7%u751F","%u5434%u6842%u8D24","%u5F20%u601D%u537F","%u8D75%u7D2B%u9633","%u6BB5%u541B%u6BC5","%u66F9%u521A%u5DDD","%u5F6D%u96EA%u67AB","%u738B%u80DC%u4FCA","%u738B%u7A3C%u7965","%u6731%u8574%u5C71","%u5B59%u8D77%u5B5F","%u6C6A%u6D0B","%u5F20%u52B2%u592B","%u5F20%u6CBB%u4E2D","%u9648%u9526%u534E","%u5468%u53D4%u8F74","%u8D75%u6734%u521D","%u67EF%u5E86%u65BD","%u6D2A%u5B66%u667A","%u59DA%u4F9D%u6797","%u9EC4%u9547","%u7AE0%u4F2F%u94A7","%u8463%u5BC5%u521D","%u4E60%u4EF2%u52CB","%u9A6C%u6587%u745E","%u5218%u6F9C%u6D9B","%u6768%u660E%u8F69","%u6C6A%u950B","%u5C48%u6B66","%u80E1%u542F%u7ACB","%u59DA%u8FDE%u851A","%u9AD8%u5C97","%u90ED%u4F2F%u96C4","%u738B%u5E73","%u738B%u6587%u5143","%u6731%u5149%u4E9A","%u4F0D%u4FEE%u6743","%u5218%u534E%u6E05","%u674E%u56DB%u5149","%u674E%u5148%u5FF5","%u5434%u4EEA","%u9648%u518D%u9053","%u9648%u9521%u8054","%u6797%u5F6A","%u79E6%u57FA%u4F1F","%u9EC4%u706B%u9752","%u9EC4%u6C38%u80DC","%u8463%u5FC5%u6B66","%u97E9%u5148%u695A","%u8C22%u5BCC%u51B6","%u9648%u660C%u667A","%u94B1%u8FD0%u5F55","%u9A6C%u4E07%u797A","%u9093%u5146%u7965","%u53F6%u9009%u5E73","%u53F6%u5251%u82F1","%u5218%u590D%u4E4B","%u8096%u626C","%u4F55%u9999%u51DD","%u8C22%u975E","%u96F7%u6D01%u743C","%u8521%u5EF7%u9534","%u5ED6%u6656","%u5ED6%u627F%u5FD7","%u970D%u82F1%u4E1C","%u7F57%u5BCC%u548C","%u4E4C%u4E91%u5176%u6728%u683C","%u767D%u7ACB%u5FF1","%u5415%u6B63%u64CD","%u674E%u8D35%u9C9C","%u6768%u6613%u6668","%u9648%u594E%u5143","%u5468%u94C1%u519C","%u5F90%u624D%u539A","%u9AD8%u5D07%u6C11","%u960E%u660E%u590D","%u5DF4%u91D1","%u9093%u5C0F%u5E73","%u9093%u6734%u65B9","%u674E%u9E4F","%u674E%u4E00%u6C13","%u6768%u6C5D%u5CB1","%u5F20%u6F9C","%u5F20%u7231%u840D","%u5F20%u6885%u9896","%u9648%u6BC5","%u9648%u5E0C%u540C","%u7F57%u745E%u537F","%u5E15%u5DF4%u62C9%B7%u683C%u5217%u6717%u6770","%u90ED%u6CAB%u82E5","%u6881%u5149%u70C8","%u5085%u949F","%u8C2D%u7ECD%u6587","%u6768%u5C1A%u6606","%u738B%u6069%u8302","%u8BB8%u5FB7%u8854","%u674E%u4E95%u6CC9","%u674E%u4F5C%u9E4F","%u8096%u534E","%u5434%u6CD5%u5BAA","%u5434%u5B98%u6B63","%u90B1%u4F1A%u4F5C","%u4F59%u79CB%u91CC","%u6C6A%u4E1C%u5174","%u5EB7%u514B%u6E05","%u66FE%u5E86%u7EA2","%u738B%u6C49%u658C","%u65B9%u6BC5","%u9093%u5B50%u6062","%u5362%u5609%u9521","%u53F6%u98DE","%u53F6%u7FA4","%u5E84%u5E0C%u6CC9","%u6768%u6210%u6B66","%u5F20%u5EF7%u53D1","%u5F20%u9F0E%u4E1E","%u9648%u4E0D%u663E","%u9648%u81F3%u7ACB","%u9648%u4F2F%u8FBE","%u9648%u5609%u5E9A","%u4E01%u5149%u8BAD","%u6731%u5B66%u8303%uFF0C%u5434%u5B66%u8C26","%u90B9%u5BB6%u534E","%u6C99%u5343%u91CC","%u5F20%u95FB%u5929","%u9648%u4E91","%u80E1%u53A5%u6587","%u94B1%u5176%u741B","%u502A%u5FD7%u798F","%u9EC4%u708E%u57F9","%u9EC4%u5B5F%u590D","%u4E07%u94A2","%u9A6C%u51EF","%u738B%u5149%u82F1","%u674E%u5FB7%u5168","%u8D3E%u6625%u65FA","%u97E6%u56FD%u6E05","%u6210%u514B%u6770","%u7518%u82E6","%u674E%u5146%u712F","%u674E%u6C9B%u7476","%u674E%u6D4E%u6DF1","%u7A0B%u601D%u8FDC","%u4E07%u56FD%u6743","%u738B%u521A","%u738B%u5FE0%u79B9","%u738B%u6D2A%u6587","%u56DE%u826F%u7389","%u8D75%u5357%u8D77","%u675C%u9752%u6797","%u674E%u745E%u73AF","%u90D1%u4E07%u901A","%u5218%u4F2F%u627F","%u6768%u767D%u51B0","%u6768%u5C1A%u6606","%u80E1%u5B50%u6602","%u8042%u8363%u81FB","%u5F20%u51B2","%u7F2A%u4E91%u53F0","%u695A%u56FE%u5357","%u9648%u4FCA%u751F","%u6797%u67AB","%u97E9%u5149","%u97E9%u677C%u6EE8","%u4E4C%u5170%u592B","%u5E03%u8D6B","%u90D1%u5929%u7FD4","%u6234%u79C9%u56FD","%u5305%u5C14%u6C49","%u6768%u9759%u4EC1","%u9A6C%u5174%u745E","%u738B%u6BC5","%u5C39%u529B","%u77F3%u6CF0%u5CF0","%u5218%u56FD%u4E2D","%u674E%u5E72%u6770","%u674E%u4E66%u78CA","%u674E%u9E3F%u5FE0","%u4F55%u536B%u4E1C","%u4F55%u7ACB%u5CF0","%u5F20%u53C8%u4FA0","%u5F20%u56FD%u6E05","%u9648%u6587%u6E05","%u9648%u5409%u5B81","%u9648%u654F%u5C14","%u8881%u5BB6%u519B","%u9EC4%u5764%u660E","%u5218%u91D1%u56FD","%u738B%u5C0F%u6D2A","%u4F55%u7ACB%u5CF0","%u5F20%u56FD%u6E05","%u5218%u56FD%u4E2D","%u738B%u5C0F%u6D2A","%u5434%u653F%u9686","%u8C0C%u8D3B%u7434","%u5434%u653F%u9686","%u5F20%u53C8%u4FA0%20","%u4F55%u536B%u4E1C","%u5218%u91D1%u56FD","%u5F20%u519B","%u5E94%u52C7","%u674E%u9E3F%u5FE0","%u738B%u4E1C%u660E","%u8096%u6377","%u90D1%u5EFA%u90A6","%u4E01%u4EF2%u793C","%u90DD%u660E%u91D1","%u8521%u8FBE%u5CF0","%u4F55%u7EF4","%u6B66%u7EF4%u534E","%u94C1%u51DD","%u5F6D%u6E05%u534E","%u5F20%u5E86%u4F1F","%u6D1B%u6851%u6C5F%u6751","%u96EA%u514B%u6765%u63D0%u624E%u514B%u5C14","%u5218%u5947","%u77F3%u6CF0%u5CF0","%u80E1%u6625%u534E","%u6C88%u8DC3%u8DC3","%u738B%u52C7","%u5468%u5F3A","%u5E15%u5DF4%u62C9%u683C%u5217%u6717%u6770","%u4F55%u539A%u94E7","%u6881%u632F%u82F1","%u5DF4%u7279%u5C14","%u82CF%u8F89","%u90B5%u9E3F","%u9AD8%u4E91%u9F99","%u9648%u6B66","%u7A46%u8679%u54B8%u8F89","%u738B%u4E1C%u5CF0","%u59DC%u4FE1%u6CBB","%u848B%u4F5C%u541B","%u4F55%u62A5%u7FD4","%u738B%u5149%u8C26","%u79E6%u535A%u52C7","%u6731%u6C38%u65B0","%u6768%u9707","%u738B%u4E1C%u5CF0","%u5C39%u529B","%u674E%u79C0%u9886","%u6BB7%u52C7","%u9B4F%u5C0F%u4E1C","%u9648%u654F%u5C14","%u55BB%u4E91%u6797","%u5F20%u5DE5","%u738B%u5E38%u677E","%u9648%u5409%u5B81","%u9EC4%u8389%u65B0","%u9F9A%u6B63","%u80E1%u6587%u5BB9","%u8881%u5BB6%u519B","%u738B%u70AF","%u80E1%u8861%u534E","%u7A0B%u4E3D%u534E","%u502A%u5CB3%u5CF0","%u738B%u6B63%u8C31","%u5F20%u56FD%u534E","%u5510%u767B%u6770","%u91D1%u6E58%u519B","%u5434%u5B58%u8363","%u5B59%u7ECD%u9A8B","%u738B%u8389%u971E","%u5F20%u5EF6%u6606","%u90DD%u9E4F","%u674E%u4E50%u6210","%u5468%u6CE2","%u666F%u4FCA%u6D77","%u80E1%u7389%u4EAD","%u6731%u56FD%u8D24","%u9ED1%u9F99%u6C5F%u7701","%u8BB8%u52E4","%u6881%u60E0%u73B2","%u84DD%u7ECD%u654F","%u4FE1%u957F%u661F","%u8BB8%u6606%u6797","%u5F20%u4E49%u73CD","%u6613%u70BC%u7EA2","%u738B%u6D69","%u5EC9%u6BC5%u654F","%u97E9%u4FCA","%u738B%u6E05%u5BAA","%u5510%u826F%u667A","%u5468%u7956%u7FFC","%u8D75%u9F99","%u6ED5%u4F73%u6750","%u5C39%u5F18","%u53F6%u5EFA%u6625","%u6797%u6B66","%u5468%u4E43%u7FD4","%u845B%u6167%u541B","%u697C%u9633%u751F","%u738B%u51EF","%u5B54%u660C%u751F","%u738B%u8499%u5FBD","%u738B%u5FE0%u6797","%u5B59%u4F1F","%u6C88%u6653%u660E","%u6BDB%u4F1F%u660E","%u6BDB%u4E07%u6625","%u9EC4%u5764%u660E","%u9EC4%u695A%u5E73","%u738B%u4F1F%u4E2D","%u6797%u514B%u5E86","%u5218%u5B81","%u84DD%u5929%u7ACB","%u5B59%u5927%u4F1F","%u51AF%u98DE","%u5218%u5C0F%u660E","%u674E%u8363%u707F","%u738B%u6653%u6656","%u9EC4%u5F3A","%u7530%u5411%u5229","%u5F90%u9E9F","%u674E%u70B3%u519B","%u8D75%u6C38%u6E05","%u738B%u5B81","%u738B%u4E88%u6CE2","%u5218%u6653%u51EF","%u738B%u541B%u6B63","%u6D1B%u6851%u6C5F%u6751","%u4E25%u91D1%u6D77","%u5E15%u5DF4%u62C9%u683C%u5217%u6717%u6770","%u8D75%u4E00%u5FB7","%u8D75%u521A","%u5F90%u65B0%u8363","%u80E1%u660C%u5347","%u4EFB%u632F%u9E64","%u5E84%u56FD%u6CF0","%u9648%u521A","%u5434%u6653%u519B","%u516C%u4FDD%u624E%u897F","%u6881%u8A00%u987A","%u5F20%u96E8%u6D66","%u9648%u96CD","%u9A6C%u5174%u745E","%u7956%u6728%u70ED%u63D0%u543E%u5E03%u529B","%u827E%u5C14%u80AF%u5410%u5C3C%u4E9A%u5B5C","%u52AA%u5C14%u5170%u963F%u4E0D%u90FD%u6EE1%u91D1","%u674E%u5BB6%u8D85","%u6881%u541B%u5F66","%u8D3A%u4E00%u8BDA","%u9AD8%u5F00%u8D24","%u9648%u4E91","%u6797%u5F6A","%u5F6D%u5FB7%u6000","%u9093%u5C0F%u5E73","%u9093%u5B50%u6062","%u8D3A%u9F99","%u9648%u6BC5","%u4E4C%u5170%u592B","%u674E%u5148%u5FF5","%u4E07%u91CC","%u59DA%u4F9D%u6797","%u674E%u9E4F","%u7530%u7EE7%u5149","%u9093%u5C0F%u5E73","%u9093%u9896%u8D85","%u6731%u9555%u57FA","%u66FE%u5E86%u6C5F","%u5468%u90A6%u56FD","%u9EC4%u83CA","%u9648%u72EC%u79C0","%u9093%u7A3C%u5148","%u5411%u5FE0%u53D1","%u4EFB%u5F3C%u65F6","%u8463%u5FC5%u6B66","%u5B59%u4E2D%u5C71","%u848B%u4ECB%u77F3","%u96F7%u950B","%u674E%u6E90%u6F6E","%u738B%u5149%u7F8E","%u6C5F%u9752","%u6797%u4F73%u6963","%u738B%u6CBB%u5E73","%u5218%u6C38%u6E05","%u6768%u5C1A%u6606","%u674E%u4F2F%u948A","%u674E%u5927%u948A","%u7F57%u8363%u6853","%u5F90%u5411%u524D","%u8042%u8363%u81FB","%u53F6%u5251%u82F1","%u7C9F%u88D5","%u5F90%u6D77%u4E1C","%u9EC4%u514B%u8BDA","%u9648%u8D53","%u8C2D%u653F","%u8096%u52B2%u5149","%u5F20%u4E91%u9038","%u7F57%u745E%u537F","%u738B%u6811%u58F0","%u8BB8%u5149%u8FBE","%u5B59%u6625%u5170","%u738B%u5C90%u5C71","%u5218%u9E64","%u80E1%u6625%u534E","%u9B4F%u51E4%u548C","%u738B%u52C7","%u738B%u6BC5","%u8096%u6377","%u8D75%u514B%u5FD7","%u8096%u6377","%u842C%u91CC","%u738B%u82B3","%u738B%u6A02%u6CC9","%u738B%u6EEC%u5BE7","%u7530%u7D00%u96F2","%u6C5F%u9752","%u674E%u8499","%u674E%u5EFA%u570B","%u4F55%u9B6F%u9E97","%u8C37%u7267","%u5B8B%u5E73","%u5B8B%u5065","%u9072%u6D69%u7530","%u5F35%u842C%u5E74","%u5F35%u6625%u6A4B","%u7F85%u5E72","%u90DD%u5EFA%u79C0","%u59DC%u6625%u96F2","%u5EB7%u751F","%u66F9%u5FD7","%u4E01%u77F3%u5B6B","%u4E01%u95DC%u6839","%u738B%u9078","%u738B%u5D11%u5D19","%u738B%u5FD7%u73CD","%u8449%u8056%u9676","%u53F2%u826F","%u83EF%u7F85%u5E9A","%u83EF%u5EFA%u654F","%u5289%u742A","%u5289%u5EF6%u6771","%u5289%u9756%u57FA","%u6C5F%u6FA4%u6C11","%u8A31%u5609%u7490","%u5B6B%u5BB6%u6B63","%u56B4%u96CB%u742A","%u82AE%u674F%u6587","%u674E%u5F37","%u674E%u5D50%u6E05","%u674E%u91D1%u83EF","%u5433%u968E%u5E73","%u5F35%u61F7%u897F","%u9678%u5B9A%u4E00","%u8305%u4EE5%u5347","%u5B63%u65B9","%u5468%u57F9%u6E90","%u69AE%u6BC5%u4EC1","%u80E1%u7E69","%u80E1%u55AC%u6728","%u5B5F%u5EFA%u67F1","%u66F9%u5EFA%u570B","%u8CBB%u5B5D%u901A","%u9867%u79C0%u84EE","%u9322%u5049%u9577","%u9322%u660C%u7167","%u5510%u5BB6%u7487","%u76DB%u83EF%u4EC1","%u8523%u6A39%u8072","%u738B%u4E19%u4E7E","%u738B%u4EFB%u91CD","%u738B%u5146%u570B","%u738B%u9DB4%u58FD","%u5289%u5BE7%u4E00","%u5B6B%u5065","%u674E%u7D20%u6587","%u674E%u932B%u9298","%u694A%u79C0%u5CF0","%u5433%u5FB7","%u4F55%u52C7","%u5F35%u7ACB%u660C","%u5F90%u51B0","%u5EB7%u4E16%u6069","%u9EC3%u83EF","%u5085%u9435%u5C71","%u99AC%u6558%u502B","%u53B2%u7121%u754F","%u55AC%u77F3","%u5B89%u5B50%u4ECB","%u5B6B%u5B5A%u51CC","%u5B6B%u66C9%u6751","%u56B4%u6FDF%u6148","%u8607%u6B65%u9752","%u6C88%u5747%u5112","%u6C88%u96C1%u51B0","%u5F35%u6995%u660E","%u9673%u826F%u5B87","%u9673%u53D4%u901A","%u9673%u6155%u83EF","%u5468%u5EFA%u4EBA","%u7D93%u53D4%u5E73","%u80E1%u6108%u4E4B","%u59DA%u6587%u5143","%u9322%u4E4B%u5149","%u9322%u6B63%u82F1","%u9322%u5B78%u68EE","%u5F90%u5321%u8FEA","%u6851%u570B%u885B","%u9EC3%u83CA","%u5C09%u5EFA%u884C","%u8523%u6B63%u83EF","%u97D3%u555F%u5FB7","%u7AE5%u7B2C%u5468","%u66FE%u57F9%u708E","%u8DEF%u752C%u7965","%u8463%u5EFA%u83EF","%u80E1%u8000%u90A6","%u6731%u9394%u57FA","%u5F6D%u5FB7%u61F7","%u7F85%u69AE%u6853","%u8CC0%u9F8D","%u7C9F%u88D5","%u9673%u8CE1","%u8096%u52C1%u5149","%u9EC3%u514B%u8AA0","%u8B5A%u653F","%u738B%u9707","%u4EFB%u5F3C%u6642","%u9676%u9444","%u8CC0%u570B%u5F37","%u674E%u5BCC%u6625","%u8B5A%u9707%u6797","%u738B%u9996%u9053","%u6BDB%u81F4%u7528","%u9127%u529B%u7FA4","%u6210%u601D%u5371","%u6C5F%u83EF","%u8607%u632F%u83EF","%u674E%u9435%u6620","%u674E%u71ED%u5875","%u674E%u7DAD%u6F22","%u694A%u52C7","%u694A%u5F97%u5FD7","%u8096%u514B","%u4F55%u9577%u5DE5","%u5B8B%u4EFB%u7AAE","%u5B8B%u6642%u8F2A","%u5F35%u9707","%u6797%u4F2F%u6E20","%u6B50%u967D%u6B3D","%u5468%u5149%u53EC","%u5468%u8C37%u57CE","%u803F%u98C6","%u9676%u5CD9%u5CB3","%u5F6D%u4F69%u96F2","%u7A0B%u6F5B","%u8B1D%u89BA%u54C9","%u8521%u66A2","%u5ED6%u6F22%u751F","%u6ED5%u4EE3%u9060","%u4EE4%u8A08%u5283","%u8584%u7199%u4F86","%u8584%u4E00%u6CE2","%u83EF%u570B%u92D2","%u5F90%u5411%u524D","%u5F6D%u771F","%u5085%u4F5C%u7FA9","%u59EC%u9D6C%u98DB","%u7D00%u767B%u594E","%u4EFB%u5EFA%u65B0","%u674E%u96EA%u5CF0","%u9673%u6C38%u8CB4","%u8463%u5176%u6B66","%u7A0B%u5B50%u83EF","%u9127%u7A4E%u8D85","%u8A31%u4E16%u53CB","%u9673%u5B97%u8208","%u674E%u5FB7%u751F","%u5433%u6842%u8CE2","%u5F35%u601D%u537F","%u8D99%u7D2B%u967D","%u6BB5%u541B%u6BC5","%u66F9%u525B%u5DDD","%u5F6D%u96EA%u6953","%u738B%u52DD%u4FCA","%u738B%u7A3C%u7965","%u6731%u860A%u5C71","%u5B6B%u8D77%u5B5F","%u5433%u90A6%u570B","%u6C6A%u6D0B","%u5F35%u52C1%u592B","%u5F35%u6CBB%u4E2D","%u9673%u9326%u83EF","%u5468%u53D4%u8EF8","%u8D99%u6A38%u521D","%u67EF%u6176%u65BD","%u6D2A%u5B78%u667A","%u59DA%u4F9D%u6797","%u9EC3%u93AE","%u7AE0%u4F2F%u921E","%u8463%u5BC5%u521D","%u7FD2%u4EF2%u52F3","%u99AC%u6587%u745E","%u5289%u703E%u6FE4","%u694A%u660E%u8ED2","%u6C6A%u92D2","%u5C48%u6B66","%u80E1%u555F%u7ACB","%u59DA%u9023%u851A","%u9AD8%u5D17","%u90ED%u4F2F%u96C4","%u738B%u5E73","%u738B%u6587%u5143","%u6731%u5149%u4E9E","%u4F0D%u4FEE%u6B0A","%u5289%u83EF%u6E05","%u674E%u56DB%u5149","%u674E%u5148%u5FF5","%u5433%u5100","%u9673%u518D%u9053","%u9673%u932B%u806F","%u6797%u5F6A","%u79E6%u57FA%u5049","%u9EC3%u706B%u9752","%u9EC3%u6C38%u52DD","%u8463%u5FC5%u6B66","%u97D3%u5148%u695A","%u8B1D%u5BCC%u51B6","%u9673%u660C%u667A","%u9322%u904B%u9304","%u99AC%u842C%u797A","%u9127%u5146%u7965","%u8449%u9078%u5E73","%u8449%u528D%u82F1","%u5289%u5FA9%u4E4B","%u8096%u63DA","%u4F55%u9999%u51DD","%u8B1D%u975E","%u96F7%u6F54%u74CA","%u8521%u5EF7%u9347","%u5ED6%u6689","%u5ED6%u627F%u5FD7","%u970D%u82F1%u6771","%u7F85%u5BCC%u548C","%u70CF%u96F2%u5176%u6728%u683C","%u767D%u7ACB%u5FF1","%u5442%u6B63%u64CD","%u674E%u8CB4%u9BAE","%u694A%u6613%u6668","%u9673%u594E%u5143","%u5468%u9435%u8FB2","%u5F90%u624D%u539A","%u9AD8%u5D07%u6C11","%u95BB%u660E%u5FA9","%u5DF4%u91D1","%u9127%u5C0F%u5E73","%u9127%u6A38%u65B9","%u674E%u9D6C","%u674E%u4E00%u6C13","%u694A%u6C5D%u5CB1","%u5F35%u703E","%u5F35%u611B%u840D","%u5F35%u6885%u7A4E","%u9673%u6BC5","%u9673%u5E0C%u540C","%u7F85%u745E%u537F","%u5E15%u5DF4%u62C9%B7%u683C%u5217%u6717%u5091","%u90ED%u6CAB%u82E5","%u6881%u5149%u70C8","%u5085%u937E","%u8B5A%u7D39%u6587","%u694A%u5C1A%u6606","%u738B%u6069%u8302","%u8A31%u5FB7%u929C","%u674E%u4E95%u6CC9","%u674E%u4F5C%u9D6C","%u8096%u83EF","%u5433%u6CD5%u61B2","%u5433%u5B98%u6B63","%u90B1%u6703%u4F5C","%u4F59%u79CB%u88E1","%u6C6A%u6771%u8208","%u5EB7%u514B%u6E05","%u66FE%u6176%u7D05","%u738B%u6F22%u658C","%u65B9%u6BC5","%u9127%u5B50%u6062","%u76E7%u5609%u932B","%u8449%u98DB","%u8449%u7FA4","%u838A%u5E0C%u6CC9","%u694A%u6210%u6B66","%u5F35%u5EF7%u767C","%u5F35%u9F0E%u4E1E","%u9673%u4E0D%u986F","%u9673%u81F3%u7ACB","%u9673%u4F2F%u9054","%u9673%u5609%u5E9A","%u4E01%u5149%u8A13","%u6731%u5B78%u8303%uFF0C%u5433%u5B78%u8B19","%u9112%u5BB6%u83EF","%u6C99%u5343%u91CC","%u5F35%u805E%u5929","%u9673%u96F2","%u80E1%u53A5%u6587","%u9322%u5176%u741B","%u502A%u5FD7%u798F","%u9EC3%u708E%u57F9","%u9EC3%u5B5F%u5FA9","%u842C%u92FC","%u99AC%u51F1","%u738B%u5149%u82F1","%u674E%u5FB7%u5168","%u8CC8%u6625%u65FA","%u97CB%u570B%u6E05","%u6210%u514B%u5091","%u7518%u82E6","%u674E%u5146%u712F","%u674E%u6C9B%u7464","%u674E%u6FDF%u6DF1","%u7A0B%u601D%u9060","%u842C%u570B%u6B0A","%u738B%u525B","%u738B%u5FE0%u79B9","%u738B%u6D2A%u6587","%u56DE%u826F%u7389","%u8D99%u5357%u8D77","%u675C%u9752%u6797","%u674E%u745E%u74B0","%u912D%u842C%u901A","%u5289%u4F2F%u627F","%u694A%u767D%u51B0","%u694A%u5C1A%u6606","%u9B0D%u5B50%u6602","%u8076%u69AE%u81FB","%u5F35%u6C96","%u7E46%u96F2%u53F0","%u695A%u5716%u5357","%u9673%u4FCA%u751F","%u6797%u6953","%u97D3%u5149","%u97D3%u677C%u6FF1","%u70CF%u862D%u592B","%u5E03%u8D6B","%u912D%u5929%u7FD4","%u6234%u79C9%u570B","%u5305%u723E%u6F22","%u694A%u975C%u4EC1","%u674E%u5F37","%u8D99%u6A02%u969B","%u738B%u6EEC%u5BE7","%u99AC%u8208%u745E","%u738B%u6BC5","%u5C39%u529B","%u77F3%u6CF0%u5CF0","%u5289%u570B%u4E2D","%u674E%u5E72%u5091","%u674E%u66F8%u78CA","%u674E%u9D3B%u5FE0","%u4F55%u885B%u6771","%u4F55%u7ACB%u5CF0","%u5F35%u53C8%u4FE0","%u5F35%u570B%u6E05","%u9673%u6587%u6E05","%u9673%u5409%u5BE7","%u9673%u654F%u723E","%u8881%u5BB6%u8ECD","%u9EC3%u5764%u660E","%u5289%u91D1%u570B","%u738B%u5C0F%u6D2A","%u97D3%u6B63","%u674E%u5F37","%u4F55%u7ACB%u5CF0","%u5F35%u570B%u6E05","%u5289%u570B%u4E2D","%u738B%u5C0F%u6D2A","%u5433%u653F%u9686","%u8AF6%u8CBD%u7434","%u5433%u653F%u9686","%u5F35%u53C8%u4FE0%20","%u4F55%u885B%u6771","%u5289%u91D1%u570B","%u5F35%u8ECD","%u61C9%u52C7","%u8D99%u6A02%u969B","%u674E%u9D3B%u5FE0","%u738B%u6771%u660E","%u8096%u6377","%u912D%u5EFA%u90A6","%u4E01%u4EF2%u79AE","%u90DD%u660E%u91D1","%u8521%u9054%u5CF0","%u4F55%u7DAD","%u6B66%u7DAD%u83EF","%u9435%u51DD","%u5F6D%u6E05%u83EF","%u5F35%u6176%u5049","%u6D1B%u6851%u6C5F%u6751","%u96EA%u514B%u4F86%u63D0%u624E%u514B%u723E","%u5289%u5947","%u738B%u6EEC%u5BE7","%u77F3%u6CF0%u5CF0","%u80E1%u6625%u83EF","%u6C88%u8E8D%u8E8D","%u738B%u52C7","%u5468%u5F37","%u5E15%u5DF4%u62C9%u683C%u5217%u6717%u5091","%u4F55%u539A%u93F5","%u6881%u632F%u82F1","%u5DF4%u7279%u723E","%u8607%u8F1D","%u90B5%u9D3B","%u9AD8%u96F2%u9F8D","%u9673%u6B66","%u7A46%u8679%u9E79%u8F1D","%u738B%u6771%u5CF0","%u59DC%u4FE1%u6CBB","%u8523%u4F5C%u541B","%u4F55%u5831%u7FD4","%u738B%u5149%u8B19","%u79E6%u535A%u52C7","%u6731%u6C38%u65B0","%u694A%u9707","%u738B%u6771%u5CF0","%u5C39%u529B","%u674E%u79C0%u9818","%u6BB7%u52C7","%u9B4F%u5C0F%u6771","%u9673%u654F%u723E","%u55BB%u96F2%u6797","%u5F35%u5DE5","%u738B%u5E38%u677E","%u9673%u5409%u5BE7","%u9EC3%u8389%u65B0","%u9F94%u6B63","%u80E1%u6587%u5BB9","%u8881%u5BB6%u8ECD","%u738B%u70AF","%u80E1%u8861%u83EF","%u7A0B%u9E97%u83EF","%u502A%u5CB3%u5CF0","%u738B%u6B63%u8B5C","%u5F35%u570B%u83EF","%u5510%u767B%u5091","%u91D1%u6E58%u8ECD","%u5433%u5B58%u69AE","%u5B6B%u7D39%u9A01","%u738B%u8389%u971E","%u5F35%u5EF6%u6606","%u90DD%u9D6C","%u674E%u6A02%u6210","%u5468%u6CE2","%u666F%u4FCA%u6D77","%u80E1%u7389%u4EAD","%u6731%u570B%u8CE2","%u9ED1%u9F8D%u6C5F%u7701","%u8A31%u52E4","%u6881%u60E0%u73B2","%u85CD%u7D39%u654F","%u4FE1%u9577%u661F","%u8A31%u6606%u6797","%u5F35%u7FA9%u73CD","%u6613%u7149%u7D05","%u738B%u6D69","%u5EC9%u6BC5%u654F","%u97D3%u4FCA","%u738B%u6E05%u61B2","%u5510%u826F%u667A","%u5468%u7956%u7FFC","%u8D99%u9F8D","%u6ED5%u4F73%u6750","%u5C39%u5F18","%u8449%u5EFA%u6625","%u6797%u6B66","%u5468%u4E43%u7FD4","%u845B%u6167%u541B","%u6A13%u967D%u751F","%u738B%u51F1","%u5B54%u660C%u751F","%u738B%u8499%u5FBD","%u738B%u5FE0%u6797","%u5B6B%u5049","%u6C88%u66C9%u660E","%u6BDB%u5049%u660E","%u6BDB%u842C%u6625","%u9EC3%u5764%u660E","%u9EC3%u695A%u5E73","%u738B%u5049%u4E2D","%u6797%u514B%u6176","%u5289%u5BE7","%u85CD%u5929%u7ACB","%u5B6B%u5927%u5049","%u99AE%u98DB","%u5289%u5C0F%u660E","%u674E%u69AE%u71E6","%u738B%u66C9%u6689","%u9EC3%u5F37","%u7530%u5411%u5229","%u5F90%u9E9F","%u674E%u70B3%u8ECD","%u8D99%u6C38%u6E05","%u738B%u5BE7","%u738B%u4E88%u6CE2","%u5289%u66C9%u51F1","%u738B%u541B%u6B63","%u6D1B%u6851%u6C5F%u6751","%u56B4%u91D1%u6D77","%u5E15%u5DF4%u62C9%u683C%u5217%u6717%u5091","%u8D99%u4E00%u5FB7","%u8D99%u525B","%u5F90%u65B0%u69AE","%u80E1%u660C%u5347","%u4EFB%u632F%u9DB4","%u838A%u570B%u6CF0","%u9673%u525B","%u5433%u66C9%u8ECD","%u516C%u4FDD%u624E%u897F","%u6881%u8A00%u9806","%u5F35%u96E8%u6D66","%u9673%u96CD","%u99AC%u8208%u745E","%u7956%u6728%u71B1%u63D0%u543E%u5E03%u529B","%u827E%u723E%u80AF%u5410%u5C3C%u4E9E%u5B5C","%u52AA%u723E%u862D%u963F%u4E0D%u90FD%u6EFF%u91D1","%u674E%u5BB6%u8D85","%u6881%u541B%u5F65","%u8CC0%u4E00%u8AA0","%u9AD8%u958B%u8CE2","%u9673%u96F2","%u6797%u5F6A","%u5F6D%u5FB7%u61F7","%u9127%u5C0F%u5E73","%u9127%u5B50%u6062","%u8CC0%u9F8D","%u9673%u6BC5","%u70CF%u862D%u592B","%u674E%u5148%u5FF5","%u842C%u91CC","%u59DA%u4F9D%u6797","%u674E%u9D6C","%u7530%u7E7C%u5149","%u9127%u5C0F%u5E73","%u9127%u7A4E%u8D85","%u5F6D%u9E97%u5A9B","%u6731%u9394%u57FA","%u66FE%u6176%u6C5F","%u5468%u90A6%u570B","%u9EC3%u83CA","%u9673%u7368%u79C0","%u9127%u7A3C%u5148","%u5411%u5FE0%u767C","%u4EFB%u5F3C%u6642","%u8463%u5FC5%u6B66","%u5B6B%u4E2D%u5C71","%u8523%u4ECB%u77F3","%u96F7%u92D2","%u674E%u6E90%u6F6E","%u738B%u5149%u7F8E","%u6C5F%u9752","%u6797%u4F73%u6963","%u738B%u6CBB%u5E73","%u5289%u6C38%u6E05","%u694A%u5C1A%u6606","%u674E%u4F2F%u91D7","%u674E%u5927%u91D7","%u7F85%u69AE%u6853","%u5F90%u5411%u524D","%u8076%u69AE%u81FB","%u8449%u528D%u82F1","%u7C9F%u88D5","%u5F90%u6D77%u6771","%u9EC3%u514B%u8AA0","%u9673%u8CE1","%u8B5A%u653F","%u8096%u52C1%u5149","%u5F35%u96F2%u9038","%u7F85%u745E%u537F","%u738B%u6A39%u8072","%u8A31%u5149%u9054","%u5B6B%u6625%u862D","%u738B%u5C90%u5C71","%u97D3%u6B63","%u5289%u9DB4","%u80E1%u6625%u83EF","%u9B4F%u9CF3%u548C","%u738B%u52C7","%u738B%u6BC5","%u8096%u6377","%u8D99%u514B%u5FD7","%u8096%u6377","%u6BDB%u6F64%u4E4B"],
            t = 0, a = u.replace(/(^\s*)|(\s*$)|(\s)/g, "");
        console.log(e[2004]);
        for (a = escape(a), console.log(a), i = 0; i < e.length; i++) {
            var n = a.indexOf(e[i]);
            -1 != a.indexOf(e[i]) && (console.log(e[i]), console.log(i), console.log(n), t++)
        }
        return console.log(t), 0 != t
    }

    var n = $("#" + u).val();
    console.log(n);
    {
        if ("NumData" === e) return n ? /(^[\u4E00-\u9FA5]{1,5}$)|(^[a-zA-Z]{1}[a-zA-Z0-9]{1,15})$/.test(n) ? !a(n) || (layer.open({
            content: "你的姓名属于敏感词汇！",
            skin: "msg",
            time: 2
        }), !1) : (layer.open({
            content: "你的姓名格式不符，<br />（格式：1~5位中文字符或2~16位英文字符）！",
            skin: "msg",
            time: 2
        }), !1) : (layer.open({content: "请输入姓名~", skin: "msg", time: 2}), !1);
        if ("NumData2" == e) {
            return n ? /(^[\u4E00-\u9FA5]{1,5}$)|(^[a-zA-Z]{1}[a-zA-Z0-9]{1,15})$/.test(n) ? !a(n) || (layer.open({
                content: "对方姓名属于敏感词汇！",
                skin: "msg",
                time: 2
            }), !1) : (layer.open({
                content: "对方姓名格式不符，<br />（格式：1~5位中文字符或2~16位英文字符）！",
                skin: "msg",
                time: 2
            }), !1) : (layer.open({content: "对方姓名没有填写！", skin: "msg", time: 2}), !1)
        } else if ("city" == e) $("#prov" + t).find("option:selected").text(), $("#city" + t).find("option:selected").text(), $("#dist" + t).find("option:selected").text(); else {
            if ("iBirthday" == e) {
                if (!n) return layer.open({content: "你的生日没有选择！", skin: "msg", time: 2}), !1;
                is_eighteen_years(n, t);
                $("#birthday_my" + t).attr("data-text");
                return !0
            }
            if ("iBirthday-hm" == e) return n ? (is_eighteen_years(n, t), !0) : (layer.open({
                content: "你的生日没有选择！",
                skin: "msg",
                time: 2
            }), !1);
            if ("iHour" == e) return !!n || (layer.open({content: "你的生辰没有选择！", skin: "msg", time: 2}), !1);
            if ("iEmail" == e) return n ? !!/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/.test(n) || (layer.open({
                content: "邮箱格式不正确！",
                skin: "msg",
                time: 2
            }), !1) : (layer.open({content: "你的邮箱没有填写！", skin: "msg", time: 2}), !1);
            if ("iMobile" == e) return n ? !!/^1[34578]\d{9}$/.test(n) || (layer.open({
                content: "手机格式不正确！",
                skin: "msg",
                time: 2
            }), !1) : (layer.open({content: "你的手机没有填写！", skin: "msg", time: 2}), !1)
        }
    }
}

function is_eighteen_years(birthday, sort) {
    var ndate = new Date, birthday_arr = birthday.split("-"), nyear = ndate.getFullYear(),
        nmonth = ndate.getMonth() + 1, nday = ndate.getDate(), age = nyear - birthday_arr[0] - 1;
    (nmonth > parseInt(birthday_arr[1]) || nmonth == parseInt(birthday_arr[1]) && nday >= parseInt(birthday_arr[2])) && (age += 1), age < 18 ? (layer.open({
        content: "未满18岁，暂不提供服务！",
        skin: "msg",
        time: 5
    }), eval("is_eighteen" + sort.toString() + " = false;")) : eval("is_eighteen" + sort.toString() + " = true;")
}

function PrefixInteger(u, e) {
    return (Array(e).join(0) + u).slice(-e)
}

function getQueryString(u) {
    var e = new RegExp("(^|&)" + u + "=([^&]*)(&|$)", "i"), t = window.location.search.substr(1).match(e);
    return null != t ? decodeURIComponent(t[2]) : null
}

function GetIOSVersion() {
    if (window.MSStream) return !1;
    var u = navigator.appVersion.match(/OS (\d+)_(\d+)_?(\d+)?/);
    return null != u && [parseInt(u[1], 10), parseInt(u[2] || 0, 10), parseInt(u[3] || 0, 10)].join(".")
}

function getAndroidVersion() {
    var u = (ua = ua.toLowerCase()).match(/android\s([0-9\.]*)/);
    return !!u && parseFloat(u[1])
}

var browser = {
        isAndroid: function () {
            return !!navigator.userAgent.match(/Android/i)
        }, isIOS: function () {
            return !!navigator.userAgent.match(/iPhone|iPad|iPod/i)
        }, isWx: function () {
            return !!navigator.userAgent.match(/micromessenger/i)
        }, isWp: function () {
            return -1 < ua.toLowerCase().indexOf("windows phone")
        }, getIOSVersion: function () {
            if (window.MSStream) return !1;
            var u, e = navigator.appVersion.match(/OS (\d+)_(\d+)_?(\d+)?/);
            return null != e && (u = [parseInt(e[1], 10), parseInt(e[2], 10), parseInt(e[3] || 0, 10)], parseFloat(u.join(".")))
        }
    }, posId = getQueryString("posId") && 0 !== getQueryString("posId").length ? getQueryString("posId") : "",
    deviceId = getQueryString("deviceId") && 0 !== getQueryString("deviceId").length ? getQueryString("deviceId") : "",
    ua = window.navigator.userAgent, appVersion = /[a-zA-Z]/.test(ua.split(" ").pop()) ? "1.0.0" : ua.split(" ").pop(),
    sysVersion = GetIOSVersion() || getAndroidVersion();
if (null !== deviceId && "[openudid]" !== deviceId.toLowerCase() || (deviceId = ""), "" === deviceId) if (localStorage.getItem("go108_tlp_guid")) deviceId = localStorage.getItem("go108_tlp_guid"); else {
    // 已禁用json_remote.php请求，使用默认deviceId
    deviceId = "device_" + Date.now();
    localStorage.setItem("go108_tlp_guid", deviceId);
}

function getElements(u) {
    for (var e = document.getElementById(u), t = new Array, a = e.getElementsByTagName("input"), n = 0; n < a.length; n++) t.push(a[n]);
    var r = e.getElementsByTagName("select");
    for (n = 0; n < r.length; n++) t.push(r[n]);
    return t
}

function inputRadio(u) {
    if (u.checked) return [u.name, u.value]
}

function inputSelector(u) {
    for (i = 0; i < u.length; i++) if (1 == u[i].selected) return [u.name, u[i].value]
}

function input(u) {
    switch (u.type.toLowerCase()) {
        case"submit":
        case"hidden":
        case"password":
        case"text":
            return [u.name, u.value];
        case"checkbox":
        case"radio":
            return inputRadio(u)
    }
    return !1
}

function pselect(u) {
    return inputSelector(u)
}

function serializeElement(u) {
    var e, t = u.tagName.toLowerCase(), a = [];
    if ("input" == t && (e = input(u))) {
        if (0 == (E = encodeURIComponent(e[0])).length) return;
        e[1].constructor != Array && (e[1] = [e[1]]);
        for (var n = e[1], r = 0; r < n.length; r++) a.push(E + "=" + encodeURIComponent(n[r]))
    }
    if ("select" == t && (e = pselect(u))) {
        var E;
        if (0 == (E = encodeURIComponent(e[0])).length) return;
        e[1].constructor != Array && (e[1] = [e[1]]);
        for (n = e[1], r = 0; r < n.length; r++) a.push(E + "=" + encodeURIComponent(n[r]))
    }
    return a.join("&")
}

function serializeForm(u) {
    for (var e = getElements(u), t = new Array, a = 0; a < e.length; a++) {
        var n = serializeElement(e[a]);
        n && t.push(n)
    }
    return t.join("&")
}

$(function () {
    $(".btnMeasure").on("click", function () {
        0;
        var u = "deviceId=" + deviceId + "&posId=" + posId;
        if ($("#page_extra").val(u), CheckUserInput()) {
            is_eighteen ? layer.open({type: 2, content: "老师解析中", time: 15}) : layer.open({
                content: "未满18岁，暂不提供服务！",
                skin: "msg",
                time: 5
            });
            // 已禁用json_remote.php请求
            /*
            var e = {DataString: serializeForm("frmMeasure"), method: "remoteID"};
            $.ajax({
                url: "../json_remote.php",
                dataType: "json",
                type: "POST",
                data: e,
                t: (new Date).getTime(),
                success: function (u) {
                    var e = u.ERR, t = u.NEXT;
                    if (1 != e) return layer.open({content: "订单创建失败", skin: "msg", time: 2}), !1;
                    location.href = t
                },
                error: function (u) {
                    console.log(u)
                }
            })
            */
        }
    })
}), window.lCalendar = function () {
    var j = $("html").width(), q = !1;
    document.addEventListener("touchmove", function (u) {
    });
    document.createElement("div");

    function z() {
        q ? (document.body.addEventListener("scroll", function (u) {
            u.cancelable && u.preventDefault()
        }), document.querySelector(".gearDate").addEventListener("touchmove", function (u) {
            u.cancelable && u.preventDefault()
        })) : (document.body.removeEventListener("scroll", function (u) {
            u.cancelable && u.preventDefault()
        }), document.querySelector(".gearDate").removeEventListener("touchmove", function (u) {
            u.cancelable && u.preventDefault()
        }))
    }

    var d = ["时辰未知", "00:00~00:59", "01:00~02:59", "03:00~04:59", "05:00~06:59", "07:00~08:59", "09:00~10:59", "11:00~12:59", "13:00~14:59", "15:00~16:59", "17:00~18:59", "19:00~20:59", "21:00~22:59", "23:00~23:59"],
        T = {year: "", month: "", date: "", hour: ""};
    "classList" in document.documentElement || Object.defineProperty(HTMLElement.prototype, "classList", {
        get: function () {
            var n = this;

            function u(a) {
                return function (u) {
                    var e = n.className.split(/\s+/g), t = e.indexOf(u);
                    a(e, t, u), n.className = e.join(" ")
                }
            }

            return {
                add: u(function (u, e, t) {
                    ~e || u.push(t)
                }), remove: u(function (u, e) {
                    ~e && u.splice(e, 1)
                }), toggle: u(function (u, e, t) {
                    ~e ? u.splice(e, 1) : u.push(t)
                }), contains: function (u) {
                    return !!~n.className.split(/\s+/g).indexOf(u)
                }, item: function (u) {
                    return n.className.split(/\s+/g)[u] || null
                }
            }
        }
    });

    function u() {
        var u = new Date;
        this.gearDate, this.minY = 1940, this.minM = 1, this.minD = 1, this.maxY = u.getYear() + 1900, this.maxM = u.getMonth() + 1, this.maxD = u.getDate() + 1, this.type = 0
    }

    return u.prototype = {
        init: function (u, e) {
            this.trigger = document.querySelector(u), this.hasHourLc = $(this.trigger).attr("hasHour"), this.bindEvent("date")
        }, bindEvent: function (u) {
            var b = this,
                x = [new e(38, 0, 0, 38, 1, 1, 0, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1), new e(26, 6, 2, 44, 1, 1, 0, 1, 1, 0, 1, 0, 0, 1, 0, 1, 0), new e(45, 0, 3, 49, 1, 0, 1, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0), new e(35, 0, 4, 54, 0, 1, 0, 1, 0, 1, 1, 0, 1, 0, 1, 0, 1), new e(24, 4, 5, 59, 1, 0, 1, 0, 1, 0, 1, 0, 1, 1, 0, 1, 1), new e(43, 0, 0, 5, 0, 0, 1, 0, 0, 1, 0, 1, 1, 1, 0, 1, 1), new e(32, 0, 1, 10, 1, 0, 0, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1), new e(21, 2, 2, 15, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 1, 1), new e(40, 0, 3, 20, 1, 0, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1, 1), new e(28, 7, 5, 26, 1, 0, 1, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1), new e(47, 0, 6, 31, 0, 1, 1, 0, 1, 1, 0, 0, 1, 0, 1, 0, 1), new e(36, 0, 0, 36, 1, 0, 1, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0), new e(26, 5, 1, 41, 0, 1, 0, 1, 0, 1, 0, 1, 1, 0, 1, 0, 1), new e(44, 0, 3, 47, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 1), new e(33, 0, 4, 52, 1, 0, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0), new e(23, 3, 5, 57, 0, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1, 1, 1), new e(42, 0, 6, 2, 0, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1, 1, 1), new e(30, 8, 1, 8, 1, 0, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1, 0), new e(48, 0, 2, 13, 1, 1, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1, 0), new e(38, 0, 3, 18, 0, 1, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1), new e(27, 6, 4, 23, 1, 0, 1, 0, 1, 1, 0, 1, 0, 1, 0, 1, 0), new e(45, 0, 6, 29, 1, 0, 1, 0, 1, 0, 1, 1, 0, 1, 0, 1, 0), new e(35, 0, 0, 34, 0, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, 1), new e(24, 4, 1, 39, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1, 1, 1, 0), new e(43, 0, 2, 44, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1, 1, 1, 0), new e(32, 0, 4, 50, 0, 1, 0, 1, 0, 0, 1, 0, 0, 1, 1, 0, 1), new e(20, 3, 5, 55, 1, 1, 1, 0, 1, 0, 0, 1, 0, 0, 1, 1, 0), new e(39, 0, 6, 0, 1, 1, 0, 1, 1, 0, 0, 1, 0, 1, 0, 1, 0), new e(29, 7, 0, 5, 0, 1, 0, 1, 1, 0, 1, 0, 1, 0, 1, 0, 1), new e(47, 0, 2, 11, 0, 1, 0, 1, 0, 1, 1, 0, 1, 0, 1, 0, 1), new e(36, 0, 3, 16, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, 1, 0), new e(26, 5, 4, 21, 0, 1, 0, 0, 1, 0, 1, 0, 1, 1, 1, 0, 1), new e(45, 0, 5, 26, 0, 1, 0, 0, 1, 0, 1, 0, 1, 1, 0, 1, 1), new e(33, 0, 0, 32, 1, 0, 1, 0, 0, 1, 0, 0, 1, 1, 0, 1, 1), new e(22, 4, 1, 37, 1, 1, 0, 1, 0, 0, 1, 0, 0, 1, 1, 0, 1), new e(41, 0, 2, 42, 1, 1, 0, 1, 0, 0, 1, 0, 0, 1, 0, 1, 1), new e(30, 8, 3, 47, 1, 1, 0, 1, 0, 1, 0, 1, 0, 0, 1, 0, 1), new e(48, 0, 5, 53, 1, 0, 1, 1, 0, 1, 0, 1, 0, 1, 0, 0, 1), new e(37, 0, 6, 58, 1, 0, 1, 1, 0, 1, 1, 0, 1, 0, 1, 0, 1), new e(27, 6, 0, 3, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, 1, 0), new e(46, 0, 1, 8, 1, 0, 0, 1, 0, 1, 0, 1, 1, 0, 1, 1, 0), new e(35, 0, 3, 14, 0, 1, 0, 0, 1, 0, 0, 1, 1, 0, 1, 1, 1), new e(24, 4, 4, 19, 1, 0, 1, 0, 0, 1, 0, 0, 1, 0, 1, 1, 1), new e(43, 0, 5, 24, 1, 0, 1, 0, 0, 1, 0, 0, 1, 0, 1, 1, 1), new e(32, 10, 6, 29, 1, 0, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 1), new e(50, 0, 1, 35, 0, 1, 1, 0, 1, 0, 1, 0, 0, 1, 0, 1, 0), new e(39, 0, 2, 40, 0, 1, 1, 0, 1, 1, 0, 1, 0, 1, 0, 0, 1), new e(28, 6, 3, 45, 1, 0, 1, 0, 1, 1, 0, 1, 1, 0, 1, 0, 0), new e(47, 0, 4, 50, 1, 0, 1, 0, 1, 0, 1, 1, 0, 1, 1, 0, 1), new e(36, 0, 6, 56, 1, 0, 0, 1, 0, 1, 0, 1, 0, 1, 1, 1, 0), new e(26, 5, 0, 1, 0, 1, 0, 0, 1, 0, 0, 1, 0, 1, 1, 1, 1), new e(45, 0, 1, 6, 0, 1, 0, 0, 1, 0, 0, 1, 0, 1, 1, 1, 0), new e(34, 0, 2, 11, 0, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 1, 0), new e(22, 3, 4, 17, 0, 1, 1, 0, 1, 0, 1, 0, 0, 1, 0, 1, 0), new e(40, 0, 5, 22, 1, 1, 1, 0, 1, 0, 1, 0, 0, 1, 0, 1, 0), new e(30, 8, 6, 27, 0, 1, 1, 0, 1, 0, 1, 1, 0, 0, 1, 0, 1), new e(49, 0, 0, 32, 0, 1, 0, 1, 1, 0, 1, 0, 1, 1, 0, 0, 1), new e(37, 0, 2, 38, 1, 0, 1, 0, 1, 0, 1, 1, 0, 1, 1, 0, 1), new e(27, 5, 3, 43, 1, 0, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1), new e(46, 0, 4, 48, 1, 0, 0, 1, 0, 0, 1, 0, 1, 1, 1, 0, 1), new e(35, 0, 5, 53, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 1, 0, 1), new e(23, 4, 0, 59, 1, 1, 0, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1), new e(42, 0, 1, 4, 1, 1, 0, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1), new e(31, 0, 2, 9, 1, 1, 0, 1, 1, 0, 1, 0, 0, 1, 0, 1, 0), new e(21, 2, 3, 14, 0, 1, 0, 1, 1, 0, 1, 0, 1, 0, 1, 0, 1), new e(39, 0, 5, 20, 0, 1, 0, 1, 0, 1, 1, 0, 1, 0, 1, 0, 1), new e(28, 7, 6, 25, 1, 0, 1, 0, 1, 0, 1, 0, 1, 1, 0, 1, 1), new e(48, 0, 0, 30, 0, 0, 1, 0, 0, 1, 0, 1, 1, 1, 0, 1, 1), new e(37, 0, 1, 35, 1, 0, 0, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1), new e(25, 5, 3, 41, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 1, 1), new e(44, 0, 4, 46, 1, 0, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1, 1), new e(33, 0, 5, 51, 1, 0, 1, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1), new e(22, 4, 6, 56, 1, 0, 1, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0), new e(40, 0, 1, 2, 1, 0, 1, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0), new e(30, 9, 2, 7, 0, 1, 0, 1, 0, 1, 0, 1, 1, 0, 1, 0, 1), new e(49, 0, 3, 12, 0, 1, 0, 0, 1, 0, 1, 1, 1, 0, 1, 0, 1), new e(38, 0, 4, 17, 1, 0, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0), new e(27, 6, 6, 23, 0, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1, 1, 1), new e(46, 0, 0, 28, 0, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1, 1, 0), new e(35, 0, 1, 33, 1, 0, 1, 0, 1, 0, 0, 1, 0, 0, 1, 1, 0), new e(24, 4, 2, 38, 0, 1, 1, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1), new e(42, 0, 4, 44, 0, 1, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1), new e(31, 0, 5, 49, 1, 0, 1, 0, 1, 1, 0, 1, 0, 1, 0, 1, 0), new e(21, 2, 6, 54, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 1), new e(40, 0, 0, 59, 0, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, 1), new e(28, 6, 2, 5, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1, 1, 1, 0), new e(47, 0, 3, 10, 1, 0, 1, 0, 0, 1, 0, 0, 1, 1, 1, 0, 1), new e(36, 0, 4, 15, 1, 1, 0, 1, 0, 0, 1, 0, 0, 1, 1, 0, 1), new e(25, 5, 5, 20, 1, 1, 1, 0, 1, 0, 0, 1, 0, 0, 1, 1, 0), new e(43, 0, 0, 26, 1, 1, 0, 1, 0, 1, 0, 1, 0, 0, 1, 0, 1), new e(32, 0, 1, 31, 1, 1, 0, 1, 1, 0, 1, 0, 1, 0, 1, 0, 0)];

            function A(u) {
                var e = b.gearDate.querySelector(".lcalendar_nongli"),
                    t = b.gearDate.querySelector(".lcalendar_gongli"), a = 0;
                if ("nongli" == u && 1 != b.type ? (e.className = e.className.replace(/active/, "").replace(/(^\s*)|(\s*$)/g, "") + " active", t.className = t.className.replace(/active/, ""), a = b.type = 1) : "gongli" == u && 0 != b.type && (e.className = e.className.replace(/active/, ""), t.className = t.className.replace(/active/, "").replace(/(^\s*)|(\s*$)/g, "") + " active", b.type = 0, a = 1), a) {
                    var n = b.maxY - b.minY + 1,
                        r = parseInt(Math.round(b.gearDate.querySelector(".date_yy").getAttribute("val"))),
                        E = parseInt(Math.round(b.gearDate.querySelector(".date_mm").getAttribute("val"))) + 1,
                        i = parseInt(Math.round(b.gearDate.querySelector(".date_dd").getAttribute("val"))) + 1,
                        B = parseInt(Math.round(b.gearDate.querySelector(".date_h").getAttribute("val22"))) + 1;
                    console.log(E + "------" + i + "------" + B);
                    var o = r % n + b.minY, s = (u = b.type ? 0 : 1, x[r].Intercalation ? x[r].Intercalation : 0);
                    !b.type && s && (s == E - 1 ? E = -(E - 1) : s < E - 1 ? --E : E = E);
                    var D = m(u, o, E, i, B);
                    0 == u && ($(b.trigger).attr("data-date22", D.yy), $(b.trigger).attr("data-date33", D.mm));
                    var C = x[D.yy - b.minY].Intercalation ? x[D.yy - b.minY].Intercalation : 0;
                    C && b.type && (D.mm < 0 ? D.mm = 1 - D.mm : D.mm > C && (D.mm = D.mm + 1)), b.gearDate.querySelector(".date_yy").setAttribute("val", D.yy - b.minY), b.gearDate.querySelector(".date_mm").setAttribute("val", D.mm - 1), b.gearDate.querySelector(".date_dd").setAttribute("val", D.dd - 1), b.gearDate.querySelector(".date_h").setAttribute("val", D.h - 1), b.gearDate.querySelector(".date_yy").setAttribute("top", ""), c()
                }
            }

            function c() {
                var u = b.maxY - b.minY + 1, e = b.gearDate.querySelector(".date_yy"), t = "<div class='tooth'></div>";
                if (e && e.getAttribute("val")) {
                    for (var a = parseInt(e.getAttribute("val")), n = 0; n <= u - 1; n++) t += "<div class='tooth'>" + (b.minY + n) + "</div>";
                    e.innerHTML = t;
                    var r = Math.floor(parseFloat(e.getAttribute("top")));
                    if (isNaN(r)) e.style.transform = "translate(0," + (8 - 2 * a) + "em)", e.style["-webkit-transform"] = "translate(0," + (8 - 2 * a) + "em)", e.style["-moz-transform"] = "translate(0," + (8 - 2 * a) + "em)", e.style["-ms-transform"] = "translate(0," + (8 - 2 * a) + "em)", e.style["-o-transform"] = "translate(0," + (8 - 2 * a) + "em)", e.setAttribute("top", 8 - 2 * a + "em"); else {
                        r % 2 == 0 ? r = r : r += 1, 8 < r && (r = 8);
                        var E = 8 - 2 * (u - 1);
                        r < E && (r = E), e.style.transform = "translate(0," + r + "em)", e.style["-webkit-transform"] = "translate(0," + r + "em)", e.style["-moz-transform"] = "translate(0," + r + "em)", e.style["-ms-transform"] = "translate(0," + r + "em)", e.style["-o-transform"] = "translate(0," + r + "em)", e.setAttribute("top", r + "em"), a = Math.abs(r - 8) / 2, e.setAttribute("val", a)
                    }
                    var i = b.gearDate.querySelector(".date_mm");
                    if (i && i.getAttribute("val")) {
                        t = "<div class='tooth'></div>";
                        var B = parseInt(i.getAttribute("val")), o = x[a].Intercalation ? x[a].Intercalation : 0;
                        if (o && b.type) var s = 12; else s = 11;
                        var D, C = 0;
                        if (a == u - 1) if (b.type) if (0 <= b.nongMaxObj.mm) {
                            var l = x[b.nongMaxObj.yy - 1940].Intercalation;
                            D = l && l < b.nongMaxObj.mm ? b.nongMaxObj.mm : b.nongMaxObj.mm - 1
                        } else D = Math.abs(b.nongMaxObj.mm); else D = b.maxM - 1;
                        0 == a && (C = b.type ? b.minM - 1 : b.minM);
                        for (n = 0; n < s - C + 1; n++) {
                            var F = C + n + 1;
                            b.type ? (F = o && o == n ? _("rm", F - 1) : _("mm", o && o < n ? F - 1 : F), t += 0 <= D && D < n ? "<div class='tooth' style='color:#c1c1c1'>" + F + "</div>" : "<div class='tooth'>" + F + "</div>") : t += 0 <= D && D < n ? "<div class='tooth' style='color:#c1c1c1'>" + F + "月</div>" : "<div class='tooth'>" + F + "月</div>"
                        }
                        i.innerHTML = t, s < B ? (B = s, i.setAttribute("val", B)) : B < C && (B = s, i.setAttribute("val", B)), i.style.transform = "translate(0," + (8 - 2 * (B - C)) + "em)", i.style["-webkit-transform"] = "translate(0," + (8 - 2 * (B - C)) + "em)", i.style["-moz-transform"] = "translate(0," + (8 - 2 * (B - C)) + "em)", i.style["-ms-transform"] = "translate(0," + (8 - 2 * (B - C)) + "em)", i.style["-o-transform"] = "translate(0," + (8 - 2 * (B - C)) + "em)", i.setAttribute("top", 8 - 2 * (B - C) + "em");
                        var d = b.gearDate.querySelector(".date_dd");
                        if (d && d.getAttribute("val")) {
                            t = "<div class='tooth'></div>";
                            var A, c = parseInt(d.getAttribute("val")), m = w(a, B) - 1, v = 0;
                            a == u - 1 && D == B && (A = b.type ? b.nongMaxObj.dd - 1 : b.maxD - 2), 0 == a && 2 == B + 1 && (v = b.type ? b.minD - 1 : b.minD + 6);
                            for (n = 0; n < m - v + 1; n++) {
                                F = b.type ? _("dd", v + n + 1) : v + n + 1;
                                b.type ? t += 0 <= A && A < n ? "<div class='tooth' style='color:#c1c1c1'>" + F + "</div>" : "<div class='tooth'>" + F + "</div>" : t += 0 <= A && A < n ? "<div class='tooth' style='color:#c1c1c1'>" + F + "日</div>" : "<div class='tooth'>" + F + "日</div>"
                            }
                            d.innerHTML = t, m < c ? (c = m, d.setAttribute("val", c)) : c < v && (c = v, d.setAttribute("val", c)), d.style.transform = "translate(0," + (8 - 2 * (c - v)) + "em)", d.style["-webkit-transform"] = "translate(0," + (8 - 2 * (c - v)) + "em)", d.style["-moz-transform"] = "translate(0," + (8 - 2 * (c - v)) + "em)", d.style["-ms-transform"] = "translate(0," + (8 - 2 * (c - v)) + "em)", d.style["-o-transform"] = "translate(0," + (8 - 2 * (c - v)) + "em)", d.setAttribute("top", 8 - 2 * (c - v) + "em");
                            var g = b.gearDate.querySelector(".date_h"), y = $(b.trigger).next().attr("jiavalue");
                            if (1 == b.hasHourLc && g && g.getAttribute("val")) {
                                var p = parseInt(g.getAttribute("val22")), f = 1;
                                if (a == u - 1 && D == B && c == A) {
                                    if ((f = function () {
                                        for (var u = (new Date).getHours(), e = ["早子时", "丑时", "寅时", "卯时", "辰时", "巳时", "午时", "未时", "申时", "酉时", "戌时", "亥时", "晚子时"], t = ["早子时", "丑时", "丑时", "寅时", "寅时", "卯时", "卯时", "辰时", "辰时", "巳时", "巳时", "午时", "午时", "未时", "未时", "申时", "申时", "酉时", "酉时", "戌时", "戌时", "亥时", "亥时", "晚子时"][u], a = 1, n = 0; n < e.length; n++) e[n] == t && (a = n + 1);
                                        return a
                                    }()) <= p) {
                                        g.setAttribute("val", f), g.setAttribute("val22", f);
                                        var h = 8 - 2 * f
                                    } else {
                                        g.setAttribute("val", 1);
                                        h = 8 - 2 * y
                                    }
                                    g.style.transform = "translate(0," + h + "em)", g.style["-webkit-transform"] = "translate(0," + h + "em)", g.style["-moz-transform"] = "translate(0," + h + "em)", g.style["-ms-transform"] = "translate(0," + h + "em)", g.style["-o-transform"] = "translate(0," + h + "em)", g.setAttribute("top", h + "em")
                                } else {
                                    g.setAttribute("val", 1);
                                    h = 8 - 2 * y;
                                    g.style.transform = "translate(0," + h + "em)", g.style["-webkit-transform"] = "translate(0," + h + "em)", g.style["-moz-transform"] = "translate(0," + h + "em)", g.style["-ms-transform"] = "translate(0," + h + "em)", g.style["-o-transform"] = "translate(0," + h + "em)", g.setAttribute("top", h + "em")
                                }
                            }
                            L()
                        }
                    }
                }
            }

            function w(u, e) {
                return 1 == b.type ? x[u].MonthDays[e] ? 30 : 29 : 1 == e ? (u += b.minY) % 4 == 0 && u % 100 != 0 || u % 400 == 0 && u % 4e3 != 0 ? 29 : 28 : 3 == e || 5 == e || 8 == e || 10 == e ? 30 : 31
            }

            function _(u, e) {
                var t = ["早子时", "丑时", "寅时", "卯时", "辰时", "巳时", "午时", "未时", "申时", "酉时", "戌时", "亥时", "晚子时"];
                return "rm" == u ? ["闰正月", "闰二月", "闰三月", "闰四月", "闰五月", "闰六月", "闰七月", "闰八月", "闰九月", "闰十月", "闰冬月", "闰腊月"][e - 1] : "mm" == u ? ["正月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"][e - 1] : "dd" == u ? ["初一", "初二", "初三", "初四", "初五", "初六", "初七", "初八", "初九", "初十", "十一", "十二", "十三", "十四", "十五", "十六", "十七", "十八", "十九", "二十", "廿一", "廿二", "廿三", "廿四", "廿五", "廿六", "廿七", "廿八", "廿九", "三十", "三十一"][e - 1] : "h" == u || "h1" === u ? t[e - 1] : void 0
            }

            function m(u, e, t, a, n) {
                var r = e, E = t, i = a, B = n,
                    o = [0, 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334, 365, 396, 0, 31, 60, 91, 121, 152, 182, 213, 244, 274, 305, 335, 366, 397];
                if (0 == u) {
                    var s = parseInt(r), D = parseInt(E), C = parseInt(i), l = D - 1, F = M(s),
                        d = ((h = o[14 * F + l] + C) + x[y = s - 1940].BaseKanChih) % 60;
                    if (d = d < 22 ? 22 - d : 82 - d, (d += 3) < 10 && (d += 60), h <= x[y].BaseDays) y--, h = o[14 * (F = M(A = s - 1)) + (l += 12)] + C; else var A = s;
                    var c = x[y].BaseDays;
                    for (_ = 0; _ < 13; _++) {
                        var m = c + x[y].MonthDays[_] + 29;
                        if (h <= m) break;
                        c = m
                    }
                    var v = _ + 1, g = h - c;
                    return 0 != (p = x[y].Intercalation) && p < v && --v == p && (v = -p), 12 < v && (v -= 12), {
                        yy: A,
                        mm: v,
                        dd: g,
                        h: B
                    }
                }
                A = parseInt(r), v = parseInt(E), g = parseInt(i);
                var y, p, f = v;
                0 != (p = x[y = A - 1940].Intercalation) && (p < f ? f++ : f == -p && (f = p + 1)), f--;
                for (var h = 0, _ = 0; _ < f; _++) h += x[y].MonthDays[_] + 29;
                h += x[y].BaseDays + g;
                for (F = M(A), _ = 13; 0 <= _ && !(o[14 * F + _] < h); _--) ;
                if (_ <= 11) s = A, D = _ + 1; else s = A + 1, D = _ - 11;
                return {yy: s, mm: D, dd: C = h - o[14 * F + _], h: B}
            }

            function M(u) {
                return u % 400 == 0 ? 1 : u % 100 == 0 ? 0 : u % 4 == 0 ? 1 : 0
            }

            function e(u, e, t, a, n, r, E, i, B, o, s, D, C, l, F, d, A) {
                this.BaseDays = u, this.Intercalation = e, this.BaseWeekday = t, this.BaseKanChih = a, this.MonthDays = [n, r, E, i, B, o, s, D, C, l, F, d, A]
            }

            function v(u) {
                var e = ((u = u || event).wheelDelta ? 0 < u.wheelDelta : u.detail < 0) ? 21 : -21;
                u.preventDefault();
                for (var t = u.target; !t.classList.contains("gear");) t = t.parentElement;
                clearInterval(t["int_" + t.id]), t["old_" + t.id] = 0, t["o_t_" + t.id] = (new Date).getTime();
                var a = t.getAttribute("top");
                t["o_d_" + t.id] = a ? parseFloat(a.replace(/em/g, "")) : 0, t["new_" + t.id] = e, t["n_t_" + t.id] = (new Date).getTime() + 360;
                var n = 18 * (t["new_" + t.id] - t["old_" + t.id]) / 370;
                t["pos_" + t.id] = t["o_d_" + t.id] + n, t.setAttribute("top", t["pos_" + t.id] + "em");
                var r = (t["new_" + t.id] - t["old_" + t.id]) / (t["n_t_" + t.id] - t["o_t_" + t.id]);
                return Math.abs(r) <= .2 ? t["spd_" + t.id] = r < 0 ? -.08 : .08 : Math.abs(r) <= .5 ? t["spd_" + t.id] = r < 0 ? -.16 : .16 : t["spd_" + t.id] = r / 2, t["pos_" + t.id] || (t["pos_" + t.id] = 0), u.preventDefault && u.preventDefault(), E(t), !1
            }

            function g(u) {
                u.preventDefault();
                for (var e = u.target, a = e, n = !1; !e.classList.contains("gear");) e = e.parentElement;
                clearInterval(e["int_" + e.id]), e["old_" + e.id] = u.screenY, e["o_t_" + e.id] = (new Date).getTime();
                var t = e.getAttribute("top");
                e["o_d_" + e.id] = t ? parseFloat(t.replace(/em/g, "")) : 0, document.onmousemove = function (u) {
                    n = !0, (u = u || window.event).preventDefault();
                    for (var e = a; !e.classList.contains("gear");) e = e.parentElement;
                    e["new_" + e.id] = u.screenY, e["n_t_" + e.id] = (new Date).getTime();
                    var t = 18 * (e["new_" + e.id] - e["old_" + e.id]) / 370;
                    e["pos_" + e.id] = e["o_d_" + e.id] + t, e.style.transform = "translate(0," + e["pos_" + e.id] + "em)", e.style["-webkit-transform"] = "translate(0," + e["pos_" + e.id] + "em)", e.style["-moz-transform"] = "translate(0," + e["pos_" + e.id] + "em)", e.style["-ms-transform"] = "translate(0," + e["pos_" + e.id] + "em)", e.style["-o-transform"] = "translate(0," + e["pos_" + e.id] + "em)", e.setAttribute("top", e["pos_" + e.id] + "em")
                }, document.onmouseup = function (u) {
                    if (!n) return document.onmousemove = null, document.onmouseup = null, !1;
                    (u = u || window.event).preventDefault();
                    for (var e = a; !e.classList.contains("gear");) e = e.parentElement;
                    var t = (e["new_" + e.id] - e["old_" + e.id]) / (e["n_t_" + e.id] - e["o_t_" + e.id]);
                    Math.abs(t) <= .2 ? e["spd_" + e.id] = t < 0 ? -.08 : .08 : Math.abs(t) <= .5 ? e["spd_" + e.id] = t < 0 ? -.16 : .16 : e["spd_" + e.id] = t / 2, e["pos_" + e.id] || (e["pos_" + e.id] = 0), E(e), document.onmousemove = null, document.onmouseup = null
                }
            }

            function y(u) {
                u.preventDefault();
                var e = u.target;
                for (e.touchTip = !1; !e.classList.contains("gear");) e = e.parentElement;
                clearInterval(e["int_" + e.id]), e["old_" + e.id] = u.targetTouches[0].screenY, e["o_t_" + e.id] = (new Date).getTime();
                var t = e.getAttribute("top");
                e["o_d_" + e.id] = t ? parseFloat(t.replace(/em/g, "")) : 0
            }

            function p(u) {
                u.preventDefault();
                var e = u.target;
                for (e.touchTip = !0; !e.classList.contains("gear");) e = e.parentElement;
                e["new_" + e.id] = u.targetTouches[0].screenY, e["n_t_" + e.id] = (new Date).getTime();
                var t = 18 * (e["new_" + e.id] - e["old_" + e.id]) / 370;
                e["pos_" + e.id] = e["o_d_" + e.id] + t, e.style.transform = "translate(0," + e["pos_" + e.id] + "em)", e.style["-webkit-transform"] = "translate(0," + e["pos_" + e.id] + "em)", e.style["-moz-transform"] = "translate(0," + e["pos_" + e.id] + "em)", e.style["-ms-transform"] = "translate(0," + e["pos_" + e.id] + "em)", e.style["-o-transform"] = "translate(0," + e["pos_" + e.id] + "em)", e.setAttribute("top", e["pos_" + e.id] + "em")
            }

            function f(u) {
                u.preventDefault();
                var e = u.target;
                if (!e.touchTip) return !1;
                for (; !e.classList.contains("gear");) e = e.parentElement;
                var t = (e["new_" + e.id] - e["old_" + e.id]) / (e["n_t_" + e.id] - e["o_t_" + e.id]);
                Math.abs(t) <= .2 ? e["spd_" + e.id] = t < 0 ? -.08 : .08 : Math.abs(t) <= .5 ? e["spd_" + e.id] = t < 0 ? -.16 : .16 : e["spd_" + e.id] = t / 2, e["pos_" + e.id] || (e["pos_" + e.id] = 0), E(e)
            }

            function E(p) {
                var f = 0, h = !1, _ = b.maxY - b.minY + 1;
                console.log(_), clearInterval(p["int_" + p.id]), p["int_" + p.id] = setInterval(function () {
                    var u = p["pos_" + p.id], e = p["spd_" + p.id] * Math.exp(-.03 * f);
                    if (u += e, !(.1 < Math.abs(e))) {
                        e = .1;
                        var t = 2 * Math.round(u / 2);
                        Math.abs(u - t) < .02 ? h = !0 : t < u ? u -= e : u += e
                    }
                    8 < u && (u = 8, h = !0);
                    var a = $(".date_mm"), n = $(".date_dd");
                    switch (p.getAttribute("data-datetype")) {
                        case"date_yy":
                            if (u < (c = 8 - 2 * (_ - 1)) && (u = c, h = !0), h) {
                                var r, E = Math.abs(u - 8) / 2;
                                if (I(p, E), clearInterval(p["int_" + p.id]), E == b.maxY - 1940) {
                                    if (b.type) if (0 <= b.nongMaxObj.mm) r = (A = x[b.nongMaxObj.yy - 1940].Intercalation) && A < b.nongMaxObj.mm ? b.nongMaxObj.mm : b.nongMaxObj.mm - 1; else r = Math.abs(b.nongMaxObj.mm); else r = b.maxM - 1;
                                    if (a.attr("val") >= r) I(a.get(0), r), D = b.type ? b.nongMaxObj.dd - 1 : b.maxD - 2, n.attr("val") > D && I(n.get(0), D)
                                }
                            }
                            break;
                        case"date_mm":
                            var i = b.gearDate.querySelector(".date_yy"), B = parseInt(i.getAttribute("val"));
                            if ((x[B].Intercalation ? x[B].Intercalation : 0) && b.type) var o = 12; else o = 11;
                            var s = 0;
                            if (B == _ - 1) if (b.type) if (0 <= b.nongMaxObj.mm) o = (A = x[b.nongMaxObj.yy - 1940].Intercalation) && A < b.nongMaxObj.mm ? b.nongMaxObj.mm : b.nongMaxObj.mm - 1; else o = Math.abs(b.nongMaxObj.mm); else o = b.maxM - 1;
                            if (0 == B && (s = b.type ? b.minM - 1 : b.minM), u < (c = 8 - 2 * (o - s)) && (u = c, h = !0), h) {
                                var D;
                                E = Math.abs(u - 8) / 2 + s;
                                if (I(p, E), clearInterval(p["int_" + p.id]), o == Math.round(E)) D = b.type ? b.nongMaxObj.dd - 1 : b.maxD - 2, n.attr("val") > D && I(n.get(0), D)
                            }
                            break;
                        case"date_dd":
                            i = b.gearDate.querySelector(".date_yy");
                            var C = b.gearDate.querySelector(".date_mm"),
                                l = w(B = parseInt(i.getAttribute("val")), v = parseInt(C.getAttribute("val"))) - 1,
                                F = 0;
                            if (b.type) if (0 <= b.nongMaxObj.mm) d = (A = x[b.nongMaxObj.yy - 1940].Intercalation) && A < b.nongMaxObj.mm ? b.nongMaxObj.mm : b.nongMaxObj.mm - 1; else d = Math.abs(b.nongMaxObj.mm); else d = b.maxM - 1;
                            if (B == _ - 1 && d == v && (l = b.type ? b.nongMaxObj.dd - 1 : b.maxD - 2), 0 == B && 2 == v + 1 && (F = b.type ? b.minD - 1 : b.minD + 6), u < (c = 8 - 2 * (l - F)) && (u = c, h = !0), h) {
                                E = Math.abs(u - 8) / 2 + F;
                                I(p, E), clearInterval(p["int_" + p.id])
                            }
                            break;
                        case"date_h":
                            i = b.gearDate.querySelector(".date_yy"), C = b.gearDate.querySelector(".date_mm");
                            var d, A, c, m = b.gearDate.querySelector(".date_dd"),
                                v = (B = parseInt(i.getAttribute("val")), parseInt(C.getAttribute("val"))),
                                g = parseInt(m.getAttribute("val")), y = 1;
                            if (b.type) if (0 <= b.nongMaxObj.mm) d = (A = x[b.nongMaxObj.yy - 1940].Intercalation) && A < b.nongMaxObj.mm ? b.nongMaxObj.mm : b.nongMaxObj.mm - 1; else d = Math.abs(b.nongMaxObj.mm); else d = b.maxM - 1;
                            if (B == _ - 1 && d == v && (l = b.type ? b.nongMaxObj.dd - 1 : b.maxD - 2), B == _ - 1 && d == v && l == g && (y = function () {
                                var u = (new Date).getHours(),
                                    e = ["早子时", "丑时", "寅时", "卯时", "辰时", "巳时", "午时", "未时", "申时", "酉时", "戌时", "亥时", "晚子时"],
                                    t = ["早子时", "丑时", "丑时", "寅时", "寅时", "卯时", "卯时", "辰时", "辰时", "巳时", "巳时", "午时", "午时", "未时", "未时", "申时", "申时", "酉时", "酉时", "戌时", "戌时", "亥时", "亥时", "晚子时"][u];
                                console.log(t);
                                for (var a = 1, n = 0; n < e.length; n++) e[n] == t && (a = 13 - n);
                                return a
                            }()), u < (c = 8 - 2 * (14 - y)) && (u = c, h = !0), h) {
                                E = Math.abs(u - 8) / 2;
                                I(p, E), clearInterval(p["int_" + p.id])
                            }
                    }
                    p["pos_" + p.id] = u, p.style.transform = "translate(0," + u + "em)", p.style["-webkit-transform"] = "translate(0," + u + "em)", p.style["-moz-transform"] = "translate(0," + u + "em)", p.style["-ms-transform"] = "translate(0," + u + "em)", p.style["-o-transform"] = "translate(0," + u + "em)", p.setAttribute("top", u + "em"), f++
                }, 6)
            }

            function I(u, e) {
                e = Math.round(e), console.log(e + "-------停留的值"), u.setAttribute("val", e), u.setAttribute("val22", e), $(u).hasClass("date_h") && $(b.trigger).next().attr("jiavalue", e), c()
            }

            function h(u) {
                if (u.preventDefault(), !window.CustomEvent) {
                    var e = new CustomEvent("input");
                    b.trigger.dispatchEvent(e)
                }
                document.body.removeChild(b.gearDate)
            }

            function S(u) {
                if (1 != b.hasHourLc) k(u); else {
                    $(".date_ctrl ").hide(), $(".date_confirm").show();
                    var e = L();
                    b.trigger.setAttribute("data-date", e.yy + "." + e.mm + "." + e.dd + "." + e.h), b.trigger.setAttribute("data-date22", e._yy), b.trigger.setAttribute("data-date33", e._mm);
                    var t = b.trigger.getAttribute("data-input-id");
                    t && (document.getElementById(t).value = e.yy + "-" + e.mm + "-" + e.dd + " " + e.h);
                    var a = $(".lcalendar_info").text(), n = $(".lcalendar_info1").text();
                    if (e._type) {
                        var r = '<p>农(阴)历：<span class="nongli" style="color:red">' + a + '</span></p><p>公(阳)历：<span class="gongli"  style="color:red">' + n + "<span></p>";
                        "时辰未知" === F && (r += '<div class="tixing1" style="color:#ff9900;font-size:18px;">注意:选时辰未知有可能影响结果的准确性</div>')
                    } else if ("时辰未知" === F) r = '<p>公(阳)历：<span class="gongli"  style="color:red">' + n + '<span></p><p>农(阴)历：<span class="nongli" style="color:red">' + a + '</span></p><div class="tixing1" style="color:#ff9900;font-size:18px;">注意:选时辰未知有可能影响结果的准确性</div>'; else r = '<p>公(阳)历：<span class="gongli"  style="color:red">' + n + '<span></p><p>农(阴)历：<span class="nongli" style="color:red">' + a + "</span></p>";
                    $(".gongnongli").html(r), 1 != b.hasHourLc && (a = function (u) {
                        var e = -1;
                        if (-1 != u.indexOf("时辰未知")) e = u.indexOf("时辰未知"), u = u.slice(0, e); else if (-1 != u.indexOf("早子")) e = u.indexOf("早子"), u = u.slice(0, e); else if (-1 != u.indexOf("晚子")) e = u.indexOf("晚子"), u = u.slice(0, e); else if (-1 != u.indexOf("时")) e = u.indexOf("时"), u = u.slice(0, e - 1); else {
                            if (-1 == u.indexOf("日")) return u;
                            e = u.indexOf("日"), u = u.slice(0, e + 1)
                        }
                        return u
                    }(a))
                }
            }

            function O() {
                $(".date_ctrl ").show(), $(".date_confirm").hide()
            }

            function k(u) {
                q = !1, z(), console.log(T);
                var e = T.hour;
                "时辰" == e && (e = "un"), $(b.trigger).next().val(T.year + "-" + T.month + "-" + T.date + "-" + e);
                var t = L();
                b.trigger.setAttribute("data-date", t.yy + "-" + t.mm + "-" + t.dd + " " + t.h), b.trigger.setAttribute("data-date22", t._yy), b.trigger.setAttribute("data-date33", t._mm);
                var a = b.trigger.getAttribute("data-input-id");
                a && (document.getElementById(a).value = t.yy + "-" + t.mm + "-" + t.dd + " " + t.h), console.log($(".lcalendar_info").text());
                $(".lcalendar_info").text(), $(".lcalendar_info1").text();
                if (b.type) {
                    var n = t._mm < 0 ? _("rm", -t._mm) : _("mm", t._mm);
                    $(b.trigger).attr("data-text", "农历:" + t._yy + "年" + n + _("dd", t._dd) + F), 1 != b.hasHourLc ? $(b.trigger).html("农历:" + t._yy + "年" + n + _("dd", t._dd)) : $(b.trigger).html("农历:" + t._yy + "年" + n + _("dd", t._dd) + F)
                } else $(b.trigger).attr("data-text", "公历:" + t.yy + "年" + t.mm + "月" + t.dd + "日" + F), 1 != b.hasHourLc ? $(b.trigger).html("公历:" + t.yy + "年" + t.mm + "月" + t.dd + "日") : $(b.trigger).html("公历:" + t.yy + "年" + t.mm + "月" + t.dd + "日" + F);
                h(u)
            }

            this.nongMaxObj = m(0, this.maxY.toString(), this.maxM.toString(), (this.maxD - 1).toString());
            var F = "";

            function L() {
                var u = b.maxY - b.minY + 1,
                    e = parseInt(Math.round(b.gearDate.querySelector(".date_yy").getAttribute("val"))),
                    t = e % u + b.minY,
                    a = parseInt(Math.round(b.gearDate.querySelector(".date_mm").getAttribute("val"))) + 1,
                    n = parseInt(Math.round(b.gearDate.querySelector(".date_dd").getAttribute("val"))) + 1,
                    r = parseInt(Math.round(b.gearDate.querySelector(".date_h").getAttribute("val22"))) + 1,
                    E = x[e].Intercalation ? x[e].Intercalation : 0;
                b.type && E && (E == a - 1 ? a = -(a - 1) : E < a - 1 ? --a : a = a);
                var i = m(b.type, t, a, n, r);
                console.log(i);
                var B = b.gearDate.querySelector(".lcalendar_info"), o = b.gearDate.querySelector(".lcalendar_info1");
                if (b.type) {
                    T.year = i.yy, T.month = i.mm, T.date = i.dd, T.hour = d[r - 1].slice(0, 2), b.trigger.setAttribute("data-type", 1);
                    var s = a < 0 ? _("rm", -a) : _("mm", a);
                    F = (F = _("h", r - 1)) || "时辰未知";
                    var D = m(1, t, a, n, r), C = t + "年" + s + _("dd", n) + F;
                    return B.innerHTML = C, o.innerHTML = D.yy + "年" + D.mm + "月" + D.dd + "日" + F, {
                        yy: i.yy,
                        mm: i.mm,
                        dd: i.dd,
                        _yy: t,
                        _mm: a,
                        _dd: n,
                        _h: r,
                        _type: b.type
                    }
                }
                T.year = t, T.month = a, T.date = n, T.hour = d[r - 1].slice(0, 2), F = (F = _("h", r - 1)) || "时辰未知", b.trigger.setAttribute("data-type", 0);
                var l = m(0, t, a, n, r);
                s = l.mm < 0 ? _("rm", -l.mm) : _("mm", l.mm), C = l.yy + "年" + s + _("dd", l.dd) + F;
                return B.innerHTML = C, o.innerHTML = t + "年" + a + "月" + n + "日" + F, {
                    _yy: i.yy,
                    _mm: i.mm,
                    _dd: i.dd,
                    yy: t,
                    mm: a,
                    dd: n,
                    h: r,
                    _type: b.type
                }
            }

            b.trigger.addEventListener("click", function () {
            }), b.trigger.addEventListener("click", {
                date: function (a) {
                    document.activeElement.blur(), b.gearDate = document.createElement("div"), b.gearDate.className = "gearDate", b.gearDate.setAttribute("style", "z-index:99999");
                    var u = '<div style="width: 100%; height: 429px; position: absolute; top: 0px; left: 0px; opacity: 0;" class="zhezhao"></div><div class="date_ctrl slideInUp" style="z-index:1000;display:block"><div class="date_info_box lcalendar_info">2016年12月29日</div><div class="date_info_box lcalendar_info1">2016年12月29日</div><div style="font-size: 10px"><div class="date_class_box"><div id="falseBtn_back">取消</div><div class="date_class lcalendar_gongli">公历</div><div class="date_class lcalendar_nongli">农历</div><div id="falseBtn_save">完成</div></div></div><div class="date_roll_mask"><div class="date_roll"><div><div class="gear date_yy" data-datetype="date_yy"></div><div class="date_grid"></div></div><div><div class="gear date_mm" data-datetype="date_mm"></div><div class="date_grid"></div></div><div><div class="gear date_dd" data-datetype="date_dd"></div><div class="date_grid"></div></div>',
                        e = "";
                    1 != b.hasHourLc && (e = "display:none"), u += '<div class="date_h_wrap" style=' + e + '><div class="gear date_h" id="dddHei" val22=' + $(b.trigger).next().attr("jiavalue") + ' data-datetype="date_h"><div class="tooth too1"></div><div class="tooth too1">时辰未知</div><div class="tooth too1">00:00~00:59 (早子)</div><div class="tooth too1">01:00~02:59 (丑)</div><div class="tooth too1">03:00~04:59 (寅)</div><div class="tooth too1">05:00~06:59 (卯)</div><div class="tooth too1">07:00~08:59 (辰)</div><div class="tooth too1">09:00~10:59 (巳)</div><div class="tooth too1">11:00~12:59 (午)</div><div class="tooth too1">13:00~14:59 (未)</div><div class="tooth too1">15:00~16:59 (申)</div> <div class="tooth too1">17:00~18:59 (酉)</div><div class="tooth too1">19:00~20:59 (戌)</div><div class="tooth too1">21:00~22:59 (亥)</div><div class="tooth too1">23:00~23:59 (晚子)</div></div><div class="date_grid"></div></div>', u += '</div></div><div class="date_btn_box"><div class="date_btn lcalendar_finish">确定</div><div class="date_btn lcalendar_cancel">取消</div></div></div>', u += '<div class="date_confirm" style="z-index:1000;border-top: 1px solid rgb(221, 221, 221);width:100%;position: absolute; bottom: 0px; left: 0px;right: 0px; background-color: rgb(255, 255, 255); z-index: 10000; color: rgb(187, 187, 187); overflow: hidden; display: none;padding-bottom:20px"><div style="line-height: 60px;border-bottom: 1px solid rgb(221, 221, 221);text-align: center;font-size: 20px;font-weight:bold;color: #000000;"> 出生日期确认</div><div style="text-align: center; overflow: hidden;margin-bottom:10px;"><p style="font-size: 18px;color: rgb(51, 51, 51);line-height: 30px;padding-top:5px;">请确认输入的时间是否正确</p><div class="gongnongli" style="font-size: 20px;line-height: 30px;color:rgb(51, 51, 51)"><div class="gongnongli"></div></div></div><div style="color: rgb(255, 255, 255);font-size: 18px;margin: 0;"><div style="float: left; width: 50%; text-align: right; box-sizing: border-box; padding-right: 20px; vertical-align: top; cursor: pointer;"><span id="return_date" style="display: inline-block; width: 150px; line-height: 50px; background-color: #999999; color: rgb(255, 255, 255); text-align: center; border-radius: 6px;">返回修改</span></div><div style="float: right; text-align: left; width: 50%; box-sizing: border-box; padding-left: 20px; vertical-align: top; cursor: pointer;"><span id="finishMobileDate" style="display: inline-block; width: 150px; line-height: 50px; background-color: #993300; color: rgb(255, 255, 255); text-align: center; border-radius: 6px;">确认提交</span></div><div style="overflow: hidden; clear: both;"></div></div></div>', b.gearDate.innerHTML = u, document.body.appendChild(b.gearDate), 1 != b.hasHourLc && $(".date_roll>div").css("width", "33.33%");
                    for (var t = $("#dddHei .tooth"), n = t.height(), r = 360 <= j ? 13 : 12, E = 0; E < t.length; E++) $(t[E]).css({
                        height: n + "px",
                        "line-height": n + "px",
                        "font-size": r + "px"
                    });
                    !function () {
                        var u = $(b.trigger).next().val().split("-"),
                            e = {yy: u[0] - 1900, mm: u[1] - 1, dd: u[2] - 1, h: 1},
                            t = b.trigger.getAttribute("data-date22") - b.minY,
                            a = b.trigger.getAttribute("data-date33");
                        /^\d{4}-\d{1,2}-\d{1,2}$/.test(b.trigger.getAttribute("data-date")) ? (rs = b.trigger.getAttribute("data-date").match(/(^|-)\d{1,4}/g), e.yy = rs[0] - b.minY, e.mm = rs[1].replace(/-/g, "") - 1, e.dd = rs[2].replace(/-/g, "") - 1) : e.yy = e.yy + 1900 - b.minY;
                        if (b.gearDate.querySelector(".date_yy").setAttribute("val", e.yy), b.gearDate.querySelector(".date_mm").setAttribute("val", e.mm), b.gearDate.querySelector(".date_dd").setAttribute("val", e.dd), b.gearDate.querySelector(".date_h").setAttribute("val", e.h), parseInt(b.trigger.getAttribute("data-type"))) {
                            b.type = 1;
                            var n = b.gearDate.querySelector(".lcalendar_nongli");
                            n.className = n.className.replace(/active/, "").replace(/(^\s*)|(\s*$)/g, "") + " active";
                            var r = b.maxY - b.minY + 1, E = e.yy % r + b.minY, i = e.mm + 1, B = e.dd + 1, o = e.h + 1,
                                s = m(0, E, i, B, o);
                            s.mm < 0 && (s.mm = 1 - s.mm), 0 != x[t].Intercalation && a > x[t].Intercalation && (console.log("jinlaile"), s.mm += 1), b.gearDate.querySelector(".date_yy").setAttribute("val", s.yy - b.minY), b.gearDate.querySelector(".date_mm").setAttribute("val", s.mm - 1), b.gearDate.querySelector(".date_dd").setAttribute("val", s.dd - 1), b.gearDate.querySelector(".date_h").setAttribute("val", s.h - 1)
                        } else {
                            b.type = 0;
                            var D = b.gearDate.querySelector(".lcalendar_gongli");
                            D.className = D.className.replace(/active/, "").replace(/(^\s*)|(\s*$)/g, "") + " active"
                        }
                        c()
                    }();
                    var i = "ontouchstart" in window;
                    b.gearDate.querySelector("#falseBtn_back").addEventListener(i ? "touchstart" : "click", h), b.gearDate.querySelector("#falseBtn_save").addEventListener(i ? "touchstart" : "click", S), b.gearDate.querySelector("#return_date").addEventListener(i ? "touchstart" : "click", O);
                    var B = b.gearDate.querySelector("#finishMobileDate");
                    B.addEventListener(i ? "touchstart" : "click", k);
                    var o = b.gearDate.querySelector(".lcalendar_gongli"),
                        s = b.gearDate.querySelector(".lcalendar_nongli");
                    o.addEventListener(i ? "touchstart" : "click", function () {
                        A("gongli")
                    }, !1), s.addEventListener(i ? "touchstart" : "click", function () {
                        A("nongli")
                    }, !1);
                    var D = b.gearDate.querySelector(".date_yy"), C = b.gearDate.querySelector(".date_mm"),
                        l = b.gearDate.querySelector(".date_dd"), F = b.gearDate.querySelector(".date_h");
                    D.addEventListener("touchstart", y), C.addEventListener("touchstart", y), l.addEventListener("touchstart", y), F.addEventListener("touchstart", y), D.addEventListener("mousedown", g), C.addEventListener("mousedown", g), l.addEventListener("mousedown", g), F.addEventListener("mousedown", g), D.addEventListener("touchmove", p), C.addEventListener("touchmove", p), l.addEventListener("touchmove", p), F.addEventListener("touchmove", p), D.addEventListener("touchend", f), C.addEventListener("touchend", f), l.addEventListener("touchend", f), F.addEventListener("touchend", f), 0 < navigator.userAgent.indexOf("Firefox") ? (b.gearDate.addEventListener("DOMMouseScroll", function (u) {
                        u.preventDefault()
                    }, !1), D.addEventListener("DOMMouseScroll", v, !1), C.addEventListener("DOMMouseScroll", v, !1), l.addEventListener("DOMMouseScroll", v, !1), F.addEventListener("DOMMouseScroll", v, !1)) : (b.gearDate.onmousewheel = function (u) {
                        return !1
                    }, D.onmousewheel = v, C.onmousewheel = v, l.onmousewheel = v, F.onmousewheel = v), "block" === $(".date_ctrl").css("display") ? $(".zhezhao").css("height", parseInt(window.innerHeight) - parseInt($(".date_ctrl").height()) + "px") : $(".zhezhao").css("height", parseInt(window.innerHeight) - parseInt($(".date_confirm").height()) + "px"), b.gearDate.onclick = function () {
                        if (parseInt(event.clientX) < parseInt($(".zhezhao").css("width")) && parseInt(event.clientY) < parseInt($(".zhezhao").css("height"))) if ("block" === $(".date_ctrl").css("display")) h(a); else if ("undefined" != typeof Event && Event instanceof Function) {
                            var u = new Event("touchstart"), e = new Event("click");
                            B.dispatchEvent(u), B.dispatchEvent(e)
                        } else if (document.createEvent && "function" == typeof document.createEvent) {
                            var t = document.createEvent("HTMLEvents");
                            t.initEvent("click", !0, !0), B.dispatchEvent(t)
                        }
                    };
                    var d = document.documentElement.scrollTop || document.body.scrollTop;
                    console.log(d), window.scroll({top: d + 5, left: 0, behavior: "smooth"}), q = !0, z()
                }
            }[u], !1)
        }
    }, u
}();
