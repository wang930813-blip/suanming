(this.webpackJsonp = this.webpackJsonp || []).push([[25], {
    105: function(e, t, n) {
        "use strict";
        n.d(t, "b", (function() {
                return c
            }
        )),
            n.d(t, "a", (function() {
                    return l
                }
            ));
        n(106),
            n(103);
        var r = n(35)
            , o = n(0)
            , i = n.n(o)
            , a = i.a.createContext({
            enable: !1
        })
            , c = function(e) {
            var t = e.children
                , n = Object(o.useState)((function() {
                    return !![].map && 0 === document.createElement("canvas").toDataURL("image/webp").indexOf("data:image/webp")
                }
            ))
                , c = Object(r.a)(n, 1)[0];
            return i.a.createElement(a.Provider, {
                value: {
                    enable: c
                }
            }, t)
        }
            , u = (n(48),
                n(102),
                function() {
                    var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {}
                        , t = e.src
                        , n = e.quality
                        , r = e.suffix
                        , o = e.enableWebp
                        , i = /(jpe?g|png|bmp|tiff)$/;
                    if (i.test(t)) {
                        var a = "number" === typeof n ? "/quality,q_".concat(n) : ""
                            , c = o ? "/format,webp" : ""
                            , u = "string" === typeof r ? r : ""
                            , s = "".concat(a).concat(c).concat(u);
                        t += s ? "?x-oss-process=image".concat(s) : ""
                    }
                    return t
                }
        )
            , s = function(e, t) {
            var n = function(e) {
                var t = e.src
                    , n = Object(o.useContext)(a).enable
                    , i = Object(o.useState)(!1)
                    , c = Object(r.a)(i, 2)
                    , s = c[0]
                    , l = c[1]
                    , p = Object(o.useState)(u({
                    src: t,
                    enableWebp: n
                }))
                    , f = Object(r.a)(p, 2)
                    , d = f[0]
                    , m = f[1];
                return Object(o.useEffect)((function() {
                        if (t) {
                            var e = u({
                                src: t,
                                enableWebp: n
                            });
                            m(e)
                        }
                    }
                ), [t]),
                    Object(o.useEffect)((function() {
                            s && (console.log("error reload"),
                                setTimeout((function() {
                                        m(t)
                                    }
                                ), 1e3))
                        }
                    ), [s]),
                    [d, l]
            }(e)
                , c = Object(r.a)(n, 2)
                , s = c[0]
                , l = c[1];
            return s ? i.a.createElement("img", Object.assign({
                alt: ""
            }, e, {
                src: s,
                ref: t,
                onError: function() {
                    return l(!0)
                }
            })) : null
        }
            , l = i.a.forwardRef(s)
    },
    19: function(e, t, n) {
        "use strict";
        n.d(t, "f", (function() {
                return s
            }
        )),
            n.d(t, "b", (function() {
                    return f
                }
            )),
            n.d(t, "a", (function() {
                    return l
                }
            )),
            n.d(t, "d", (function() {
                    return i
                }
            )),
            n.d(t, "c", (function() {
                    return o
                }
            )),
            n.d(t, "g", (function() {
                    return p
                }
            )),
            n.d(t, "e", (function() {
                    return u
                }
            ));
        n(51),
            n(150),
            n(151),
            n(152),
            n(76),
            n(111),
            n(49),
            n(37),
            n(70),
            n(54),
            n(55);
        var r = n(26);
        var o = "other"
            , i = "zh-CN"
            , a = "https://linghit.qiyukf.com/client?k=da58ce0115a1232c79a01c472ae24164&wp=1qtype=13111"
            , c = "https://za.yjkxmy3.cn/quweiceshi/h5more.html"
            , u = "zxcs"
            , s = 20
            , l = {
            FETCH_LANG: "/api/v1/page/location.json",
            PAY_CONF: "/api/payments/config",
            WECHAT_H5_PAY: "/api/payments/pay/config",
            WECHAT_OFFICIAL_PAY: "/api/payments/wechat/charge/config",
            ORDER_STATUS: "/api/payments/pay/query",
            REGISTER: "/api/orders",
            QUERY: "/api/orders/",
            QUERY_LIST: "/api/orders/index",
            QUERY_COMMON: "/api/orders/query",
            RESULT: "/api/results/",
            ASSESS: "/api/comments/result",
            PAY_DETAIN: "/api/results/detain/",
            LANG: "/api/tools/location.json",
            SEND_CONTCAT: "/api/notify/send/",
            SHOP: "/api/shop/order.json",
            FREE: "/api/results/free",
            SHOP_SHOW: "/api/tools/goods/",
            ADD_NAME: "/api/orders/",
            ZHUIWEN_LIST: "/api/activity/yiqiwen",
            Algorithm: "/api/config/algorithm",
            PRODUCTS: "/api/products/",
            COMBOREGISTER: "/api/activity/combo_store/",
            COMBO_ORDER: "/api/activity/combo_order/",
            COMBO_QUERY: "/api/activity/combo_query/",
            SMS_CHECK: "/api/notify/sms_check",
            SUBSCRIBE: "/api/notify/subscribe",
            ZHUIWEN_LIST_ZW: "/api/products/",
            COMBO_STORE: "/api/activity/combo_store/yqw",
            ADJUST_PRICE: "/api/orders/price/",
            PRICE_CONFIG: "/api/config/index/",
            ARTICLE: "/api/tools/article/check",
            SOURCE: "/api/resource/show",
            WX_CODE: "/api/wechat/geturl",
            WX_USER_INFO: "/api/wechat/getuserinfo",
            WECHAT_POOL: "/api/wechat/pool",
            WX_VISITORID: "/api/wechat/third",
            WX_USER_GH: "/api/user/info",
            BAIDU_TRACK: "/api/tools/baidu/conversion",
            INIT_TLY: "/api/tly/key",
            SHOP_REGISTER: "/api/shop/orders",
            SMS_URL: "/api/orders/sms_url/"
        };
        function p(e) {
            var t = "newzx_history_orders"
                , n = Object(r.b)(e)
                , u = Object(r.c)(e)
                , s = {
                KefuDomain: a,
                INDIVIDUAL_PRIVACY: "/individualPrivacy/index",
                TouchDomain: c,
                INDEX: "/".concat(n, "/index"),
                QUERY: "/".concat(n, "/query"),
                RESULT: "/".concat(n, "/result"),
                ORDER: "/".concat(n, "/order"),
                NEW_PAY: "/".concat(n, "/pay"),
                PAY: u
            };
            return {
                BASE_NAME: e,
                HISTORY_ORDERS: t,
                DEFAULT_CHANNEL: o,
                DEFAULT_LANG: i,
                DEFAULT_LAP: 0,
                PAGE: s,
                API: l,
                MARK: e
            }
        }
        var f = {
            RELAY_HOST: "//relayfe.caij100.com",
            CMS_HOST: "//cmsfe.linghit.io",
            TEMP_PATH: "/api/acttemp/pj/",
            SUB_PATH: "/api/acttempsub/pj/",
            WEIXIN_CS_HOST: "//sandbox-weixin.linghit.io",
            WEIXIN_HOST: "//api-admin-weixin.lingjiwenhua.xyz",
            CDN: "//zx.tengzhihh.com"
        }
    },
    192: function(e, t, n) {
        e.exports = n(275)
    },
    247: function(e, t, n) {},
    248: function(e, t, n) {},
    26: function(e, t, n) {
        "use strict";
        n.d(t, "d", (function() {
                return l
            }
        )),
            n.d(t, "i", (function() {
                    return p
                }
            )),
            n.d(t, "g", (function() {
                    return f
                }
            )),
            n.d(t, "f", (function() {
                    return d
                }
            )),
            n.d(t, "l", (function() {
                    return m
                }
            )),
            n.d(t, "k", (function() {
                    return _
                }
            )),
            n.d(t, "j", (function() {
                    return g
                }
            )),
            n.d(t, "n", (function() {
                    return b
                }
            )),
            n.d(t, "e", (function() {
                    return y
                }
            )),
            n.d(t, "q", (function() {
                    return h
                }
            )),
            n.d(t, "h", (function() {
                    return v
                }
            )),
            n.d(t, "m", (function() {
                    return E
                }
            )),
            n.d(t, "r", (function() {
                    return j
                }
            )),
            n.d(t, "p", (function() {
                    return w
                }
            )),
            n.d(t, "a", (function() {
                    return A
                }
            )),
            n.d(t, "o", (function() {
                    return S
                }
            )),
            n.d(t, "b", (function() {
                    return x
                }
            )),
            n.d(t, "c", (function() {
                    return R
                }
            ));
        n(51),
            n(150),
            n(151),
            n(102),
            n(38),
            n(152),
            n(106),
            n(76),
            n(111),
            n(179),
            n(49),
            n(37),
            n(180),
            n(107),
            n(110),
            n(47),
            n(70),
            n(54),
            n(171),
            n(168),
            n(169),
            n(115),
            n(39),
            n(55);
        var r = n(17)
            , o = n.n(r)
            , i = n(74)
            , a = n.n(i)
            , c = n(19);
        function u(e, t) {
            var n;
            if ("undefined" === typeof Symbol || null == e[Symbol.iterator]) {
                if (Array.isArray(e) || (n = function(e, t) {
                        if (!e)
                            return;
                        if ("string" === typeof e)
                            return s(e, t);
                        var n = Object.prototype.toString.call(e).slice(8, -1);
                        "Object" === n && e.constructor && (n = e.constructor.name);
                        if ("Map" === n || "Set" === n)
                            return Array.from(e);
                        if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n))
                            return s(e, t)
                    }(e)) || t && e && "number" === typeof e.length) {
                    n && (e = n);
                    var r = 0
                        , o = function() {};
                    return {
                        s: o,
                        n: function() {
                            return r >= e.length ? {
                                done: !0
                            } : {
                                done: !1,
                                value: e[r++]
                            }
                        },
                        e: function(e) {
                            throw e
                        },
                        f: o
                    }
                }
                throw new TypeError("Invalid attempt to iterate non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }
            var i, a = !0, c = !1;
            return {
                s: function() {
                    n = e[Symbol.iterator]()
                },
                n: function() {
                    var e = n.next();
                    return a = e.done,
                        e
                },
                e: function(e) {
                    c = !0,
                        i = e
                },
                f: function() {
                    try {
                        a || null == n.return || n.return()
                    } finally {
                        if (c)
                            throw i
                    }
                }
            }
        }
        function s(e, t) {
            (null == t || t > e.length) && (t = e.length);
            for (var n = 0, r = new Array(t); n < t; n++)
                r[n] = e[n];
            return r
        }
        function l(e) {
            var t = a.a.parse(location.search, {
                ignoreQueryPrefix: !0
            });
            if (e instanceof Array) {
                var n, r = {}, o = u(e);
                try {
                    for (o.s(); !(n = o.n()).done; ) {
                        var i = n.value;
                        r[i] = t[i]
                    }
                } catch (c) {
                    o.e(c)
                } finally {
                    o.f()
                }
                return r
            }
            return t[e]
        }
        function p() {
            var e = navigator.userAgent;
            return /iphone|ipad|ipod/i.test(e)
        }
        function f() {
            return navigator.userAgent.toLocaleLowerCase().indexOf("baiduboxapp") > -1
        }
        function d() {
            var e = navigator.userAgent;
            return /android/i.test(e)
        }
        function m() {
            var e = window.navigator.userAgent.toLowerCase();
            return /micromessenger/i.test(e)
        }
        function _() {
            var e = window.navigator.userAgent.toLowerCase();
            return /ucbrowser/i.test(e)
        }
        function g() {
            var e = navigator.userAgent.toLowerCase();
            return /linghit/i.test(e)
        }
        function b(e, t) {
            if (O()) {
                var n = localStorage.getItem(e)
                    , r = t;
                if (new RegExp(t,"ig").test(n))
                    return;
                n && "null" !== n && "undefined" !== n && (r = "".concat(n, ",").concat(t)),
                    localStorage.setItem(e, r)
            }
        }
        function O() {
            if (!window.localStorage)
                return !1;
            var e = !1;
            try {
                localStorage.setItem("support", 1),
                    localStorage.removeItem("support"),
                    e = !0
            } catch (t) {
                e = !1
            }
            return e
        }
        function y(e) {
            if (!O())
                return null;
            var t = localStorage.getItem(e);
            return void 0 === t ? null : t
        }
        function h(e, t) {
            O() && localStorage.setItem(e, t)
        }
        function v(e) {
            return /^https?:\/\/(([a-zA-Z0-9_-])+(\.)?)*/i.test(e)
        }
        function E() {
            var e = navigator.userAgent
                , t = /iPad|iPhone|iPod/.test(e)
                , n = /OS 11/.test(e);
            return t && n
        }
        function j() {
            var e = l("wltc") || "";
            try {
                e && o.a.set("_wltc", e, 1 / 0, "/")
            } catch (t) {}
        }
        function w() {
            var e = l("schannel") || "";
            try {
                e ? o.a.set("_schannel", e, 1 / 0, "/") : o.a.remove("_schannel", "/")
            } catch (t) {}
        }
        function A() {
            var e = l("code") || "";
            try {
                e && o.a.set("_activity_coupon_code", e, 1 / 0, "/")
            } catch (t) {}
        }
        function S(e) {
            try {
                var t = e.name
                    , n = e.gender
                    , r = e.birthday
                    , o = e.clear_hour
                    , i = e.is_solar
                    , a = localStorage.getItem("zx_user_info");
                a = a ? JSON.parse(a) : {};
                var c = {
                    name: t || a.name,
                    gender: n || a.gender,
                    birth: r || a.birth,
                    clear_hour: "undefined" != o ? o : a.clear_hour,
                    is_solar: "undefined" != i ? i : a.is_solar
                };
                localStorage.setItem("zx_user_info", JSON.stringify(c))
            } catch (u) {}
        }
        function I() {
            return new RegExp("^/".concat(c.e, "/")).test(location.pathname)
        }
        function x(e) {
            var t = e;
            return I() && (t = "".concat(c.e, "/").concat(e)),
                t
        }
        function R(e) {
            var t = "/pay/".concat(e);
            return I() && (t = "/".concat(c.e, "/pay/").concat(e)),
                t
        }
    },
    261: function(e, t, n) {},
    268: function(e, t, n) {},
    269: function(e, t, n) {
        var r = {
            "./index/components/form/index": [182, 0, 3, 24],
            "./index/components/hot/index": [191, 9],
            "./index/components/input/index": [172, 18],
            "./index/components/video/index": [183, 4],
            "./index/index": [186, 0, 2, 3, 4, 7],
            "./pay/components/gong/index": [163, 16],
            "./pay/components/header/index": [173, 15],
            "./pay/components/payment/index": [184, 0, 5, 17],
            "./pay/components/payment/pay-tips/index": [174, 12],
            "./pay/components/progress/index": [187, 19],
            "./pay/components/table/index": [175, 14],
            "./pay/index": [188, 0, 2, 5, 10],
            "./redirection/index": [276, 28],
            "./result/components/analyses-box/index": [164, 20],
            "./result/components/hot-item/index": [189, 11],
            "./result/components/jiri/index": [165, 21],
            "./result/components/method-box/index": [166, 22],
            "./result/components/result-data/index": [176, 1, 8],
            "./result/components/score-box/index": [177, 1, 13],
            "./result/components/top-info/index": [167, 23],
            "./result/index": [190, 0, 1, 2, 6]
        };
        function o(e) {
            if (!n.o(r, e))
                return Promise.resolve().then((function() {
                        var t = new Error("Cannot find module '" + e + "'");
                        throw t.code = "MODULE_NOT_FOUND",
                            t
                    }
                ));
            var t = r[e]
                , o = t[0];
            return Promise.all(t.slice(1).map(n.e)).then((function() {
                    return n(o)
                }
            ))
        }
        o.keys = function() {
            return Object.keys(r)
        }
            ,
            o.id = 269,
            e.exports = o
    },
    275: function(e, t, n) {
        "use strict";
        n.r(t);
        n(193),
            n(223),
            n(245),
            n(247),
            n(248);
        var r = n(94)
            , o = n.n(r)
            , i = n(40)
            , a = n(30)
            , c = (n(51),
            n(112),
            n(38),
            n(48),
            n(113),
            n(114),
            n(104),
            n(110),
            n(47),
            n(70),
            n(39),
            n(71))
            , u = n.n(c)
            , s = n(52)
            , l = n(118)
            , p = (n(108),
            n(109))
            , f = n(19)
            , d = n(26)
            , m = n(17)
            , _ = n.n(m);
        function g(e, t) {
            var n = Object.keys(e);
            if (Object.getOwnPropertySymbols) {
                var r = Object.getOwnPropertySymbols(e);
                t && (r = r.filter((function(t) {
                        return Object.getOwnPropertyDescriptor(e, t).enumerable
                    }
                ))),
                    n.push.apply(n, r)
            }
            return n
        }
        function b(e) {
            for (var t = 1; t < arguments.length; t++) {
                var n = null != arguments[t] ? arguments[t] : {};
                t % 2 ? g(Object(n), !0).forEach((function(t) {
                        Object(s.a)(e, t, n[t])
                    }
                )) : Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(n)) : g(Object(n)).forEach((function(t) {
                        Object.defineProperty(e, t, Object.getOwnPropertyDescriptor(n, t))
                    }
                ))
            }
            return e
        }
        var O = {
            single_page: !0,
            server_url: "//sdklog.linghit.com/",
            cookie_name: "ma_id",
            show_log: !1
        }
            , y = function() {
            var e = Object(p.a)(u.a.mark((function e(t) {
                    var n, r, o, i, a, c, s, p, m, g;
                    return u.a.wrap((function(e) {
                            for (; ; )
                                switch (e.prev = e.next) {
                                    case 0:
                                        if (n = t.app_id,
                                                r = t.product_id,
                                                o = t.attr,
                                                i = void 0 === o ? {} : o,
                                                a = Object(l.a)(t, ["app_id", "product_id", "attr"]),
                                                n) {
                                            e.next = 3;
                                            break
                                        }
                                        return e.abrupt("return");
                                    case 3:
                                        c = Object(d.d)("u_id"),
                                            s = new RegExp("^/".concat(f.e, "/")),
                                        s.test(location.pathname) && (r = Object(d.d)("resource_id") || _.a.get("ltvId") || "X01"),
                                            p = b({
                                                attr: i,
                                                app_id: n,
                                                product_id: r,
                                                user_center_id: c
                                            }, a),
                                            m = Object.assign({}, O, p),
                                            g = null,
                                            function e() {
                                                clearTimeout(g),
                                                    window.sense ? sense.init(m) : g = setTimeout(e, 10)
                                            }();
                                    case 10:
                                    case "end":
                                        return e.stop()
                                }
                        }
                    ), e)
                }
            )));
            return function(t) {
                return e.apply(this, arguments)
            }
        }();
        n(261);
        y({
            app_id: a.a.BIG_DATA_ID,
            product_id: a.a.ZUI_XIAO_LI_DU_ID
        }),
            Object(i.b)(o.a.project_id);
        var h = n(0)
            , v = n.n(h)
            , E = n(162)
            , j = n(72);
        var w = function(e, t) {
            if (t.firstElementChild) {
                var n = document.createElement("div");
                n.setAttribute("style", "position:relative; z-index:-1;"),
                    Object(j.render)(e, n),
                    t.appendChild(n),
                    window.addEventListener("load", (function() {
                            Object(E.a)(t.children).forEach((function(e) {
                                    e !== n && t.removeChild(e)
                                }
                            )),
                                n.style.zIndex = "auto",
                                n = null
                        }
                    ))
            } else
                Object(j.render)(e, t)
        }
            , A = (n(103),
            n(49),
            n(9))
            , S = n(117)
            , I = n(105)
            , x = (n(37),
            n(107),
            n(160))
            , R = n.n(x)
            , T = (n(268),
                function(e) {
                    return e.isLoading ? e.timedOut ? (Object(i.a)({
                        msg: "\u52a0\u8f7djs\u6587\u4ef6\u8d85\u65f6",
                        from: window.location.href
                    }),
                        v.a.createElement("div", {
                            className: "ignore-lds-wrap"
                        }, v.a.createElement("button", {
                            onClick: function() {
                                return location.reload(!0)
                            }
                        }, "\u91cd\u65b0\u52a0\u8f7d"))) : e.pastDelay ? v.a.createElement("div", {
                        className: "ignore-lds-wrap"
                    }, v.a.createElement("div", {
                        className: "ignore-lds-ring"
                    })) : null : e.error ? (console.log(e.error),
                        Object(i.a)({
                            msg: e.error,
                            from: window.location.href
                        }),
                        v.a.createElement("div", {
                            className: "ignore-lds-wrap"
                        }, v.a.createElement("button", {
                            onClick: function() {
                                return location.reload(!0)
                            }
                        }, "\u91cd\u65b0\u52a0\u8f7d"))) : null
                }
        )
            , P = a.a.BASE_NAME
            , D = Object(d.b)(P)
            , C = function(e) {
            return R()({
                loader: function() {
                    return n(269)("./".concat(e, "/index"))
                },
                loading: T,
                delay: 300
            })
        }
            , N = C("index")
            , U = C("result")
            , L = C("pay")
            , k = C("redirection")
            , B = [{
            path: "/".concat(D, "/index"),
            component: N,
            belong: "index"
        }, {
            path: "/".concat(D, "/result"),
            component: U,
            belong: "result"
        }, {
            path: "/".concat(D, "/pay"),
            component: L,
            belong: "pay"
        }, {
            component: k
        }];
        B.forEach((function(e) {
                e.cms_id = "".concat(P),
                    e.project = P,
                    e.is_t = a.a.GENERATED_CONFIG.is_t,
                    e.project_id = a.a.PRODUCT_ID,
                    e.name = a.a.BID_DATA_TRACK_NAME
            }
        ));
        var H = B
            , G = function() {
            var e = Object(A.g)().pathname;
            return Object(h.useEffect)((function() {
                    window.sense && sense.track(["$Scan", "$EnterPage"], {
                        $url: location.href,
                        $title: document.title
                    })
                }
            ), [e]),
                null
        }
            , M = function() {
            return v.a.createElement(S.a, null, v.a.createElement(G, null), v.a.createElement(I.b, null, v.a.createElement(A.d, null, H.map((function(e, t) {
                    return v.a.createElement(A.b, {
                        key: t,
                        path: e.path,
                        render: function(t) {
                            return v.a.createElement(e.component, Object.assign({}, t, {
                                belong: e.belong,
                                project: e.project,
                                cms_id: e.cms_id,
                                is_t: e.is_t,
                                project_id: e.project_id,
                                name: e.name
                            }))
                        }
                    })
                }
            )))))
        };
        w(v.a.createElement(M, null), document.getElementById("root"))
    },
    30: function(e, t, n) {
        "use strict";
        n(51),
            n(112),
            n(38),
            n(113),
            n(114),
            n(104),
            n(39);
        var r = n(52)
            , o = n(19);
        function i(e, t) {
            var n = Object.keys(e);
            if (Object.getOwnPropertySymbols) {
                var r = Object.getOwnPropertySymbols(e);
                t && (r = r.filter((function(t) {
                        return Object.getOwnPropertyDescriptor(e, t).enumerable
                    }
                ))),
                    n.push.apply(n, r)
            }
            return n
        }
        function a(e) {
            for (var t = 1; t < arguments.length; t++) {
                var n = null != arguments[t] ? arguments[t] : {};
                t % 2 ? i(Object(n), !0).forEach((function(t) {
                        Object(r.a)(e, t, n[t])
                    }
                )) : Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(n)) : i(Object(n)).forEach((function(t) {
                        Object.defineProperty(e, t, Object.getOwnPropertyDescriptor(n, t))
                    }
                ))
            }
            return e
        }
        var c = n(94)
            , u = 1 === c.is_t ? c.tid : c.fields.base_name
            , s = Object(o.g)(u)
            , l = a({}, s.PAGE)
            , p = a({
            PAY_CONFIG: "/api/config/pay/"
        }, s.API)
            , f = a(a({}, s), {}, {
            API: p,
            PAGE: l,
            GENERATED_CONFIG: c,
            PRODUCT_ID: "jing_pin_he_hun_tf",
            BIG_DATA_ID: "A345",
            ZUI_XIAO_LI_DU_ID: "160644899700000080",
            BID_DATA_TRACK_NAME: "\u7cbe\u54c1\u5408\u5a5a\u6295\u653e",
            NewSiteROUTER: o.e
        });
        t.a = f
    },
    40: function(e, t, n) {
        "use strict";
        n.d(t, "a", (function() {
                return o
            }
        ));
        n(48),
            n(47),
            n(115);
        var r = {
            id: n(19).f,
            url: "https://error.youjyi.cn/api/errrorlog/receive",
            random: 1,
            offlineLog: !1,
            submit: function(e) {
                var t = BJ_REPORT.urlSearchParse(e.split("?")[1])
                    , n = BJ_REPORT.urlQueryParse(t);
                BJ_REPORT.request.ajax({
                    url: "https://error.youjyi.cn/api/errrorlog/receive",
                    type: "POST",
                    data: n,
                    success: function(e) {},
                    error: function(e) {}
                })
            },
            onReport: function(e, t) {}
        }
            , o = function() {
            var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {
                msg: {},
                target: "unknow",
                from: location.href,
                rowNum: "0",
                colNum: "0"
            };
            "object" === typeof e.msg && (e.msg = JSON.stringify(e.msg)),
            window.BJ_REPORT && BJ_REPORT.report(e)
        };
        t.b = function() {
            var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : "unknow"
                , t = null
                , n = function n() {
                if (clearTimeout(t),
                        window.BJ_REPORT) {
                    var o = Object.assign({}, r, {
                        uin: e
                    });
                    BJ_REPORT.init(o)
                } else
                    t = setTimeout(n, 1e3)
            };
            n()
        }
    },
    //94: function(e, t) {
    //    e.exports = {
    //        display_name: "\u59d3\u540d\u5408\u5a5a",
    //        fields: {
    //            base_name: "jingpinhehuntf"
    //        },
    //        tid: "new_career",
    //        project_id: "jingpinhehuntf",
    //        temp_url: ""
    //    }
    //}
}, [[192, 26, 27]]]);
