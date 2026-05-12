/**
 * 后台菜单配置
 * 数据驱动，易于维护和扩展
 */

// 菜单配置数据
const MENU_CONFIG = [
    {
        id: 'home',
        title: '首页概况总览',
        icon: 'layui-icon-home',
        url: '/acs/?ct=index&ac=index',
        match: ['ct=index&ac=index']
    },
    {
        id: 'system',
        title: '系统配置',
        icon: 'layui-icon-set',
        match: ['ct=system', 'ct=ffsm_dsyy&ac=index', 'ct=users&ac=index'],
        children: [
            { title: '系统基本配置', url: '/acs/?ct=system&ac=index', match: ['ct=system&ac=index'] },
            { title: '测算价格配置', url: '/acs/?ct=system&ac=index_m', match: ['ct=system&ac=index_m'] },
            { title: '在线预约配置', url: '/acs/?ct=ffsm_dsyy&ac=index', match: ['ct=ffsm_dsyy&ac=index'] },
            { title: '系统信息配置', url: '/acs/?ct=system&ac=index_a', match: ['ct=system&ac=index_a'] },
            { title: '代理分成配置', url: '/acs/?ct=system&ac=index_b', match: ['ct=system&ac=index_b'] },
            { title: '推广积分配置', url: '/acs/?ct=system&ac=integral', match: ['ct=system&ac=integral'] },
            { title: 'VIP价格配置', url: '/acs/?ct=system&ac=index_d', match: ['ct=system&ac=index_d'] },
            { title: '账号管理', url: '/acs/?ct=users&ac=index', match: ['ct=users&ac=index'] }
        ]
    },
    {
        id: 'order',
        title: '付费应用',
        icon: 'layui-icon-rmb',
        match: ['ct=ffsm_order'],
        children: [
            { title: '订单管理', url: '/acs/?ct=ffsm_order&ac=index', match: ['ct=ffsm_order&ac=index'] },
            { title: '订单导出', url: '/acs/?ct=ffsm_order&ac=excel', match: ['ct=ffsm_order&ac=excel'] }
        ]
    },
    {
        id: 'promotion',
        title: '推广管理',
        icon: 'layui-icon-share',
        match: ['ct=fxdl', 'ct=fxdltxzh'],
        children: [
            { title: '推广链接', url: '/acs/?ct=fxdl&ac=links', match: ['ct=fxdl&ac=links'] },
            { title: '订单管理', url: '/acs/?ct=fxdl&ac=index', match: ['ct=fxdl&ac=index'] },
            { title: '提现管理', url: '/acs/?ct=fxdltxzh&ac=index', match: ['ct=fxdltxzh&ac=index'] }
        ]
    },
    {
        id: 'home_content',
        title: '首页内容管理',
        icon: 'layui-icon-website',
        match: ['ct=home_content'],
        children: [
            { title: 'Banner轮播图', url: '/acs/?ct=home_content&ac=banner', match: ['ct=home_content&ac=banner'] },
            { title: '本周热门', url: '/acs/?ct=home_content&ac=hot', match: ['ct=home_content&ac=hot'] },
            { title: '精品推荐', url: '/acs/?ct=home_content&ac=recommend', match: ['ct=home_content&ac=recommend'] },
            { title: '首页产品', url: '/acs/?ct=home_content&ac=products', match: ['ct=home_content&ac=products'] }
        ]
    },
    {
        id: 'account',
        title: '账号管理',
        icon: 'layui-icon-user',
        match: ['ct=users&ac=edit_purview', 'ct=users&ac=editpwd'],
        children: [
            { title: '组权限管理', url: '/acs/?ct=users&ac=edit_purview_groups', match: ['ct=users&ac=edit_purview_groups'] },
            { title: '组权限XML配置', url: '/acs/?ct=users&ac=edit_purview_xml', match: ['ct=users&ac=edit_purview_xml'] },
            { title: '修改密码', url: '/acs/?ct=users&ac=editpwd', match: ['ct=users&ac=editpwd'] }
        ]
    },
    {
        id: 'logs',
        title: '系统其他',
        icon: 'layui-icon-log',
        match: ['ct=users&ac=log', 'ct=users&ac=login_log'],
        children: [
            { title: '操作日志', url: '/acs/?ct=users&ac=log', match: ['ct=users&ac=log'] },
            { title: '登录日志', url: '/acs/?ct=users&ac=login_log', match: ['ct=users&ac=login_log'] }
        ]
    },
    {
        id: 'cache',
        title: '缓存管理',
        icon: 'layui-icon-release',
        url: '/acs/?ct=cache&ac=index',
        match: ['ct=cache&ac=index']
    }
];

/**
 * 判断菜单项是否激活
 * @param {Array} matchRules - 匹配规则数组
 * @returns {boolean}
 */
function isMenuActive(matchRules) {
    if (!matchRules || matchRules.length === 0) return false;
    
    const currentUrl = window.location.href;
    return matchRules.some(rule => currentUrl.includes(rule));
}

/**
 * 生成菜单HTML
 * @returns {string}
 */
function generateMenu() {
    let html = '';
    
    MENU_CONFIG.forEach(menu => {
        const isActive = isMenuActive(menu.match);
        const hasChildren = menu.children && menu.children.length > 0;
        
        if (hasChildren) {
            // 有子菜单的项目
            html += `<li class="layui-nav-item ${isActive ? 'layui-nav-itemed' : ''}">`;
            html += `    <a href="javascript:;">`;
            html += `        <i class="layui-icon ${menu.icon}"></i> ${menu.title}`;
            html += `    </a>`;
            html += `    <dl class="layui-nav-child">`;
            
            menu.children.forEach(child => {
                const childActive = isMenuActive(child.match);
                html += `        <dd class="${childActive ? 'layui-this' : ''}">`;
                html += `            <a href="${child.url}">${child.title}</a>`;
                html += `        </dd>`;
            });
            
            html += `    </dl>`;
            html += `</li>`;
        } else {
            // 无子菜单的项目
            html += `<li class="layui-nav-item ${isActive ? 'layui-this' : ''}">`;
            html += `    <a href="${menu.url}">`;
            html += `        <i class="layui-icon ${menu.icon}"></i> ${menu.title}`;
            html += `    </a>`;
            html += `</li>`;
        }
    });
    
    return html;
}

/**
 * 初始化菜单
 */
function initMenu() {
    const menuContainer = document.querySelector('.side-menu-container');
    if (menuContainer) {
        menuContainer.innerHTML = generateMenu();
        
        // 重新渲染Layui导航
        if (typeof layui !== 'undefined') {
            layui.use('element', function(){
                var element = layui.element;
                element.render('nav', 'side-nav');
            });
        }
    }
}

// 页面加载完成后初始化菜单
document.addEventListener('DOMContentLoaded', initMenu);
