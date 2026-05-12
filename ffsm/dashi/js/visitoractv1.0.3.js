
(function (global) {
	'use strict';

//存读默认支付方式本地缓存
function saveZf(zfWay) {
    window.localStorage.setItem("zfWay",zfWay);
}

function getZf() {
    return window.localStorage.getItem('zfWay');
}

//初始化邮箱
function initEmail(elementId, email){
    var _email = email ? email : '';
    if(!email && window.localStorage && window.localStorage.cacheEmail){
        _email = window.localStorage.cacheEmail;
    }
    $('#' + elementId).val(_email);
}

//验证表单字段
function verifyElementData(elementId, type){
    //验证字段：姓名一（NumData）、姓名二（NumData2）、生日（iBirthday）、时辰（iHour）、邮箱（iEmail）、手机（iMobile）
    var elementValue = $('#' + elementId).val();
    if(type == 'iEmail'){
        //判断邮箱不能为空
        if(!elementValue){
            layer.open({
                content: '你的邮箱没有填写！',
                skin: 'msg',
                time: 2
            });
            return false;
        }
        //判断邮箱格式是否正确
        var regexp = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
        if(!regexp.test(elementValue)){
            layer.open({
                content: '邮箱格式不正确！',
                skin: 'msg',
                time: 2
            });
            return false;
        }
        //存储本地数据
        window.localStorage.cacheEmail = elementValue;
        return true;
    }
}

//初始化邮箱
initEmail('iEmail', '');

//验证表单
function CheckUserInput(){
    //验证邮箱
//  var isiEmail = verifyElementData('iEmail', 'iEmail');
    var isZwb=$('#pay_ways').val();
    //提交表单
//  console.log(isZwb);
//  if(isZwb == 'zwb'){
    saveZf($('#pay_ways').val());
    layer.open({type: 2,time:4}); //loading层
    $('#_to_next_form').submit();
    setTimeout(function(){showPop();},5000); 
//  }
}

function init() {
	if(window.localStorage){
	   	z_pop = window.localStorage.z_pop;
     if(z_pop == $('#remote_id').val()){
     	$('#payPop').show();
      	$('.payPop').show();
     }
  }
      
  //初始化默认支付方式
  var localZfway=getZf();
  if(localZfway){
      //改默认支付行的位置
      var tempDiv=$('.bank_ways[ways='+localZfway+']').parents('.kjzfpay_hang');
      var cloneDiv=tempDiv.clone();
      var parent=tempDiv.parents('.kjzfpay');
      tempDiv.remove();
      parent.find('.kjzfpay_title').after(cloneDiv);
      $('.bank_ways[ways='+localZfway+']').click();
  }
}

//转换金额
function numTurn(a,b) {
  var c=$('#realMoney').text();
  if(a=='zwb'&&b!='zwb'){
    $('#realMoney').text(c/10);
  }else if(a!='zwb'&&b=='zwb'){
    $('#realMoney').text(c*10);
  }
}


function showPop(){
//	 if($("#payPop").is(":hidden")){
		$('#payPop').show();
	 	$('.payPop').show();
//	 }
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
  	             /*layer.open({
                    content: '支付失败，请重试',
                    skin: 'msg',
                    time: 3
                 });*/
                 
                	$('.confirmPopBg').show();
           			$('.confirmPopBox').show();
                	return false;
           		}
           	},error: function (response) {
           		console.log(response);
           	}
       });
}

$(function(){
	   init(); //初始化
	    
    //支付方式切换
    $('.kjzfmain').on('click','.bank_ways',function(){
    	console.log(1)
        var $checkI= $('.kjzfpay i.fa-check-circle')
        var beforWay=$checkI.parents('.bank_ways').attr('ways');

        $checkI.removeClass('fa-check-circle').addClass('fa-circle-o');
        $(this).find('i').addClass('fa-check-circle').removeClass('fa-circle-o');
        var ways = $(this).attr('ways');
        var zfAct = $(this).attr('zfAct');

        $("#pay_ways").val(ways);
        $("#_to_next_form").attr('action',zfAct);
    });
    
    $('.btnMeasure').on('click', function () {
    	  if(window.localStorage) { 
          var storage = window.localStorage;
          storage.z_pop = $('#remote_id').val();
        }
    	
        CheckUserInput();
    });
    
    $('#payAgain').live('click', function(){
       	$('.payPop').hide();
       	$('.confirmPopBox').hide();
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