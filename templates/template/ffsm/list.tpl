<!DOCTYPE html>
<html>
<head>
<title>测算集合页</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Cache-Control" content="no-cache" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0" />
<link href="static/css/public.css" rel="stylesheet" type="text/css">
<link href="static/css/scjihe.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="static/js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="static/js/resizeevts.js"></script>
<{$page_meta}>
</head>
<body>

<section class="wrapper"> 
  <!--产品列表-->
  <section class="listBox">
    <!---->
    <div class="listClass">
        <{foreach from=$categories item=cat name=cat_loop}>
        <a data-type="<{$cat.code}>" href="javascript:void(0)" <{if $smarty.foreach.cat_loop.first}>class="current"<{/if}>><{$cat.name}></a>
        <{/foreach}>
    </div>
    <!---->
    <div class="listRight">
      <!---->
      <{foreach from=$categories item=cat name=cat_loop}>
      <{assign var="code" value=$cat.code}>
      <{if isset($test_data.$code)}>
      <div class="listProd" <{if $smarty.foreach.cat_loop.first}>style="display: block;"<{else}>style="display: none;"<{/if}>>
        <{foreach from=$test_data.$code.items item=item}>
        <a href="<{$item.link}>">
          <dl>
            <dt><img src="<{$item.image}>" alt="<{$item.title}>"/></dt>
            <dd>
              <b><{$item.title}></b><br>
              <span><{$item.description}></span><br>
              <i>
                <img src="static/picture/ce.png" alt=""/> <{$item.test_count}>人次已测算&nbsp;&nbsp;
                <img src="static/picture/zan.png" alt=""/> <{$item.rate}>好评
              </i>
            </dd>
          </dl>
        </a>
        <{/foreach}>
      </div>
      <{/if}>
      <{/foreach}>
        
      <div class="listMore"><a href="/?ct=test_list&ac=index">更多测试，马上去看看吧 ></a></div>
      <!---->
    </div>
    <!---->
  </section>
  <!--产品列表-->
  <!--底部浮动菜单-->
  <section class="indexMenu">
    <a href="/">发现</a>
    <a href="javascript:void(0);" class="current">测算大全</a>
    <a href="/?ac=jrys">个人中心</a>
  </section>
  <!--底部浮动菜单-->
</section>

<script>
//列表分类切换
$('.listClass a').click(function() {
	let index = $(this).index();
	$('.listClass a').removeClass('current').eq(index).addClass('current');
	$('.listProd').hide().eq(index).show();
})
</script>

</body>
</html>
