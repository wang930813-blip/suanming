function initName(e, t) { var a = "";
	e == "NumData" + t && !a && window.localStorage && window.localStorage["cacheName" + t] && (a = window.localStorage["cacheName" + t]), $("#" + e).val(a) }

function lc_initEmail(e, t) { var a = t || "";!t && window.localStorage && window.localStorage.cacheEmail && (a = window.localStorage.cacheEmail), $("#" + e).val(a) }

function lc_initPlace(e, t) { var a = window.localStorage["cachePlace" + t],
		n = "北京",
		r = "海淀区",
		i = null; if(a) { var o = a.split("-");
		o[0] && (n = o[0]), o[1] && (r = o[1]), o[2] && (i = o[2]) } $("#lc_city" + t).citySelect({ prov: n, city: r, dist: i, nodata: "none" }) }

function lc_initplaceSlide(e) { var i = document.getElementById(e),
		o = [],
		s = [],
		l = [],
		t = [0, 0, 0],
		n = [0, 0, 0];

	function r(e, r) { e.forEach(function(e, t, a) { var n = new Object;
			n.text = e.name, n.value = t, r.push(n) }) } r(city, o), city[t[0]].hasOwnProperty("sub") ? r(city[t[0]].sub, s) : s = [{ text: "", value: 0 }], city[t[0]].sub[t[1]].hasOwnProperty("sub") ? r(city[t[0]].sub[t[1]].sub, l) : l = [{ text: "", value: 0 }]; var d = new Picker({ data: [o, s, l], selectedIndex: t, title: "地址选择" });
	d.on("picker.select", function(e, t) { var a = o[t[0]].text,
			n = s[t[1]].text,
			r = l[t[2]] ? l[t[2]].text : "";
		i.innerText = a + " " + n + " " + r }), d.on("picker.change", function(e, a) { 0 === e ? function() { s = [], l = [], n[0] = a; var e = city[a]; if(e.hasOwnProperty("sub")) { r(e.sub, s); var t = city[a].sub[0];
				t.hasOwnProperty("sub") ? r(t.sub, l) : (l = [{ text: "", value: 0 }], n[2] = 0) } else s = [{ text: "", value: 0 }], l = [{ text: "", value: 0 }], n[1] = 0, n[2] = 0;
			d.refillColumn(1, s), d.refillColumn(2, l), d.scrollColumn(1, 0), d.scrollColumn(2, 0) }() : 1 === e && function() { l = [], n[1] = a; var e = n[0]; if(city[e].sub[a].hasOwnProperty("sub")) { var t = city[e].sub[a];
				r(t.sub, l), d.refillColumn(2, l), d.scrollColumn(2, 0) } else l = [{ text: "", value: 0 }], n[2] = 0, d.refillColumn(2, l), d.scrollColumn(2, 0) }() }), d.on("picker.valuechange", function(e, t) { console.log(e), console.log(t) }), i.addEventListener("click", function() { d.show() }) }

function lc_initplaceSlide3(e, a, n) { var r = new Array,
		i = 0;! function e(t) { for(var a = 0; a < t.length; a++) t[a].value == n[i] && (i++, r[r.length] = t[a].id, t[a].childs && e(t[a].childs)) }(newCityJson);
	new MobileSelect({ trigger: e, title: "出生地点", wheels: [{ data: newCityJson }], position: r || [2, 0], transitionEnd: function(e, t) {}, callback: function(e, t) { console.log(t), $("#prov" + a).val(t[0].value), $("#city" + a).val(t[1].value), t[2] && $("#dist" + a).val(t[2].value) } }) }

function lc_initHmBirthDate(e, t) { $("#" + e).val("1985-01-01-00:00"); var a = window.localStorage["cacheBirthday-hm" + t];
	a && $("#" + e).val(a) }

function lc_initBirthDate(e, t, a) { var n = window.localStorage["cacheBirthdayText" + a];
	$("#" + e).attr("data-text", n); var r = window.localStorage["cacheBirthday" + a];
	$("#" + e); if(console.log(e), $("#" + e).text(n), $("#" + t).attr("value", r), r) { var i = r.split("-"),
			o = i[3],
			s = i[4];
		$("#" + t).attr("jiavalue", o), $("#" + t).attr("jiavalue2", s) } }

function lc_initBirthDate_hm2(e, t, a) { var n = window.localStorage["cacheBirthdayText_hm2" + a];
	$("#" + e).attr("data-text", n); var r = window.localStorage["cacheBirthday_hm2" + a];
	$("#" + e); if(console.log(e), $("#" + e).text(n), $("#" + t).attr("value", r), r) { var i = r.split("."),
			o = parseInt(i[3]) + 1,
			s = parseInt(i[4]) + 1;
		$("#" + t).attr("jiavalue", o), $("#" + t).attr("jiavalue2", s) } }

function saveSexFunction(e, t) { var a = $("#" + e).val();
	window.localStorage["sexSaveVal" + t] = a }

function changeSex2(e, t) { var a = $(".sex-box" + t);
	$("#iSex" + t).val(e);
	a.find(".sex0-yes").hide(), a.find(".sex0-no").show(), a.find(".sex1-yes").hide(), a.find(".sex1-no").show(), a.find(".sex" + e).hide(), a.find(".sex" + e + "-yes").show() }

function lc_initSex(e, t) { initSex(e, t); var a = window.localStorage["sexSaveVal" + t];
	a && changeSex2(a, t) }

function initSex(e, t) {
	function a(e, t) { $("." + sexString + "-box" + t).find("." + sexString + "0-yes").hide(), $("." + sexString + "-box" + t).find("." + sexString + "0-no").show(), $("." + sexString + "-box" + t).find("." + sexString + "1-yes").hide(), $("." + sexString + "-box" + t).find("." + sexString + "1-no").show(), $("." + sexString + "-box" + t).find("." + sexString + e).hide(), $("." + sexString + "-box" + t).find("." + sexString + e + "-yes").show() } sexString = "sex", a($("#" + e).val(), t), $("." + sexString + "-btn" + t).bind("click", function() { var e = $(this).attr("data-sex");
		a(e, t), $("#iSex" + t).val(e) }) }

function verifyElementData(e, t, a) {
	function n(e) { var t = ["QQ", "腾迅", "号码", "电话", "系统", "管理", "system", "admin", "站长", "淫賤", "淫贱", "去死", "吃屎", "妈的", "娘的", "日你", "尻", "操你", "干死你", "王八", "傻逼", "傻B", "贱人", "狗娘", "婊子", "表子", "靠你", "叉你", "叉死", "插你", "插死", "干你", "干死", "日死", "鸡巴", "睾丸", "包皮", "龟头", "屄", "赑", "妣", "肏", "奶子", "屌", "成人文学", "成人图片", "成人电影", "性爱电影", "情色电影", "学生妹", "情色图片", "情色贴图", "无码电影", "特肖", "禁肖", "杀尾公式", "杀肖公式", "曾道人", "特码生肖", "法轮大法", "修炼之歌", "弘法会", "大法弘传", "法轮功", "大法之声", "灵修团体", "宇宙最高法理", "真善忍大法", "正法洪流", "五套功法", "师傅法身", "师父法身", "李洪志", "大法弟子", "真修弟子", "弟子正法", "天安门受难", "六四惨案", "六四真相", "八九民运", "民运人士", "红色恐怖", "民主运动", "邓二世", "天安门血", "自由网", "明慧网", "正见网", "圆明网", "打印机版", "fawanghuihui", "minghui", "freenet-china", "yuanmingeurope", "secretchina", "江政府", "江泽民当局", "江核心", "江路线", "江泽民政权", "江贼", "江贼民", "江昏君", "江二世", "中共当局", "大陆当局", "大陆官员", "中共媒体", "共匪", "共产专制", "古拉格", "当权者", "恶警", "宗教迫害", "大法第子", "天安门受难人", "开悟弟子正法", "媽的", "幹死你", "賤人", "幹你", "幹死", "雞巴", "龜頭", "贔", "成人文學", "成人圖片", "成人電影", "性愛電影", "情色電影", "學生妹", "情色圖片", "情色貼圖", "無碼電影", "殺尾公式", "殺肖公式", "特碼生肖", "法輪大法", "修煉之歌", "弘法會", "大法弘傳", "法輪功", "大法之聲", "靈修團體", "師傅法身", "師父法身", "天安門受難", "六四慘案", "天安門受難人", "開悟弟子正法", "惡警", "當權者", "古拉格", "共産專制", "中共媒體", "大陸官員", "大陸當局", "中共當局", "江澤民政權", "江路線", "江澤民當局", "印表機版", "圓明網", "正見網", "明慧網", "自由網", "天安門血", "鄧二世", "紅色恐怖", "毛泽东", "江泽民", "胡錦濤", "溫家寶", "賤B", "毛澤東", "周恩來", "共產黨", "操你媽", "鄧小平", "前列腺", "裸照", "AV女優", "強姦", "胡政府", "胡錦濤當局", "胡核心", "胡路線", "胡錦濤政權", "胡昏君", "中國", "中華人民共和國", "主席", "總統", "省長", "吳邦國", "賈慶林", "李長春", "習近平", "李克強", "賀國強", "周永康", "胡锦涛", "温家宝", "贱B", "毛泽东", "周恩来", "共产党", "操你妈", "邓小平", "前列腺", "裸照", "AV女优", "强奸", "胡政府", "胡锦涛当局", "胡核心", "胡路线", "胡锦涛政权", "胡昏君", "中国", "中华人民共和国", "总统", "省长", "吴邦国", "贾庆林", "李长春", "习近平", "李克强", "贺国强", "周永康", "混蛋", "無恥", "下流", "fuck", "mmd", "卑鄙", "流氓", "淫賤", "淫賤", "sb", "SB", "去死", "吃屎", "媽的", "娘的", "日你", "尻", "操你", "干死你", "王八", "傻逼", "傻B", "賤人", "我靠", "狗娘", "婊子", "表子", "靠你", "叉你", "叉死", "插你", "插死", "干你", "干死", "日死", "雞巴", "痞子", "睪丸", "包皮", "龜頭", "屄", "贔", "妣", "肏", "奶子", "尻", "屌", "成人文學", "成人圖片", "成人電影", "性愛電影", "落霞缀", "死一边去", "盖塔奥", "母猪", "强淫", "挨了一炮", "麻古", "滚蛋", "黑喂狗", "猪公", "中共主席", "搅基", "卖淫", "麻果配", "骚人", "闹太套", "大脑短路", "藏独", "黄段子", "藏独", "麻果丸", "骚", "本宫", "烂泥", "疆独", "笨拉灯", "操了嫂", "麻将透", "新建户", "攻受", "废渣", "马英九", "战五渣", "操嫂子", "麻醉狗", "新疆叛", "小妾", "作呕", "水扁", "矮仔", "插屁屁", "麻醉枪", "新疆限", "可攻可受", "进天堂", "衰人", "傻仔", "察象蚂", "麻醉枪", "新金瓶", "不是人", "裹胸", "处男", "奸夫", "成人电", "麻醉药", "新唐人", "何弃疗", "裹脚布", "马克思", "黑鬼", "成人卡通", "毛一鲜", "姓忽悠", "土憋", "耗子", "列宁", "洗了滚", "成人聊", "美艳少妇", "性爱日", "绿茶婊", "你吖", "中华人民", "娼妓", "成人片", "妹按摩", "性福情", "婊", "绑大款", "共和国", "猪仔", "成人视", "妹上门", "性感少", "婊了", "养小蜜", "社会", "啥表", "成人图", "蒙汗药", "性推广歌", "吊炸天", "吃里扒外", "民主党", "锉毙", "成人文", "迷幻型", "胸主席", "菊花", "溅B", "64", "粪便", "成人小", "迷幻药", "徐玉元", "爆菊", "跑堂狗", "民主", "膣屄", "充气娃", "迷幻药", "爆菊花", "特妈", "破鞋", "尿泡", "催眠水", "迷昏口", "丫的", "无节操", "嬷痹", "扯巴子", "吹箫", "催情粉", "迷昏药", "性器", "菜鸟", "娘个B德", "溜洽子", "干你娘", "催情药", "迷昏药", "烟感器", "波霸", "B叫", "瓜哇子", "屌你老母", "催情药", "迷魂香", "严晓玲", "泡M", "滚", "龟儿子", "肏你妈", "挫仑", "迷魂药", "颜射", "泡妞", "滚回去", "臭婊子", "打飞机", "鸡巴", "迷魂药", "劳教", "毛片", "滚床单", "二流子", "泥马", "鸡巴", "迷奸药", "劳改犯", "好个毛", "滚床单", "鸡鸡", "骚货", "奶子", "迷情水", "颜射", "你妹", "犊子", "粪胀", "雏妓", "肉棒", "迷情药", "姚明进去", "毛线", "滚犊子", "杂种", "狗噏", "代孕", "迷药", "要射精了", "傻帽", "草死你妈", "十三点", "烂臭鞋", "法车仑", "谜奸药", "要射了", "傻X", "废了你", "该猪吃", "恶狗", "法正干", "蜜穴", "要泄了", "熊样", "残废", "狗造化", "恶棍", "法轮", "内射", "夜激情", "唾弃", "大比岔", "你算老几", "无赖", "法轮佛", "嫩穴", "液体炸", "腐植质", "卖骚", "秀逗", "蠢人", "法维权", "嫩阴", "一小撮别", "装B", "卖弄", "没脑子", "贱货", "法一轮", "操你妈", "遗情书", "装b", "扮纯", "脑子进水", "没屁眼", "法院给废", "拟涛哥", "蚁力神", "呆逼", "装纯", "骚包", "狗娘养的", "仿真枪", "娘两腿之间", "阴间来电", "傻逼", "败类", "贱皮子", "贱猪", "夫妻交换", "妞上门", "阴唇", "二逼", "fuck", "解放军", "蠢猪", "感扑克", "浓精", "阴道", "死逼", "damn", "妓女", "婊子养的", "冈本真", "女被人家搞", "阴户", "笨蛋", "丑角", "政府", "疯狗", "肛交", "女激情", "淫魔舞", "白痴", "ET", "缩头乌龟", "肛门是邻", "女优", "淫情女", "二痴", "变态", "团体", "卖比", "冈本真", "炮的小蜜", "淫肉", "蛋白质", "凤姐", "游行", "傻吊", "钢针狗", "喷尿", "淫骚妹", "王八", "屁股", "小日本", "人模狗样", "钢珠枪", "嫖俄罗", "淫兽", "三八", "MMD", "坯子", "港澳博球", "嫖鸡", "淫兽学", "东方标志", "NND", "大麻", "歪逼", "港马会", "仆不怕饮", "淫水", "东方婊子", "禽兽", "起义", "操逼", "港鑫华", "普通嘌", "淫穴", "比样迪", "兽", "抵制", "装葱", "高莺莺", "叫床", "咏妓", "逼样的", "下贱", "拉萨", "癞蛤蟆", "搞媛交", "色黄", "幽谷三", "DBF", "欠踹", "开打", "狼心狗肺", "共狗", "色黄图", "游精佑", "大泼妇", "欠拍", "李登辉", "挨刀的货", "共王储", "奇淫散", "有奶不一", "兔崽子", "欠拧", "陈水扁", "死不要脸", "狗粮", "贱淫", "右转是政", "不想活啦", "死皮赖脸", "卧槽", "屎坨坨", "滚圆大乳", "淫荡", "幼齿类", "他奶奶的", "剑人", "我擦", "卖骚", "国家妓", "贱B", "愚民同", "去死吧你", "醉银剑", "屌爆了", "卖逼", "和狗交", "柔胸粉", "愚民政", "祖宗", "人剑合一", "我嘞个去", "阳痿", "和狗性", "肉洞", "与狗性", "祖宗十八代", "化粪池", "二货", "寄生虫", "和狗做", "肉棍", "玉蒲团", "蠢材", "流氓", "脑弱", "傻子", "红色恐", "如厕死", "鸳鸯洗", "蠢货", "山寨", "次奥", "窝囊", "胡江内斗", "乳交", "砍杀", "呕像", "恶心", "蛋碎", "窝囊废", "胡紧套", "软弱的国", "杀人犯", "小妞", "该死", "粉木耳", "歪瓜劣枣", "胡锦涛", "赛后骚", "凶杀", "老娘", "BT", "黑木耳", "胡扯", "胡适眼", "三挫", "血案", "青蛙头", "呆瓜", "搞基", "狗屁", "胡耀邦", "三级片", "韵徐娘", "阴阳失调", "呆子", "撸管", "仆街", "湖淫娘", "三秒倒", "炸死", "河马", "dork", "谢特", "南朝鲜人", "虎头猎", "三网友", "植物冰", "火山喷发", "下流", "装逼", "后庭", "华国锋", "三唑", "殖器护", "垃圾人", "泼妇", "矮穷挫", "总理", "华门开", "骚妇", "惨案", "垃圾", "淫猥", "活春宫", "我日", "吹萧", "骚浪", "凶案", "恐龙", "公驴", "银枪小霸王", "屁眼", "还看锦涛", "骚穴", "贪官", "青蛙", "傻瓜", "拔吊无情", "老二", "换妻", "骚嘴", "狗官", "废材", "蠢驴", "拔屌无情", "鞭鞭", "浑圆豪乳", "扫了爷爷", "昼将近", "孙了", "神经病", "屁话", "汉奸", "激情电", "色电影", "主席忏", "装孙", "青楼", "滚粗", "强暴", "激情短", "色妹妹", "着涛哥", "装孙子", "便便", "废柴", "钉子户", "激情炮", "色小说", "自由圣", "瞎搞", "马屁精", "打炮", "揩油", "激情妹", "色视频", "自慰用", "扯蛋", "大便", "聊骚", "恶爆", "急需嫖", "尸博", "自由亚", "一陀粪", "痴呆", "潮吹", "恶霸", "腐败", "失身水", "有毛病", "一陀屎", "牛逼烘烘", "煞笔", "耐操", "打砸抢", "失意药", "我靠", "草包", "无节操", "波推", "顶你个肺", "奸成瘾", "狮子旗", "靠", "自杀", "强奸", "阴经", "共和国", "江胡内斗", "十八等", "迷药", "妈蛋", "色诱", "八婆", "小鬼子", "江太上", "十大谎", "作死", "无性生殖", "手淫", "鸡婆", "李克强", "江系人", "十大禁", "做爱", "生殖", "你大姨妈的", "拉皮条", "李长春", "疆独", "熟妇", "做爱小", "智障", "坑爹", "嘿咻", "张德江", "自慰", "贱民", "套套", "丑陋", "坑妈", "约炮", "俞正声", "叫自慰", "太王四神", "泄", "自爆", "坑爷", "娘炮", "刘云山", "姐包夜", "六四", "妈蛋", "灭了", "坑奶奶", "屁民", "王歧山", "姐服务", "东突", "死边去", "基因突变", "你有病", "援交", "张高丽", "姐兼职", "探测狗", "屌丝", "你tmd", "渣滓", "土肥圆", "李援朝", "姐上门", "涛共产", "鸟", "吹牛b", "碎渣", "基佬", "李源朝", "猪头", "涛一样胡", "鸟人", "群殴", "杂碎", "孬种", "博熙来", "狗蛋", "特码", "屌人", "撒子", "没用的家伙", "备胎", "傻蛋", "天朝特", "草泥马", "自恋", "混蛋", "民奸", "蛋疼", "偷偷贪", "法克由", "吹牛", "废物", "傻冒", "操蛋", "推油按", "法克", "狗眼", "畜牲", "歇菜", "MLGB", "脱衣艳", "吊儿郎当的", "狗嘴", "八嘎", "歇火", "去年买了个表", "瓦斯手", "他妈的", "矫情", "笨脑子", "菊花紧", "mlgb", "袜按摩", "他妈", "屁颠", "阿呆", "牛X", "qnmgb", "温家堡", "XXOO", "骗钱", "疯子", "我顶你个肺", "精子射", "温切斯特", "丫滴", "你大爷", "卑贱", "牛叉", "就爱插", "温影帝", "怂样", "脑残片", "卑鄙", "麻痹", "就要色", "温家宝", "丑角", "脑残", "小偷", "奶奶个熊", "巨乳", "瘟加饱", "死翘翘", "被驴踢", "麻子脸", "咸猪手", "拉登说", "瘟假饱", "屎样", "被驴踢", "老家伙", "天朝", "浪穴", "纹了毛", "狗屎", "你妈妈的", "该死的", "鬼畜", "黎阳平", "台独", "邓小平", "二百五", "色狼", "抽风", "李洪志", "乌蝇水", "猪", "250", "肥猪", "打手枪", "李咏曰", "无耻", "马B", "奇葩", "神棍", "尼玛", "骗中央", "无码专", "周恩来", "臭鸡蛋", "畜生", "丽媛离", "西藏限", "刘少奇", "脱裤子", "豆腐渣", "节操掉了", "利他林", "希脏", "朱德", "放屁", "吹潮", "蹭炮", "六合彩", "习进平", "宋庆龄", "拽", "龟头", "法克鱿", "乱奸", "习晋平", "习近平", "shit", "射入", "达菲鸡", "乱伦类", "席复活", "李克强", "SHIT", "A片", "马勒戈壁", "乱伦小", "席临终前", "人渣", "欠抽", "中南海", "互撸娃", "乱伦", "席指着护", "渣男", "找抽", "处女", "吃翔", "伦理大", "洗澡死", "渣", "欠扁", "吃精", "爆出翔", "伦理毛", "喜贪赃", "切克闹", "挂了", "你全家", "打蝴蝶", "伦理片", "陷害案", "来死狗", "猥琐", "黄片", "贱骨头", "裸聊网", "陷害罪", "药药药", "龌龊", "斯大林", "屁轻", "裸舞视", "小穴", "盖塔奥", "愚昧", "阿扁", "老三老四", "成人圖片", "落霞綴", "死一邊去", "蓋塔奧", "母豬", "強淫", "挨了一炮", "麻古", "滾蛋", "黑餵狗", "豬公", "中共主席", "攪基", "賣淫", "麻果配", "騷人", "鬧太套", "大腦短路", "藏獨", "黃段子", "藏獨", "麻果丸", "騷", "本宮", "爛泥", "疆獨", "笨拉燈", "操了嫂", "麻將透", "新建戶", "攻受", "廢渣", "馬英九", "戰五渣", "操嫂子", "麻醉狗", "新疆叛", "小妾", "作嘔", "水扁", "矮仔", "插屁屁", "麻醉槍", "新疆限", "可攻可受", "進天堂", "衰人", "傻仔", "察象螞", "麻醉槍", "新金瓶", "不是人", "裹胸", "處男", "姦夫", "成人電", "麻醉藥", "新唐人", "何棄療", "裹腳布", "馬克思", "黑鬼", "成人卡通", "毛一鮮", "姓忽悠", "土憋", "耗子", "列寧", "洗了滾", "成人聊", "美艷少婦", "性愛日", "綠茶婊", "你丫", "中華人民", "娼妓", "成人片", "妹按摩", "性福情", "婊", "綁大款", "共和國", "豬仔", "成人視", "妹上門", "性感少", "婊了", "養小蜜", "社會", "啥表", "成人圖", "蒙汗藥", "性推廣歌", "吊炸天", "吃裡扒外", "民主黨", "銼斃", "成人文", "迷幻型", "胸主席", "菊花", "濺B", "64", "糞便", "成人小", "迷幻藥", "徐玉元", "爆菊", "跑堂狗", "民主", "膣屄", "充氣娃", "迷幻藥", "爆菊花", "特媽", "破鞋", "尿泡", "催眠水", "迷昏口", "丫的", "無節操", "嬤痺", "扯巴子", "吹簫", "催情粉", "迷昏藥", "性器", "菜鳥", "娘個B德", "溜洽子", "干你娘", "催情藥", "迷昏藥", "煙感器", "波霸", "B叫", "瓜哇子", "屌你老母", "催情藥", "迷魂香", "嚴曉玲", "泡M", "滾", "龜兒子", "肏你媽", "挫侖", "迷魂藥", "顏射", "泡妞", "滾回去", "臭婊子", "打飛機", "雞巴", "迷魂藥", "勞教", "毛片", "滾床單", "二流子", "泥馬", "雞巴", "迷姦藥", "勞改犯", "好個毛", "滾床單", "雞雞", "騷貨", "奶子", "迷情水", "顏射", "你妹", "犢子", "糞脹", "雛妓", "肉棒", "迷情藥", "姚明進去", "毛線", "滾犢子", "雜種", "狗吸", "代孕", "迷藥", "要射精了", "傻帽", "草死你媽", "十三點", "爛臭鞋", "法車侖", "謎奸藥", "要射了", "傻X", "廢了你", "該豬吃", "惡狗", "法正乾", "蜜穴", "要洩了", "熊樣", "殘廢", "狗造化", "惡棍", "法輪", "內射", "夜激情", "唾棄", "大比岔", "你算老幾", "無賴", "法輪佛", "嫩穴", "液體炸", "腐植質", "賣騷", "秀逗", "蠢人", "法維權", "嫩陰", "一小撮別", "裝B", "賣弄", "沒腦子", "賤貨", "法一輪", "操你媽", "遺情書", "裝b", "扮純", "腦子進水", "沒屁眼", "法院給廢", "擬濤哥", "蟻力神", "夫妻交換", "妞上門", "陰唇", "二逼", "fuck", "解放軍", "蠢豬", "感撲克", "濃精", "陰道", "死逼", "damn", "妓女", "婊子養的", "岡本真", "女被人家搞", "陰戶", "笨蛋", "丑角", "政府", "瘋狗", "肛交", "女激情", "淫魔舞", "白癡", "ET", "國軍", "縮頭烏龜", "肛門是鄰", "女優", "淫情女", "二癡", "變態", "團體", "賣比", "岡本真", "炮的小蜜", "淫肉", "蛋白質", "鳳姐", "遊行", "傻吊", "鋼針狗", "噴尿", "淫騷妹", "王八", "屁股", "小日本", "人模狗樣", "鋼珠槍", "嫖俄羅", "淫獸", "三八", "MMD", "黨", "坯子", "港澳博球", "嫖雞", "淫獸學", "東方標誌", "NND", "大麻", "歪逼", "港馬會", "僕不怕飲", "淫水", "東方婊子", "禽獸", "起義", "操逼", "港鑫華", "普通嘌", "淫穴", "比樣迪", "獸", "抵制", "裝蔥", "高鶯鶯", "叫床", "詠妓", "逼樣的", "下賤", "拉薩", "癩蛤蟆", "搞媛交", "色黃", "幽谷三", "DBF", "欠踹", "開打", "狼心狗肺", "共狗", "色黃圖", "游精佑", "大潑婦", "欠拍", "李登輝", "挨刀的貨", "共王儲", "奇淫散", "有奶不一", "兔崽子", "欠擰", "陳水扁", "死不要臉", "狗糧", "賤淫", "右轉是政", "不想活啦", "死皮賴臉", "臥槽", "屎坨坨", "滾圓大乳", "淫蕩", "幼齒類", "他奶奶的", "劍人", "我擦", "賣騷", "國家妓", "賤B", "愚民同", "去死吧你", "醉銀劍", "屌爆了", "賣逼", "和狗交", "柔胸粉", "愚民政", "祖宗", "人劍合一", "我勒個去", "陽痿", "和狗性", "肉洞", "與狗性", "祖宗十八代", "化糞池", "二貨", "寄生蟲", "和狗做", "肉棍", "玉蒲團", "蠢材", "流氓", "腦弱", "傻子", "紅色恐", "如廁死", "鴛鴦洗", "蠢貨", "山寨", "次奧", "窩囊", "胡江內鬥", "乳交", "砍殺", "嘔像", "噁心", "蛋碎", "窩囊廢", "胡緊套", "軟弱的國", "殺人犯", "小妞", "該死", "粉木耳", "歪瓜劣棗", "胡錦濤", "賽後騷", "兇殺", "老娘", "BT", "黑木耳", "胡扯", "胡適眼", "三挫", "血案", "青蛙頭", "呆瓜", "搞基", "狗屁", "胡耀邦", "三級片", "韻徐娘", "陰陽失調", "呆子", "擼管", "仆街", "湖淫娘", "三秒倒", "炸死", "河馬", "dork", "謝特", "南朝鮮人", "虎頭獵", "三網友", "植物冰", "火山噴發", "下流", "裝逼", "後庭", "華國鋒", "三唑", "殖器護", "垃圾人", "潑婦", "矮窮挫", "總理", "華門開", "騷婦", "慘案", "垃圾", "淫猥", "活春宮", "我日", "吹蕭", "騷浪", "兇案", "恐龍", "公驢", "銀槍小霸王", "屁眼", "還看錦濤", "騷穴", "貪官", "青蛙", "傻瓜", "拔吊無情", "老二", "換妻", "騷嘴", "狗官", "廢材", "蠢驢", "拔屌無情", "鞭鞭", "渾圓豪乳", "掃了爺爺", "晝將近", "孫了", "神經病", "屁話", "漢奸", "激情電", "色電影", "主席懺", "裝孫", "青樓", "滾粗", "強暴", "激情短", "色妹妹", "著濤哥", "裝孫子", "便便", "廢柴", "釘子戶", "激情炮", "色小說", "自由聖", "瞎搞", "馬屁精", "打炮", "揩油", "激情妹", "色視頻", "自慰用", "扯蛋", "大便", "聊騷", "惡爆", "急需嫖", "屍博", "自由亞", "一陀糞", "癡呆", "潮吹", "惡霸", "腐敗", "失身水", "有毛病", "一陀屎", "牛逼烘烘", "煞筆", "耐操", "打砸搶", "失意藥", "我靠", "草包", "無節操", "波推", "頂你個肺", "奸成癮", "獅子旗", "靠", "自殺", "強姦", "陰經", "共和國", "江胡內鬥", "十八等", "迷藥", "媽蛋", "色誘", "八婆", "小鬼子", "江太上", "十大謊", "作死", "無性生殖", "手淫", "雞婆", "李克強", "江系人", "十大禁", "做愛", "生殖", "你大姨媽的", "拉皮條", "李長春", "疆獨", "熟婦", "做愛小", "智障", "坑爹", "嘿咻", "張德江", "自慰", "賤民", "套套", "醜陋", "坑媽", "約炮", "俞正聲", "叫自慰", "太王四神", "洩", "自爆", "坑爺", "娘炮", "劉雲山", "姐包夜", "六四", "媽蛋", "滅了", "坑奶奶", "屁民", "王歧山", "姐服務", "東突", "死邊去", "基因突變", "你有病", "援交", "張高麗", "姐兼職", "探測狗", "屌絲", "你tmd", "渣滓", "土肥圓", "李援朝", "姐上門", "濤共產", "鳥", "吹牛b", "碎渣", "基佬", "李源朝", "豬頭", "濤一樣胡", "鳥人", "群毆", "雜碎", "孬種", "博熙來", "狗蛋", "特碼", "屌人", "撒子", "沒用的傢伙", "備胎", "傻蛋", "天朝特", "草泥馬", "自戀", "混蛋", "民奸", "蛋疼", "偷偷貪", "法克由", "吹牛", "廢物", "傻冒", "操蛋", "推油按", "法克", "狗眼", "畜牲", "歇菜", "MLGB", "脫衣艷", "吊兒郎當的", "狗嘴", "八嘎", "歇火", "去年買了個表", "瓦斯手", "他媽的", "矯情", "笨腦子", "菊花緊", "mlgb", "襪按摩", "他媽", "屁顛", "阿呆", "牛X", "qnmgb", "溫家堡", "XXOO", "騙錢", "瘋子", "我頂你個肺", "精子射", "溫切斯特", "丫滴", "你大爺", "卑賤", "牛叉", "就愛插", "溫影帝", "慫樣", "腦殘片", "卑鄙", "麻痺", "就要色", "溫家寶", "丑角", "腦殘", "小偷", "奶奶個熊", "巨乳", "瘟加飽", "死翹翹", "被驢踢", "麻子臉", "鹹豬手", "拉登說", "瘟假飽", "屎樣", "被驢踢", "老傢伙", "天朝", "浪穴", "紋了毛", "狗屎", "你媽媽的", "該死的", "鬼畜", "黎陽平", "台獨", "鄧小平", "二百五", "色狼", "抽風", "李洪志", "烏蠅水", "豬", "250", "肥豬", "打手槍", "李詠曰", "無恥", "馬B", "奇葩", "神棍", "尼瑪", "騙中央", "無碼專", "周恩來", "臭雞蛋", "畜生", "銀槍小霸王", "麗媛離", "西藏限", "劉少奇", "脫褲子", "豆腐渣", "節操掉了", "利他林", "希髒", "朱德", "放屁", "吹潮", "蹭炮", "六合彩", "習進平", "宋慶齡", "拽", "龜頭", "法克魷", "亂奸", "習晉平", "習近平", "shit", "射入", "達菲雞", "亂倫類", "席復活", "李克強", "SHIT", "A片", "馬勒戈壁", "亂倫小", "席臨終前", "人渣", "欠抽", "中南海", "互擼娃", "亂倫", "席指著護", "渣男", "找抽", "處女", "吃翔", "倫理大", "洗澡死", "渣", "欠扁", "吃精", "爆出翔", "倫理毛", "喜貪贓", "切克鬧", "掛了", "你全家", "打蝴蝶", "倫理片", "陷害案", "來死狗", "猥瑣", "黃片", "賤骨頭", "裸聊網", "陷害罪", "藥藥藥", "齷齪", "斯大林", "屁輕", "裸舞視", "小穴", "蓋塔奧", "愚昧", "阿扁", "老三老四", "共産黨", "共产党"],
			a = 0,
			n = e.replace(/(^\s*)|(\s*$)|(\s)/g, ""); for(i = 0; i < t.length; i++) - 1 != n.indexOf(t[i]) && a++; return 0 != a } var r = $("#" + e).val(); { if("NumData" == t) return r ? r < 4 ? (layer.open({ content: "你的姓名格式不符，<br />（格式：1~5位中文字符或2~16位英文字符）！", skin: "msg", time: 2 }), !1) : 20 < r ? (layer.open({ content: "你的姓名格式不符，<br />（格式：1~5位中文字符或2~16位英文字符）！", skin: "msg", time: 2 }), !1) : /(^[\u4E00-\u9FA5]{1,5}$)|(^[a-zA-Z]{1}[a-zA-Z0-9]{1,15})$/.test(r) ? n(r) ? (layer.open({ content: "你的姓名属于敏感词汇！", skin: "msg", time: 2 }), !1) : (e == "NumData" + a && (window.localStorage["cacheName" + a] = r), !0) : (layer.open({ content: "你的姓名格式不符，<br />（格式：1~5位中文字符或2~16位英文字符）！", skin: "msg", time: 2 }), !1) : (layer.open({ content: "你的姓名没有填写！", skin: "msg", time: 2 }), !1); if("NumData2" == t) { return r ? r < 4 ? (layer.open({ content: "对方姓名格式不符，<br />（格式：1~5位中文字符或2~16位英文字符）！", skin: "msg", time: 2 }), !1) : 20 < r ? (layer.open({ content: "对方姓名格式不符，<br />（格式：1~5位中文字符或2~16位英文字符）！", skin: "msg", time: 2 }), !1) : /(^[\u4E00-\u9FA5]{1,5}$)|(^[a-zA-Z]{1}[a-zA-Z0-9]{1,15})$/.test(r) ? n(r) ? (layer.open({ content: "对方姓名属于敏感词汇！", skin: "msg", time: 2 }), !1) : ("NumData1" == e && (window.localStorage.cacheName2 = r), !0) : (layer.open({ content: "对方姓名格式不符，<br />（格式：1~5位中文字符或2~16位英文字符）！", skin: "msg", time: 2 }), !1) : (layer.open({ content: "对方姓名没有填写！", skin: "msg", time: 2 }), !1) } else if("city" == t) { var o = $("#prov" + a).find("option:selected").text(),
				s = $("#city" + a).find("option:selected").text(),
				l = $("#dist" + a).find("option:selected").text();
			window.localStorage["cachePlace" + a] = o + "-" + s + "-" + l } else { if("iBirthday" == t) { if(!r) return layer.open({ content: "你的生日没有选择！", skin: "msg", time: 2 }), !1; var d = $("#birthday_my" + a).attr("data-text"); return window.localStorage["cacheBirthdayText" + a] = d, window.localStorage["cacheBirthday" + a] = r, !0 } if("iBirthday_hm2" == t) { if(!r) return layer.open({ content: "你的生日没有选择！", skin: "msg", time: 2 }), !1;
				d = $("#birthday_my" + a).attr("data-text"); return window.localStorage["cacheBirthdayText_hm2" + a] = d, window.localStorage["cacheBirthday_hm2" + a] = r, !0 } if("iBirthday-hm" == t) return r ? (window.localStorage["cacheBirthday-hm" + a] = r, !0) : (layer.open({ content: "你的生日没有选择！", skin: "msg", time: 2 }), !1); if("iHour" == t) return r ? (window.localStorage.cacheHour = r, !0) : (layer.open({ content: "你的生辰没有选择！", skin: "msg", time: 2 }), !1); if("iEmail" == t) return r ? /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/.test(r) ? (window.localStorage.cacheEmail = r, !0) : (layer.open({ content: "邮箱格式不正确！", skin: "msg", time: 2 }), !1) : (layer.open({ content: "你的邮箱没有填写！", skin: "msg", time: 2 }), !1); if("iMobile" == t) return r ? /^1[34578]\d{9}$/.test(r) ? (window.localStorage.cacheMobile = r, !0) : (layer.open({ content: "手机格式不正确！", skin: "msg", time: 2 }), !1) : (layer.open({ content: "你的手机没有填写！", skin: "msg", time: 2 }), !1) } } }

function getQueryString(e) { var t = new RegExp("(^|&)" + e + "=([^&]*)(&|$)", "i"),
		a = window.location.search.substr(1).match(t); return null != a ? decodeURIComponent(a[2]) : null }

function GetIOSVersion() { if(window.MSStream) return !1; var e = navigator.appVersion.match(/OS (\d+)_(\d+)_?(\d+)?/); return null != e && [parseInt(e[1], 10), parseInt(e[2] || 0, 10), parseInt(e[3] || 0, 10)].join(".") }

function getAndroidVersion() { var e = (ua = ua.toLowerCase()).match(/android\s([0-9\.]*)/); return !!e && parseFloat(e[1]) }
var browser = { isAndroid: function() { return !!navigator.userAgent.match(/Android/i) }, isIOS: function() { return !!navigator.userAgent.match(/iPhone|iPad|iPod/i) }, isWx: function() { return !!navigator.userAgent.match(/micromessenger/i) }, isWp: function() { return -1 < ua.toLowerCase().indexOf("windows phone") }, getIOSVersion: function() { if(window.MSStream) return !1; var e, t = navigator.appVersion.match(/OS (\d+)_(\d+)_?(\d+)?/); return null != t && (e = [parseInt(t[1], 10), parseInt(t[2], 10), parseInt(t[3] || 0, 10)], parseFloat(e.join("."))) } },
	posId = getQueryString("posId") && 0 !== getQueryString("posId").length ? getQueryString("posId") : "",
	deviceId = getQueryString("deviceId") && 0 !== getQueryString("deviceId").length ? getQueryString("deviceId") : "",
	ua = window.navigator.userAgent,
	appVersion = /[a-zA-Z]/.test(ua.split(" ").pop()) ? "1.0.0" : ua.split(" ").pop(),
	sysVersion = GetIOSVersion() || getAndroidVersion();
if(null !== deviceId && "[openudid]" !== deviceId.toLowerCase() || (deviceId = ""), "" === deviceId)
	if(localStorage.getItem("go108_tlp_guid")) deviceId = localStorage.getItem("go108_tlp_guid");
	else { var data = { method: "newGuid" };
		$.ajax({ url: "../json_remote.php", dataType: "json", type: "POST", data: data, t: (new Date).getTime(), success: function(e) { deviceId = e.deviceId, localStorage.setItem("go108_tlp_guid", deviceId) }, error: function(e) { console.log(e) } }) }
function getElements(e) { for(var t = document.getElementById(e), a = new Array, n = t.getElementsByTagName("input"), r = 0; r < n.length; r++) a.push(n[r]); var i = t.getElementsByTagName("select"); for(r = 0; r < i.length; r++) a.push(i[r]); return a }

function inputRadio(e) { if(e.checked) return [e.name, e.value] }

function inputSelector(e) { for(i = 0; i < e.length; i++)
		if(1 == e[i].selected) return [e.name, e[i].value] }

function input(e) { switch(e.type.toLowerCase()) {
		case "submit":
		case "hidden":
		case "password":
		case "text":
			return [e.name, e.value];
		case "checkbox":
		case "radio":
			return inputRadio(e) } return !1 }

function pselect(e) { return inputSelector(e) }

function serializeElement(e) { var t, a = e.tagName.toLowerCase(),
		n = []; if("input" == a && (t = input(e))) { if(0 == (o = encodeURIComponent(t[0])).length) return;
		t[1].constructor != Array && (t[1] = [t[1]]); for(var r = t[1], i = 0; i < r.length; i++) n.push(o + "=" + encodeURIComponent(r[i])) } if("select" == a && (t = pselect(e))) { var o; if(0 == (o = encodeURIComponent(t[0])).length) return;
		t[1].constructor != Array && (t[1] = [t[1]]); for(r = t[1], i = 0; i < r.length; i++) n.push(o + "=" + encodeURIComponent(r[i])) } return n.join("&") }

function serializeForm(e) { for(var t = getElements(e), a = new Array, n = 0; n < t.length; n++) { var r = serializeElement(t[n]);
		r && a.push(r) } return a.join("&") }; window.lCalendar = function() { $("html").width(); var j, z = !1;
	document.addEventListener("touchmove", function(e) { z && e.preventDefault() });
	document.createElement("div");

	function T() { z ? (document.body.addEventListener("scroll", function(e) { e.preventDefault() }), document.querySelector(".gearDate").addEventListener("touchmove", function(e) { e.preventDefault() })) : (document.body.removeEventListener("scroll", function(e) { e.preventDefault() }), document.querySelector(".gearDate").removeEventListener("touchmove", function(e) { e.preventDefault() })) } var N = { year: "", month: "", date: "", hour: "", min: "" }; "classList" in document.documentElement || Object.defineProperty(HTMLElement.prototype, "classList", { get: function() { var r = this;

			function e(n) { return function(e) { var t = r.className.split(/\s+/g),
						a = t.indexOf(e);
					n(t, a, e), r.className = t.join(" ") } } return { add: e(function(e, t, a) {~t || e.push(a) }), remove: e(function(e, t) {~t && e.splice(t, 1) }), toggle: e(function(e, t, a) {~t ? e.splice(t, 1) : e.push(a) }), contains: function(e) { return !!~r.className.split(/\s+/g).indexOf(e) }, item: function(e) { return r.className.split(/\s+/g)[e] || null } } } });

	function e() { var e = new Date;
		this.gearDate, this.minY = 1940, this.minM = 1, this.minD = 1, this.maxY = e.getYear() + 1900, this.maxM = e.getMonth() + 1, this.maxD = e.getDate() + 1, this.type = 0 } return e.prototype = { init: function(e, t) { t, this.trigger = document.querySelector(e), this.hasHourLc = $(this.trigger).attr("hasHour"), this.bindEvent("date") }, bindEvent: function(e) { var I = this,
				E = [new t(38, 0, 0, 38, 1, 1, 0, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1), new t(26, 6, 2, 44, 1, 1, 0, 1, 1, 0, 1, 0, 0, 1, 0, 1, 0), new t(45, 0, 3, 49, 1, 0, 1, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0), new t(35, 0, 4, 54, 0, 1, 0, 1, 0, 1, 1, 0, 1, 0, 1, 0, 1), new t(24, 4, 5, 59, 1, 0, 1, 0, 1, 0, 1, 0, 1, 1, 0, 1, 1), new t(43, 0, 0, 5, 0, 0, 1, 0, 0, 1, 0, 1, 1, 1, 0, 1, 1), new t(32, 0, 1, 10, 1, 0, 0, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1), new t(21, 2, 2, 15, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 1, 1), new t(40, 0, 3, 20, 1, 0, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1, 1), new t(28, 7, 5, 26, 1, 0, 1, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1), new t(47, 0, 6, 31, 0, 1, 1, 0, 1, 1, 0, 0, 1, 0, 1, 0, 1), new t(36, 0, 0, 36, 1, 0, 1, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0), new t(26, 5, 1, 41, 0, 1, 0, 1, 0, 1, 0, 1, 1, 0, 1, 0, 1), new t(44, 0, 3, 47, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 1), new t(33, 0, 4, 52, 1, 0, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0), new t(23, 3, 5, 57, 0, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1, 1, 1), new t(42, 0, 6, 2, 0, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1, 1, 1), new t(30, 8, 1, 8, 1, 0, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1, 0), new t(48, 0, 2, 13, 1, 1, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1, 0), new t(38, 0, 3, 18, 0, 1, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1), new t(27, 6, 4, 23, 1, 0, 1, 0, 1, 1, 0, 1, 0, 1, 0, 1, 0), new t(45, 0, 6, 29, 1, 0, 1, 0, 1, 0, 1, 1, 0, 1, 0, 1, 0), new t(35, 0, 0, 34, 0, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, 1), new t(24, 4, 1, 39, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1, 1, 1, 0), new t(43, 0, 2, 44, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1, 1, 1, 0), new t(32, 0, 4, 50, 0, 1, 0, 1, 0, 0, 1, 0, 0, 1, 1, 0, 1), new t(20, 3, 5, 55, 1, 1, 1, 0, 1, 0, 0, 1, 0, 0, 1, 1, 0), new t(39, 0, 6, 0, 1, 1, 0, 1, 1, 0, 0, 1, 0, 1, 0, 1, 0), new t(29, 7, 0, 5, 0, 1, 0, 1, 1, 0, 1, 0, 1, 0, 1, 0, 1), new t(47, 0, 2, 11, 0, 1, 0, 1, 0, 1, 1, 0, 1, 0, 1, 0, 1), new t(36, 0, 3, 16, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, 1, 0), new t(26, 5, 4, 21, 0, 1, 0, 0, 1, 0, 1, 0, 1, 1, 1, 0, 1), new t(45, 0, 5, 26, 0, 1, 0, 0, 1, 0, 1, 0, 1, 1, 0, 1, 1), new t(33, 0, 0, 32, 1, 0, 1, 0, 0, 1, 0, 0, 1, 1, 0, 1, 1), new t(22, 4, 1, 37, 1, 1, 0, 1, 0, 0, 1, 0, 0, 1, 1, 0, 1), new t(41, 0, 2, 42, 1, 1, 0, 1, 0, 0, 1, 0, 0, 1, 0, 1, 1), new t(30, 8, 3, 47, 1, 1, 0, 1, 0, 1, 0, 1, 0, 0, 1, 0, 1), new t(48, 0, 5, 53, 1, 0, 1, 1, 0, 1, 0, 1, 0, 1, 0, 0, 1), new t(37, 0, 6, 58, 1, 0, 1, 1, 0, 1, 1, 0, 1, 0, 1, 0, 1), new t(27, 6, 0, 3, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, 1, 0), new t(46, 0, 1, 8, 1, 0, 0, 1, 0, 1, 0, 1, 1, 0, 1, 1, 0), new t(35, 0, 3, 14, 0, 1, 0, 0, 1, 0, 0, 1, 1, 0, 1, 1, 1), new t(24, 4, 4, 19, 1, 0, 1, 0, 0, 1, 0, 0, 1, 0, 1, 1, 1), new t(43, 0, 5, 24, 1, 0, 1, 0, 0, 1, 0, 0, 1, 0, 1, 1, 1), new t(32, 10, 6, 29, 1, 0, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 1), new t(50, 0, 1, 35, 0, 1, 1, 0, 1, 0, 1, 0, 0, 1, 0, 1, 0), new t(39, 0, 2, 40, 0, 1, 1, 0, 1, 1, 0, 1, 0, 1, 0, 0, 1), new t(28, 6, 3, 45, 1, 0, 1, 0, 1, 1, 0, 1, 1, 0, 1, 0, 0), new t(47, 0, 4, 50, 1, 0, 1, 0, 1, 0, 1, 1, 0, 1, 1, 0, 1), new t(36, 0, 6, 56, 1, 0, 0, 1, 0, 1, 0, 1, 0, 1, 1, 1, 0), new t(26, 5, 0, 1, 0, 1, 0, 0, 1, 0, 0, 1, 0, 1, 1, 1, 1), new t(45, 0, 1, 6, 0, 1, 0, 0, 1, 0, 0, 1, 0, 1, 1, 1, 0), new t(34, 0, 2, 11, 0, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 1, 0), new t(22, 3, 4, 17, 0, 1, 1, 0, 1, 0, 1, 0, 0, 1, 0, 1, 0), new t(40, 0, 5, 22, 1, 1, 1, 0, 1, 0, 1, 0, 0, 1, 0, 1, 0), new t(30, 8, 6, 27, 0, 1, 1, 0, 1, 0, 1, 1, 0, 0, 1, 0, 1), new t(49, 0, 0, 32, 0, 1, 0, 1, 1, 0, 1, 0, 1, 1, 0, 0, 1), new t(37, 0, 2, 38, 1, 0, 1, 0, 1, 0, 1, 1, 0, 1, 1, 0, 1), new t(27, 5, 3, 43, 1, 0, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1), new t(46, 0, 4, 48, 1, 0, 0, 1, 0, 0, 1, 0, 1, 1, 1, 0, 1), new t(35, 0, 5, 53, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 1, 0, 1), new t(23, 4, 0, 59, 1, 1, 0, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1), new t(42, 0, 1, 4, 1, 1, 0, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1), new t(31, 0, 2, 9, 1, 1, 0, 1, 1, 0, 1, 0, 0, 1, 0, 1, 0), new t(21, 2, 3, 14, 0, 1, 0, 1, 1, 0, 1, 0, 1, 0, 1, 0, 1), new t(39, 0, 5, 20, 0, 1, 0, 1, 0, 1, 1, 0, 1, 0, 1, 0, 1), new t(28, 7, 6, 25, 1, 0, 1, 0, 1, 0, 1, 0, 1, 1, 0, 1, 1), new t(48, 0, 0, 30, 0, 0, 1, 0, 0, 1, 0, 1, 1, 1, 0, 1, 1), new t(37, 0, 1, 35, 1, 0, 0, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1), new t(25, 5, 3, 41, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 1, 1), new t(44, 0, 4, 46, 1, 0, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1, 1), new t(33, 0, 5, 51, 1, 0, 1, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1), new t(22, 4, 6, 56, 1, 0, 1, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0), new t(40, 0, 1, 2, 1, 0, 1, 0, 1, 1, 0, 1, 0, 1, 0, 1, 0), new t(30, 9, 2, 7, 0, 1, 0, 1, 0, 1, 0, 1, 1, 0, 1, 0, 1), new t(49, 0, 3, 12, 0, 1, 0, 0, 1, 0, 1, 1, 1, 0, 1, 0, 1), new t(38, 0, 4, 17, 1, 0, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0), new t(27, 6, 6, 23, 0, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1, 1, 1), new t(46, 0, 0, 28, 0, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1, 1, 0), new t(35, 0, 1, 33, 0, 1, 1, 0, 1, 0, 0, 1, 0, 0, 1, 1, 0), new t(24, 4, 2, 38, 0, 1, 1, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1), new t(42, 0, 4, 44, 0, 1, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1), new t(31, 0, 5, 49, 1, 0, 1, 0, 1, 1, 0, 1, 0, 1, 0, 1, 0), new t(21, 2, 6, 54, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 1), new t(40, 0, 0, 59, 0, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, 1), new t(28, 6, 2, 5, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1, 1, 1, 0), new t(47, 0, 3, 10, 1, 0, 1, 0, 0, 1, 0, 0, 1, 1, 1, 0, 1), new t(36, 0, 4, 15, 1, 1, 0, 1, 0, 0, 1, 0, 0, 1, 1, 0, 1), new t(25, 5, 5, 20, 1, 1, 1, 0, 1, 0, 0, 1, 0, 0, 1, 1, 0), new t(43, 0, 0, 26, 1, 1, 0, 1, 0, 1, 0, 1, 0, 0, 1, 0, 1), new t(32, 0, 1, 31, 1, 1, 0, 1, 1, 0, 1, 0, 1, 0, 1, 0, 0)];

			function v(e) { var t = I.gearDate.querySelector(".lcalendar_nongli"),
					a = I.gearDate.querySelector(".lcalendar_gongli"),
					n = 0; if("nongli" == e && 1 != I.type ? (t.className = t.className.replace(/active/, "").replace(/(^\s*)|(\s*$)/g, "") + " active", a.className = a.className.replace(/active/, ""), n = I.type = 1) : "gongli" == e && 0 != I.type && (t.className = t.className.replace(/active/, ""), a.className = a.className.replace(/active/, "").replace(/(^\s*)|(\s*$)/g, "") + " active", I.type = 0, n = 1), n) { var r = I.maxY - I.minY + 1,
						i = parseInt(Math.round(I.gearDate.querySelector(".date_yy").getAttribute("val"))),
						o = parseInt(Math.round(I.gearDate.querySelector(".date_mm").getAttribute("val"))) + 1,
						s = parseInt(Math.round(I.gearDate.querySelector(".date_dd").getAttribute("val"))) + 1,
						l = parseInt(Math.round(I.gearDate.querySelector(".date_h").getAttribute("val22"))),
						d = parseInt(Math.round(I.gearDate.querySelector(".date_min").getAttribute("val22")));
					console.log(o + "------" + d + "------" + l); var c = i % r + I.minY,
						m = (e = I.type ? 0 : 1, E[i].Intercalation ? E[i].Intercalation : 0);!I.type && m && (m == o - 1 ? o = -(o - 1) : m < o - 1 ? o -= 1 : o = o); var u = p(e, c, o, s, l, d);
					0 == e && ($(I.trigger).attr("data-date22", u.yy), $(I.trigger).attr("data-date33", u.mm)); var v = E[u.yy - I.minY].Intercalation ? E[u.yy - I.minY].Intercalation : 0;
					v && I.type && (u.mm < 0 ? u.mm = 1 - u.mm : u.mm > v && (u.mm = u.mm + 1)), I.gearDate.querySelector(".date_yy").setAttribute("val", u.yy - I.minY), I.gearDate.querySelector(".date_mm").setAttribute("val", u.mm - 1), I.gearDate.querySelector(".date_dd").setAttribute("val", u.dd - 1), I.gearDate.querySelector(".date_h").setAttribute("val", u.h - 1), I.gearDate.querySelector(".date_min").setAttribute("val", u.min - 1), I.gearDate.querySelector(".date_yy").setAttribute("top", ""), g() } }

			function g() { var e = I.maxY - I.minY + 1,
					t = I.gearDate.querySelector(".date_yy"),
					a = "<div class='tooth'></div>"; if(t && t.getAttribute("val")) { for(var n = parseInt(t.getAttribute("val")), r = 0; r <= e - 1; r++) a += "<div class='tooth'>" + (I.minY + r) + "</div>";
					t.innerHTML = a; var i = Math.floor(parseFloat(t.getAttribute("top"))); if(isNaN(i)) t.style.transform = "translate(0," + (8 - 2 * n) + "em)", t.style["-webkit-transform"] = "translate(0," + (8 - 2 * n) + "em)", t.style["-moz-transform"] = "translate(0," + (8 - 2 * n) + "em)", t.style["-ms-transform"] = "translate(0," + (8 - 2 * n) + "em)", t.style["-o-transform"] = "translate(0," + (8 - 2 * n) + "em)", t.setAttribute("top", 8 - 2 * n + "em");
					else { i % 2 == 0 ? i = i : i += 1, 8 < i && (i = 8); var o = 8 - 2 * (e - 1);
						i < o && (i = o), t.style.transform = "translate(0," + i + "em)", t.style["-webkit-transform"] = "translate(0," + i + "em)", t.style["-moz-transform"] = "translate(0," + i + "em)", t.style["-ms-transform"] = "translate(0," + i + "em)", t.style["-o-transform"] = "translate(0," + i + "em)", t.setAttribute("top", i + "em"), n = Math.abs(i - 8) / 2, t.setAttribute("val", n) } var s = I.gearDate.querySelector(".date_mm"); if(s && s.getAttribute("val")) { a = "<div class='tooth'></div>"; var l = parseInt(s.getAttribute("val")),
							d = E[n].Intercalation ? E[n].Intercalation : 0; if(d && I.type) var c = 12;
						else c = 11; var m, u = 0; if(n == e - 1)
							if(I.type)
								if(0 <= I.nongMaxObj.mm) { var v = E[I.nongMaxObj.yy - 1940].Intercalation;
									m = v && v < I.nongMaxObj.mm ? I.nongMaxObj.mm : I.nongMaxObj.mm - 1 } else m = Math.abs(I.nongMaxObj.mm);
						else m = I.maxM - 1;
						0 == n && (u = I.type ? I.minM - 1 : I.minM); for(r = 0; r < c - u + 1; r++) { var g = u + r + 1;
							I.type ? (g = d && d == r ? k("rm", g - 1) : k("mm", d && d < r ? g - 1 : g), a += 0 <= m && m < r ? "<div class='tooth' style='color:#c1c1c1'>" + g + "</div>" : "<div class='tooth'>" + g + "</div>") : a += 0 <= m && m < r ? "<div class='tooth' style='color:#c1c1c1'>" + g + "月</div>" : "<div class='tooth'>" + g + "月</div>" } s.innerHTML = a, c < l ? (l = c, s.setAttribute("val", l)) : l < u && (l = c, s.setAttribute("val", l)), s.style.transform = "translate(0," + (8 - 2 * (l - u)) + "em)", s.style["-webkit-transform"] = "translate(0," + (8 - 2 * (l - u)) + "em)", s.style["-moz-transform"] = "translate(0," + (8 - 2 * (l - u)) + "em)", s.style["-ms-transform"] = "translate(0," + (8 - 2 * (l - u)) + "em)", s.style["-o-transform"] = "translate(0," + (8 - 2 * (l - u)) + "em)", s.setAttribute("top", 8 - 2 * (l - u) + "em"); var p = I.gearDate.querySelector(".date_dd"); if(p && p.getAttribute("val")) { a = "<div class='tooth'></div>"; var y, h = parseInt(p.getAttribute("val")),
								f = A(n, l) - 1,
								w = 0;
							n == e - 1 && m == l && (y = I.type ? I.nongMaxObj.dd - 1 : I.maxD - 2), 0 == n && 2 == l + 1 && (w = I.type ? I.minD - 1 : I.minD + 6); for(r = 0; r < f - w + 1; r++) { g = I.type ? k("dd", w + r + 1) : w + r + 1;
								I.type ? a += 0 <= y && y < r ? "<div class='tooth' style='color:#c1c1c1'>" + g + "</div>" : "<div class='tooth'>" + g + "</div>" : a += 0 <= y && y < r ? "<div class='tooth' style='color:#c1c1c1'>" + g + "日</div>" : "<div class='tooth'>" + g + "日</div>" } p.innerHTML = a, f < h ? (h = f, p.setAttribute("val", h)) : h < w && (h = w, p.setAttribute("val", h)), p.style.transform = "translate(0," + (8 - 2 * (h - w)) + "em)", p.style["-webkit-transform"] = "translate(0," + (8 - 2 * (h - w)) + "em)", p.style["-moz-transform"] = "translate(0," + (8 - 2 * (h - w)) + "em)", p.style["-ms-transform"] = "translate(0," + (8 - 2 * (h - w)) + "em)", p.style["-o-transform"] = "translate(0," + (8 - 2 * (h - w)) + "em)", p.setAttribute("top", 8 - 2 * (h - w) + "em"); var _ = I.gearDate.querySelector(".date_h"),
								b = I.gearDate.querySelector(".date_min"),
								x = $(I.trigger).next().attr("jiavalue"),
								S = $(I.trigger).next().attr("jiavalue2"); if(1 == I.hasHourLc) { _.setAttribute("val", 1); var D = 8 - 2 * x;
								_.style.transform = "translate(0," + D + "em)", _.style["-webkit-transform"] = "translate(0," + D + "em)", _.style["-moz-transform"] = "translate(0," + D + "em)", _.style["-ms-transform"] = "translate(0," + D + "em)", _.style["-o-transform"] = "translate(0," + D + "em)", _.setAttribute("top", D + "em"), b.setAttribute("val", 1); var M = 8 - 2 * S;
								b.style.transform = "translate(0," + M + "em)", b.style["-webkit-transform"] = "translate(0," + M + "em)", b.style["-moz-transform"] = "translate(0," + M + "em)", b.style["-ms-transform"] = "translate(0," + M + "em)", b.style["-o-transform"] = "translate(0," + M + "em)", b.setAttribute("top", M + "em"), 0 == x ? j.eq(0).hide() : j.eq(0).show(), 0 == S ? j.eq(1).hide() : j.eq(1).show() } B() } } } }

			function A(e, t) { return 1 == I.type ? E[e].MonthDays[t] ? 30 : 29 : 1 == t ? (e += I.minY) % 4 == 0 && e % 100 != 0 || e % 400 == 0 && e % 4e3 != 0 ? 29 : 28 : 3 == t || 5 == t || 8 == t || 10 == t ? 30 : 31 }

			function k(e, t) { var a = ["丑时", "丑时", "寅时", "寅时", "卯时", "卯时", "辰时", "辰时", "巳时", "巳时", "午时", "午时", "未时", "未时", "申时", "申时", "酉时", "酉时", "戌时", "戌时", "亥时", "亥时", "晚子时", "早子时"]; return "rm" == e ? ["闰正月", "闰二月", "闰三月", "闰四月", "闰五月", "闰六月", "闰七月", "闰八月", "闰九月", "闰十月", "闰冬月", "闰腊月"][t - 1] : "mm" == e ? ["正月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"][t - 1] : "dd" == e ? ["初一", "初二", "初三", "初四", "初五", "初六", "初七", "初八", "初九", "初十", "十一", "十二", "十三", "十四", "十五", "十六", "十七", "十八", "十九", "二十", "廿一", "廿二", "廿三", "廿四", "廿五", "廿六", "廿七", "廿八", "廿九", "三十", "三十一"][t - 1] : "h" == e ? 0 == t ? a[23] : a[t - 1] : void 0 }

			function p(e, t, a, n, r, i) { var o = t,
					s = a,
					l = n,
					d = r,
					c = i,
					m = [0, 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334, 365, 396, 0, 31, 60, 91, 121, 152, 182, 213, 244, 274, 305, 335, 366, 397]; if(0 == e) { var u = parseInt(o),
						v = parseInt(s),
						g = parseInt(l),
						p = v - 1,
						y = L(u),
						h = ((I = m[14 * y + p] + g) + E[S = u - 1940].BaseKanChih) % 60; if(h = h < 22 ? 22 - h : 82 - h, (h += 3) < 10 && (h += 60), I <= E[S].BaseDays) S--, I = m[14 * (y = L(f = u - 1)) + (p += 12)] + g;
					else var f = u; var w = E[S].BaseDays; for(A = 0; A < 13; A++) { var _ = w + E[S].MonthDays[A] + 29; if(I <= _) break;
						w = _ } var b = A + 1,
						x = I - w; return 0 != (D = E[S].Intercalation) && D < b && --b == D && (b = -D), 12 < b && (b -= 12), { yy: f, mm: b, dd: x, h: d, min: c } } f = parseInt(o), b = parseInt(s), x = parseInt(l); var S, D, M = b;
				0 != (D = E[S = f - 1940].Intercalation) && (D < M ? M++ : M == -D && (M = D + 1)), M--; for(var I = 0, A = 0; A < M; A++) I += E[S].MonthDays[A] + 29;
				I += E[S].BaseDays + x; for(y = L(f), A = 13; 0 <= A && !(m[14 * y + A] < I); A--); if(A <= 11) u = f, v = A + 1;
				else u = f + 1, v = A - 11; return { yy: u, mm: v, dd: g = I - m[14 * y + A], h: d, min: c } }

			function L(e) { return e % 400 == 0 ? 1 : e % 100 == 0 ? 0 : e % 4 == 0 ? 1 : 0 }

			function t(e, t, a, n, r, i, o, s, l, d, c, m, u, v, g, p, y) { this.BaseDays = e, this.Intercalation = t, this.BaseWeekday = a, this.BaseKanChih = n, this.MonthDays = [r, i, o, s, l, d, c, m, u, v, g, p, y] }

			function y(e) { var t = ((e = e || event).wheelDelta ? 0 < e.wheelDelta : e.detail < 0) ? 21 : -21;
				e.preventDefault(); for(var a = e.target; !a.classList.contains("gear");) a = a.parentElement;
				clearInterval(a["int_" + a.id]), a["old_" + a.id] = 0, a["o_t_" + a.id] = (new Date).getTime(); var n = a.getAttribute("top");
				a["o_d_" + a.id] = n ? parseFloat(n.replace(/em/g, "")) : 0, a["new_" + a.id] = t, a["n_t_" + a.id] = (new Date).getTime() + 360; var r = 18 * (a["new_" + a.id] - a["old_" + a.id]) / 370;
				a["pos_" + a.id] = a["o_d_" + a.id] + r, a.setAttribute("top", a["pos_" + a.id] + "em"); var i = (a["new_" + a.id] - a["old_" + a.id]) / (a["n_t_" + a.id] - a["o_t_" + a.id]); return Math.abs(i) <= .2 ? a["spd_" + a.id] = i < 0 ? -.08 : .08 : Math.abs(i) <= .5 ? a["spd_" + a.id] = i < 0 ? -.16 : .16 : a["spd_" + a.id] = i / 2, a["pos_" + a.id] || (a["pos_" + a.id] = 0), e.preventDefault && e.preventDefault(), o(a), !1 }

			function h(e) { e.preventDefault(); for(var t = e.target, n = t, r = !1; !t.classList.contains("gear");) t = t.parentElement;
				clearInterval(t["int_" + t.id]), t["old_" + t.id] = e.screenY, t["o_t_" + t.id] = (new Date).getTime(); var a = t.getAttribute("top");
				t["o_d_" + t.id] = a ? parseFloat(a.replace(/em/g, "")) : 0, document.onmousemove = function(e) { r = !0, (e = e || window.event).preventDefault(); for(var t = n; !t.classList.contains("gear");) t = t.parentElement;
					t["new_" + t.id] = e.screenY, t["n_t_" + t.id] = (new Date).getTime(); var a = 18 * (t["new_" + t.id] - t["old_" + t.id]) / 370;
					t["pos_" + t.id] = t["o_d_" + t.id] + a, t.style.transform = "translate(0," + t["pos_" + t.id] + "em)", t.style["-webkit-transform"] = "translate(0," + t["pos_" + t.id] + "em)", t.style["-moz-transform"] = "translate(0," + t["pos_" + t.id] + "em)", t.style["-ms-transform"] = "translate(0," + t["pos_" + t.id] + "em)", t.style["-o-transform"] = "translate(0," + t["pos_" + t.id] + "em)", t.setAttribute("top", t["pos_" + t.id] + "em") }, document.onmouseup = function(e) { if(!r) return document.onmousemove = null, document.onmouseup = null, !1;
					(e = e || window.event).preventDefault(); for(var t = n; !t.classList.contains("gear");) t = t.parentElement; var a = (t["new_" + t.id] - t["old_" + t.id]) / (t["n_t_" + t.id] - t["o_t_" + t.id]);
					Math.abs(a) <= .2 ? t["spd_" + t.id] = a < 0 ? -.08 : .08 : Math.abs(a) <= .5 ? t["spd_" + t.id] = a < 0 ? -.16 : .16 : t["spd_" + t.id] = a / 2, t["pos_" + t.id] || (t["pos_" + t.id] = 0), o(t), document.onmousemove = null, document.onmouseup = null } }

			function f(e) { e.preventDefault(); var t = e.target; for(t.touchTip = !1; !t.classList.contains("gear");) t = t.parentElement;
				clearInterval(t["int_" + t.id]), t["old_" + t.id] = e.targetTouches[0].screenY, t["o_t_" + t.id] = (new Date).getTime(); var a = t.getAttribute("top");
				t["o_d_" + t.id] = a ? parseFloat(a.replace(/em/g, "")) : 0 }

			function w(e) { e.preventDefault(); var t = e.target; for(t.touchTip = !0; !t.classList.contains("gear");) t = t.parentElement;
				t["new_" + t.id] = e.targetTouches[0].screenY, t["n_t_" + t.id] = (new Date).getTime(); var a = 18 * (t["new_" + t.id] - t["old_" + t.id]) / 370;
				t["pos_" + t.id] = t["o_d_" + t.id] + a, t.style.transform = "translate(0," + t["pos_" + t.id] + "em)", t.style["-webkit-transform"] = "translate(0," + t["pos_" + t.id] + "em)", t.style["-moz-transform"] = "translate(0," + t["pos_" + t.id] + "em)", t.style["-ms-transform"] = "translate(0," + t["pos_" + t.id] + "em)", t.style["-o-transform"] = "translate(0," + t["pos_" + t.id] + "em)", t.setAttribute("top", t["pos_" + t.id] + "em") }

			function _(e) { e.preventDefault(); var t = e.target; if(!t.touchTip) return !1; for(; !t.classList.contains("gear");) t = t.parentElement; var a = (t["new_" + t.id] - t["old_" + t.id]) / (t["n_t_" + t.id] - t["o_t_" + t.id]);
				Math.abs(a) <= .2 ? t["spd_" + t.id] = a < 0 ? -.08 : .08 : Math.abs(a) <= .5 ? t["spd_" + t.id] = a < 0 ? -.16 : .16 : t["spd_" + t.id] = a / 2, t["pos_" + t.id] || (t["pos_" + t.id] = 0), o(t) }

			function o(w) { var _ = 0,
					b = !1,
					x = I.maxY - I.minY + 1;
				console.log(x), clearInterval(w["int_" + w.id]), w["int_" + w.id] = setInterval(function() { var e = w["pos_" + w.id],
						t = w["spd_" + w.id] * Math.exp(-.03 * _); if(e += t, .1 < Math.abs(t));
					else { t = .1; var a = 2 * Math.round(e / 2);
						Math.abs(e - a) < .02 ? b = !0 : a < e ? e -= t : e += t } 8 < e && (e = 8, b = !0); var n = $(".date_mm"),
						r = $(".date_dd"); switch(w.getAttribute("data-datetype")) {
						case "date_yy":
							if(e < (f = 8 - 2 * (x - 1)) && (e = f, b = !0), b) { var i, o = Math.abs(e - 8) / 2; if(S(w, o), clearInterval(w["int_" + w.id]), o == I.maxY - 1940) { if(I.type)
										if(0 <= I.nongMaxObj.mm) i = (v = E[I.nongMaxObj.yy - 1940].Intercalation) && v < I.nongMaxObj.mm ? I.nongMaxObj.mm : I.nongMaxObj.mm - 1;
										else i = Math.abs(I.nongMaxObj.mm);
									else i = I.maxM - 1; if(n.attr("val") >= i) S(n.get(0), i), m = I.type ? I.nongMaxObj.dd - 1 : I.maxD - 2, r.attr("val") > m && S(r.get(0), m) } } break;
						case "date_mm":
							var s = I.gearDate.querySelector(".date_yy"),
								l = parseInt(s.getAttribute("val")); if((E[l].Intercalation ? E[l].Intercalation : 0) && I.type) var d = 12;
							else d = 11; var c = 0; if(l == x - 1)
								if(I.type)
									if(0 <= I.nongMaxObj.mm) d = (v = E[I.nongMaxObj.yy - 1940].Intercalation) && v < I.nongMaxObj.mm ? I.nongMaxObj.mm : I.nongMaxObj.mm - 1;
									else d = Math.abs(I.nongMaxObj.mm);
							else d = I.maxM - 1; if(0 == l && (c = I.type ? I.minM - 1 : I.minM), e < (f = 8 - 2 * (d - c)) && (e = f, b = !0), b) { var m;
								o = Math.abs(e - 8) / 2 + c; if(S(w, o), clearInterval(w["int_" + w.id]), d == Math.round(o)) m = I.type ? I.nongMaxObj.dd - 1 : I.maxD - 2, r.attr("val") > m && S(r.get(0), m) } break;
						case "date_dd":
							s = I.gearDate.querySelector(".date_yy"); var u, v, g = I.gearDate.querySelector(".date_mm"),
								p = (l = parseInt(s.getAttribute("val")), parseInt(g.getAttribute("val"))),
								y = A(l, p) - 1,
								h = 0; if(I.type)
								if(0 <= I.nongMaxObj.mm) u = (v = E[I.nongMaxObj.yy - 1940].Intercalation) && v < I.nongMaxObj.mm ? I.nongMaxObj.mm : I.nongMaxObj.mm - 1;
								else u = Math.abs(I.nongMaxObj.mm);
							else u = I.maxM - 1; if(l == x - 1 && u == p && (y = I.type ? I.nongMaxObj.dd - 1 : I.maxD - 2), 0 == l && 2 == p + 1 && (h = I.type ? I.minD - 1 : I.minD + 6), e < (f = 8 - 2 * (y - h)) && (e = f, b = !0), b) { o = Math.abs(e - 8) / 2 + h;
								S(w, o), clearInterval(w["int_" + w.id]) } break;
						case "date_h":
							if(e < (f = -40) && (e = f, b = !0), b) { o = Math.abs(e - 8) / 2;
								S(w, o), clearInterval(w["int_" + w.id]) } break;
						case "date_min":
							var f; if(e < (f = -112) && (e = f, b = !0), b) { o = Math.abs(e - 8) / 2;
								S(w, o), clearInterval(w["int_" + w.id]) } } w["pos_" + w.id] = e, w.style.transform = "translate(0," + e + "em)", w.style["-webkit-transform"] = "translate(0," + e + "em)", w.style["-moz-transform"] = "translate(0," + e + "em)", w.style["-ms-transform"] = "translate(0," + e + "em)", w.style["-o-transform"] = "translate(0," + e + "em)", w.setAttribute("top", e + "em"), _++ }, 6) }

			function S(e, t) { t = Math.round(t), console.log(t + "-------停留的值"), e.setAttribute("val", t), e.setAttribute("val22", t), $(e).hasClass("date_h") && $(I.trigger).next().attr("jiavalue", t), $(e).hasClass("date_min") && $(I.trigger).next().attr("jiavalue2", t), g() }

			function b(e) { if(z = !1, e.preventDefault(), !window.CustomEvent) { var t = new CustomEvent("input");
					I.trigger.dispatchEvent(t) } document.body.removeChild(I.gearDate) }

			function x(e) { $(".date_ctrl ").hide(), $(".date_confirm").show(), $(I.trigger).next().val(N.year + "." + N.month + "." + N.date + "." + N.hour + "." + N.min); var t = B();
				I.trigger.setAttribute("data-date", t.yy + "." + t.mm + "." + t.dd + "." + t.h + "." + t.min), I.trigger.setAttribute("data-date22", t._yy), I.trigger.setAttribute("data-date33", t._mm); var a = I.trigger.getAttribute("data-input-id");
				a && (document.getElementById(a).value = t.yy + "." + t.mm + "." + t.dd + "." + t.h + "." + t.min); var n = $(".lcalendar_info").text(),
					r = $(".lcalendar_info1").text(); if(I.type) { var i = '<p>农(阴)历：<span class="nongli" style="color:red">' + n + '</span></p><p>公(阳)历：<span class="gongli"  style="color:red">' + r + "<span></p>"; "" != q && "" != O || (i += '<div class="tixing1" style="color:#ff9900;font-size:18px;">注意:选未知有可能影响结果的准确性</div>') } else if("" == q || "" == O) i = '<p>公(阳)历：<span class="gongli"  style="color:red">' + r + '<span></p><p>农(阴)历：<span class="nongli" style="color:red">' + n + '</span></p><div class="tixing1" style="color:#ff9900;font-size:18px;">注意:选未知有可能影响结果的准确性</div>';
				else i = '<p>公(阳)历：<span class="gongli"  style="color:red">' + r + '<span></p><p>农(阴)历：<span class="nongli" style="color:red">' + n + "</span></p>";
				$(".gongnongli").html(i) }

			function D() { $(".date_ctrl ").show(), $(".date_confirm").hide() }

			function M(e) { z = !1, T(), $(I.trigger).next().val(N.year + "." + N.month + "." + N.date + "." + N.hour + "." + N.min); var t = B();
				I.trigger.setAttribute("data-date", t.yy + "." + t.mm + "." + t.dd + "." + t.h + "." + t.min), I.trigger.setAttribute("data-date22", t._yy), I.trigger.setAttribute("data-date33", t._mm); var a = I.trigger.getAttribute("data-input-id");
				a && (document.getElementById(a).value = t.yy + "." + t.mm + "." + t.dd + "." + t.h + "." + t.min), console.log($(".lcalendar_info").text()); var n = $(".lcalendar_info").text(),
					r = $(".lcalendar_info1").text();
				1 != I.hasHourLc && (n = function(e) { var t = -1; if(-1 != e.indexOf("时辰未知")) t = e.indexOf("时辰未知"), e = e.slice(0, t);
					else if(-1 != e.indexOf("早子")) t = e.indexOf("早子"), e = e.slice(0, t);
					else if(-1 != e.indexOf("晚子")) t = e.indexOf("晚子"), e = e.slice(0, t);
					else if(-1 != e.indexOf("时")) t = e.indexOf("时"), e = e.slice(0, t - 1);
					else { if(-1 == e.indexOf("日")) return e;
						t = e.indexOf("日"), e = e.slice(0, t + 1) } return e }(n)), I.type ? ($(I.trigger).attr("data-text", "农历:" + n), $(I.trigger).html("农历:" + n)) : ($(I.trigger).attr("data-text", "公历:" + r), $(I.trigger).html("公历:" + r)), b(e) } this.nongMaxObj = p(0, this.maxY.toString(), this.maxM.toString(), (this.maxD - 1).toString()); var O = "",
				q = "";

			function B() { var e = I.maxY - I.minY + 1,
					t = parseInt(Math.round(I.gearDate.querySelector(".date_yy").getAttribute("val"))),
					a = t % e + I.minY,
					n = parseInt(Math.round(I.gearDate.querySelector(".date_mm").getAttribute("val"))) + 1,
					r = parseInt(Math.round(I.gearDate.querySelector(".date_dd").getAttribute("val"))) + 1,
					i = parseInt(Math.round(I.gearDate.querySelector(".date_h").getAttribute("val22"))) - 1,
					o = parseInt(Math.round(I.gearDate.querySelector(".date_min").getAttribute("val22"))) - 1,
					s = E[t].Intercalation ? E[t].Intercalation : 0;
				I.type && s && (s == n - 1 ? n = -(n - 1) : s < n - 1 ? n -= 1 : n = n); var l = p(I.type, a, n, r, i, o);
				console.log(l), (q = o) < 0 ? q = "" : q += "分", (O = i) < 0 ? q = O = "" : O += "时"; var d = I.gearDate.querySelector(".lcalendar_info"),
					c = I.gearDate.querySelector(".lcalendar_info1"); if(I.type) { N.year = l.yy, N.month = l.mm, N.date = l.dd, N.hour = l.h, N.min = l.min, I.trigger.setAttribute("data-type", 1); var m = n < 0 ? k("rm", -n) : k("mm", n),
						u = p(1, a, n, r, i, o); return d.innerHTML = a + "年" + m + k("dd", r) + O + q, c.innerHTML = u.yy + "年" + u.mm + "月" + u.dd + "日" + O + q, { yy: l.yy, mm: l.mm, dd: l.dd, _yy: a, _mm: n, _dd: r, h: i, min: o } } N.year = a, N.month = n, N.date = r, N.hour = l.h, N.min = l.min, I.trigger.setAttribute("data-type", 0); var v = p(0, a, n, r, i, o);
				m = v.mm < 0 ? k("rm", -v.mm) : k("mm", v.mm); return d.innerHTML = v.yy + "年" + m + k("dd", v.dd) + O + q, c.innerHTML = a + "年" + n + "月" + r + "日" + O + q, { _yy: l.yy, _mm: l.mm, _dd: l.dd, yy: a, mm: n, dd: r, h: i, min: o } } console.log(I.trigger), I.trigger.addEventListener("click", function() { z = !0 }), I.trigger.addEventListener("click", { date: function(n) { document.activeElement.blur(), I.gearDate = document.createElement("div"), I.gearDate.className = "gearDate", I.gearDate.setAttribute("style", "z-index:99999"); var e = '<div style="width: 100%; height: 429px; position: absolute; top: 0px; left: 0px; opacity: 0;" class="zhezhao"></div><div class="date_ctrl slideInUp" style="display:block;z-index:1000;"><div class="date_info_box lcalendar_info">2016年12月29日</div><div class="date_info_box lcalendar_info1">2016年12月29日</div><div style="font-size: 10px"><div class="date_class_box"><div id="falseBtn_back">取消</div><div class="date_class lcalendar_gongli">公历</div><div class="date_class lcalendar_nongli">农历</div><div id="falseBtn_save">完成</div></div></div><div class="date_roll_mask"><div class="date_roll"><div style="width: 26%"><div class="gear date_yy" data-datetype="date_yy"></div><div class="date_grid"></div></div><div style="width: 20%"><div class="gear date_mm" data-datetype="date_mm"></div><div class="date_grid"></div></div><div style="width: 20%"><div class="gear date_dd" data-datetype="date_dd"></div><div class="date_grid"></div></div>',
						t = "";
					1 != I.hasHourLc && (t = "display:none;"), e += '<div class="date_h_wrap" style=' + (t += "width:17%;") + '><div class="gear date_h" id="dddHei" val22=' + $(I.trigger).next().attr("jiavalue") + ' data-datetype="date_h"><div class="tooth too1"></div><div class="tooth too1">未知</div>'; for(var a = 0; a < 24; a++) e += '<div class="tooth too1">' + a + "</div>"; for(e += '</div><div class="date_grid"><div class="mark">时</div></div></div>', e += '<div class="date_min_wrap" style=' + t + '><div class="gear date_min" id="minHei" val22=' + $(I.trigger).next().attr("jiavalue2") + ' data-datetype="date_min"><div class="tooth too1"></div><div class="tooth too1">未知</div>', a = 0; a < 60; a++) e += '<div class="tooth too1">' + a + "</div>";
					e += '</div><div class="date_grid"><div class="mark">分</div></div></div>', e += '</div></div><div class="date_btn_box"><div class="date_btn lcalendar_finish">确定</div><div class="date_btn lcalendar_cancel">取消</div></div></div>', e += '<div class="date_confirm" style="z-index:1000;border-top: 1px solid rgb(221, 221, 221);width:100%;position: absolute; bottom: 0px; left: 0px;right: 0px; background-color: rgb(255, 255, 255); z-index: 10000; color: rgb(187, 187, 187); overflow: hidden; display: none;padding-bottom:20px"><div style="line-height: 60px;border-bottom: 1px solid rgb(221, 221, 221);text-align: center;font-size: 20px;font-weight:bold;color: #000000;"> 出生日期确认</div><div style="text-align: center; overflow: hidden;margin-bottom:10px;"><p style="font-size: 18px;color: rgb(51, 51, 51);line-height: 30px;padding-top:5px;">请确认输入的时间是否正确</p><div class="gongnongli" style="font-size: 20px;line-height: 30px;color:rgb(51, 51, 51)"><div class="gongnongli"></div></div></div><div style="color: rgb(255, 255, 255);font-size: 18px;margin: 0;"><div style="float: left; width: 50%; text-align: right; box-sizing: border-box; padding-right: 20px; vertical-align: top; cursor: pointer;"><span id="return_date" style="display: inline-block; width: 150px; line-height: 50px; background-color: #999999; color: rgb(255, 255, 255); text-align: center; border-radius: 6px;">返回修改</span></div><div style="float: right; text-align: left; width: 50%; box-sizing: border-box; padding-left: 20px; vertical-align: top; cursor: pointer;"><span id="finishMobileDate" style="display: inline-block; width: 150px; line-height: 50px; background-color: #993300; color: rgb(255, 255, 255); text-align: center; border-radius: 6px;">确认提交</span></div><div style="overflow: hidden; clear: both;"></div></div></div>', I.gearDate.innerHTML = e, document.body.appendChild(I.gearDate), 1 != I.hasHourLc && $(".date_roll>div").css("width", "33.33%"), j = $(".date_roll .mark"),
						function() { var e = $(I.trigger).next().val().split("."),
								t = { yy: e[0] - 1900, mm: e[1] - 1, dd: e[2] - 1, h: 1, min: 1 },
								a = I.trigger.getAttribute("data-date22") - I.minY,
								n = I.trigger.getAttribute("data-date33"); if(/^\d{4}-\d{1,2}-\d{1,2}$/.test(I.trigger.getAttribute("data-date")) ? (rs = I.trigger.getAttribute("data-date").match(/(^|-)\d{1,4}/g), t.yy = rs[0] - I.minY, t.mm = rs[1].replace(/-/g, "") - 1, t.dd = rs[2].replace(/-/g, "") - 1) : t.yy = t.yy + 1900 - I.minY, I.gearDate.querySelector(".date_yy").setAttribute("val", t.yy), I.gearDate.querySelector(".date_mm").setAttribute("val", t.mm), I.gearDate.querySelector(".date_dd").setAttribute("val", t.dd), I.gearDate.querySelector(".date_h").setAttribute("val", t.h), I.gearDate.querySelector(".date_min").setAttribute("val", t.min), parseInt(I.trigger.getAttribute("data-type"))) { I.type = 1; var r = I.gearDate.querySelector(".lcalendar_nongli");
								r.className = r.className.replace(/active/, "").replace(/(^\s*)|(\s*$)/g, "") + " active"; var i = I.maxY - I.minY + 1,
									o = t.yy % i + I.minY,
									s = t.mm + 1,
									l = t.dd + 1,
									d = t.h + 1,
									c = t.min + 1,
									m = p(0, o, s, l, d, c);
								m.mm < 0 && (m.mm = 1 - m.mm), 0 != E[a].Intercalation && n > E[a].Intercalation && (console.log("jinlaile"), m.mm += 1), I.gearDate.querySelector(".date_yy").setAttribute("val", m.yy - I.minY), I.gearDate.querySelector(".date_mm").setAttribute("val", m.mm - 1), I.gearDate.querySelector(".date_dd").setAttribute("val", m.dd - 1), I.gearDate.querySelector(".date_h").setAttribute("val", m.h - 1), I.gearDate.querySelector(".date_min").setAttribute("val", m.min - 1) } else { I.type = 0; var u = I.gearDate.querySelector(".lcalendar_gongli");
								u.className = u.className.replace(/active/, "").replace(/(^\s*)|(\s*$)/g, "") + " active" } g() }(); var r = "ontouchstart" in window;
					I.gearDate.querySelector("#falseBtn_back").addEventListener(r ? "touchstart" : "click", b), I.gearDate.querySelector("#falseBtn_save").addEventListener(r ? "touchstart" : "click", x), I.gearDate.querySelector("#falseBtn_save").addEventListener(r ? "touchstart" : "click", x), I.gearDate.querySelector("#return_date").addEventListener(r ? "touchstart" : "click", D); var i = I.gearDate.querySelector("#finishMobileDate");
					i.addEventListener(r ? "touchstart" : "click", M); var o = I.gearDate.querySelector(".lcalendar_gongli"),
						s = I.gearDate.querySelector(".lcalendar_nongli");
					o.addEventListener(r ? "touchstart" : "click", function() { v("gongli") }, !1), s.addEventListener(r ? "touchstart" : "click", function() { v("nongli") }, !1); var l = I.gearDate.querySelector(".date_yy"),
						d = I.gearDate.querySelector(".date_mm"),
						c = I.gearDate.querySelector(".date_dd"),
						m = I.gearDate.querySelector(".date_h"),
						u = I.gearDate.querySelector(".date_min");
					l.addEventListener("touchstart", f), d.addEventListener("touchstart", f), c.addEventListener("touchstart", f), m.addEventListener("touchstart", f), u.addEventListener("touchstart", f), l.addEventListener("mousedown", h), d.addEventListener("mousedown", h), c.addEventListener("mousedown", h), m.addEventListener("mousedown", h), u.addEventListener("mousedown", h), l.addEventListener("touchmove", w), d.addEventListener("touchmove", w), c.addEventListener("touchmove", w), m.addEventListener("touchmove", w), u.addEventListener("touchmove", w), l.addEventListener("touchend", _), d.addEventListener("touchend", _), c.addEventListener("touchend", _), m.addEventListener("touchend", _), u.addEventListener("touchend", _), 0 < navigator.userAgent.indexOf("Firefox") ? (I.gearDate.addEventListener("DOMMouseScroll", function(e) { e.preventDefault() }, !1), l.addEventListener("DOMMouseScroll", y, !1), d.addEventListener("DOMMouseScroll", y, !1), c.addEventListener("DOMMouseScroll", y, !1), m.addEventListener("DOMMouseScroll", y, !1), u.addEventListener("DOMMouseScroll", y, !1)) : (I.gearDate.onmousewheel = function(e) { return !1 }, l.onmousewheel = y, d.onmousewheel = y, c.onmousewheel = y, m.onmousewheel = y, u.onmousewheel = y), "block" === $(".date_ctrl").css("display") ? $(".zhezhao").css("height", parseInt(window.innerHeight) - parseInt($(".date_ctrl").height()) + "px") : $(".zhezhao").css("height", parseInt(window.innerHeight) - parseInt($(".date_confirm").height()) + "px"), I.gearDate.onclick = function() { if(parseInt(event.clientX) < parseInt($(".zhezhao").css("width")) && parseInt(event.clientY) < parseInt($(".zhezhao").css("height")))
							if("block" === $(".date_ctrl").css("display")) b(n);
							else if("undefined" != typeof Event && Event instanceof Function) { var e = new Event("touchstart"),
								t = new Event("click");
							i.dispatchEvent(e), i.dispatchEvent(t) } else if(document.createEvent && "function" == typeof document.createEvent) { var a = document.createEvent("HTMLEvents");
							a.initEvent("click", !0, !0), i.dispatchEvent(a) } }, z = !0, T() } }[e], !1) } }, e }();