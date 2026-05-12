
var clcsroll=0;
function stops(){
	$('.fade').show();
	clcsroll=$(window).scrollTop()
	$('html,body').addClass('bodyon').css('top',-clcsroll)
}
function moves(){
	$('.fade').hide();
	$('html,body').removeClass('bodyon').removeAttr('style');
	jQuery('body,html').animate({scrollTop:clcsroll},0);
}
function toSlide(idname){
	var id = '#' + idname
	if($(id).find('.list').length > 1){
		TouchSlide({
			slideCell: id,
			titCell:".hd ul", //开启自动分页 autoPage:true ，此时设置 titCell 为导航元素包裹层
			mainCell:".bd", 
			effect:"leftLoop", 
			interTime:3000,
			autoPage:true,//自动分页
			autoPlay:false, //自动播放
		});
	}
}