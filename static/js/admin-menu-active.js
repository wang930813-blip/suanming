(function (root, factory) {
    if (typeof module === 'object' && module.exports) {
        module.exports = factory();
    } else {
        root.AdminMenuActive = factory();
    }
}(typeof self !== 'undefined' ? self : this, function () {
    function parseQuery(url) {
        var query = '';
        var questionIndex = url.indexOf('?');
        if (questionIndex >= 0) {
            query = url.slice(questionIndex + 1);
        }

        var hashIndex = query.indexOf('#');
        if (hashIndex >= 0) {
            query = query.slice(0, hashIndex);
        }

        var params = {};
        if (!query) {
            return params;
        }

        query.split('&').forEach(function (part) {
            if (!part) {
                return;
            }

            var pair = part.split('=');
            var key = decodeURIComponent(pair.shift() || '');
            var value = decodeURIComponent(pair.join('=') || '');
            if (key) {
                params[key] = value;
            }
        });

        return params;
    }

    function getRouteKey(url) {
        var params = parseQuery(url);
        return {
            ct: params.ct || 'index',
            ac: params.ac || 'index'
        };
    }

    function urlsMatch(currentUrl, linkUrl) {
        var current = getRouteKey(currentUrl);
        var link = getRouteKey(linkUrl);
        return current.ct === link.ct && current.ac === link.ac;
    }

    function clearActiveState(nav) {
        var activeItems = nav.querySelectorAll('.layui-this');
        for (var i = 0; i < activeItems.length; i++) {
            activeItems[i].classList.remove('layui-this');
        }

        var openedItems = nav.querySelectorAll('.layui-nav-itemed');
        for (var j = 0; j < openedItems.length; j++) {
            openedItems[j].classList.remove('layui-nav-itemed');
        }
    }

    function applyActiveState(documentRef, currentUrl) {
        var nav = documentRef.querySelector('.layui-nav-tree[lay-filter="side-nav"]');
        if (!nav) {
            return false;
        }

        clearActiveState(nav);

        var links = nav.querySelectorAll('a[href]');
        for (var i = 0; i < links.length; i++) {
            var link = links[i];
            var href = link.getAttribute('href');
            if (!href || href === 'javascript:;') {
                continue;
            }

            if (!urlsMatch(currentUrl, href)) {
                continue;
            }

            var dd = closest(link, 'dd');
            var item = closest(link, '.layui-nav-item');

            if (dd) {
                dd.classList.add('layui-this');
            } else if (item) {
                item.classList.add('layui-this');
            }

            if (item) {
                item.classList.add('layui-nav-itemed');
            }

            return true;
        }

        return false;
    }

    function closest(element, selector) {
        if (element.closest) {
            return element.closest(selector);
        }

        while (element) {
            if (matches(element, selector)) {
                return element;
            }
            element = element.parentElement;
        }

        return null;
    }

    function matches(element, selector) {
        var fn = element.matches || element.msMatchesSelector || element.webkitMatchesSelector;
        return fn ? fn.call(element, selector) : false;
    }

    function init() {
        applyActiveState(document, window.location.href);
    }

    return {
        getRouteKey: getRouteKey,
        urlsMatch: urlsMatch,
        applyActiveState: applyActiveState,
        init: init
    };
}));
