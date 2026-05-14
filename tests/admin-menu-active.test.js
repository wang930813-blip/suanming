const assert = require('assert');
const AdminMenuActive = require('../static/js/admin-menu-active');

function test(name, fn) {
    try {
        fn();
        console.log(`PASS ${name}`);
    } catch (error) {
        console.error(`FAIL ${name}`);
        console.error(error.stack);
        process.exitCode = 1;
    }
}

test('matches menu links by ct and ac regardless of absolute path', () => {
    assert.strictEqual(
        AdminMenuActive.urlsMatch(
            'https://zhi.wangzi.cc.cd/acs/?ct=system&ac=index',
            '/acs/?ct=system&ac=index'
        ),
        true
    );
});

test('does not match same controller with different action', () => {
    assert.strictEqual(
        AdminMenuActive.urlsMatch(
            'https://zhi.wangzi.cc.cd/acs/?ct=system&ac=index_m',
            '/acs/?ct=system&ac=index'
        ),
        false
    );
});

test('uses index defaults for missing ct and ac', () => {
    assert.deepStrictEqual(
        AdminMenuActive.getRouteKey('https://zhi.wangzi.cc.cd/acs/'),
        { ct: 'index', ac: 'index' }
    );
});

test('marks matching child menu and opens parent menu', () => {
    function createClassList(initial) {
        const values = new Set(initial ? initial.split(/\s+/).filter(Boolean) : []);
        return {
            add(value) {
                values.add(value);
            },
            remove(value) {
                values.delete(value);
            },
            contains(value) {
                return values.has(value);
            }
        };
    }

    const parent = { classList: createClassList('layui-nav-item') };
    const child = { classList: createClassList('') };
    const link = {
        getAttribute(name) {
            return name === 'href' ? '/acs/?ct=system&ac=index' : '';
        },
        closest(selector) {
            if (selector === 'dd') return child;
            if (selector === '.layui-nav-item') return parent;
            return null;
        }
    };
    const nav = {
        querySelectorAll(selector) {
            if (selector === '.layui-this' || selector === '.layui-nav-itemed') return [];
            if (selector === 'a[href]') return [link];
            return [];
        }
    };
    const documentRef = {
        querySelector(selector) {
            return selector === '.layui-nav-tree[lay-filter="side-nav"]' ? nav : null;
        }
    };

    assert.strictEqual(
        AdminMenuActive.applyActiveState(documentRef, 'https://zhi.wangzi.cc.cd/acs/?ct=system&ac=index'),
        true
    );
    assert.strictEqual(child.classList.contains('layui-this'), true);
    assert.strictEqual(parent.classList.contains('layui-nav-itemed'), true);
});
