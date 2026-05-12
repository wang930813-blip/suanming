<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<title>商城首页-<{$zhanming}></title>
<meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta content="yes" name="apple-mobile-web-app-capable">
<meta content="black" name="apple-mobile-web-app-status-bar-style">
<meta content="telephone=no" name="format-detection">
<link rel="shortcut icon" href="/statics/ffsm/favicon.ico">
<link href="css/shop.css" rel="stylesheet" type="text/css">
<script src="ziwei/js/jquery-3.4.1.min.js"></script>
<style>
* { margin: 0; padding: 0; box-sizing: border-box; }
body { background: #f5f5f5 !important; font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif; }
.header { height: 50px; background: #fff; display: flex; align-items: center; justify-content: space-between; padding: 0 15px; box-shadow: 0 2px 10px rgba(0,0,0,0.05); position: sticky; top: 0; z-index: 100; }
.header-back { width: 24px; height: 24px; cursor: pointer; }
.header-title { font-size: 16px; font-weight: 600; color: #333; position: absolute; left: 50%; transform: translateX(-50%); }
.header-right { width: 24px; }
.goods-item-btn { background: #f5a623 !important; color: #333 !important; border-radius: 6px !important; font-weight: 600 !important; }

/* 左右布局 */
.shop-layout { display: flex; min-height: calc(100vh - 50px); }
.shop-sidebar { width: 90px; background: #fff; border-right: 1px solid #eee; position: sticky; top: 50px; height: calc(100vh - 50px); overflow-y: auto; flex-shrink: 0; }
.shop-main { flex: 1; padding: 10px; background: #fafafa; }

/* 左侧分类样式 */
.category-list-vertical { display: flex; flex-direction: column; padding: 10px 0; }
.category-item-vertical { 
    display: block; 
    padding: 15px 10px; 
    text-align: center; 
    color: #1890ff; 
    text-decoration: none; 
    font-size: 13px;
    transition: all 0.3s;
    word-break: break-all;
}
.category-item-vertical:hover { background: #f5f5f5; }
.category-item-vertical.active { color: #ff4d4f !important; font-weight: 400; background: transparent !important; }
.category-item-vertical:first-child { color: #ff4d4f; }
</style>
<{$page_meta}>
</head>
<body>
<div class="header">
    <a href="javascript:history.back();" class="header-back">
        <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
            <path d="M19 12H5M12 19l-7-7 7-7"/>
        </svg>
    </a>
    <div class="header-title">商城首页</div>
    <div class="header-right"></div>
</div>

<!-- 左右布局 -->
<div class="shop-layout">
    <!-- 左侧分类 -->
    <div class="shop-sidebar">
        <div class="category-list-vertical">
            <a href="/?ct=shop&ac=index" class="category-item-vertical active">全部商品</a>
            <{foreach from=$category_tree item=cat}>
            <a href="/?ct=shop&ac=goods_list&cid=<{$cat.id}>" class="category-item-vertical"><{$cat.name}></a>
            <{/foreach}>
        </div>
    </div>
    
    <!-- 右侧商品 -->
    <div class="shop-main">
        <{if $home_goods || $goods_list || $all_goods}>
        <div class="goods-grid">
            <{foreach from=$home_goods|default:$goods_list|default:$all_goods item=goods}>
            <div class="goods-item">
                <a href="/?ct=shop&ac=goods_detail&id=<{$goods.id}>">
                    <div class="goods-thumb">
                        <img src="<{$goods.thumb}>" alt="<{$goods.goods_name}>">
                        <{if $goods.goods_type == 2}>
                        <span class="goods-tag">虚拟</span>
                        <{/if}>
                    </div>
                    <div class="goods-info">
                        <div class="goods-name"><{$goods.goods_name}></div>
                        <div class="goods-price">
                            <span class="price-current">¥<{$goods.price}></span>
                            <{if $goods.market_price > 0}>
                            <span class="price-market">¥<{$goods.market_price}></span>
                            <{/if}>
                        </div>
                        <div class="goods-sales">已售<{$goods.sales}></div>
                    </div>
                </a>
            </div>
            <{/foreach}>
        </div>
        <{else}>
        <div style="text-align: center; padding: 50px 0; color: #999; font-size: 14px;">
            该分类暂无商品
        </div>
        <{/if}>
    </div>
</div>

<!-- 底部导航 -->
<{include file='./ffsm/tabBar.tpl'}>

<script>
// 添加购物车动画等交互
</script>

</body>
</html>
