(this.webpackJsonp = this.webpackJsonp || []).push([[28, 13], {
    276: function(t, n, e) {
        "use strict";
        e.r(n),
            e.d(n, "default", (function() {
                    return y
                }
            ));
        e(37),
            e(278),
            e(70);
        var r = e(279)
            , o = e(280)
            , c = e(282)
            , u = e(283)
            , i = e(281)
            , a = e(0)
            , f = e.n(a)
            , s = e(9)
            , l = e(94);
        function p(t) {
            var n = function() {
                if ("undefined" === typeof Reflect || !Reflect.construct)
                    return !1;
                if (Reflect.construct.sham)
                    return !1;
                if ("function" === typeof Proxy)
                    return !0;
                try {
                    return Date.prototype.toString.call(Reflect.construct(Date, [], (function() {}
                    ))),
                        !0
                } catch (t) {
                    return !1
                }
            }();
            return function() {
                var e, r = Object(i.a)(t);
                if (n) {
                    var o = Object(i.a)(this).constructor;
                    e = Reflect.construct(r, arguments, o)
                } else
                    e = r.apply(this, arguments);
                return Object(u.a)(this, e)
            }
        }
        var y = function(t) {
            Object(c.a)(e, t);
            var n = p(e);
            function e(t) {
                var o;
                return Object(r.a)(this, e),
                    (o = n.call(this, t)).state = {
                        redirectPath: ""
                    },
                    o
            }
            return Object(o.a)(e, [{
                key: "componentDidMount",
                value: function() {
                    var t = 1 == l.is_t ? l.tid : l.project_id;
                    this.setState({
                        redirectPath: "/".concat(t, "/index")
                    })
                }
            }, {
                key: "render",
                value: function() {
                    var t = this.state;
                    return f.a.createElement("div", null, f.a.createElement(s.a, {
                        to: t.redirectPath
                    }))
                }
            }]),
                e
        }(a.Component)
    },
    278: function(t, n, e) {
        var r = e(1)
            , o = e(12)
            , c = e(5)
            , u = e(2)
            , i = e(11)
            , a = e(50)
            , f = e(289)
            , s = e(7)
            , l = o("Reflect", "construct")
            , p = s((function() {
                function t() {}
                return !(l((function() {}
                ), [], t)instanceof t)
            }
        ))
            , y = !s((function() {
                l((function() {}
                ))
            }
        ))
            , b = p || y;
        r({
            target: "Reflect",
            stat: !0,
            forced: b,
            sham: b
        }, {
            construct: function(t, n) {
                c(t),
                    u(n);
                var e = arguments.length < 3 ? t : c(arguments[2]);
                if (y && !p)
                    return l(t, n, e);
                if (t == e) {
                    switch (n.length) {
                        case 0:
                            return new t;
                        case 1:
                            return new t(n[0]);
                        case 2:
                            return new t(n[0],n[1]);
                        case 3:
                            return new t(n[0],n[1],n[2]);
                        case 4:
                            return new t(n[0],n[1],n[2],n[3])
                    }
                    var r = [null];
                    return r.push.apply(r, n),
                        new (f.apply(t, r))
                }
                var o = e.prototype
                    , s = a(i(o) ? o : Object.prototype)
                    , b = Function.apply.call(t, s, n);
                return i(b) ? b : s
            }
        })
    },
    279: function(t, n, e) {
        "use strict";
        function r(t, n) {
            if (!(t instanceof n))
                throw new TypeError("Cannot call a class as a function")
        }
        e.d(n, "a", (function() {
                return r
            }
        ))
    },
    280: function(t, n, e) {
        "use strict";
        function r(t, n) {
            for (var e = 0; e < n.length; e++) {
                var r = n[e];
                r.enumerable = r.enumerable || !1,
                    r.configurable = !0,
                "value"in r && (r.writable = !0),
                    Object.defineProperty(t, r.key, r)
            }
        }
        function o(t, n, e) {
            return n && r(t.prototype, n),
            e && r(t, e),
                t
        }
        e.d(n, "a", (function() {
                return o
            }
        ))
    },
    281: function(t, n, e) {
        "use strict";
        function r(t) {
            return (r = Object.setPrototypeOf ? Object.getPrototypeOf : function(t) {
                    return t.__proto__ || Object.getPrototypeOf(t)
                }
            )(t)
        }
        e.d(n, "a", (function() {
                return r
            }
        ))
    },
    282: function(t, n, e) {
        "use strict";
        function r(t, n) {
            return (r = Object.setPrototypeOf || function(t, n) {
                        return t.__proto__ = n,
                            t
                    }
            )(t, n)
        }
        function o(t, n) {
            if ("function" !== typeof n && null !== n)
                throw new TypeError("Super expression must either be null or a function");
            t.prototype = Object.create(n && n.prototype, {
                constructor: {
                    value: t,
                    writable: !0,
                    configurable: !0
                }
            }),
            n && r(t, n)
        }
        e.d(n, "a", (function() {
                return o
            }
        ))
    },
    283: function(t, n, e) {
        "use strict";
        function r(t) {
            return (r = "function" === typeof Symbol && "symbol" === typeof Symbol.iterator ? function(t) {
                    return typeof t
                }
                    : function(t) {
                    return t && "function" === typeof Symbol && t.constructor === Symbol && t !== Symbol.prototype ? "symbol" : typeof t
                }
            )(t)
        }
        e.d(n, "a", (function() {
                return c
            }
        ));
        var o = e(285);
        function c(t, n) {
            return !n || "object" !== r(n) && "function" !== typeof n ? Object(o.a)(t) : n
        }
    },
    285: function(t, n, e) {
        "use strict";
        function r(t) {
            if (void 0 === t)
                throw new ReferenceError("this hasn't been initialised - super() hasn't been called");
            return t
        }
        e.d(n, "a", (function() {
                return r
            }
        ))
    },
    289: function(t, n, e) {
        "use strict";
        var r = e(5)
            , o = e(11)
            , c = [].slice
            , u = {}
            , i = function(t, n, e) {
            if (!(n in u)) {
                for (var r = [], o = 0; o < n; o++)
                    r[o] = "a[" + o + "]";
                u[n] = Function("C,a", "return new C(" + r.join(",") + ")")
            }
            return u[n](t, e)
        };
        t.exports = Function.bind || function(t) {
                var n = r(this)
                    , e = c.call(arguments, 1)
                    , u = function() {
                    var r = e.concat(c.call(arguments));
                    return this instanceof u ? i(n, r.length, r) : n.apply(t, r)
                };
                return o(n.prototype) && (u.prototype = n.prototype),
                    u
            }
    }
}]);
