function initName(e, t) {
    var a = "";
    e == "NumData" + t && !a && window.localStorage && window.localStorage["cacheName" + t] && (a = window.localStorage["cacheName" + t]),
    $("#" + e).val(a)
}
function lc_initEmail(e, t) {
    var a = t || ""; ! t && window.localStorage && window.localStorage.cacheEmail && (a = window.localStorage.cacheEmail),
    $("#" + e).val(a)
}
function lc_initPlace(e, t) {
    var a = window.localStorage["cachePlace" + t],
    n = "北京",
    r = "海淀区",
    i = null;
    if (a) {
        var o = a.split("-");
        o[0] && (n = o[0]),
        o[1] && (r = o[1]),
        o[2] && (i = o[2])
    }
    $("#lc_city" + t).citySelect({
        prov: n,
        city: r,
        dist: i,
        nodata: "none"
    })
}
function lc_initplaceSlide(e) {
    var i = document.getElementById(e),
    o = [],
    s = [],
    d = [],
    t = [0, 0, 0],
    n = [0, 0, 0];
    function r(e, r) {
        e.forEach(function(e, t, a) {
            var n = new Object;
            n.text = e.name,
            n.value = t,
            r.push(n)
        })
    }
    r(city, o),
    city[t[0]].hasOwnProperty("sub") ? r(city[t[0]].sub, s) : s = [{
        text: "",
        value: 0
    }],
    city[t[0]].sub[t[1]].hasOwnProperty("sub") ? r(city[t[0]].sub[t[1]].sub, d) : d = [{
        text: "",
        value: 0
    }];
    var l = new Picker({
        data: [o, s, d],
        selectedIndex: t,
        title: "地址选择"
    });
    l.on("picker.select",
    function(e, t) {
        var a = o[t[0]].text,
        n = s[t[1]].text,
        r = d[t[2]] ? d[t[2]].text: "";
        i.innerText = a + " " + n + " " + r
    }),
    l.on("picker.change",
    function(e, a) {
        0 === e ?
        function() {
            s = [],
            d = [],
            n[0] = a;
            var e = city[a];
            if (e.hasOwnProperty("sub")) {
                r(e.sub, s);
                var t = city[a].sub[0];
                t.hasOwnProperty("sub") ? r(t.sub, d) : (d = [{
                    text: "",
                    value: 0
                }], n[2] = 0)
            } else s = [{
                text: "",
                value: 0
            }],
            d = [{
                text: "",
                value: 0
            }],
            n[1] = 0,
            n[2] = 0;
            l.refillColumn(1, s),
            l.refillColumn(2, d),
            l.scrollColumn(1, 0),
            l.scrollColumn(2, 0)
        } () : 1 === e &&
        function() {
            d = [],
            n[1] = a;
            var e = n[0];
            if (city[e].sub[a].hasOwnProperty("sub")) {
                r(city[e].sub[a].sub, d),
                l.refillColumn(2, d),
                l.scrollColumn(2, 0)
            } else d = [{
                text: "",
                value: 0
            }],
            n[2] = 0,
            l.refillColumn(2, d),
            l.scrollColumn(2, 0)
        } ()
    }),
    l.on("picker.valuechange",
    function(e, t) {}),
    i.addEventListener("click",
    function() {
        l.show()
    })
}
function lc_initplaceSlide3(e, a, n) {
    var r = new Array,
    i = 0; !
    function e(t) {
        for (var a = 0; a < t.length; a++) t[a].value == n[i] && (i++, r[r.length] = t[a].id, t[a].childs && e(t[a].childs))
    } (newCityJson);
    new MobileSelect({
        trigger: e,
        title: "出生地点",
        wheels: [{
            data: newCityJson
        }],
        position: r || [2, 0],
        transitionEnd: function(e, t) {},
        callback: function(e, t) {
            $("#prov" + a).val(t[0].value),
            $("#city" + a).val(t[1].value),
            t[2] ? $("#dist" + a).val(t[2].value) : $("#dist" + a).val("")
        }
    })
}
function lc_initHmBirthDate(e, t) {
    $("#" + e).val("1985-01-01-00:00");
    var a = window.localStorage["cacheBirthday-hm" + t];
    a && $("#" + e).val(a)
}
function lc_initBirthDate(e, t, a) {
    var n = window.localStorage["cacheBirthdayText" + a];
    $("#" + e).attr("data-text", n);
    var r = window.localStorage["cacheBirthday" + a];
    if (0 == $("#" + e).attr("hashour") && n) {
        var i = -1;
        n = -1 != n.indexOf("时辰未知") ? (i = n.indexOf("时辰未知"), n.slice(0, i)) : -1 != n.indexOf("早子") ? (i = n.indexOf("早子"), n.slice(0, i)) : -1 != n.indexOf("晚子") ? (i = n.indexOf("晚子"), n.slice(0, i)) : -1 != n.indexOf("时") ? (i = n.indexOf("时"), n.slice(0, i - 1)) : -1 != n.indexOf("日") ? (i = n.indexOf("日"), n.slice(0, i + 1)) : n
    }
    if ($("#" + e).text(n), $("#" + t).attr("value", r), r) {
        var o = {
            un: 0,
            "00": 1,
            "01": 2,
            "03": 3,
            "05": 4,
            "07": 5,
            "09": 6,
            11 : 7,
            13 : 8,
            15 : 9,
            17 : 10,
            19 : 11,
            21 : 12,
            23 : 13
        } [r.split("-")[3]];
        $("#" + t).attr("jiavalue", o)
    }
}
function saveSexFunction(e, t) {
    var a = $("#" + e).val();
    window.localStorage["sexSaveVal" + t] = a
}
function changeSex2(e, t) {
    var a = $(".sex-box" + t);
    $("#iSex" + t).val(e);
    a.find(".sex0-yes").hide(),
    a.find(".sex0-no").show(),
    a.find(".sex1-yes").hide(),
    a.find(".sex1-no").show(),
    a.find(".sex" + e).hide(),
    a.find(".sex" + e + "-yes").show()
}
function lc_initSex(e, t) {
    initSex(e, t);
    var a = window.localStorage["sexSaveVal" + t];
    a && changeSex2(a, t)
}
function initSex(e, t) {
    function a(e, t) {
        $("." + sexString + "-box" + t).find("." + sexString + "0-yes").hide(),
        $("." + sexString + "-box" + t).find("." + sexString + "0-no").show(),
        $("." + sexString + "-box" + t).find("." + sexString + "1-yes").hide(),
        $("." + sexString + "-box" + t).find("." + sexString + "1-no").show(),
        $("." + sexString + "-box" + t).find("." + sexString + e).hide(),
        $("." + sexString + "-box" + t).find("." + sexString + e + "-yes").show()
    }
    sexString = "sex",
    a($("#" + e).val(), t),
    $("." + sexString + "-btn" + t).bind("click",
    function() {
        var e = $(this).attr("data-sex");
        a(e, t),
        $("#iSex" + t).val(e)
    })
}
var is_eighteen = !0,
is_eighteen2 = !0,
is_eighteen3 = !0;
function verifyElementData(e, t, a) {
    function n(e) {
        var t = ["QQ", "腾迅", "号码", "电话", "系统", "管理", "system", "admin", "站长", "淫賤", "淫贱", "去死", "吃屎", "妈的", "娘的", "日你", "尻", "操你", "干死你", "王八", "傻逼", "傻B", "贱人", "狗娘", "婊子", "表子", "靠你", "叉你", "叉死", "插你", "插死", "干你", "干死", "日死", "鸡巴", "睾丸", "包皮", "龟头", "屄", "赑", "妣", "肏", "奶子", "屌", "成人文学", "成人图片", "成人电影", "性爱电影", "情色电影", "学生妹", "情色图片", "情色贴图", "无码电影", "特肖", "禁肖", "杀尾公式", "杀肖公式", "曾道人", "特码生肖", "法轮大法", "修炼之歌", "弘法会", "大法弘传", "法轮功", "大法之声", "灵修团体", "宇宙最高法理", "真善忍大法", "正法洪流", "五套功法", "师傅法身", "师父法身", "李洪志", "大法弟子", "真修弟子", "弟子正法", "天安门受难", "六四惨案", "六四真相", "八九民运", "民运人士", "红色恐怖", "民主运动", "邓二世", "天安门血", "自由网", "明慧网", "正见网", "圆明网", "打印机版", "fawanghuihui", "minghui", "freenet-china", "yuanmingeurope", "secretchina", "江政府", "江泽民当局", "江核心", "江路线", "江泽民政权", "江贼", "江贼民", "江昏君", "江二世", "中共当局", "大陆当局", "大陆官员", "中共媒体", "共匪", "共产专制", "古拉格", "当权者", "恶警", "宗教迫害", "大法第子", "天安门受难人", "开悟弟子正法", "媽的", "幹死你", "賤人", "幹你", "幹死", "雞巴", "龜頭", "贔", "成人文學", "成人圖片", "成人電影", "性愛電影", "情色電影", "學生妹", "情色圖片", "情色貼圖", "無碼電影", "殺尾公式", "殺肖公式", "特碼生肖", "法輪大法", "修煉之歌", "弘法會", "大法弘傳", "法輪功", "大法之聲", "靈修團體", "師傅法身", "師父法身", "天安門受難", "六四慘案", "天安門受難人", "開悟弟子正法", "惡警", "當權者", "古拉格", "共産專制", "中共媒體", "大陸官員", "大陸當局", "中共當局", "江澤民政權", "江路線", "江澤民當局", "印表機版", "圓明網", "正見網", "明慧網", "自由網", "天安門血", "鄧二世", "紅色恐怖", "毛泽东", "江泽民", "胡錦濤", "溫家寶", "賤B", "毛澤東", "周恩來", "共產黨", "操你媽", "鄧小平", "前列腺", "裸照", "AV女優", "強姦", "胡政府", "胡錦濤當局", "胡核心", "胡路線", "胡錦濤政權", "胡昏君", "中國", "中華人民共和國", "主席", "總統", "省長", "吳邦國", "賈慶林", "李長春", "習近平", "李克強", "賀國強", "周永康", "胡锦涛", "温家宝", "贱B", "毛泽东", "周恩来", "共产党", "操你妈", "邓小平", "前列腺", "裸照", "AV女优", "强奸", "胡政府", "胡锦涛当局", "胡核心", "胡路线", "胡锦涛政权", "胡昏君", "中国", "中华人民共和国", "总统", "省长", "吴邦国", "贾庆林", "李长春", "习近平", "李克强", "贺国强", "周永康", "混蛋", "無恥", "下流", "fuck", "mmd", "卑鄙", "流氓", "淫賤", "淫賤", "sb", "SB", "去死", "吃屎", "媽的", "娘的", "日你", "尻", "操你", "干死你", "王八", "傻逼", "傻B", "賤人", "我靠", "狗娘", "婊子", "表子", "靠你", "叉你", "叉死", "插你", "插死", "干你", "干死", "日死", "雞巴", "痞子", "睪丸", "包皮", "龜頭", "屄", "贔", "妣", "肏", "奶子", "尻", "屌", "成人文學", "成人圖片", "成人電影", "性愛電影", "落霞缀", "死一边去", "盖塔奥", "母猪", "强淫", "挨了一炮", "麻古", "滚蛋", "黑喂狗", "猪公", "中共主席", "搅基", "卖淫", "麻果配", "骚人", "闹太套", "大脑短路", "藏独", "黄段子", "藏独", "麻果丸", "骚", "本宫", "烂泥", "疆独", "笨拉灯", "操了嫂", "麻将透", "新建户", "攻受", "废渣", "马英九", "战五渣", "操嫂子", "麻醉狗", "新疆叛", "小妾", "作呕", "水扁", "矮仔", "插屁屁", "麻醉枪", "新疆限", "可攻可受", "进天堂", "衰人", "傻仔", "察象蚂", "麻醉枪", "新金瓶", "不是人", "裹胸", "处男", "奸夫", "成人电", "麻醉药", "新唐人", "何弃疗", "裹脚布", "马克思", "黑鬼", "成人卡通", "毛一鲜", "姓忽悠", "土憋", "耗子", "列宁", "洗了滚", "成人聊", "美艳少妇", "性爱日", "绿茶婊", "你吖", "中华人民", "娼妓", "成人片", "妹按摩", "性福情", "婊", "绑大款", "共和国", "猪仔", "成人视", "妹上门", "性感少", "婊了", "养小蜜", "社会", "啥表", "成人图", "蒙汗药", "性推广歌", "吊炸天", "吃里扒外", "民主党", "锉毙", "成人文", "迷幻型", "胸主席", "菊花", "溅B", "64", "粪便", "成人小", "迷幻药", "徐玉元", "爆菊", "跑堂狗", "民主", "膣屄", "充气娃", "迷幻药", "爆菊花", "特妈", "破鞋", "尿泡", "催眠水", "迷昏口", "丫的", "无节操", "嬷痹", "扯巴子", "吹箫", "催情粉", "迷昏药", "性器", "菜鸟", "娘个B德", "溜洽子", "干你娘", "催情药", "迷昏药", "烟感器", "波霸", "B叫", "瓜哇子", "屌你老母", "催情药", "迷魂香", "严晓玲", "泡M", "滚", "龟儿子", "肏你妈", "挫仑", "迷魂药", "颜射", "泡妞", "滚回去", "臭婊子", "打飞机", "鸡巴", "迷魂药", "劳教", "毛片", "滚床单", "二流子", "泥马", "鸡巴", "迷奸药", "劳改犯", "好个毛", "滚床单", "鸡鸡", "骚货", "奶子", "迷情水", "颜射", "你妹", "犊子", "粪胀", "雏妓", "肉棒", "迷情药", "姚明进去", "毛线", "滚犊子", "杂种", "狗噏", "代孕", "迷药", "要射精了", "傻帽", "草死你妈", "十三点", "烂臭鞋", "法车仑", "谜奸药", "要射了", "傻X", "废了你", "该猪吃", "恶狗", "法正干", "蜜穴", "要泄了", "熊样", "残废", "狗造化", "恶棍", "法轮", "内射", "夜激情", "唾弃", "大比岔", "你算老几", "无赖", "法轮佛", "嫩穴", "液体炸", "腐植质", "卖骚", "秀逗", "蠢人", "法维权", "嫩阴", "一小撮别", "装B", "卖弄", "没脑子", "贱货", "法一轮", "操你妈", "遗情书", "装b", "扮纯", "脑子进水", "没屁眼", "法院给废", "拟涛哥", "蚁力神", "呆逼", "装纯", "骚包", "狗娘养的", "仿真枪", "娘两腿之间", "阴间来电", "傻逼", "败类", "贱皮子", "贱猪", "夫妻交换", "妞上门", "阴唇", "二逼", "fuck", "解放军", "蠢猪", "感扑克", "浓精", "阴道", "死逼", "damn", "妓女", "婊子养的", "冈本真", "女被人家搞", "阴户", "笨蛋", "丑角", "政府", "疯狗", "肛交", "女激情", "淫魔舞", "白痴", "ET", "缩头乌龟", "肛门是邻", "女优", "淫情女", "二痴", "变态", "团体", "卖比", "冈本真", "炮的小蜜", "淫肉", "蛋白质", "凤姐", "游行", "傻吊", "钢针狗", "喷尿", "淫骚妹", "王八", "屁股", "小日本", "人模狗样", "钢珠枪", "嫖俄罗", "淫兽", "三八", "MMD", "坯子", "港澳博球", "嫖鸡", "淫兽学", "东方标志", "NND", "大麻", "歪逼", "港马会", "仆不怕饮", "淫水", "东方婊子", "禽兽", "起义", "操逼", "港鑫华", "普通嘌", "淫穴", "比样迪", "兽", "抵制", "装葱", "高莺莺", "叫床", "咏妓", "逼样的", "下贱", "拉萨", "癞蛤蟆", "搞媛交", "色黄", "幽谷三", "DBF", "欠踹", "开打", "狼心狗肺", "共狗", "色黄图", "游精佑", "大泼妇", "欠拍", "李登辉", "挨刀的货", "共王储", "奇淫散", "有奶不一", "兔崽子", "欠拧", "陈水扁", "死不要脸", "狗粮", "贱淫", "右转是政", "不想活啦", "死皮赖脸", "卧槽", "屎坨坨", "滚圆大乳", "淫荡", "幼齿类", "他奶奶的", "剑人", "我擦", "卖骚", "国家妓", "贱B", "愚民同", "去死吧你", "醉银剑", "屌爆了", "卖逼", "和狗交", "柔胸粉", "愚民政", "祖宗", "人剑合一", "我嘞个去", "阳痿", "和狗性", "肉洞", "与狗性", "祖宗十八代", "化粪池", "二货", "寄生虫", "和狗做", "肉棍", "玉蒲团", "蠢材", "流氓", "脑弱", "傻子", "红色恐", "如厕死", "鸳鸯洗", "蠢货", "山寨", "次奥", "窝囊", "胡江内斗", "乳交", "砍杀", "呕像", "恶心", "蛋碎", "窝囊废", "胡紧套", "软弱的国", "杀人犯", "小妞", "该死", "粉木耳", "歪瓜劣枣", "胡锦涛", "赛后骚", "凶杀", "老娘", "BT", "黑木耳", "胡扯", "胡适眼", "三挫", "血案", "青蛙头", "呆瓜", "搞基", "狗屁", "胡耀邦", "三级片", "韵徐娘", "阴阳失调", "呆子", "撸管", "仆街", "湖淫娘", "三秒倒", "炸死", "河马", "dork", "谢特", "南朝鲜人", "虎头猎", "三网友", "植物冰", "火山喷发", "下流", "装逼", "后庭", "华国锋", "三唑", "殖器护", "垃圾人", "泼妇", "矮穷挫", "总理", "华门开", "骚妇", "惨案", "垃圾", "淫猥", "活春宫", "我日", "吹萧", "骚浪", "凶案", "恐龙", "公驴", "银枪小霸王", "屁眼", "还看锦涛", "骚穴", "贪官", "青蛙", "傻瓜", "拔吊无情", "老二", "换妻", "骚嘴", "狗官", "废材", "蠢驴", "拔屌无情", "鞭鞭", "浑圆豪乳", "扫了爷爷", "昼将近", "孙了", "神经病", "屁话", "汉奸", "激情电", "色电影", "主席忏", "装孙", "青楼", "滚粗", "强暴", "激情短", "色妹妹", "着涛哥", "装孙子", "便便", "废柴", "钉子户", "激情炮", "色小说", "自由圣", "瞎搞", "马屁精", "打炮", "揩油", "激情妹", "色视频", "自慰用", "扯蛋", "大便", "聊骚", "恶爆", "急需嫖", "尸博", "自由亚", "一陀粪", "痴呆", "潮吹", "恶霸", "腐败", "失身水", "有毛病", "一陀屎", "牛逼烘烘", "煞笔", "耐操", "打砸抢", "失意药", "我靠", "草包", "无节操", "波推", "顶你个肺", "奸成瘾", "狮子旗", "靠", "自杀", "强奸", "阴经", "共和国", "江胡内斗", "十八等", "迷药", "妈蛋", "色诱", "八婆", "小鬼子", "江太上", "十大谎", "作死", "无性生殖", "手淫", "鸡婆", "李克强", "江系人", "十大禁", "做爱", "生殖", "你大姨妈的", "拉皮条", "李长春", "疆独", "熟妇", "做爱小", "智障", "坑爹", "嘿咻", "张德江", "自慰", "贱民", "套套", "丑陋", "坑妈", "约炮", "俞正声", "叫自慰", "太王四神", "泄", "自爆", "坑爷", "娘炮", "刘云山", "姐包夜", "六四", "妈蛋", "灭了", "坑奶奶", "屁民", "王歧山", "姐服务", "东突", "死边去", "基因突变", "你有病", "援交", "张高丽", "姐兼职", "探测狗", "屌丝", "你tmd", "渣滓", "土肥圆", "李援朝", "姐上门", "涛共产", "鸟", "吹牛b", "碎渣", "基佬", "李源朝", "猪头", "涛一样胡", "鸟人", "群殴", "杂碎", "孬种", "博熙来", "狗蛋", "特码", "屌人", "撒子", "没用的家伙", "备胎", "傻蛋", "天朝特", "草泥马", "自恋", "混蛋", "民奸", "蛋疼", "偷偷贪", "法克由", "吹牛", "废物", "傻冒", "操蛋", "推油按", "法克", "狗眼", "畜牲", "歇菜", "MLGB", "脱衣艳", "吊儿郎当的", "狗嘴", "八嘎", "歇火", "去年买了个表", "瓦斯手", "他妈的", "矫情", "笨脑子", "菊花紧", "mlgb", "袜按摩", "他妈", "屁颠", "阿呆", "牛X", "qnmgb", "温家堡", "XXOO", "骗钱", "疯子", "我顶你个肺", "精子射", "温切斯特", "丫滴", "你大爷", "卑贱", "牛叉", "就爱插", "温影帝", "怂样", "脑残片", "卑鄙", "麻痹", "就要色", "温家宝", "丑角", "脑残", "小偷", "奶奶个熊", "巨乳", "瘟加饱", "死翘翘", "被驴踢", "麻子脸", "咸猪手", "拉登说", "瘟假饱", "屎样", "被驴踢", "老家伙", "天朝", "浪穴", "纹了毛", "狗屎", "你妈妈的", "该死的", "鬼畜", "黎阳平", "台独", "邓小平", "二百五", "色狼", "抽风", "李洪志", "乌蝇水", "猪", "250", "肥猪", "打手枪", "李咏曰", "无耻", "马B", "奇葩", "神棍", "尼玛", "骗中央", "无码专", "周恩来", "臭鸡蛋", "畜生", "丽媛离", "西藏限", "刘少奇", "脱裤子", "豆腐渣", "节操掉了", "利他林", "希脏", "朱德", "放屁", "吹潮", "蹭炮", "六合彩", "习进平", "宋庆龄", "拽", "龟头", "法克鱿", "乱奸", "习晋平", "习近平", "shit", "射入", "达菲鸡", "乱伦类", "席复活", "李克强", "SHIT", "A片", "马勒戈壁", "乱伦小", "席临终前", "人渣", "欠抽", "中南海", "互撸娃", "乱伦", "席指着护", "渣男", "找抽", "处女", "吃翔", "伦理大", "洗澡死", "渣", "欠扁", "吃精", "爆出翔", "伦理毛", "喜贪赃", "切克闹", "挂了", "你全家", "打蝴蝶", "伦理片", "陷害案", "来死狗", "猥琐", "黄片", "贱骨头", "裸聊网", "陷害罪", "药药药", "龌龊", "斯大林", "屁轻", "裸舞视", "小穴", "盖塔奥", "愚昧", "阿扁", "老三老四", "成人圖片", "落霞綴", "死一邊去", "蓋塔奧", "母豬", "強淫", "挨了一炮", "麻古", "滾蛋", "黑餵狗", "豬公", "中共主席", "攪基", "賣淫", "麻果配", "騷人", "鬧太套", "大腦短路", "藏獨", "黃段子", "藏獨", "麻果丸", "騷", "本宮", "爛泥", "疆獨", "笨拉燈", "操了嫂", "麻將透", "新建戶", "攻受", "廢渣", "馬英九", "戰五渣", "操嫂子", "麻醉狗", "新疆叛", "小妾", "作嘔", "水扁", "矮仔", "插屁屁", "麻醉槍", "新疆限", "可攻可受", "進天堂", "衰人", "傻仔", "察象螞", "麻醉槍", "新金瓶", "不是人", "裹胸", "處男", "姦夫", "成人電", "麻醉藥", "新唐人", "何棄療", "裹腳布", "馬克思", "黑鬼", "成人卡通", "毛一鮮", "姓忽悠", "土憋", "耗子", "列寧", "洗了滾", "成人聊", "美艷少婦", "性愛日", "綠茶婊", "你丫", "中華人民", "娼妓", "成人片", "妹按摩", "性福情", "婊", "綁大款", "共和國", "豬仔", "成人視", "妹上門", "性感少", "婊了", "養小蜜", "社會", "啥表", "成人圖", "蒙汗藥", "性推廣歌", "吊炸天", "吃裡扒外", "民主黨", "銼斃", "成人文", "迷幻型", "胸主席", "菊花", "濺B", "64", "糞便", "成人小", "迷幻藥", "徐玉元", "爆菊", "跑堂狗", "民主", "膣屄", "充氣娃", "迷幻藥", "爆菊花", "特媽", "破鞋", "尿泡", "催眠水", "迷昏口", "丫的", "無節操", "嬤痺", "扯巴子", "吹簫", "催情粉", "迷昏藥", "性器", "菜鳥", "娘個B德", "溜洽子", "干你娘", "催情藥", "迷昏藥", "煙感器", "波霸", "B叫", "瓜哇子", "屌你老母", "催情藥", "迷魂香", "嚴曉玲", "泡M", "滾", "龜兒子", "肏你媽", "挫侖", "迷魂藥", "顏射", "泡妞", "滾回去", "臭婊子", "打飛機", "雞巴", "迷魂藥", "勞教", "毛片", "滾床單", "二流子", "泥馬", "雞巴", "迷姦藥", "勞改犯", "好個毛", "滾床單", "雞雞", "騷貨", "奶子", "迷情水", "顏射", "你妹", "犢子", "糞脹", "雛妓", "肉棒", "迷情藥", "姚明進去", "毛線", "滾犢子", "雜種", "狗吸", "代孕", "迷藥", "要射精了", "傻帽", "草死你媽", "十三點", "爛臭鞋", "法車侖", "謎奸藥", "要射了", "傻X", "廢了你", "該豬吃", "惡狗", "法正乾", "蜜穴", "要洩了", "熊樣", "殘廢", "狗造化", "惡棍", "法輪", "內射", "夜激情", "唾棄", "大比岔", "你算老幾", "無賴", "法輪佛", "嫩穴", "液體炸", "腐植質", "賣騷", "秀逗", "蠢人", "法維權", "嫩陰", "一小撮別", "裝B", "賣弄", "沒腦子", "賤貨", "法一輪", "操你媽", "遺情書", "裝b", "扮純", "腦子進水", "沒屁眼", "法院給廢", "擬濤哥", "蟻力神", "夫妻交換", "妞上門", "陰唇", "二逼", "fuck", "解放軍", "蠢豬", "感撲克", "濃精", "陰道", "死逼", "damn", "妓女", "婊子養的", "岡本真", "女被人家搞", "陰戶", "笨蛋", "丑角", "政府", "瘋狗", "肛交", "女激情", "淫魔舞", "白癡", "ET", "國軍", "縮頭烏龜", "肛門是鄰", "女優", "淫情女", "二癡", "變態", "團體", "賣比", "岡本真", "炮的小蜜", "淫肉", "蛋白質", "鳳姐", "遊行", "傻吊", "鋼針狗", "噴尿", "淫騷妹", "王八", "屁股", "小日本", "人模狗樣", "鋼珠槍", "嫖俄羅", "淫獸", "三八", "MMD", "黨", "坯子", "港澳博球", "嫖雞", "淫獸學", "東方標誌", "NND", "大麻", "歪逼", "港馬會", "僕不怕飲", "淫水", "東方婊子", "禽獸", "起義", "操逼", "港鑫華", "普通嘌", "淫穴", "比樣迪", "獸", "抵制", "裝蔥", "高鶯鶯", "叫床", "詠妓", "逼樣的", "下賤", "拉薩", "癩蛤蟆", "搞媛交", "色黃", "幽谷三", "DBF", "欠踹", "開打", "狼心狗肺", "共狗", "色黃圖", "游精佑", "大潑婦", "欠拍", "李登輝", "挨刀的貨", "共王儲", "奇淫散", "有奶不一", "兔崽子", "欠擰", "陳水扁", "死不要臉", "狗糧", "賤淫", "右轉是政", "不想活啦", "死皮賴臉", "臥槽", "屎坨坨", "滾圓大乳", "淫蕩", "幼齒類", "他奶奶的", "劍人", "我擦", "賣騷", "國家妓", "賤B", "愚民同", "去死吧你", "醉銀劍", "屌爆了", "賣逼", "和狗交", "柔胸粉", "愚民政", "祖宗", "人劍合一", "我勒個去", "陽痿", "和狗性", "肉洞", "與狗性", "祖宗十八代", "化糞池", "二貨", "寄生蟲", "和狗做", "肉棍", "玉蒲團", "蠢材", "流氓", "腦弱", "傻子", "紅色恐", "如廁死", "鴛鴦洗", "蠢貨", "山寨", "次奧", "窩囊", "胡江內鬥", "乳交", "砍殺", "嘔像", "噁心", "蛋碎", "窩囊廢", "胡緊套", "軟弱的國", "殺人犯", "小妞", "該死", "粉木耳", "歪瓜劣棗", "胡錦濤", "賽後騷", "兇殺", "老娘", "BT", "黑木耳", "胡扯", "胡適眼", "三挫", "血案", "青蛙頭", "呆瓜", "搞基", "狗屁", "胡耀邦", "三級片", "韻徐娘", "陰陽失調", "呆子", "擼管", "仆街", "湖淫娘", "三秒倒", "炸死", "河馬", "dork", "謝特", "南朝鮮人", "虎頭獵", "三網友", "植物冰", "火山噴發", "下流", "裝逼", "後庭", "華國鋒", "三唑", "殖器護", "垃圾人", "潑婦", "矮窮挫", "總理", "華門開", "騷婦", "慘案", "垃圾", "淫猥", "活春宮", "我日", "吹蕭", "騷浪", "兇案", "恐龍", "公驢", "銀槍小霸王", "屁眼", "還看錦濤", "騷穴", "貪官", "青蛙", "傻瓜", "拔吊無情", "老二", "換妻", "騷嘴", "狗官", "廢材", "蠢驢", "拔屌無情", "鞭鞭", "渾圓豪乳", "掃了爺爺", "晝將近", "孫了", "神經病", "屁話", "漢奸", "激情電", "色電影", "主席懺", "裝孫", "青樓", "滾粗", "強暴", "激情短", "色妹妹", "著濤哥", "裝孫子", "便便", "廢柴", "釘子戶", "激情炮", "色小說", "自由聖", "瞎搞", "馬屁精", "打炮", "揩油", "激情妹", "色視頻", "自慰用", "扯蛋", "大便", "聊騷", "惡爆", "急需嫖", "屍博", "自由亞", "一陀糞", "癡呆", "潮吹", "惡霸", "腐敗", "失身水", "有毛病", "一陀屎", "牛逼烘烘", "煞筆", "耐操", "打砸搶", "失意藥", "我靠", "草包", "無節操", "波推", "頂你個肺", "奸成癮", "獅子旗", "靠", "自殺", "強姦", "陰經", "共和國", "江胡內鬥", "十八等", "迷藥", "媽蛋", "色誘", "八婆", "小鬼子", "江太上", "十大謊", "作死", "無性生殖", "手淫", "雞婆", "李克強", "江系人", "十大禁", "做愛", "生殖", "你大姨媽的", "拉皮條", "李長春", "疆獨", "熟婦", "做愛小", "智障", "坑爹", "嘿咻", "張德江", "自慰", "賤民", "套套", "醜陋", "坑媽", "約炮", "俞正聲", "叫自慰", "太王四神", "洩", "自爆", "坑爺", "娘炮", "劉雲山", "姐包夜", "六四", "媽蛋", "滅了", "坑奶奶", "屁民", "王歧山", "姐服務", "東突", "死邊去", "基因突變", "你有病", "援交", "張高麗", "姐兼職", "探測狗", "屌絲", "你tmd", "渣滓", "土肥圓", "李援朝", "姐上門", "濤共產", "鳥", "吹牛b", "碎渣", "基佬", "李源朝", "豬頭", "濤一樣胡", "鳥人", "群毆", "雜碎", "孬種", "博熙來", "狗蛋", "特碼", "屌人", "撒子", "沒用的傢伙", "備胎", "傻蛋", "天朝特", "草泥馬", "自戀", "混蛋", "民奸", "蛋疼", "偷偷貪", "法克由", "吹牛", "廢物", "傻冒", "操蛋", "推油按", "法克", "狗眼", "畜牲", "歇菜", "MLGB", "脫衣艷", "吊兒郎當的", "狗嘴", "八嘎", "歇火", "去年買了個表", "瓦斯手", "他媽的", "矯情", "笨腦子", "菊花緊", "mlgb", "襪按摩", "他媽", "屁顛", "阿呆", "牛X", "qnmgb", "溫家堡", "XXOO", "騙錢", "瘋子", "我頂你個肺", "精子射", "溫切斯特", "丫滴", "你大爺", "卑賤", "牛叉", "就愛插", "溫影帝", "慫樣", "腦殘片", "卑鄙", "麻痺", "就要色", "溫家寶", "丑角", "腦殘", "小偷", "奶奶個熊", "巨乳", "瘟加飽", "死翹翹", "被驢踢", "麻子臉", "鹹豬手", "拉登說", "瘟假飽", "屎樣", "被驢踢", "老傢伙", "天朝", "浪穴", "紋了毛", "狗屎", "你媽媽的", "該死的", "鬼畜", "黎陽平", "台獨", "鄧小平", "二百五", "色狼", "抽風", "李洪志", "烏蠅水", "豬", "250", "肥豬", "打手槍", "李詠曰", "無恥", "馬B", "奇葩", "神棍", "尼瑪", "騙中央", "無碼專", "周恩來", "臭雞蛋", "畜生", "銀槍小霸王", "麗媛離", "西藏限", "劉少奇", "脫褲子", "豆腐渣", "節操掉了", "利他林", "希髒", "朱德", "放屁", "吹潮", "蹭炮", "六合彩", "習進平", "宋慶齡", "拽", "龜頭", "法克魷", "亂奸", "習晉平", "習近平", "shit", "射入", "達菲雞", "亂倫類", "席復活", "李克強", "SHIT", "A片", "馬勒戈壁", "亂倫小", "席臨終前", "人渣", "欠抽", "中南海", "互擼娃", "亂倫", "席指著護", "渣男", "找抽", "處女", "吃翔", "倫理大", "洗澡死", "渣", "欠扁", "吃精", "爆出翔", "倫理毛", "喜貪贓", "切克鬧", "掛了", "你全家", "打蝴蝶", "倫理片", "陷害案", "來死狗", "猥瑣", "黃片", "賤骨頭", "裸聊網", "陷害罪", "藥藥藥", "齷齪", "斯大林", "屁輕", "裸舞視", "小穴", "蓋塔奧", "愚昧", "阿扁", "老三老四", "共産黨", "共产党"],
        a = 0,
        n = e.replace(/(^\s*)|(\s*$)|(\s)/g, "");
        for (i = 0; i < t.length; i++) - 1 != n.indexOf(t[i]) && a++;
        return 0 != a
    }
    var r = $("#" + e).val(); {
        if ("NumData" == t) return r ? /(^[\u4E00-\u9FA5]{1,5}$)|(^[a-zA-Z]{1}[a-zA-Z0-9]{1,15})$/.test(r) ? n(r) ? (layer.open({
            content: "你的姓名属于敏感词汇！",
            skin: "msg",
            time: 2
        }), !1) : (e == "NumData" + a && (window.localStorage["cacheName" + a] = r), !0) : (layer.open({
            content: "你的姓名格式不符，<br />（格式：1~5位中文字符或2~16位英文字符）！",
            skin: "msg",
            time: 2
        }), !1) : (layer.open({
            content: "请输入姓名~",
            skin: "msg",
            time: 2
        }), !1);
        if ("NumData2" == t) {
            return r ? /(^[\u4E00-\u9FA5]{1,5}$)|(^[a-zA-Z]{1}[a-zA-Z0-9]{1,15})$/.test(r) ? n(r) ? (layer.open({
                content: "对方姓名属于敏感词汇！",
                skin: "msg",
                time: 2
            }), !1) : ("NumData1" == e && (window.localStorage.cacheName2 = r), e == "NumData" + a && (window.localStorage["cacheName" + a] = r), !0) : (layer.open({
                content: "对方姓名格式不符，<br />（格式：1~5位中文字符或2~16位英文字符）！",
                skin: "msg",
                time: 2
            }), !1) : (layer.open({
                content: "对方姓名没有填写！",
                skin: "msg",
                time: 2
            }), !1)
        } else if ("city" == t) {
            var o = $("#prov" + a).find("option:selected").text(),
            s = $("#city" + a).find("option:selected").text(),
            d = $("#dist" + a).find("option:selected").text();
            window.localStorage["cachePlace" + a] = o + "-" + s + "-" + d
        } else {
            if ("iBirthday" == t) {
                if (!r) return layer.open({
                    content: "你的生日没有选择！",
                    skin: "msg",
                    time: 2
                }),
                !1;
                is_eighteen_years(r, a);
                var l = $("#birthday_my" + a).attr("data-text");
                return window.localStorage["cacheBirthdayText" + a] = l,
                window.localStorage["cacheBirthday" + a] = r,
                !0
            }
            if ("iBirthday-hm" == t) return r ? (is_eighteen_years(r, a), window.localStorage["cacheBirthday-hm" + a] = r, !0) : (layer.open({
                content: "你的生日没有选择！",
                skin: "msg",
                time: 2
            }), !1);
            if ("iHour" == t) return r ? (window.localStorage.cacheHour = r, !0) : (layer.open({
                content: "你的生辰没有选择！",
                skin: "msg",
                time: 2
            }), !1);
            if ("iEmail" == t) return r ? /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/.test(r) ? (window.localStorage.cacheEmail = r, !0) : (layer.open({
                content: "邮箱格式不正确！",
                skin: "msg",
                time: 2
            }), !1) : (layer.open({
                content: "你的邮箱没有填写！",
                skin: "msg",
                time: 2
            }), !1);
            if ("iMobile" == t) return r ? /^1[34578]\d{9}$/.test(r) ? (window.localStorage.cacheMobile = r, !0) : (layer.open({
                content: "手机格式不正确！",
                skin: "msg",
                time: 2
            }), !1) : (layer.open({
                content: "你的手机没有填写！",
                skin: "msg",
                time: 2
            }), !1)
        }
    }
}
function is_eighteen_years(birthday, sort) {
    var ndate = new Date,
    birthday_arr = birthday.split("-"),
    nyear = ndate.getFullYear(),
    nmonth = ndate.getMonth() + 1,
    nday = ndate.getDate(),
    age = nyear - birthday_arr[0] - 1; (nmonth > parseInt(birthday_arr[1]) || nmonth == parseInt(birthday_arr[1]) && nday >= parseInt(birthday_arr[2])) && (age += 1),
    age < 18 ? (layer.open({
        content: "未满18岁，暂不提供服务！",
        skin: "msg",
        time: 5
    }), eval("is_eighteen" + sort.toString() + " = false;")) : eval("is_eighteen" + sort.toString() + " = true;")
}
function PrefixInteger(e, t) {
    return (Array(t).join(0) + e).slice( - t)
}
function getQueryString(e) {
    var t = new RegExp("(^|&)" + e + "=([^&]*)(&|$)", "i"),
    a = window.location.search.substr(1).match(t);
    return null != a ? decodeURIComponent(a[2]) : null
}
function GetIOSVersion() {
    if (window.MSStream) return ! 1;
    var e = navigator.appVersion.match(/OS (\d+)_(\d+)_?(\d+)?/);
    return null != e && [parseInt(e[1], 10), parseInt(e[2] || 0, 10), parseInt(e[3] || 0, 10)].join(".")
}
function getAndroidVersion() {
    var e = (ua = ua.toLowerCase()).match(/android\s([0-9\.]*)/);
    return !! e && parseFloat(e[1])
}
var browser = {
    isAndroid: function() {
        return !! navigator.userAgent.match(/Android/i)
    },
    isIOS: function() {
        return !! navigator.userAgent.match(/iPhone|iPad|iPod/i)
    },
    isWx: function() {
        return !! navigator.userAgent.match(/micromessenger/i)
    },
    isWp: function() {
        return - 1 < ua.toLowerCase().indexOf("windows phone")
    },
    getIOSVersion: function() {
        if (window.MSStream) return ! 1;
        var e, t = navigator.appVersion.match(/OS (\d+)_(\d+)_?(\d+)?/);
        return null != t && (e = [parseInt(t[1], 10), parseInt(t[2], 10), parseInt(t[3] || 0, 10)], parseFloat(e.join(".")))
    }
},
posId = getQueryString("posId") && 0 !== getQueryString("posId").length ? getQueryString("posId") : "",
deviceId = getQueryString("deviceId") && 0 !== getQueryString("deviceId").length ? getQueryString("deviceId") : "",
ua = window.navigator.userAgent,
appVersion = /[a-zA-Z]/.test(ua.split(" ").pop()) ? "1.0.0": ua.split(" ").pop(),
sysVersion = GetIOSVersion() || getAndroidVersion();
if (null !== deviceId && "[openudid]" !== deviceId.toLowerCase() || (deviceId = ""), "" === deviceId) if (localStorage.getItem("go108_tlp_guid")) deviceId = localStorage.getItem("go108_tlp_guid");
else {
    var data = {
        method: "newGuid"
    };
    $.ajax({
        url: "../json_remote.php",
        dataType: "json",
        type: "POST",
        data: data,
        t: (new Date).getTime(),
        async: !1,
        success: function(e) {
            deviceId = e.deviceId,
            localStorage.setItem("go108_tlp_guid", deviceId)
        },
        error: function(e) {
            console.log(e)
        }
    })
}
function getElements(e) {
    for (var t = document.getElementById(e), a = new Array, n = t.getElementsByTagName("input"), r = 0; r < n.length; r++) a.push(n[r]);
    var i = t.getElementsByTagName("select");
    for (r = 0; r < i.length; r++) a.push(i[r]);
    return a
}
function inputRadio(e) {
    if (e.checked) return [e.name, e.value]
}
function inputSelector(e) {
    for (i = 0; i < e.length; i++) if (1 == e[i].selected) return [e.name, e[i].value]
}
function input(e) {
    switch (e.type.toLowerCase()) {
    case "submit":
    case "hidden":
    case "password":
    case "text":
        return [e.name, e.value];
    case "checkbox":
    case "radio":
        return inputRadio(e)
    }
    return ! 1
}
function pselect(e) {
    return inputSelector(e)
}
function serializeElement(e) {
    var t, a = e.tagName.toLowerCase(),
    n = [];
    if ("input" == a && (t = input(e))) {
        if (0 == (o = encodeURIComponent(t[0])).length) return;
        t[1].constructor != Array && (t[1] = [t[1]]);
        for (var r = t[1], i = 0; i < r.length; i++) n.push(o + "=" + encodeURIComponent(r[i]))
    }
    if ("select" == a && (t = pselect(e))) {
        var o;
        if (0 == (o = encodeURIComponent(t[0])).length) return;
        t[1].constructor != Array && (t[1] = [t[1]]);
        for (r = t[1], i = 0; i < r.length; i++) n.push(o + "=" + encodeURIComponent(r[i]))
    }
    return n.join("&")
}
function serializeForm(e) {
    for (var t = getElements(e), a = new Array, n = 0; n < t.length; n++) {
        var r = serializeElement(t[n]);
        r && a.push(r)
    }
    return a.join("&")
}
$(function() {
    $(".btnMeasure").on("click",
    function() {
        0;
        var e = "deviceId=" + deviceId + "&posId=" + posId;
        if ($("#page_extra").val(e), CheckUserInput()) {
            is_eighteen ? layer.open({
                type: 2,
                content: "解析中",
                time: 3
            }) : layer.open({
                content: "未满18岁，暂不提供服务！",
                skin: "msg",
                time: 5
            });
            var t = {
                DataString: serializeForm("frmMeasure"),
                method: "remoteID"
            };
            $.ajax({
                url: "../json_remote.php",
                dataType: "json",
                type: "POST",
                data: t,
                t: (new Date).getTime(),
                success: function(e) {
                    var t = e.ERR,
                    a = e.NEXT;
                    if (1 != t) return layer.open({
                        content: "订单创建失败",
                        skin: "msg",
                        time: 2
                    }),
                    !1;
                    location.href = a
                },
                error: function(e) {
                    console.log(e)
                }
            })
        }
    })
}),
window.lCalendar = function() {
    var j = $("html").width(),
    z = !1;
    document.addEventListener("touchmove",
    function(e) {
        z && e.preventDefault()
    });
    document.createElement("div");
    function N() {
        z ? (document.body.addEventListener("scroll",
        function(e) {
            e.preventDefault()
        }), document.querySelector(".gearDate").addEventListener("touchmove",
        function(e) {
            e.preventDefault()
        })) : (document.body.removeEventListener("scroll",
        function(e) {
            e.preventDefault()
        }), document.querySelector(".gearDate").removeEventListener("touchmove",
        function(e) {
            e.preventDefault()
        }))
    }
    var T = ["时辰未知", "00:00~00:59", "01:00~02:59", "03:00~04:59", "05:00~06:59", "07:00~08:59", "09:00~10:59", "11:00~12:59", "13:00~14:59", "15:00~16:59", "17:00~18:59", "19:00~20:59", "21:00~22:59", "23:00~23:59"],
    Y = {
        year: "",
        month: "",
        date: "",
        hour: ""
    };
    "classList" in document.documentElement || Object.defineProperty(HTMLElement.prototype, "classList", {
        get: function() {
            var r = this;
            function e(n) {
                return function(e) {
                    var t = r.className.split(/\s+/g),
                    a = t.indexOf(e);
                    n(t, a, e),
                    r.className = t.join(" ")
                }
            }
            return {
                add: e(function(e, t, a) {~t || e.push(a)
                }),
                remove: e(function(e, t) {~t && e.splice(t, 1)
                }),
                toggle: e(function(e, t, a) {~t ? e.splice(t, 1) : e.push(a)
                }),
                contains: function(e) {
                    return !! ~r.className.split(/\s+/g).indexOf(e)
                },
                item: function(e) {
                    return r.className.split(/\s+/g)[e] || null
                }
            }
        }
    });
    function e() {
        var e = new Date;
        this.gearDate,
        this.minY = 1940,
        this.minM = 1,
        this.minD = 1,
        this.maxY = e.getYear() + 1900,
        this.maxM = e.getMonth() + 1,
        this.maxD = e.getDate() + 1,
        this.type = 0
    }
    return e.prototype = {
        init: function(e, t) {
            this.trigger = document.querySelector(e),
            this.hasHourLc = $(this.trigger).attr("hasHour"),
            this.bindEvent("date")
        },
        bindEvent: function(e) {
            var S = this,
            I = [new t(38, 0, 0, 38, 1, 1, 0, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1), new t(26, 6, 2, 44, 1, 1, 0, 1, 1, 0, 1, 0, 0, 1, 0, 1, 0), new t(45, 0, 3, 49, 1, 0, 1, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0), new t(35, 0, 4, 54, 0, 1, 0, 1, 0, 1, 1, 0, 1, 0, 1, 0, 1), new t(24, 4, 5, 59, 1, 0, 1, 0, 1, 0, 1, 0, 1, 1, 0, 1, 1), new t(43, 0, 0, 5, 0, 0, 1, 0, 0, 1, 0, 1, 1, 1, 0, 1, 1), new t(32, 0, 1, 10, 1, 0, 0, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1), new t(21, 2, 2, 15, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 1, 1), new t(40, 0, 3, 20, 1, 0, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1, 1), new t(28, 7, 5, 26, 1, 0, 1, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1), new t(47, 0, 6, 31, 0, 1, 1, 0, 1, 1, 0, 0, 1, 0, 1, 0, 1), new t(36, 0, 0, 36, 1, 0, 1, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0), new t(26, 5, 1, 41, 0, 1, 0, 1, 0, 1, 0, 1, 1, 0, 1, 0, 1), new t(44, 0, 3, 47, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 1), new t(33, 0, 4, 52, 1, 0, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0), new t(23, 3, 5, 57, 0, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1, 1, 1), new t(42, 0, 6, 2, 0, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1, 1, 1), new t(30, 8, 1, 8, 1, 0, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1, 0), new t(48, 0, 2, 13, 1, 1, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1, 0), new t(38, 0, 3, 18, 0, 1, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1), new t(27, 6, 4, 23, 1, 0, 1, 0, 1, 1, 0, 1, 0, 1, 0, 1, 0), new t(45, 0, 6, 29, 1, 0, 1, 0, 1, 0, 1, 1, 0, 1, 0, 1, 0), new t(35, 0, 0, 34, 0, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, 1), new t(24, 4, 1, 39, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1, 1, 1, 0), new t(43, 0, 2, 44, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1, 1, 1, 0), new t(32, 0, 4, 50, 0, 1, 0, 1, 0, 0, 1, 0, 0, 1, 1, 0, 1), new t(20, 3, 5, 55, 1, 1, 1, 0, 1, 0, 0, 1, 0, 0, 1, 1, 0), new t(39, 0, 6, 0, 1, 1, 0, 1, 1, 0, 0, 1, 0, 1, 0, 1, 0), new t(29, 7, 0, 5, 0, 1, 0, 1, 1, 0, 1, 0, 1, 0, 1, 0, 1), new t(47, 0, 2, 11, 0, 1, 0, 1, 0, 1, 1, 0, 1, 0, 1, 0, 1), new t(36, 0, 3, 16, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, 1, 0), new t(26, 5, 4, 21, 0, 1, 0, 0, 1, 0, 1, 0, 1, 1, 1, 0, 1), new t(45, 0, 5, 26, 0, 1, 0, 0, 1, 0, 1, 0, 1, 1, 0, 1, 1), new t(33, 0, 0, 32, 1, 0, 1, 0, 0, 1, 0, 0, 1, 1, 0, 1, 1), new t(22, 4, 1, 37, 1, 1, 0, 1, 0, 0, 1, 0, 0, 1, 1, 0, 1), new t(41, 0, 2, 42, 1, 1, 0, 1, 0, 0, 1, 0, 0, 1, 0, 1, 1), new t(30, 8, 3, 47, 1, 1, 0, 1, 0, 1, 0, 1, 0, 0, 1, 0, 1), new t(48, 0, 5, 53, 1, 0, 1, 1, 0, 1, 0, 1, 0, 1, 0, 0, 1), new t(37, 0, 6, 58, 1, 0, 1, 1, 0, 1, 1, 0, 1, 0, 1, 0, 1), new t(27, 6, 0, 3, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, 1, 0), new t(46, 0, 1, 8, 1, 0, 0, 1, 0, 1, 0, 1, 1, 0, 1, 1, 0), new t(35, 0, 3, 14, 0, 1, 0, 0, 1, 0, 0, 1, 1, 0, 1, 1, 1), new t(24, 4, 4, 19, 1, 0, 1, 0, 0, 1, 0, 0, 1, 0, 1, 1, 1), new t(43, 0, 5, 24, 1, 0, 1, 0, 0, 1, 0, 0, 1, 0, 1, 1, 1), new t(32, 10, 6, 29, 1, 0, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 1), new t(50, 0, 1, 35, 0, 1, 1, 0, 1, 0, 1, 0, 0, 1, 0, 1, 0), new t(39, 0, 2, 40, 0, 1, 1, 0, 1, 1, 0, 1, 0, 1, 0, 0, 1), new t(28, 6, 3, 45, 1, 0, 1, 0, 1, 1, 0, 1, 1, 0, 1, 0, 0), new t(47, 0, 4, 50, 1, 0, 1, 0, 1, 0, 1, 1, 0, 1, 1, 0, 1), new t(36, 0, 6, 56, 1, 0, 0, 1, 0, 1, 0, 1, 0, 1, 1, 1, 0), new t(26, 5, 0, 1, 0, 1, 0, 0, 1, 0, 0, 1, 0, 1, 1, 1, 1), new t(45, 0, 1, 6, 0, 1, 0, 0, 1, 0, 0, 1, 0, 1, 1, 1, 0), new t(34, 0, 2, 11, 0, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 1, 0), new t(22, 3, 4, 17, 0, 1, 1, 0, 1, 0, 1, 0, 0, 1, 0, 1, 0), new t(40, 0, 5, 22, 1, 1, 1, 0, 1, 0, 1, 0, 0, 1, 0, 1, 0), new t(30, 8, 6, 27, 0, 1, 1, 0, 1, 0, 1, 1, 0, 0, 1, 0, 1), new t(49, 0, 0, 32, 0, 1, 0, 1, 1, 0, 1, 0, 1, 1, 0, 0, 1), new t(37, 0, 2, 38, 1, 0, 1, 0, 1, 0, 1, 1, 0, 1, 1, 0, 1), new t(27, 5, 3, 43, 1, 0, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1), new t(46, 0, 4, 48, 1, 0, 0, 1, 0, 0, 1, 0, 1, 1, 1, 0, 1), new t(35, 0, 5, 53, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 1, 0, 1), new t(23, 4, 0, 59, 1, 1, 0, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1), new t(42, 0, 1, 4, 1, 1, 0, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1), new t(31, 0, 2, 9, 1, 1, 0, 1, 1, 0, 1, 0, 0, 1, 0, 1, 0), new t(21, 2, 3, 14, 0, 1, 0, 1, 1, 0, 1, 0, 1, 0, 1, 0, 1), new t(39, 0, 5, 20, 0, 1, 0, 1, 0, 1, 1, 0, 1, 0, 1, 0, 1), new t(28, 7, 6, 25, 1, 0, 1, 0, 1, 0, 1, 0, 1, 1, 0, 1, 1), new t(48, 0, 0, 30, 0, 0, 1, 0, 0, 1, 0, 1, 1, 1, 0, 1, 1), new t(37, 0, 1, 35, 1, 0, 0, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1), new t(25, 5, 3, 41, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 1, 1), new t(44, 0, 4, 46, 1, 0, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1, 1), new t(33, 0, 5, 51, 1, 0, 1, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1), new t(22, 4, 6, 56, 1, 0, 1, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0), new t(40, 0, 1, 2, 1, 0, 1, 0, 1, 1, 0, 1, 0, 1, 0, 1, 0), new t(30, 9, 2, 7, 0, 1, 0, 1, 0, 1, 0, 1, 1, 0, 1, 0, 1), new t(49, 0, 3, 12, 0, 1, 0, 0, 1, 0, 1, 1, 1, 0, 1, 0, 1), new t(38, 0, 4, 17, 1, 0, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0), new t(27, 6, 6, 23, 0, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1, 1, 1), new t(46, 0, 0, 28, 0, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1, 1, 0), new t(35, 0, 1, 33, 1, 0, 1, 0, 1, 0, 0, 1, 0, 0, 1, 1, 0), new t(24, 4, 2, 38, 0, 1, 1, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1), new t(42, 0, 4, 44, 0, 1, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1), new t(31, 0, 5, 49, 1, 0, 1, 0, 1, 1, 0, 1, 0, 1, 0, 1, 0), new t(21, 2, 6, 54, 0, 1, 0, 1, 0, 1, 0, 1, 1, 0, 1, 0, 1), new t(40, 0, 0, 59, 0, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, 1), new t(28, 6, 2, 5, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1, 1, 1, 0), new t(47, 0, 3, 10, 1, 0, 1, 0, 0, 1, 0, 0, 1, 1, 1, 0, 1), new t(36, 0, 4, 15, 1, 1, 0, 1, 0, 0, 1, 0, 0, 1, 1, 0, 1), new t(25, 5, 5, 20, 1, 1, 1, 0, 1, 0, 0, 1, 0, 0, 1, 1, 0), new t(43, 0, 0, 26, 1, 1, 0, 1, 0, 1, 0, 1, 0, 0, 1, 0, 1), new t(32, 0, 1, 31, 1, 1, 0, 1, 1, 0, 1, 0, 1, 0, 1, 0, 0)];
            function p(e) {
                var t = S.gearDate.querySelector(".lcalendar_nongli"),
                a = S.gearDate.querySelector(".lcalendar_gongli"),
                n = 0;
                if ("nongli" == e && 1 != S.type ? (t.className = t.className.replace(/active/, "").replace(/(^\s*)|(\s*$)/g, "") + " active", a.className = a.className.replace(/active/, ""), n = S.type = 1) : "gongli" == e && 0 != S.type && (t.className = t.className.replace(/active/, ""), a.className = a.className.replace(/active/, "").replace(/(^\s*)|(\s*$)/g, "") + " active", S.type = 0, n = 1), n) {
                    var r = S.maxY - S.minY + 1,
                    i = parseInt(Math.round(S.gearDate.querySelector(".date_yy").getAttribute("val"))),
                    o = parseInt(Math.round(S.gearDate.querySelector(".date_mm").getAttribute("val"))) + 1,
                    s = parseInt(Math.round(S.gearDate.querySelector(".date_dd").getAttribute("val"))) + 1,
                    d = parseInt(Math.round(S.gearDate.querySelector(".date_h").getAttribute("val22"))) + 1;
                    console.log(o + "------" + s + "------" + d);
                    var l = i % r + S.minY,
                    c = (e = S.type ? 0 : 1, I[i].Intercalation ? I[i].Intercalation: 0); ! S.type && c && (c == o - 1 ? o = -(o - 1) : c < o - 1 ? --o: o = o);
                    var m = h(e, l, o, s, d);
                    0 == e && ($(S.trigger).attr("data-date22", m.yy), $(S.trigger).attr("data-date33", m.mm));
                    var u = I[m.yy - S.minY].Intercalation ? I[m.yy - S.minY].Intercalation: 0;
                    u && S.type && (m.mm < 0 ? m.mm = 1 - m.mm: m.mm > u && (m.mm = m.mm + 1)),
                    S.gearDate.querySelector(".date_yy").setAttribute("val", m.yy - S.minY),
                    S.gearDate.querySelector(".date_mm").setAttribute("val", m.mm - 1),
                    S.gearDate.querySelector(".date_dd").setAttribute("val", m.dd - 1),
                    S.gearDate.querySelector(".date_h").setAttribute("val", m.h - 1),
                    S.gearDate.querySelector(".date_yy").setAttribute("top", ""),
                    y()
                }
            }
            function y() {
                var e = S.maxY - S.minY + 1,
                t = S.gearDate.querySelector(".date_yy"),
                a = "<div class='tooth'></div>";
                if (t && t.getAttribute("val")) {
                    for (var n = parseInt(t.getAttribute("val")), r = 0; r <= e - 1; r++) a += "<div class='tooth'>" + (S.minY + r) + "</div>";
                    t.innerHTML = a;
                    var i = Math.floor(parseFloat(t.getAttribute("top")));
                    if (isNaN(i)) t.style.transform = "translate(0," + (8 - 2 * n) + "em)",
                    t.style["-webkit-transform"] = "translate(0," + (8 - 2 * n) + "em)",
                    t.style["-moz-transform"] = "translate(0," + (8 - 2 * n) + "em)",
                    t.style["-ms-transform"] = "translate(0," + (8 - 2 * n) + "em)",
                    t.style["-o-transform"] = "translate(0," + (8 - 2 * n) + "em)",
                    t.setAttribute("top", 8 - 2 * n + "em");
                    else {
                        i % 2 == 0 ? i = i: i += 1,
                        8 < i && (i = 8);
                        var o = 8 - 2 * (e - 1);
                        i < o && (i = o),
                        t.style.transform = "translate(0," + i + "em)",
                        t.style["-webkit-transform"] = "translate(0," + i + "em)",
                        t.style["-moz-transform"] = "translate(0," + i + "em)",
                        t.style["-ms-transform"] = "translate(0," + i + "em)",
                        t.style["-o-transform"] = "translate(0," + i + "em)",
                        t.setAttribute("top", i + "em"),
                        n = Math.abs(i - 8) / 2,
                        t.setAttribute("val", n)
                    }
                    var s = S.gearDate.querySelector(".date_mm");
                    if (s && s.getAttribute("val")) {
                        a = "<div class='tooth'></div>";
                        var d = parseInt(s.getAttribute("val")),
                        l = I[n].Intercalation ? I[n].Intercalation: 0;
                        if (l && S.type) var c = 12;
                        else c = 11;
                        var m, u = 0;
                        if (n == e - 1) if (S.type) if (0 <= S.nongMaxObj.mm) {
                            var v = I[S.nongMaxObj.yy - 1940].Intercalation;
                            m = v && v < S.nongMaxObj.mm ? S.nongMaxObj.mm: S.nongMaxObj.mm - 1
                        } else m = Math.abs(S.nongMaxObj.mm);
                        else m = S.maxM - 1;
                        0 == n && (u = S.type ? S.minM - 1 : S.minM);
                        for (r = 0; r < c - u + 1; r++) {
                            var g = u + r + 1;
                            S.type ? (g = l && l == r ? M("rm", g - 1) : M("mm", l && l < r ? g - 1 : g), a += 0 <= m && m < r ? "<div class='tooth' style='color:#c1c1c1'>" + g + "</div>": "<div class='tooth'>" + g + "</div>") : a += 0 <= m && m < r ? "<div class='tooth' style='color:#c1c1c1'>" + g + "月</div>": "<div class='tooth'>" + g + "月</div>"
                        }
                        s.innerHTML = a,
                        c < d ? (d = c, s.setAttribute("val", d)) : d < u && (d = c, s.setAttribute("val", d)),
                        s.style.transform = "translate(0," + (8 - 2 * (d - u)) + "em)",
                        s.style["-webkit-transform"] = "translate(0," + (8 - 2 * (d - u)) + "em)",
                        s.style["-moz-transform"] = "translate(0," + (8 - 2 * (d - u)) + "em)",
                        s.style["-ms-transform"] = "translate(0," + (8 - 2 * (d - u)) + "em)",
                        s.style["-o-transform"] = "translate(0," + (8 - 2 * (d - u)) + "em)",
                        s.setAttribute("top", 8 - 2 * (d - u) + "em");
                        var p = S.gearDate.querySelector(".date_dd");
                        if (p && p.getAttribute("val")) {
                            a = "<div class='tooth'></div>";
                            var y, h = parseInt(p.getAttribute("val")),
                            f = D(n, d) - 1,
                            _ = 0;
                            n == e - 1 && m == d && (y = S.type ? S.nongMaxObj.dd - 1 : S.maxD - 2),
                            0 == n && 2 == d + 1 && (_ = S.type ? S.minD - 1 : S.minD + 6);
                            for (r = 0; r < f - _ + 1; r++) {
                                g = S.type ? M("dd", _ + r + 1) : _ + r + 1;
                                S.type ? a += 0 <= y && y < r ? "<div class='tooth' style='color:#c1c1c1'>" + g + "</div>": "<div class='tooth'>" + g + "</div>": a += 0 <= y && y < r ? "<div class='tooth' style='color:#c1c1c1'>" + g + "日</div>": "<div class='tooth'>" + g + "日</div>"
                            }
                            p.innerHTML = a,
                            f < h ? (h = f, p.setAttribute("val", h)) : h < _ && (h = _, p.setAttribute("val", h)),
                            p.style.transform = "translate(0," + (8 - 2 * (h - _)) + "em)",
                            p.style["-webkit-transform"] = "translate(0," + (8 - 2 * (h - _)) + "em)",
                            p.style["-moz-transform"] = "translate(0," + (8 - 2 * (h - _)) + "em)",
                            p.style["-ms-transform"] = "translate(0," + (8 - 2 * (h - _)) + "em)",
                            p.style["-o-transform"] = "translate(0," + (8 - 2 * (h - _)) + "em)",
                            p.setAttribute("top", 8 - 2 * (h - _) + "em");
                            var w = S.gearDate.querySelector(".date_h"),
                            b = $(S.trigger).next().attr("jiavalue");
                            if (1 == S.hasHourLc) {
                                w.setAttribute("val", 1);
                                var x = 8 - 2 * b;
                                w.style.transform = "translate(0," + x + "em)",
                                w.style["-webkit-transform"] = "translate(0," + x + "em)",
                                w.style["-moz-transform"] = "translate(0," + x + "em)",
                                w.style["-ms-transform"] = "translate(0," + x + "em)",
                                w.style["-o-transform"] = "translate(0," + x + "em)",
                                w.setAttribute("top", x + "em")
                            }
                            q()
                        }
                    }
                }
            }
            function D(e, t) {
                return 1 == S.type ? I[e].MonthDays[t] ? 30 : 29 : 1 == t ? (e += S.minY) % 4 == 0 && e % 100 != 0 || e % 400 == 0 && e % 4e3 != 0 ? 29 : 28 : 3 == t || 5 == t || 8 == t || 10 == t ? 30 : 31
            }
            function M(e, t) {
                var a = ["早子时", "丑时", "寅时", "卯时", "辰时", "巳时", "午时", "未时", "申时", "酉时", "戌时", "亥时", "晚子时"];
                return "rm" == e ? ["闰正月", "闰二月", "闰三月", "闰四月", "闰五月", "闰六月", "闰七月", "闰八月", "闰九月", "闰十月", "闰冬月", "闰腊月"][t - 1] : "mm" == e ? ["正月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"][t - 1] : "dd" == e ? ["初一", "初二", "初三", "初四", "初五", "初六", "初七", "初八", "初九", "初十", "十一", "十二", "十三", "十四", "十五", "十六", "十七", "十八", "十九", "二十", "廿一", "廿二", "廿三", "廿四", "廿五", "廿六", "廿七", "廿八", "廿九", "三十", "三十一"][t - 1] : "h" == e || "h1" === e ? a[t - 1] : void 0
            }
            function h(e, t, a, n, r) {
                var i = t,
                o = a,
                s = n,
                d = r,
                l = [0, 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334, 365, 396, 0, 31, 60, 91, 121, 152, 182, 213, 244, 274, 305, 335, 366, 397];
                if (0 == e) {
                    var c = parseInt(i),
                    m = parseInt(o),
                    u = parseInt(s),
                    v = m - 1,
                    g = A(c),
                    p = ((D = l[14 * g + v] + u) + I[b = c - 1940].BaseKanChih) % 60;
                    if (p = p < 22 ? 22 - p: 82 - p, (p += 3) < 10 && (p += 60), D <= I[b].BaseDays) b--,
                    D = l[14 * (g = A(y = c - 1)) + (v += 12)] + u;
                    else var y = c;
                    var h = I[b].BaseDays;
                    for (M = 0; M < 13; M++) {
                        var f = h + I[b].MonthDays[M] + 29;
                        if (D <= f) break;
                        h = f
                    }
                    var _ = M + 1,
                    w = D - h;
                    return 0 != (x = I[b].Intercalation) && x < _ && --_ == x && (_ = -x),
                    12 < _ && (_ -= 12),
                    {
                        yy: y,
                        mm: _,
                        dd: w,
                        h: d
                    }
                }
                y = parseInt(i),
                _ = parseInt(o),
                w = parseInt(s);
                var b, x, S = _;
                0 != (x = I[b = y - 1940].Intercalation) && (x < S ? S++:S == -x && (S = x + 1)),
                S--;
                for (var D = 0,
                M = 0; M < S; M++) D += I[b].MonthDays[M] + 29;
                D += I[b].BaseDays + w;
                for (g = A(y), M = 13; 0 <= M && !(l[14 * g + M] < D); M--);
                if (M <= 11) c = y,
                m = M + 1;
                else c = y + 1,
                m = M - 11;
                return {
                    yy: c,
                    mm: m,
                    dd: u = D - l[14 * g + M],
                    h: d
                }
            }
            function A(e) {
                return e % 400 == 0 ? 1 : e % 100 == 0 ? 0 : e % 4 == 0 ? 1 : 0
            }
            function t(e, t, a, n, r, i, o, s, d, l, c, m, u, v, g, p, y) {
                this.BaseDays = e,
                this.Intercalation = t,
                this.BaseWeekday = a,
                this.BaseKanChih = n,
                this.MonthDays = [r, i, o, s, d, l, c, m, u, v, g, p, y]
            }
            function f(e) {
                var t = ((e = e || event).wheelDelta ? 0 < e.wheelDelta: e.detail < 0) ? 21 : -21;
                e.preventDefault();
                for (var a = e.target; ! a.classList.contains("gear");) a = a.parentElement;
                clearInterval(a["int_" + a.id]),
                a["old_" + a.id] = 0,
                a["o_t_" + a.id] = (new Date).getTime();
                var n = a.getAttribute("top");
                a["o_d_" + a.id] = n ? parseFloat(n.replace(/em/g, "")) : 0,
                a["new_" + a.id] = t,
                a["n_t_" + a.id] = (new Date).getTime() + 360;
                var r = 18 * (a["new_" + a.id] - a["old_" + a.id]) / 370;
                a["pos_" + a.id] = a["o_d_" + a.id] + r,
                a.setAttribute("top", a["pos_" + a.id] + "em");
                var i = (a["new_" + a.id] - a["old_" + a.id]) / (a["n_t_" + a.id] - a["o_t_" + a.id]);
                return Math.abs(i) <= .2 ? a["spd_" + a.id] = i < 0 ? -.08 : .08 : Math.abs(i) <= .5 ? a["spd_" + a.id] = i < 0 ? -.16 : .16 : a["spd_" + a.id] = i / 2,
                a["pos_" + a.id] || (a["pos_" + a.id] = 0),
                e.preventDefault && e.preventDefault(),
                o(a),
                !1
            }
            function _(e) {
                e.preventDefault();
                for (var t = e.target,
                n = t,
                r = !1; ! t.classList.contains("gear");) t = t.parentElement;
                clearInterval(t["int_" + t.id]),
                t["old_" + t.id] = e.screenY,
                t["o_t_" + t.id] = (new Date).getTime();
                var a = t.getAttribute("top");
                t["o_d_" + t.id] = a ? parseFloat(a.replace(/em/g, "")) : 0,
                document.onmousemove = function(e) {
                    r = !0,
                    (e = e || window.event).preventDefault();
                    for (var t = n; ! t.classList.contains("gear");) t = t.parentElement;
                    t["new_" + t.id] = e.screenY,
                    t["n_t_" + t.id] = (new Date).getTime();
                    var a = 18 * (t["new_" + t.id] - t["old_" + t.id]) / 370;
                    t["pos_" + t.id] = t["o_d_" + t.id] + a,
                    t.style.transform = "translate(0," + t["pos_" + t.id] + "em)",
                    t.style["-webkit-transform"] = "translate(0," + t["pos_" + t.id] + "em)",
                    t.style["-moz-transform"] = "translate(0," + t["pos_" + t.id] + "em)",
                    t.style["-ms-transform"] = "translate(0," + t["pos_" + t.id] + "em)",
                    t.style["-o-transform"] = "translate(0," + t["pos_" + t.id] + "em)",
                    t.setAttribute("top", t["pos_" + t.id] + "em")
                },
                document.onmouseup = function(e) {
                    if (!r) return document.onmousemove = null,
                    document.onmouseup = null,
                    !1; (e = e || window.event).preventDefault();
                    for (var t = n; ! t.classList.contains("gear");) t = t.parentElement;
                    var a = (t["new_" + t.id] - t["old_" + t.id]) / (t["n_t_" + t.id] - t["o_t_" + t.id]);
                    Math.abs(a) <= .2 ? t["spd_" + t.id] = a < 0 ? -.08 : .08 : Math.abs(a) <= .5 ? t["spd_" + t.id] = a < 0 ? -.16 : .16 : t["spd_" + t.id] = a / 2,
                    t["pos_" + t.id] || (t["pos_" + t.id] = 0),
                    o(t),
                    document.onmousemove = null,
                    document.onmouseup = null
                }
            }
            function w(e) {
                e.preventDefault();
                var t = e.target;
                for (t.touchTip = !1; ! t.classList.contains("gear");) t = t.parentElement;
                clearInterval(t["int_" + t.id]),
                t["old_" + t.id] = e.targetTouches[0].screenY,
                t["o_t_" + t.id] = (new Date).getTime();
                var a = t.getAttribute("top");
                t["o_d_" + t.id] = a ? parseFloat(a.replace(/em/g, "")) : 0
            }
            function b(e) {
                e.preventDefault();
                var t = e.target;
                for (t.touchTip = !0; ! t.classList.contains("gear");) t = t.parentElement;
                t["new_" + t.id] = e.targetTouches[0].screenY,
                t["n_t_" + t.id] = (new Date).getTime();
                var a = 18 * (t["new_" + t.id] - t["old_" + t.id]) / 370;
                t["pos_" + t.id] = t["o_d_" + t.id] + a,
                t.style.transform = "translate(0," + t["pos_" + t.id] + "em)",
                t.style["-webkit-transform"] = "translate(0," + t["pos_" + t.id] + "em)",
                t.style["-moz-transform"] = "translate(0," + t["pos_" + t.id] + "em)",
                t.style["-ms-transform"] = "translate(0," + t["pos_" + t.id] + "em)",
                t.style["-o-transform"] = "translate(0," + t["pos_" + t.id] + "em)",
                t.setAttribute("top", t["pos_" + t.id] + "em")
            }
            function x(e) {
                e.preventDefault();
                var t = e.target;
                if (!t.touchTip) return ! 1;
                for (; ! t.classList.contains("gear");) t = t.parentElement;
                var a = (t["new_" + t.id] - t["old_" + t.id]) / (t["n_t_" + t.id] - t["o_t_" + t.id]);
                Math.abs(a) <= .2 ? t["spd_" + t.id] = a < 0 ? -.08 : .08 : Math.abs(a) <= .5 ? t["spd_" + t.id] = a < 0 ? -.16 : .16 : t["spd_" + t.id] = a / 2,
                t["pos_" + t.id] || (t["pos_" + t.id] = 0),
                o(t)
            }
            function o(_) {
                var w = 0,
                b = !1,
                x = S.maxY - S.minY + 1;
                console.log(x),
                clearInterval(_["int_" + _.id]),
                _["int_" + _.id] = setInterval(function() {
                    var e = _["pos_" + _.id],
                    t = _["spd_" + _.id] * Math.exp( - .03 * w);
                    if (e += t, !(.1 < Math.abs(t))) {
                        t = .1;
                        var a = 2 * Math.round(e / 2);
                        Math.abs(e - a) < .02 ? b = !0 : a < e ? e -= t: e += t
                    }
                    8 < e && (e = 8, b = !0);
                    var n = $(".date_mm"),
                    r = $(".date_dd");
                    switch (_.getAttribute("data-datetype")) {
                    case "date_yy":
                        if (e < (f = 8 - 2 * (x - 1)) && (e = f, b = !0), b) {
                            var i, o = Math.abs(e - 8) / 2;
                            if (E(_, o), clearInterval(_["int_" + _.id]), o == S.maxY - 1940) {
                                if (S.type) if (0 <= S.nongMaxObj.mm) i = (v = I[S.nongMaxObj.yy - 1940].Intercalation) && v < S.nongMaxObj.mm ? S.nongMaxObj.mm: S.nongMaxObj.mm - 1;
                                else i = Math.abs(S.nongMaxObj.mm);
                                else i = S.maxM - 1;
                                if (n.attr("val") >= i) E(n.get(0), i),
                                m = S.type ? S.nongMaxObj.dd - 1 : S.maxD - 2,
                                r.attr("val") > m && E(r.get(0), m)
                            }
                        }
                        break;
                    case "date_mm":
                        var s = S.gearDate.querySelector(".date_yy"),
                        d = parseInt(s.getAttribute("val"));
                        if ((I[d].Intercalation ? I[d].Intercalation: 0) && S.type) var l = 12;
                        else l = 11;
                        var c = 0;
                        if (d == x - 1) if (S.type) if (0 <= S.nongMaxObj.mm) l = (v = I[S.nongMaxObj.yy - 1940].Intercalation) && v < S.nongMaxObj.mm ? S.nongMaxObj.mm: S.nongMaxObj.mm - 1;
                        else l = Math.abs(S.nongMaxObj.mm);
                        else l = S.maxM - 1;
                        if (0 == d && (c = S.type ? S.minM - 1 : S.minM), e < (f = 8 - 2 * (l - c)) && (e = f, b = !0), b) {
                            var m;
                            o = Math.abs(e - 8) / 2 + c;
                            if (E(_, o), clearInterval(_["int_" + _.id]), l == Math.round(o)) m = S.type ? S.nongMaxObj.dd - 1 : S.maxD - 2,
                            r.attr("val") > m && E(r.get(0), m)
                        }
                        break;
                    case "date_dd":
                        s = S.gearDate.querySelector(".date_yy");
                        var u, v, g = S.gearDate.querySelector(".date_mm"),
                        p = (d = parseInt(s.getAttribute("val")), parseInt(g.getAttribute("val"))),
                        y = D(d, p) - 1,
                        h = 0;
                        if (S.type) if (0 <= S.nongMaxObj.mm) u = (v = I[S.nongMaxObj.yy - 1940].Intercalation) && v < S.nongMaxObj.mm ? S.nongMaxObj.mm: S.nongMaxObj.mm - 1;
                        else u = Math.abs(S.nongMaxObj.mm);
                        else u = S.maxM - 1;
                        if (d == x - 1 && u == p && (y = S.type ? S.nongMaxObj.dd - 1 : S.maxD - 2), 0 == d && 2 == p + 1 && (h = S.type ? S.minD - 1 : S.minD + 6), e < (f = 8 - 2 * (y - h)) && (e = f, b = !0), b) {
                            o = Math.abs(e - 8) / 2 + h;
                            E(_, o),
                            clearInterval(_["int_" + _.id])
                        }
                        break;
                    case "date_h":
                        var f;
                        if (e < (f = -18) && (e = f, b = !0), b) {
                            o = Math.abs(e - 8) / 2;
                            E(_, o),
                            clearInterval(_["int_" + _.id])
                        }
                    }
                    _["pos_" + _.id] = e,
                    _.style.transform = "translate(0," + e + "em)",
                    _.style["-webkit-transform"] = "translate(0," + e + "em)",
                    _.style["-moz-transform"] = "translate(0," + e + "em)",
                    _.style["-ms-transform"] = "translate(0," + e + "em)",
                    _.style["-o-transform"] = "translate(0," + e + "em)",
                    _.setAttribute("top", e + "em"),
                    w++
                },
                6)
            }
            function E(e, t) {
                t = Math.round(t),
                console.log(t + "-------停留的值"),
                e.setAttribute("val", t),
                e.setAttribute("val22", t),
                $(e).hasClass("date_h") && $(S.trigger).next().attr("jiavalue", t),
                y()
            }
            function O(e) {
                if (e.preventDefault(), !window.CustomEvent) {
                    var t = new CustomEvent("input");
                    S.trigger.dispatchEvent(t)
                }
                document.body.removeChild(S.gearDate)
            }
            function L(e) {
                if (1 != S.hasHourLc) B(e);
                else {
                    $(".date_ctrl ").hide(),
                    $(".date_confirm").show();
                    var t = q();
                    S.trigger.setAttribute("data-date", t.yy + "." + t.mm + "." + t.dd + "." + t.h),
                    S.trigger.setAttribute("data-date22", t._yy),
                    S.trigger.setAttribute("data-date33", t._mm);
                    var a = S.trigger.getAttribute("data-input-id");
                    a && (document.getElementById(a).value = t.yy + "-" + t.mm + "-" + t.dd + " " + t.h);
                    var n = $(".lcalendar_info").text(),
                    r = $(".lcalendar_info1").text();
                    if (t._type) {
                        var i = '<p>农(阴)历：<span class="nongli" style="color:red">' + n + '</span></p><p>公(阳)历：<span class="gongli"  style="color:red">' + r + "<span></p>";
                        "时辰未知" === g && (i += '<div class="tixing1" style="color:#ff9900;font-size:18px;">注意:选时辰未知有可能影响结果的准确性</div>')
                    } else if ("时辰未知" === g) i = '<p>公(阳)历：<span class="gongli"  style="color:red">' + r + '<span></p><p>农(阴)历：<span class="nongli" style="color:red">' + n + '</span></p><div class="tixing1" style="color:#ff9900;font-size:18px;">注意:选时辰未知有可能影响结果的准确性</div>';
                    else i = '<p>公(阳)历：<span class="gongli"  style="color:red">' + r + '<span></p><p>农(阴)历：<span class="nongli" style="color:red">' + n + "</span></p>";
                    $(".gongnongli").html(i),
                    1 != S.hasHourLc && (n = function(e) {
                        var t = -1;
                        if ( - 1 != e.indexOf("时辰未知")) t = e.indexOf("时辰未知"),
                        e = e.slice(0, t);
                        else if ( - 1 != e.indexOf("早子")) t = e.indexOf("早子"),
                        e = e.slice(0, t);
                        else if ( - 1 != e.indexOf("晚子")) t = e.indexOf("晚子"),
                        e = e.slice(0, t);
                        else if ( - 1 != e.indexOf("时")) t = e.indexOf("时"),
                        e = e.slice(0, t - 1);
                        else {
                            if ( - 1 == e.indexOf("日")) return e;
                            t = e.indexOf("日"),
                            e = e.slice(0, t + 1)
                        }
                        return e
                    } (n))
                }
            }
            function k() {
                $(".date_ctrl ").show(),
                $(".date_confirm").hide()
            }
            function B(e) {
                z = !1,
                N(),
                console.log(Y);
                var t = Y.hour;
                "时辰" == t && (t = "un"),
                $(S.trigger).next().val(Y.year + "-" + Y.month + "-" + Y.date + "-" + t);
                var a = q();
                S.trigger.setAttribute("data-date", a.yy + "-" + a.mm + "-" + a.dd + " " + a.h),
                S.trigger.setAttribute("data-date22", a._yy),
                S.trigger.setAttribute("data-date33", a._mm);
                var n = S.trigger.getAttribute("data-input-id");
                n && (document.getElementById(n).value = a.yy + "-" + a.mm + "-" + a.dd + " " + a.h),
                console.log($(".lcalendar_info").text());
                $(".lcalendar_info").text(),
                $(".lcalendar_info1").text();
                if (S.type) {
                    var r = a._mm < 0 ? M("rm", -a._mm) : M("mm", a._mm);
                    $(S.trigger).attr("data-text", "农历:" + a._yy + "年" + r + M("dd", a._dd) + g),
                    1 != S.hasHourLc ? $(S.trigger).html("农历:" + a._yy + "年" + r + M("dd", a._dd)) : $(S.trigger).html("农历:" + a._yy + "年" + r + M("dd", a._dd) + g)
                } else $(S.trigger).attr("data-text", "公历:" + a.yy + "年" + a.mm + "月" + a.dd + "日" + g),
                1 != S.hasHourLc ? $(S.trigger).html("公历:" + a.yy + "年" + a.mm + "月" + a.dd + "日") : $(S.trigger).html("公历:" + a.yy + "年" + a.mm + "月" + a.dd + "日" + g);
                O(e)
            }
            this.nongMaxObj = h(0, this.maxY.toString(), this.maxM.toString(), (this.maxD - 1).toString());
            var g = "";
            function q() {
                var e = S.maxY - S.minY + 1,
                t = parseInt(Math.round(S.gearDate.querySelector(".date_yy").getAttribute("val"))),
                a = t % e + S.minY,
                n = parseInt(Math.round(S.gearDate.querySelector(".date_mm").getAttribute("val"))) + 1,
                r = parseInt(Math.round(S.gearDate.querySelector(".date_dd").getAttribute("val"))) + 1,
                i = parseInt(Math.round(S.gearDate.querySelector(".date_h").getAttribute("val22"))) + 1,
                o = I[t].Intercalation ? I[t].Intercalation: 0;
                S.type && o && (o == n - 1 ? n = -(n - 1) : o < n - 1 ? --n: n = n);
                var s = h(S.type, a, n, r, i);
                console.log(s);
                var d = S.gearDate.querySelector(".lcalendar_info"),
                l = S.gearDate.querySelector(".lcalendar_info1");
                if (S.type) {
                    Y.year = s.yy,
                    Y.month = s.mm,
                    Y.date = s.dd,
                    Y.hour = T[i - 1].slice(0, 2),
                    S.trigger.setAttribute("data-type", 1);
                    var c = n < 0 ? M("rm", -n) : M("mm", n);
                    g = (g = M("h", i - 1)) || "时辰未知";
                    var m = h(1, a, n, r, i),
                    u = a + "年" + c + M("dd", r) + g;
                    return d.innerHTML = u,
                    l.innerHTML = m.yy + "年" + m.mm + "月" + m.dd + "日" + g,
                    {
                        yy: s.yy,
                        mm: s.mm,
                        dd: s.dd,
                        _yy: a,
                        _mm: n,
                        _dd: r,
                        _h: i,
                        _type: S.type
                    }
                }
                Y.year = a,
                Y.month = n,
                Y.date = r,
                Y.hour = T[i - 1].slice(0, 2),
                g = (g = M("h", i - 1)) || "时辰未知",
                S.trigger.setAttribute("data-type", 0);
                var v = h(0, a, n, r, i);
                c = v.mm < 0 ? M("rm", -v.mm) : M("mm", v.mm),
                u = v.yy + "年" + c + M("dd", v.dd) + g;
                return d.innerHTML = u,
                l.innerHTML = a + "年" + n + "月" + r + "日" + g,
                {
                    _yy: s.yy,
                    _mm: s.mm,
                    _dd: s.dd,
                    yy: a,
                    mm: n,
                    dd: r,
                    h: i,
                    _type: S.type
                }
            }
            console.log(S.trigger),
            S.trigger.addEventListener("click",
            function() {}),
            S.trigger.addEventListener("click", {
                date: function(n) {
                    document.activeElement.blur(),
                    S.gearDate = document.createElement("div"),
                    S.gearDate.className = "gearDate",
                    S.gearDate.setAttribute("style", "z-index:99999");
                    var e = '<div style="width: 100%; height: 429px; position: absolute; top: 0px; left: 0px; opacity: 0;" class="zhezhao"></div><div class="date_ctrl slideInUp" style="z-index:1000;display:block"><div class="date_info_box lcalendar_info">2016年12月29日</div><div class="date_info_box lcalendar_info1">2016年12月29日</div><div style="font-size: 10px"><div class="date_class_box"><div id="falseBtn_back">取消</div><div class="date_class lcalendar_gongli">公历</div><div class="date_class lcalendar_nongli">农历</div><div id="falseBtn_save">完成</div></div></div><div class="date_roll_mask"><div class="date_roll"><div><div class="gear date_yy" data-datetype="date_yy"></div><div class="date_grid"></div></div><div><div class="gear date_mm" data-datetype="date_mm"></div><div class="date_grid"></div></div><div><div class="gear date_dd" data-datetype="date_dd"></div><div class="date_grid"></div></div>',
                    t = "";
                    1 != S.hasHourLc && (t = "display:none"),
                    e += '<div class="date_h_wrap" style=' + t + '><div class="gear date_h" id="dddHei" val22=' + $(S.trigger).next().attr("jiavalue") + ' data-datetype="date_h"><div class="tooth too1"></div><div class="tooth too1">时辰未知</div><div class="tooth too1">00:00~00:59 (早子)</div><div class="tooth too1">01:00~02:59 (丑)</div><div class="tooth too1">03:00~04:59 (寅)</div><div class="tooth too1">05:00~06:59 (卯)</div><div class="tooth too1">07:00~08:59 (辰)</div><div class="tooth too1">09:00~10:59 (巳)</div><div class="tooth too1">11:00~12:59 (午)</div><div class="tooth too1">13:00~14:59 (未)</div><div class="tooth too1">15:00~16:59 (申)</div> <div class="tooth too1">17:00~18:59 (酉)</div><div class="tooth too1">19:00~20:59 (戌)</div><div class="tooth too1">21:00~22:59 (亥)</div><div class="tooth too1">23:00~23:59 (晚子)</div></div><div class="date_grid"></div></div>',
                    e += '</div></div><div class="date_btn_box"><div class="date_btn lcalendar_finish">确定</div><div class="date_btn lcalendar_cancel">取消</div></div></div>',
                    e += '<div class="date_confirm" style="z-index:1000;border-top: 1px solid rgb(221, 221, 221);width:100%;position: absolute; bottom: 0px; left: 0px;right: 0px; background-color: rgb(255, 255, 255); z-index: 10000; color: rgb(187, 187, 187); overflow: hidden; display: none;padding-bottom:20px"><div style="line-height: 60px;border-bottom: 1px solid rgb(221, 221, 221);text-align: center;font-size: 20px;font-weight:bold;color: #000000;"> 出生日期确认</div><div style="text-align: center; overflow: hidden;margin-bottom:10px;"><p style="font-size: 18px;color: rgb(51, 51, 51);line-height: 30px;padding-top:5px;">请确认输入的时间是否正确</p><div class="gongnongli" style="font-size: 20px;line-height: 30px;color:rgb(51, 51, 51)"><div class="gongnongli"></div></div></div><div style="color: rgb(255, 255, 255);font-size: 18px;margin: 0;"><div style="float: left; width: 50%; text-align: right; box-sizing: border-box; padding-right: 20px; vertical-align: top; cursor: pointer;"><span id="return_date" style="display: inline-block; width: 150px; line-height: 50px; background-color: #999999; color: rgb(255, 255, 255); text-align: center; border-radius: 6px;">返回修改</span></div><div style="float: right; text-align: left; width: 50%; box-sizing: border-box; padding-left: 20px; vertical-align: top; cursor: pointer;"><span id="finishMobileDate" style="display: inline-block; width: 150px; line-height: 50px; background-color: #993300; color: rgb(255, 255, 255); text-align: center; border-radius: 6px;">确认提交</span></div><div style="overflow: hidden; clear: both;"></div></div></div>',
                    S.gearDate.innerHTML = e,
                    document.body.appendChild(S.gearDate),
                    1 != S.hasHourLc && $(".date_roll>div").css("width", "33.33%");
                    for (var a = $("#dddHei .tooth"), r = a.height(), i = 360 <= j ? 14 : 12, o = 0; o < a.length; o++) $(a[o]).css({
                        height: r + "px",
                        "line-height": r + "px",
                        "font-size": i + "px"
                    }); !
                    function() {
                        var e = $(S.trigger).next().val().split("-"),
                        t = {
                            yy: e[0] - 1900,
                            mm: e[1] - 1,
                            dd: e[2] - 1,
                            h: 1
                        },
                        a = S.trigger.getAttribute("data-date22") - S.minY,
                        n = S.trigger.getAttribute("data-date33");
                        /^\d{4}-\d{1,2}-\d{1,2}$/.test(S.trigger.getAttribute("data-date")) ? (rs = S.trigger.getAttribute("data-date").match(/(^|-)\d{1,4}/g), t.yy = rs[0] - S.minY, t.mm = rs[1].replace(/-/g, "") - 1, t.dd = rs[2].replace(/-/g, "") - 1) : t.yy = t.yy + 1900 - S.minY;
                        if (S.gearDate.querySelector(".date_yy").setAttribute("val", t.yy), S.gearDate.querySelector(".date_mm").setAttribute("val", t.mm), S.gearDate.querySelector(".date_dd").setAttribute("val", t.dd), S.gearDate.querySelector(".date_h").setAttribute("val", t.h), parseInt(S.trigger.getAttribute("data-type"))) {
                            S.type = 1;
                            var r = S.gearDate.querySelector(".lcalendar_nongli");
                            r.className = r.className.replace(/active/, "").replace(/(^\s*)|(\s*$)/g, "") + " active";
                            var i = S.maxY - S.minY + 1,
                            o = t.yy % i + S.minY,
                            s = t.mm + 1,
                            d = t.dd + 1,
                            l = t.h + 1,
                            c = h(0, o, s, d, l);
                            c.mm < 0 && (c.mm = 1 - c.mm),
                            0 != I[a].Intercalation && n > I[a].Intercalation && (console.log("jinlaile"), c.mm += 1),
                            S.gearDate.querySelector(".date_yy").setAttribute("val", c.yy - S.minY),
                            S.gearDate.querySelector(".date_mm").setAttribute("val", c.mm - 1),
                            S.gearDate.querySelector(".date_dd").setAttribute("val", c.dd - 1),
                            S.gearDate.querySelector(".date_h").setAttribute("val", c.h - 1)
                        } else {
                            S.type = 0;
                            var m = S.gearDate.querySelector(".lcalendar_gongli");
                            m.className = m.className.replace(/active/, "").replace(/(^\s*)|(\s*$)/g, "") + " active"
                        }
                        y()
                    } ();
                    var s = "ontouchstart" in window;
                    S.gearDate.querySelector("#falseBtn_back").addEventListener(s ? "touchstart": "click", O),
                    S.gearDate.querySelector("#falseBtn_save").addEventListener(s ? "touchstart": "click", L),
                    S.gearDate.querySelector("#return_date").addEventListener(s ? "touchstart": "click", k);
                    var d = S.gearDate.querySelector("#finishMobileDate");
                    d.addEventListener(s ? "touchstart": "click", B);
                    var l = S.gearDate.querySelector(".lcalendar_gongli"),
                    c = S.gearDate.querySelector(".lcalendar_nongli");
                    l.addEventListener(s ? "touchstart": "click",
                    function() {
                        p("gongli")
                    },
                    !1),
                    c.addEventListener(s ? "touchstart": "click",
                    function() {
                        p("nongli")
                    },
                    !1);
                    var m = S.gearDate.querySelector(".date_yy"),
                    u = S.gearDate.querySelector(".date_mm"),
                    v = S.gearDate.querySelector(".date_dd"),
                    g = S.gearDate.querySelector(".date_h");
                    m.addEventListener("touchstart", w),
                    u.addEventListener("touchstart", w),
                    v.addEventListener("touchstart", w),
                    g.addEventListener("touchstart", w),
                    m.addEventListener("mousedown", _),
                    u.addEventListener("mousedown", _),
                    v.addEventListener("mousedown", _),
                    g.addEventListener("mousedown", _),
                    m.addEventListener("touchmove", b),
                    u.addEventListener("touchmove", b),
                    v.addEventListener("touchmove", b),
                    g.addEventListener("touchmove", b),
                    m.addEventListener("touchend", x),
                    u.addEventListener("touchend", x),
                    v.addEventListener("touchend", x),
                    g.addEventListener("touchend", x),
                    0 < navigator.userAgent.indexOf("Firefox") ? (S.gearDate.addEventListener("DOMMouseScroll",
                    function(e) {
                        e.preventDefault()
                    },
                    !1), m.addEventListener("DOMMouseScroll", f, !1), u.addEventListener("DOMMouseScroll", f, !1), v.addEventListener("DOMMouseScroll", f, !1), g.addEventListener("DOMMouseScroll", f, !1)) : (S.gearDate.onmousewheel = function(e) {
                        return ! 1
                    },
                    m.onmousewheel = f, u.onmousewheel = f, v.onmousewheel = f, g.onmousewheel = f),
                    "block" === $(".date_ctrl").css("display") ? $(".zhezhao").css("height", parseInt(window.innerHeight) - parseInt($(".date_ctrl").height()) + "px") : $(".zhezhao").css("height", parseInt(window.innerHeight) - parseInt($(".date_confirm").height()) + "px"),
                    S.gearDate.onclick = function() {
                        if (parseInt(event.clientX) < parseInt($(".zhezhao").css("width")) && parseInt(event.clientY) < parseInt($(".zhezhao").css("height"))) if ("block" === $(".date_ctrl").css("display")) O(n);
                        else if ("undefined" != typeof Event && Event instanceof Function) {
                            var e = new Event("touchstart"),
                            t = new Event("click");
                            d.dispatchEvent(e),
                            d.dispatchEvent(t)
                        } else if (document.createEvent && "function" == typeof document.createEvent) {
                            var a = document.createEvent("HTMLEvents");
                            a.initEvent("click", !0, !0),
                            d.dispatchEvent(a)
                        }
                    },
                    z = !0,
                    N()
                }
            } [e], !1)
        }
    },
    e
} ();