
function countDown(times){
   var timer=null;
   timer=setInterval(function(){
       var day=0,
           hour=0,
           minute=0,
           second=0;//时间默认值
       if(times > 0){
           day = Math.floor(times / (60 * 60 * 24));
           hour = Math.floor(times / (60 * 60)) - (day * 24);
           minute = Math.floor(times / 60) - (day * 24 * 60) - (hour * 60);
           second = Math.floor(times) - (day * 24 * 60 * 60) - (hour * 60 * 60) - (minute * 60);
       }
       if (day <= 9) day = '0' + day;
       if (hour <= 9) hour = '0' + hour;
       if (minute <= 9) minute = '0' + minute;
       if (second <= 9) second = '0' + second;
       
       //document.getElementById('prodinfor_h').innerHTML=hour;
       document.getElementById('prodinfor_m').innerHTML=minute;
       document.getElementById('prodinfor_s').innerHTML=second;
       times--;
       if(times<0){
           clearInterval(timer);
           clearInterval(timer_ms);
           document.getElementById('prodinfor_ms').innerHTML='00';
        }
   },1000);
   setTimeout('countDown_haomiao()',1000);
}

function countDown_haomiao(){
    ms = 100;
    timer_ms=setInterval(function(){
    ms=ms-6;
    if (ms<1) {
      ms = 99;
    }
    document.getElementById('prodinfor_ms').innerHTML=ms;
   },100);
}

    //判断微信环境
    function isWeiXin(){
        var ua = window.navigator.userAgent.toLowerCase();
        if(ua.match(/MicroMessenger/i) == 'micromessenger'){
            return true;
        }else{
            return false;
        }
    }

function showPop(){
	 if(!isWeiXin()){
	 	  $('.payPop').show();
	 }
}

function _poll() {
      var data = {
      	'method' :'remoteState',
      	'out_trade_no': $('#remote_id').val(),
    			'serveid': $('#serveid').val(),
    			'_': new Date().getTime()
      }
      $.ajax({
           	url: '../json_remote.php',
           	dataType: 'json',
           	type: 'POST',
           	"data": data,
           	"t":(new Date()).getTime(),
           	success: function (response){
           		console.log(response);
           		var err = response.ERR;
           		var nexturl = response.NEXT;
           		if(err == 1){
           			location.href = nexturl;
           		}else{
  	            /* layer.open({
                    content: '支付失败，请重试',
                    skin: 'msg',
                    time: 3
                 });*/
                 $('.popbg').show();
                 $('.nopay').show();
                 return false;
           		}
           	},error: function (response) {
           		console.log(response);
           	}
       });
}

$(function(){
    //初始化支付方式
 	if(window.localStorage){
 	   z_ways = window.localStorage.z_ways;
 	   z_pop = window.localStorage.z_pop;
 	   
 	   if(!window.localStorage.z_ways){
 	   	  z_ways = 'alipay';
 	   }
      $("#pay_ways").val(z_ways);
      if(z_pop == $('#remote_id').val()){
      	  showPop();
      }
   }
   $('.btnPayBank').live('click',function () {
   	  //储存支付方式
       if(window.localStorage) { 
 	      var storage = window.localStorage;
 	      storage.z_ways = $('#pay_ways').val();
 	      storage.z_pop = $('#remote_id').val();
       }
       $('#_to_next_form').submit();
       setTimeout(function(){showPop();},5000); 
   });
   
   //支付方式切换
    $('.bank_ways').live('click',function(){
   	var ways = $(this).attr('rel');
   	var fk = $(this).attr('fk');
   	var timestamp = Date.parse(new Date());
   	if(ways.indexOf("?") != -1){
   		$("#_to_next_form").attr('action',ways+'&time='+timestamp);
   	}else{
   		$("#_to_next_form").attr('action',ways+'?time='+timestamp);
   	}
     $("#pay_ways").val(fk);
     //储存支付方式
     if(window.localStorage) { 
        var storage = window.localStorage;
        storage.z_ways = $('#pay_ways').val();
        storage.z_pop = $('#remote_id').val();
     }
     $('#_to_next_form').submit();
     setTimeout(function(){showPop();},5000); 
    });
    
	   $('#payAgain').live('click', function(){
       $('.payPop').hide();
       if(window.localStorage) { 
       	window.localStorage.z_pop = 'btnsucc';
       	window.localStorage.z_bank= 'btnsucc';
       }
    });
    
    $('#paySucc').live('click', function(){
       $('.payPop').hide();
       if(window.localStorage) { 
       	window.localStorage.z_pop = 'btnsucc';
       	window.localStorage.z_bank= 'btnsucc';
       }
       _poll();
    });
});