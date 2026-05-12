<?php /* Smarty version 2.6.25, created on 2025-12-05 16:05:50
         compiled from admin/header.html */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'default', 'admin/header.html', 6, false),)), $this); ?>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title><?php echo ((is_array($_tmp=@$this->_tpl_vars['web_title'])) ? $this->_run_mod_handler('default', true, $_tmp, "管理后台") : smarty_modifier_default($_tmp, "管理后台")); ?>
 - 狗凯之家源码网在线测算</title>
    <link rel="stylesheet" href="/ffsm/statics/ffsm/kmmb/layui/css/layui.css">
    <script src="/ffsm/static/js/jquery-3.4.1.min.js"></script>
    <style>
        /* 全局美化 */
        body {
            background-color: #f2f2f2;
        }
        
        /* 顶部导航栏 */
        .layui-layout-admin .layui-header {
            background: linear-gradient(135deg, #2f4056 0%, #394a5f 100%);
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        
        .layui-logo {
            display: flex;
            align-items: center;
            gap: 8px;
        }
        
        .layui-logo i {
            font-size: 24px;
        }
        
        /* 侧边栏美化 */
        .layui-side {
            background-color: #2f4056;
        }
        
        .layui-side-scroll {
            background-color: #2f4056;
        }
        
        .layui-nav-tree .layui-nav-item a {
            color: rgba(255,255,255,0.85);
            transition: all 0.3s ease;
        }
        
        .layui-nav-tree .layui-nav-item a:hover {
            background-color: rgba(255,255,255,0.1);
            color: #fff;
        }
        
        .layui-nav-tree .layui-this > a {
            background-color: #1E9FFF !important;
            color: #fff !important;
        }
        
        .layui-nav-tree .layui-nav-child dd.layui-this {
            background-color: #1E9FFF !important;
        }
        
        .layui-nav-tree .layui-nav-child dd.layui-this a {
            color: #fff !important;
        }
        
        .layui-nav-itemed > a {
            background-color: rgba(0,0,0,0.2) !important;
        }
        
        /* 主体内容区美化 */
        .layui-body {
            background-color: #f2f2f2;
        }
        
        /* 卡片美化 */
        .layui-card {
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.08);
            transition: all 0.3s ease;
        }
        
        .layui-card:hover {
            box-shadow: 0 4px 16px rgba(0,0,0,0.12);
        }
        
        .layui-card-header {
            background: linear-gradient(135deg, #fff 0%, #f9f9f9 100%);
            border-bottom: 1px solid #eee;
            font-weight: bold;
            border-radius: 8px 8px 0 0;
        }
        
        /* 表格美化 */
        .layui-table th {
            background-color: #f8f8f8;
            font-weight: bold;
            color: #333;
        }
        
        .layui-table tr:hover {
            background-color: #f9f9f9;
        }
        
        /* 按钮美化 */
        .layui-btn {
            border-radius: 4px;
            transition: all 0.3s ease;
        }
        
        .layui-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0,0,0,0.15);
        }
        
        /* 输入框美化 */
        .layui-input, .layui-select, .layui-textarea {
            border-radius: 4px;
            transition: all 0.3s ease;
        }
        
        .layui-input:focus, .layui-select:focus, .layui-textarea:focus {
            border-color: #1E9FFF;
            box-shadow: 0 0 5px rgba(30,159,255,0.3);
        }
        
        /* 统计卡片美化 */
        .stat-card {
            border-radius: 8px;
            padding: 20px;
            position: relative;
            overflow: hidden;
            transition: all 0.3s ease;
            text-align: center;
        }
        
        .stat-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 20px rgba(0,0,0,0.15);
        }
        
        .stat-card .stat-label {
            font-size: 14px;
            color: #666;
            margin-bottom: 10px;
        }
        
        .stat-card .stat-value {
            font-size: 28px;
            font-weight: bold;
            color: #1E9FFF;
            margin-bottom: 10px;
        }
        
        .stat-card .stat-sub {
            font-size: 12px;
            color: #999;
            line-height: 1.8;
        }
        
        /* 响应式 */
        @media screen and (max-width: 768px) {
            .layui-logo {
                font-size: 16px !important;
            }
        }
    </style>
<?php echo $this->_tpl_vars['page_meta']; ?>

</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">

    <div class="layui-header">
        <div id="logo-area"></div>

  
        <ul class="layui-nav layui-layout-right" style="background-color: transparent;">
            <li class="layui-nav-item">
                <a href="javascript:;" onclick="location.reload()" title="刷新页面">
                    <i class="layui-icon layui-icon-refresh"></i> 刷新
                </a>
            </li>
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <i class="layui-icon layui-icon-username" style="font-size: 20px;"></i> 管理员
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="/acs/?ct=users&ac=editpwd"><i class="layui-icon layui-icon-password"></i> 修改密码</a></dd>
                    <dd><a href="/acs/?ct=index&ac=loginout"><i class="layui-icon layui-icon-logout"></i> 退出登录</a></dd>
                </dl>
            </li>
        </ul>
    </div>
    
    <!-- 左侧导航 -->
    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <ul class="layui-nav layui-nav-tree" lay-filter="side-nav" style="background-color: #2f4056;">
                
                <!-- 首页 -->
                <li class="layui-nav-item">
                    <a href="/acs/?ct=index&ac=index">
                        <i class="layui-icon layui-icon-home"></i> 首页概况
                    </a>
                </li>
                
                <!-- 系统配置 -->
                <li class="layui-nav-item">
                    <a href="javascript:;">
                        <i class="layui-icon layui-icon-set"></i> 系统配置
                    </a>
                    <dl class="layui-nav-child">
                        <dd><a href="/acs/?ct=system&ac=index">系统基本配置</a></dd>
                        <dd><a href="/acs/?ct=system&ac=index_m">测算价格配置</a></dd>
                        <dd><a href="/acs/?ct=ffsm_dsyy&ac=index">在线预约配置</a></dd>
                        <dd><a href="/acs/?ct=system&ac=index_a">系统信息配置</a></dd>
                        <dd><a href="/acs/?ct=system&ac=index_b">代理分成配置</a></dd>
                        <dd><a href="/acs/?ct=system&ac=integral">推广积分配置</a></dd>
                        <dd><a href="/acs/?ct=system&ac=index_d">VIP价格配置</a></dd>
                    </dl>
                </li>
                
                <!-- 付费应用 -->
                <li class="layui-nav-item">
                    <a href="javascript:;">
                        <i class="layui-icon layui-icon-rmb"></i> 付费应用
                    </a>
                    <dl class="layui-nav-child">
                        <dd><a href="/acs/?ct=ffsm_order&ac=index">订单管理</a></dd>
                        <dd><a href="/acs/?ct=ffsm_order&ac=excel">订单导出</a></dd>
                    </dl>
                </li>
                
                <!-- 推广管理 -->
                <li class="layui-nav-item">
                    <a href="javascript:;">
                        <i class="layui-icon layui-icon-share"></i> 推广管理
                    </a>
                    <dl class="layui-nav-child">
                        <dd><a href="/acs/?ct=fxdl&ac=links">推广链接</a></dd>
                        <dd><a href="/acs/?ct=fxdl&ac=index">订单管理</a></dd>
                        <dd><a href="/acs/?ct=fxdltxzh&ac=index">提现管理</a></dd>
                    </dl>
                </li>
                
                <!-- 用户权限 -->
                <li class="layui-nav-item">
                    <a href="javascript:;">
                        <i class="layui-icon layui-icon-user"></i> 用户权限
                    </a>
                    <dl class="layui-nav-child">
                        <dd><a href="/acs/?ct=users&ac=index">账号管理</a></dd>
                        <dd><a href="/acs/?ct=users&ac=edit_purview_groups">组权限管理</a></dd>
                        <dd><a href="/acs/?ct=users&ac=edit_purview_xml">组权限XML配置</a></dd>
                    </dl>
                </li>
                
                <!-- 首页内容管理 -->
                <li class="layui-nav-item">
                    <a href="javascript:;">
                        <i class="layui-icon layui-icon-template"></i> 首页内容管理
                    </a>
                    <dl class="layui-nav-child">
                        <dd><a href="/acs/?ct=home_content&ac=banner">Banner轮播图</a></dd>
                        <dd><a href="/acs/?ct=home_content&ac=hot">本周热门</a></dd>
                        <dd><a href="/acs/?ct=home_content&ac=recommend">精品推荐</a></dd>
                        <dd><a href="/acs/?ct=home_content&ac=products">首页产品</a></dd>
                        <dd><a href="/acs/?ct=home_content&ac=like">猜你喜欢</a></dd>
                    </dl>
                </li>
                
                <!-- 商城管理 -->
                <li class="layui-nav-item">
                    <a href="javascript:;">
                        <i class="layui-icon layui-icon-cart"></i> 商城管理
                    </a>
                    <dl class="layui-nav-child">
                        <dd><a href="/acs/?ct=shop_admin&ac=category">商品分类</a></dd>
                        <dd><a href="/acs/?ct=shop_admin&ac=goods_list">商品列表</a></dd>
                        <dd><a href="/acs/?ct=shop_admin&ac=goods_add">添加商品</a></dd>
                        <dd><a href="/acs/?ct=shop_admin&ac=order_list">订单管理</a></dd>
                        <dd><a href="/acs/?ct=shop_admin&ac=order_ship">待发货订单</a></dd>
                        <dd><a href="/acs/?ct=shop_admin&ac=statistics">销售统计</a></dd>
                    </dl>
                </li>
                
                <!-- 测算列表管理 -->
                <li class="layui-nav-item">
                    <a href="javascript:;">
                        <i class="layui-icon layui-icon-list"></i> 测算列表管理
                    </a>
                    <dl class="layui-nav-child">
                        <dd><a href="/acs/?ct=test_list&ac=index">测算项目</a></dd>
                        <dd><a href="/acs/?ct=test_list&ac=category">分类管理</a></dd>
                    </dl>
                </li>
                
                <!-- 系统日志 -->
                <li class="layui-nav-item">
                    <a href="javascript:;">
                        <i class="layui-icon layui-icon-log"></i> 系统日志
                    </a>
                    <dl class="layui-nav-child">
                        <dd><a href="/acs/?ct=users&ac=log">操作日志</a></dd>
                        <dd><a href="/acs/?ct=users&ac=login_log">登录日志</a></dd>
                    </dl>
                </li>
                
                <!-- 缓存管理 -->
                <li class="layui-nav-item">
                    <a href="/acs/?ct=cache&ac=index">
                        <i class="layui-icon layui-icon-release"></i> 缓存管理
                    </a>
                </li>
                
            </ul>
        </div>
    </div>
    
    <!-- 主体内容 -->
    <div class="layui-body" style="padding: 15px;">
    
    <script src="/ffsm/statics/ffsm/kmmb/layui/layui.js"></script>