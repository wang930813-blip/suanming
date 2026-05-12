(function (docs, win) {
	 var docEls = docs.documentElement,
		resizeEvts = 'orientationchange' in window ? 'orientationchange' : 'resize',
		recalcs = function () {
			//getBoundingClientRect()这个方法返回一个矩形对象
			window.rem = docEls.getBoundingClientRect().width/7.5;
			if(window.rem>100){
				window.rem=100;
			}
			docEls.style.fontSize = window.rem + 'px';
		};
		
	recalcs();
	if (!docs.addEventListener) return;
	win.addEventListener(resizeEvts, recalcs, false);
})(document, window);


$(function(){
    //侧边栏----
    $('#qudaoHeaderMenu').bind('click', function(){
        $('html').addClass('noscroll');
        layerPop = layer.open({
            type: 1,
            className: 'remsidebar',
            content: $('#qudaoHeaderMenuContent').html(),
            end:function(index){
                layer.close(index);
                $('html').removeClass('noscroll');
            }
        });
    });
    $('body').on('touchstart','.layui-m-layershade',function () {
        layer.close(layerPop);
    });
    $('body').on('touchstart','.layui-m-layerchild',function(b){
        b.cancelBubble=true;
    });
});