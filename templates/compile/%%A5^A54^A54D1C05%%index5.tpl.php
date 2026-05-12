<?php /* Smarty version 2.6.25, created on 2025-12-05 16:05:51
         compiled from ffsm/index5.tpl */ ?>
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
<link rel="stylesheet" href="static/css/swiper.min.css">
<link rel="stylesheet" href="static/css/layer.css">
<script type="text/javascript" src="static/js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="static/js/resizeevts.js"></script>
<script type="text/javascript" src="static/js/swiper.min.js"></script>
<script type="text/javascript" src="static/js/layer.js"></script>
<?php echo $this->_tpl_vars['page_meta']; ?>

</head>
<body>

<section class="wrapper">
  <!--banner-->
  <section class="indexBann">
    <ul class="swiper-wrapper">
        <?php $_from = $this->_tpl_vars['home_banner']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['banner']):
?>
              <li class="swiper-slide"><a href="<?php echo $this->_tpl_vars['banner']['link']; ?>
"><img src="<?php echo $this->_tpl_vars['banner']['image']; ?>
" alt="<?php echo $this->_tpl_vars['banner']['title']; ?>
"/></a></li>
        <?php endforeach; endif; unset($_from); ?>
    </ul>
  </section>
  <!--banner-->
  <!--3个产品-->
  <section class="index3Prod">
    <?php $_from = $this->_tpl_vars['home_products']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['product']):
?>
        <a href="<?php echo $this->_tpl_vars['product']['link']; ?>
"><img src="<?php echo $this->_tpl_vars['product']['image']; ?>
" alt="<?php echo $this->_tpl_vars['product']['title']; ?>
"/></a>
    <?php endforeach; endif; unset($_from); ?>
  </section>
  <!--3个产品-->
  <!--本周热门-->
  <section class="bigbox">
    <div class="indexTitle"><b>本周热门</b><img src="static/picture/icon01.png" alt=""/></div>
    <div class="indexHotProd">
        <?php $_from = $this->_tpl_vars['home_hot']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['hot']):
?>
                                <a href="<?php echo $this->_tpl_vars['hot']['link']; ?>
"><img src="<?php echo $this->_tpl_vars['hot']['image']; ?>
" alt="<?php echo $this->_tpl_vars['hot']['title']; ?>
"/><?php echo $this->_tpl_vars['hot']['title']; ?>
</a>
        <?php endforeach; endif; unset($_from); ?>
    </div>
  </section>
  <!--本周热门-->
  <!--猜你喜欢-->
  <section class="bigbox">
    <div class="indexTitle"><b>猜你喜欢</b><img src="static/picture/icon02.png" alt=""/></div>
    <div class="indexLikeProd">
            <?php $_from = $this->_tpl_vars['recommend_list']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['k'] => $this->_tpl_vars['v']):
?>
                                  <a href="<?php echo $this->_tpl_vars['v']['url']; ?>
">
              <dl>
                <dt>
                    <b><?php echo $this->_tpl_vars['v']['title']; ?>
</b>
                    <br><span><?php echo $this->_tpl_vars['v']['description']; ?>
</span>
                </dt>
                <dd><img src="<?php echo $this->_tpl_vars['v']['image']; ?>
" alt=""/></dd>
              </dl>
              </a>

            <?php endforeach; endif; unset($_from); ?>
        </div>
  </section>
  <!--猜你喜欢-->
    <!--商城商品推荐-->
        <section class="indexTejiProd">
        <div class="box">
            <?php $_from = $this->_tpl_vars['home_special']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['special']):
?>
                                    <a href="<?php echo $this->_tpl_vars['special']['link']; ?>
">
                <img src="<?php echo $this->_tpl_vars['special']['image']; ?>
" alt="<?php echo $this->_tpl_vars['special']['title']; ?>
">
                <?php echo $this->_tpl_vars['special']['title']; ?>
                <del>¥<?php echo $this->_tpl_vars['special']['old_price']; ?>
</del>
                <i>¥<?php echo $this->_tpl_vars['special']['new_price']; ?>
</i>
            </a>
            <?php endforeach; endif; unset($_from); ?>
                  </div>
        <div class="more"><a href="/?ct=shop&ac=index">更多商品，马上去看看吧 &gt;</a></div>
    </section>
    <!--商城商品推荐-->
<!--    特辑推荐-->
<!--    --><!--    特辑推荐-->
  <!--精品推荐-->
  <section class="bigbox xiding">
    <ul class="indexTab" id="fixedTab">
      <li class="current">精品推荐</li>
      <li>新品尝鲜</li>
      <a href="/?ct=test_list&ac=index">更多></a>
    </ul>
    <div class="indexNewProd">
        <?php $_from = $this->_tpl_vars['home_recommend_jp']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['rec']):
?>
                  <a href="<?php echo $this->_tpl_vars['rec']['link']; ?>
">
            <p><img src="<?php echo $this->_tpl_vars['rec']['image']; ?>
" alt="<?php echo $this->_tpl_vars['rec']['title']; ?>
"/></p>
            <dl>
              <dt>
                  <b><?php echo $this->_tpl_vars['rec']['title']; ?>
</b>
                  <br><span><?php echo $this->_tpl_vars['rec']['description']; ?>
</span>
                  <br><i><img src="static/picture/ce.png" alt=""/>
                      <?php echo $this->_tpl_vars['rec']['test_count']; ?>
人次已测算 &nbsp;&nbsp;&nbsp;&nbsp; <img src="static/picture/zan.png" alt=""/> <?php echo $this->_tpl_vars['rec']['rate']; ?>
好评</i>
              </dt>
              <dd>立即测算</dd>
            </dl>
          </a>
        <?php endforeach; endif; unset($_from); ?>
            </div>
    <div class="indexNewProd" style="display:none;">
        <?php $_from = $this->_tpl_vars['home_recommend_xp']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['rec']):
?>
                    <a href="<?php echo $this->_tpl_vars['rec']['link']; ?>
">
                <p><img src="<?php echo $this->_tpl_vars['rec']['image']; ?>
" alt="<?php echo $this->_tpl_vars['rec']['title']; ?>
"/></p>
                <dl>
                    <dt>
                        <b><?php echo $this->_tpl_vars['rec']['title']; ?>
</b>
                        <br><span><?php echo $this->_tpl_vars['rec']['description']; ?>
</span>
                        <br><i><img src="static/picture/ce.png" alt=""/> <?php echo $this->_tpl_vars['rec']['test_count']; ?>
人次已测算 &nbsp;&nbsp;&nbsp;&nbsp; <img src="static/picture/zan.png" alt=""/> <?php echo $this->_tpl_vars['rec']['rate']; ?>
好评</i>
                    </dt>
                    <dd>立即测算</dd>
                </dl>
            </a>
        <?php endforeach; endif; unset($_from); ?>
            </div>
    <div class="indexMore"><a href="javascript:void(0);">加载查看更多</a></div>
  </section>
  <!--精品推荐-->

  <!--底部浮动菜单-->
  <section class="indexMenu">
    <a href="javascript:void(0);" class="current">发现</a>
    <a href="/?ct=test_list&ac=index">测算大全</a>
    <a href="/?ac=jrys">个人中心</a>
  </section>
  <!--底部浮动菜单-->

<script>
//banner图轮播
function showSwiper() {
	new Swiper('.indexBann', {
		autoplay: {
			delay: 2000,
			//disableOnInteraction: true,
		},
		speed: 1000,
		loop: true,
		slidesPerView: 1,
		//observer: true, //开启动态检查器，监测swiper和slide
		//observeParents: true,  //监测Swiper 的祖/父元素
	});
}
showSwiper()

//菜单吸顶
/*let liClick = $('.indexTab li'),
    mainTop = $('.xiding');
	
function checkscroll() {
	let spanTop = liClick.parent().height(),
    	winTop = $(window).scrollTop(),
        mainH = $(mainTop).offset().top;
    if (parseInt(winTop) > parseInt(mainH - spanTop - 40)) {
        $('#fixedTab').addClass('fixedNav')
    } else {
        $('#fixedTab').removeClass('fixedNav')
    }
}

$(window).scroll(() => checkscroll());*/

//精品、新品切换
$('.indexTab li').click(function() {
	let index = $(this).index();
    $('.indexTab li').removeClass('current').eq(index).addClass('current');
	$('.indexNewProd').hide().eq(index).show();
})


var num0 = $(".bigbox .indexNewProd:eq(0)>a").eq(-1).index();
var num1 = $(".bigbox .indexNewProd:eq(1)>a").eq(-1).index();
var offset0 = 0;
var offset1 = 0;
var list_flag0 = 0;
var list_flag1 = 0;

//加载更多
$('.indexMore').click(function(){
    let index = $('.indexTab .current').index();
    if(index == 0){
        offset0 += 10;
        if(num0 < offset0){
            layer.open({
                content: '没有更多了~',
                skin: 'msg',
                time: 2
            });
            list_flag0 = 1;
        }else{
            let pos0 = offset0 + 10;
            $(".bigbox .indexNewProd:eq("+index+")>a:lt("+pos0+")").show();
        }
    }else{
        offset1 += 10;
        if(num1 < offset1){
            layer.open({
                content: '没有更多了~',
                skin: 'msg',
                time: 2
            });
            list_flag1 = 1;
        }else{
            let pos1 = offset0 + 10;
            $(".bigbox .indexNewProd:eq("+index+")>a:lt("+pos1+")").show();
        }
    }

    // console.log(num0);
    // console.log(num1);
})

window.onscroll = function() {
    var t = document.documentElement.scrollTop || document.body.scrollTop;
    var h = $('.indexMore').offset().top;
    // var f = $('.xia').offset().top;
    var windowH = $(window).height();
    // console.log(h);
    // console.log(windowH);
    // console.log(t);
    if (parseInt(t) > parseInt(h - windowH + 80)) {
        let index = $('.indexTab .current').index();
        // console.log(index);
        if(index == 0 && list_flag0 == 0){
            $('.indexMore').click();
        }
        if(index == 1 && list_flag1 == 0){
            $('.indexMore').click();
        }
        // $('.floatbtn').show();
    }
}


</script>

</body>
</html>