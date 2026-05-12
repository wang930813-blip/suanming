function init_sync(){
	  if($('.name-box').length > 0){
	    var nval = $('.name-box:eq(0)').attr('value'); 
      $('.name-box').attr('value',nval);
    }
    
    if($('.name-box2').length > 0){
      var nval2 = $('.name-box2:eq(0)').attr('value'); 
      $('.name-box2').attr('value',nval2);
    }
    
    if($('#pasteday_my').attr('data-text')){
    	 lc_initBirthDate('pasteday_my', 'pYear','');
    	 var pastebirth1 = new lCalendar().init('#pasteday_my','');
    }
    
    if($('#pasteday_my2').attr('data-text')){
    	  lc_initBirthDate('pasteday_my2', 'pYear2','2');
    	 var pastebirth2 = new lCalendar().init('#pasteday_my2','2');
    }
}


	      
$(function(){
	      //初始化姓名
        init_sync();
        
        //苹果手机浏览器适配
       $('.wrapper').on('touchmove',function(){
            if($('.name-box').length > 0){
            	  $(".name-box").change();
            }
            if($('.name-box2').length > 0){
            	  $(".name-box2").change();
            }
       });
	       
	      //第一人资料同步
        $('.name-box').bind('change', function(){
          $('.name-box').attr('value',$(this).val());
        });
        
        //第二人资料同步
        $('.name-box2').bind('change', function(){
          $('.name-box2').attr('value',$(this).val());
        });
        
        //第一人生辰
        $('.birth-box').bind('DOMNodeInserted', function(){
        	  var birth_txt = $(this).attr('data-text');
        	  var birth_html = $(this).html();
        	  var eleId = $(this).attr('id').replace('birthday','pasteday');
        	  var copy_txt = $('#'+eleId).attr('data-text');
        	  if(birth_txt != copy_txt){
               $('#'+eleId).attr('data-text',birth_txt);
               $('#'+eleId).html(birth_html);
               
               var vname = $(this).siblings().attr('name').replace('i','p');
               var birthday = $(this).siblings().val();
               $('#'+vname).val(birthday);
               $('#'+eleId).val(birth_html);
            }
        });
        
        //第二人生辰
        $('.birth-paste').bind('DOMNodeInserted', function(){
        	  var birth_txt = $(this).attr('data-text');
        	  var birth_html = $(this).html();
        	  var eleId = $(this).attr('id').replace('pasteday','birthday');
        	  var copy_txt = $('#'+eleId).attr('data-text');
        	  if(birth_txt != copy_txt){
               $('#'+eleId).attr('data-text',birth_txt);
               $('#'+eleId).html(birth_html);
               
               var vname = $(this).siblings().attr('name').replace('p','i');
               var birthday = $(this).siblings().val();
               $('#'+vname).val(birthday);
               $('#'+eleId).val(birth_html);
            }
        });    
});