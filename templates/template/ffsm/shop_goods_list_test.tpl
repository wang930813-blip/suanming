<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<title>商品列表-<{$zhanming}></title>
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<link href="/css/shop.css" rel="stylesheet" type="text/css">
<style>
* { margin: 0; padding: 0; box-sizing: border-box; }
body { background: #f5f5f5 !important; font-family: -apple-system, sans-serif; }
.header { height: 50px; background: #fff; display: flex; align-items: center; padding: 0 15px; }
.header-title { font-size: 16px; font-weight: 600; color: #333; margin: 0 auto; }
.shop-layout { display: flex; min-height: calc(100vh - 50px); }
.shop-sidebar { width: 90px; background: #fff; border-right: 1px solid #eee; }
.shop-main { flex: 1; padding: 10px; background: #fafafa; }
.category-item-vertical { 
    display: block; padding: 15px 10px; text-align: center; 
    color: #1890ff; text-decoration: none; font-size: 13px;
}
.category-item-vertical.active { color: #ff4d4f !important; }
</style>
<{$page_meta}>
</head>
<body>
<div class="header">
    <div class="header-title">商品列表</div>
</div>

<div class="shop-layout">
    <div class="shop-sidebar">
        <a href="/?ct=shop&ac=goods_list" class="category-item-vertical <{if !$cid}>active<{/if}>">全部</a>
        <{foreach from=$category_tree item=cat}>
        <a href="/?ct=shop&ac=goods_list&cid=<{$cat.id}>" class="category-item-vertical <{if $cid == $cat.id}>active<{/if}>"><{$cat.name}></a>
        <{/foreach}>
    </div>
    
    <div class="shop-main">
        <p>共<{$total}>件商品</p>
        
        <{if $goods_list}>
        <div class="goods-grid">
            <{foreach from=$goods_list item=goods}>
            <div class="goods-item">
                <a href="/?ct=shop&ac=goods_detail&id=<{$goods.id}>">
                    <img src="<{$goods.thumb}>" alt="<{$goods.goods_name}>" style="width:100%;">
                    <div><{$goods.goods_name}></div>
                    <div>¥<{$goods.price}></div>
                </a>
            </div>
            <{/foreach}>
        </div>
        <{else}>
        <p>暂无商品</p>
        <{/if}>
    </div>
</div>

</body>
</html>
