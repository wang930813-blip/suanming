
$('#qudaoHeaderMenu').bind('click', function(){
$('#qudaoHeaderMenu').attr('src','//image.ibazi.cn/m/sc/qudao/images/icon1009/p_topb.png');
var pageii = layer.open({
          type: 1,
          className: 'p_pop',
          content: $('#qudaoHeaderMenuContent').html(),
          anim: 'up',
          shade: 'background-color: rgba(0,0,0,.3)', //自定义遮罩的透明度
          end:function(index){
            $('#qudaoHeaderMenu').attr('src','//image.ibazi.cn/m/sc/qudao/images/icon1009/p_topa.png');
            layer.close(index);
          }
        });
})