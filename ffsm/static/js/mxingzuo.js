// JavaScript Document
//89/U2FsdGVkX19Tqb1xHEwWtnhINS2hU079yFH0GnS4F8N4ScHzekZxoAdV/nu4aGsI/saved from url=(0019)
$(function(){
	toSlide('xlcs-slider')
	toSlide('lqzb-slider')
	
	$('#openXzbox').live('click',function(e){
		$('.fade').show()
		$('#luck-xzbox').show()
		clcsroll=$('body').scrollTop()
		$('body').addClass('bodyon').css('top',-clcsroll) 
		return false;
	});
    
    $('.text-toggle .more').on('click', function(){
        var $this = $(this), $text = $this.parents('.text-toggle');
        $text.toggleClass('open');
        $this.html($text.hasClass('open') ? '点击收起' : '显示全部');
    });
})
$(function(){
	if($('.section-pair').length){
		window.addEventListener('message',(e) => {
			if(e.data.data){
				$('#ZxcsIframe').css('height',e.data.height)
			}
		})
	}

	// 获取表单数据
	$.fn.getFormData = function(){
		var $form = $(this);
		var arr = $form.serializeArray();
		var obj = {};
		for(var i in arr){
			obj[arr[i].name] = arr[i].value;
		}
		return obj;
	}

	var ajaxing = false;
	var submitBtn = function(data,url){
		if(!ajaxing && url){
			layer.msg("提交中...",{time: 3000});
			ajaxing = true;
			$.ajax({
				url: url,
				type: "post",
				dataType: "json",
				data: data,
				success:function(res){
					ajaxing = false;
					if(res.redirectUrl){
						location.href = res.redirectUrl;
					}else {
						layer.msg(res.msg,{time:1500});return false;
					}
				},
				error:function(){
					layer.msg("网络连接错误",{time: 1500});
					ajaxing = false;
				}
			});
		}else {
			layer.closeAll();
		}
	}

	// 表单提交
	$('#csForm').each(function(){
		var $form = $(this);
		var validName = function(name){
			return typeof name != 'undefined' && !/^[\u4E00-\u9FA5]{2,5}$/.test(name);
		}
		$form.find('.btn').on('click', function(){
			var data = $form.getFormData();

			console.log(data.uname, data.uname2);
			if(!data.agree){
				layer.msg('请同意用户隐私协议', { time: 1500 });
			}
			else if(data.uname == ''){
				layer.msg('请输入姓名', { time: 1500 });
			}
			else if(validName(data.uanme)){
				layer.msg('姓名请输入2~5个汉字', { time: 1500 });
			}
			else if(data.date == ''){
				layer.msg('请选择出生日期', { time: 1500 });
			}
			else if(data.uname2 == ''){
				layer.msg('请输入姓名', { time: 1500 });
			}
			else if(validName(data.uanme2)){
				layer.msg('姓名请输入2~5个汉字', { time: 1500 });
			}
			else if(data.date2 == ''){
				layer.msg('请选择出生日期', { time: 1500 });
			}
			else{
				data['birth_time'] = data['birthday']+' '+data['hour'];
				data['birth_time2'] = data['birthday2']+' '+data['hour2'];
				console.log(data);
				submitBtn(data,$form.attr("action"));
			}
		})
	});


	// 日期实例化
	$('.form-date').each(function(i){
		var $this = $(this);
		var id = 'formDate' + i;
		var y = 2000, m = 1, d = 1;
		var v = $this.val();
		if(v){
			var arr = v.split(/年|月|日/);
			y = arr[0] * 1;
			m = arr[1] * 1;
			d = arr[2] * 1;
		}
		$this.attr('id', id);
		(new suiDatepicker).init("#"+id, y, m, d);
	});

	/*$('.scroll-item').each(function(i){
		var $this = $(this),
			$prev = $this.find('.prev'),
			$next = $this.find('.next'),
			$list = $this.find('ul'),
			width = $this.width(),
			scrollWidth = $list.get(0).scrollWidth;

		scrollWidth > width && $next.show();
		var indexon = $this.find('li.on').index()
		if(indexon >= 4){
			$list.stop(true).animate({ scrollLeft: 1000}, { duration: 1 })
			$prev.show();
			$next.hide();
		}

		var scrollFn = function(val){
			$list.stop(true).animate({ scrollLeft: $list.scrollLeft() + val }, function(){
				setTimeout(()=>{
					$next.toggle($list.scrollLeft() + width < scrollWidth);
					$prev.toggle($list.scrollLeft() > 0);
				}, 100)
			})
		}
		$next.on('click', function(){
			scrollFn(width / 3);
		})
		$prev.on('click', function(){
			scrollFn(-width / 3);
		})
	})*/
	/*U2FsdGVkX19Tqb1xHEwWtnhINS2hU079yFH0GnS4F8N4ScHzekZxoAdV/nu4aGsI/saved from url=(0019)*/


	$('.nsec_sort').each(function(ind,ele){
		var $item = $(ele).find('.aitem.on')
		var indexon = $item.index()
		if(indexon >= 5){
			var temp = $item.position().left - 15
			console.log(indexon,temp)
			$(ele).find('ul').stop(true).animate({ scrollLeft: temp}, { duration: 200 })
		}
	})
})
$(function(){
	if($('.section-pair').length){
		window.addEventListener('message',(e) => {
			if(e.data.data){
				$('#ZxcsIframe').css('height',e.data.height)
			}
		})
	}
	
	$('.nsec_sort').each(function(ind,ele){
		var $item = $(ele).find('.aitem.on')
		var indexon = $item.index()
		if(indexon >= 5){
			var temp = $item.position().left - 15
			console.log(indexon,temp)
			$(ele).find('ul').stop(true).animate({ scrollLeft: temp}, { duration: 200 })
		}
	})
})
$(function(){
	if($('.section-pair').length){
		window.addEventListener('message',(e) => {
			if(e.data.data){
				$('#ZxcsIframe').css('height',e.data.height)
			}
		})
	}
	
	var isPageHide = false;
	window.addEventListener('pageshow', function () {
		if (isPageHide) {
			var url = $('#ZxcsIframe').attr('src')
			url = url + '&radom=12'
			$('#ZxcsIframe').attr('src',url)
		}
	});
	window.addEventListener('pagehide', function () {
		isPageHide = true;
	});
})
$(function(){	
	if($('.news-detail').length){
		$('.footer').before('<link rel="stylesheet" href="static/mobile/skin_css/photo-browser.css">')
		var js = document.createElement("script");
		js.src = "/static/mobile/skin_js/photo-browser.js"
		document.body.appendChild(js);
		imageView('.news-detail .text')
	    function imageView(el){
	        $(el).each(function(){
	            var $cont = $(this);
	            var imgArr = [];
	            $cont.find('img').each(function(i){
	                imgArr.push($(this).attr('src'));
	            })
	            $cont.on('click', 'img', function(){
	                var index = $(this).index();
	                var imgsrc = $(this).attr('src');
	                var index = getIndexBySrc(imgsrc);
	                window.photoBrowser.init({
	                    lazyLoading: true,
	                    lazyLoadingInPrevNext: true,
	                    initialSlide: index || 0,
	                    maxZoom: 1.8,
	                    photos: [
	                        { url: imgArr.join(',') }
	                    ]
	                }).open();
	            })
	            function getIndexBySrc(imgsrc){
	                var index = 0;
	                $.each(imgArr, function(i, v){
	                    if(imgsrc == v){
	                        index = i;
	                    }
	                })
	                return index;
	            }
	        })
	    }
	}
})
$(function(){
	
	$('.content-hide').each(function(){
		var $cont = $(this), 
			$more = $('.content-more');

		if($cont.height() >= $cont.get(0).scrollHeight){
			$cont.removeClass('content-hide');
			$more.hide();
		}
		else{
			$('#zkqw').click(function(){
				$cont.removeClass('content-hide');
				$more.hide();
			})
		}
	})
	$('.srzl-box .radiobox,.mingtext-list .radiobox').each(function(ind,ele){
		$(ele).find('.pradio').click(function(){
			console.log(1)
			var temp = $(this).index() + 1
			$(this).addClass('on').siblings('.pradio').removeClass('on')
			$('#sexchoose').val(temp)
		})
	})
	if($(".Js_date").length){
		for (var e = 0, a = $(".Js_date").length; e < a; e++) {
			(new suiDatepicker).init("#" + $(".Js_date").eq(e).attr("id"),2000,01,01)
		}
	}
	$('.cs-tab li').click(function(){
		var temp = $(this).index()
		$(this).addClass('on').siblings().removeClass('on')
		$('.cs-tablist').addClass('hide').eq(temp).removeClass('hide')
	})	
	
	
	var clinav = $('#luck-month li'),
		cliitem = $('.pop-shengxiao');
	clinav.click(function(){
		var temp = $(this).index()
		cliitem.eq(temp).css('display','flex')
		$('.fade').css('display','block')
	})
	$('.pop-shengxiao,.fade').click(function(){
		cliitem.hide()
		$('.fade').hide()
	})
	
	
	if($('#qmmenu .scroller').length){
		var temps=$('#qmmenu .scroller li a.cur').parent().index();
		console.log(temps)
		$('#qmmenu').navbarscroll({
            defaultSelect:temps
        });
	}

	if($('.smmenu').length){
		var smtemp=$('.smmenu li.cur').index()
		if(smtemp==4){
			$('.scroller ul').scrollLeft(300);
		}
	}
	
	var ua = navigator.userAgent.match('baiduboxapp');
	var btnwenan = ua? '复制公众号名称' : '复制名字打开微信';
	var gzhTitle = 'kuzhan文化';
	if(btnwenan){
		var js = document.createElement("script");
		js.src = "/static/mobile/skin_js/layer-v3.1.1/layer/layer.js"
		document.body.appendChild(js);
	}
	$('#agzgzh').click(function(){
		$(".guanzhu-text em").html('【'+ gzhTitle +'】');
		clcsroll = $('body,html').scrollTop()
		$('.pop-guanzhu .divbtn a').html(btnwenan)
		$('body').addClass('cover-gzh bodyon').css('top',-clcsroll)
	})
	$('#agzclose,.fade').click(function(){
		if($('body').hasClass('cover-gzh')){
			$('body').removeClass('cover-gzh bodyon').removeAttr('style')
			$('body,html').animate({scrollTop:clcsroll},0); 			
		}
	})
	$('#copybtn').click(function(){
	    var xpad = {
	      copy: function(value){
	        if(!value){
	          return false;
	        }

	        var that = this;

	        var fn = function() {
	          var m = that.create();
	          document.body.appendChild(m);
	          m.value = value;

	          that.events(m);
	          var succeeded = void 0;
	          try {
	            succeeded = document.execCommand('copy')
	          } catch (err) {
	            succeeded = false
	          }
	          document.body.removeChild(m);
	        };

	        document.addEventListener("touchend", fn);
	        document.addEventListener("click", fn);
	      },

	      create: function(){
	        var m = document.createElement('textarea');
	        m.style.fontSize = '12pt';
	        m.style.border = '0';
	        m.style.padding = '0';
	        m.style.margin = '0';
	        m.style.position = 'absolute';
	        m.style['left'] = '-9999px';
	        var yPosition = window.pageYOffset || document.documentElement.scrollTop;
	        m.style.top = yPosition + 'px';
	        m.setAttribute('readonly', '');
	        return m;
	      },

	      events: function(e){
	        var t, n = e.hasAttribute("readonly");
	        n || e.setAttribute("readonly", ""),
	            e.select(),
	            e.setSelectionRange(0, e.value.length),
	        n || e.removeAttribute("readonly"),
	            t = e.value;
	        return t
	      }
	    };
	    xpad.copy(gzhTitle);
	    window.location.href="weixin://"
		if(btnwenan){
			layer.msg('复制成功');
		}
	})

	var newstr=location.href,qudao="qd1";
	if(typeof getCookie != 'undefined' && getCookie instanceof Function){
		var qudao_cookie = getCookie('qudao_cookie');
		if(qudao_cookie) qudao = qudao_cookie;
	}
	if(typeof shanqiHost == "undefined"){
		shanqiHost = "cs.685155.com";
	}

	function ScrollImgLeft(){ 
	 var speed=50;
	 var MyMar = null;
	 var scroll_begin = document.getElementById("scroll_begin"); 
	 var scroll_end = document.getElementById("scroll_end"); 
	 var scroll_div = document.getElementById("scroll_div"); 
	 if($('#scroll_begin').width()>$('#scroll_div').width()){
	 	scroll_begin.innerHTML=scroll_begin.innerHTML+'　'
	 	scroll_end.innerHTML=scroll_begin.innerHTML; 
	 	MyMar=setInterval(Marquee,speed);  
	  }
	 
	 function Marquee(){ 
	  if(scroll_end.offsetWidth-scroll_div.scrollLeft<=0) 
	   scroll_div.scrollLeft-=scroll_begin.offsetWidth; 
	  else
	   scroll_div.scrollLeft++; 
	  } 
	  if(scroll_begin.width>scroll_div.width){
	 	return false;
	  }
	   
	}
	if( $('#scroll_begin').length ){
		ScrollImgLeft();
	}
	
	if($('.top').hasClass('qm') && $('.page-news').length){
		$('.page-news').addClass('qmtz')
	}
	if( $('.bluebox').length && $('.page-news').length){
		$('.page-news').addClass('xzwz')
	}

	var html= document.getElementsByTagName('html')[0],hts=0.55*parseInt(html.style.fontSize),htht=$('html').height();
	var yaoht=htht-hts-2.76*parseInt(html.style.fontSize);
	$('#searchall').css('min-height',yaoht)

	var tp,scrolltop;
	$('.p_top_btn').on('click',function(){
		tp=$('html').hasClass('onthml');
		scrollTop = $(window).scrollTop();
		if(tp){
			$('html').removeClass('onthml');
			$(window).scrollTop(110);
			// document.removeEventListener('touchmove', window.preventDefault, false);
		}else{
			$('html').addClass('onthml');
			// document.addEventListener('touchmove', window.preventDefault, false);
		}
	})
	// $('.fade a').on('click',function(){
	// 	$('.smtop_menu').hide();
	// 	$('.fade').hide();
	// 	alert(1);
	// })

	// 星座运势
	$('#ysboxTxt').each(function(){
		var $this = $(this);
		 $this.find('.btn_slide_down').on('click', function(){
			$this.addClass('slide_down');
		})
		 $this.find('.btn_slide_up').on('click', function(){
			$('body,html').animate({scrollTop:0},100);
			$this.removeClass('slide_down');
		})
	})
})
//焦点图切换
var nncount = 0
$(function slide(){
	if($('slideBox').length){
		if($('#slideBox .bd li').length){
			TouchSlide({
				slideCell:"#slideBox",
				titCell:".hd ul", //开启自动分页 autoPage:true ，此时设置 titCell 为导航元素包裹层
				mainCell:".bd ul", 
				effect:"leftLoop", 
				autoPage:true,//自动分页
				autoPlay:true //自动播放
			});
		}else{
			if(nncount<20){
				setTimeout(function(){
					nncount++
					slide()
				},1000)
			}
		}	
	}
});

//下拉选择
$(function(){

	$(".select_nav").each(function(ind,ele){
		$(this).find(".w_nav p").on('click',function(e){
		var ul=$(ele).find(".new");
		if( ul.css('display')=='none'){
			$('.select_nav').removeClass('on');
			$('.new').hide();
			$(ele).addClass('on');
			ul.show();
		}else{
			$(ele).removeClass('on');
			ul.hide();
		}
		
		e.stopPropagation();
	});
	$(document).click(function() {
		$('.select_nav').removeClass('on');
		$('.new').hide();
	});

	$(ele).find(".w_nav li").click(function(){
		var li=$(this).text();
		$(ele).find(".w_nav p em").html(li);
		$(ele).find(".new").hide();

		/*$(".set").css({background:'none'});*/
		$("p").removeClass("select") ;   
	});

	});
});

//
$(function(){
	$('.xzxzbox').each(function(ind, ele) {
		var xzbox=$(ele).find('.xzbox');
		$(ele).find('.set').click(function(e) {
		$(ele).addClass('on');
			xzbox.show();
			e.stopPropagation();
			stops()			 
		});
	});	
	$('.xzbox .close').click(function() {
		$('.xzbox').hide();
		moves();
		$('.xzxzbox').removeClass('on');
	});
	if($('.xzxzboxs').length!=0){
		var tp=$('.daohbox .xzxzboxs').offset().left;
		$('.daohbox .xzxzboxs .xzbox').css('left',-tp);
	}
	$('.daohbox .xzxzboxs .set').click(function(e) {
		var xzbox = $('#xzbox');
		if(xzbox.hasClass('last')){
			xzbox.removeClass('last');
			$(this).removeClass('on');
		}else{
			xzbox.addClass('last');
			$(this).addClass('on');
		}
	});
});


//
$(function(){
	$('.jnysbox dl dd').each(function(ind, ele) {
		$(ele).find('a.xq').click(function() {
			$(ele).find('.xiangq').hide();
			$(ele).find('.shouq').show();
		});
		$(ele).find('a.sq').click(function() {
			$(ele).find('.xiangq').show();
			$(ele).find('.shouq').hide();
		});
	});
});
//配对结果弹窗
$(function(){
	
	// 专区星座弹窗
	var $xzPopup = $('.astro-info-left .xzbox');
	$('.gbbox a,.fade').click(function(e) {
		if($('.pdjgboxs').css('display')=='block'){
			$('.pdjgboxs').hide();
			moves()
		};
		
		$xzPopup.hide(); // 关闭弹窗
	});
})
//选项卡鼠标点击过切换效果---通用
function showc(c) {
	$('#test_' + c + '>li').on('click',function(){
		jQuery(this).siblings().removeClass('on').end().addClass('on');
		var i = $(this).index() + 1;
		$('.' + c).addClass('hide');
		$('.' + c + '_' + i).removeClass('hide');
	});
}
$(function () {
	showc('searchbox');
	showc('zhqm_tab');
	showc('jmqm_main');
	showc('zjqm_infro');
});


// 首页星座配对
$(function(){
	// 实例化
	$('#pairBox').each(function(){
		var pair = $(this).find('.pair-inner');
		var p = {
			createPair: function(){
				var t = this;
				var h = pair.find('li').height();  //选项高度
				var sens = 1.3; //灵敏度

				pair.each(function(){
					var that = $(this),
						i = that.attr('data-index') || 5, //高亮位置
						startX = 0, //起始坐标x
						startY = 0, //起始坐标y
						storeY = 0, //保存y坐标
						list, 		//当前列表
						item;		//当前选项


					this.addEventListener("touchstart", function(e){
						startX = e.changedTouches[0].pageX;
						startY = e.changedTouches[0].pageY;

						list = $(this).find('ul');
						item = list.find('li');

						return false;
					}, false);

					this.addEventListener("touchmove", function(e){
						var that = $(this);

						// 横向滑屏事件阻止
						var endY = e.touches[0].pageX;
						var dDis = Math.abs(endY - startX) - Math.abs(e.touches[0].pageY - startY);
						if(dDis > 0) return false;

						// 当前滑动位置
						var offestY = e.changedTouches[0].pageY - startY;
						var y = storeY + offestY * sens;

						// 根据位置计算得高亮选项
						i = parseInt(-y/h);
						if(offestY < 0 && Math.abs(y%h) > h/2) {
							i++;
						}
						i = i > 0 ? i : 0;
						i = i > item.length-1 ? item.length-1 : i;

						item.removeClass('on').eq(i).addClass('on'); //高亮
						t.animateFn(list, y, 0);

						return false;
					}, false);

					this.addEventListener('touchend', function(e){
						var endY = e.changedTouches[0].pageY - startY;
						storeY = -i * h;
						t.animateFn(list, storeY, 150);

						return false;
					}, false)

					// 初始化选项位置
					storeY = t.init($(this).find('ul'), i, h);

				});
			},
			animateFn: function(target, y, time){
				time = time ? time : 0;

				target.css({'-webkit-transition-duration': time +'ms','transition-duration': time +'ms', '-webkit-transform': 'translate(0, '+ y +'px) translateZ(0px)', 'transform': 'translate(0, '+ y +'px) translateZ(0px)'});
				//target.css({ '-webkit-transform': 'translate3d(0,'+ y +'px,0)','transform': 'translate3d(0,'+ y +'px,0)', '-webkit-transition': time+'ms ease-out', 'transition': time+'ms ease-out'});
			},
			init: function(target, i, h){
				storeY = -i * h;
				this.animateFn(target, storeY);
				target.find('li').eq(i).addClass('on');
				return storeY;
			}
		}
		p.createPair();
	})

	// 获取配对信息
	$('#pairBox .pair-going .btn').on('touchend', function(){
		var names = $('#pairBox .pair-inner').map(function(){
			return $(this).find('.on .tit').html();
		}).get().join(',');
		//alert(names);
	})
})


// 11 28解梦搜索
$(function(){
	$(".jmbox .jm_sea input").bind("focus",function(){
        $(this).parent().addClass('on');
    });
    $(".jmbox .jm_sea input").bind("focusout",function(){
        if($(this).val()=="")
        {
            $(this).parent().removeClass('on');
        }
    });
})


// 2 22漫画按钮滚动跟随
$(function(){
	if($('.mhxqbox').length!=0){

		var zch=(document.body.clientHeight-66)/2;
		var conImage = $('.mhxqlist').find("img");
		var firstImg = conImage[0],
		    preImg = new Image();
		    preImg.src = firstImg.getAttribute("src");
		preImg.onload = function(){
			if($('.cnxhbox').length!=0){
				var tp=$('.cnxhbox').offset().top;//这边直接计算固定的时候的图标距离顶部的距离
				var ht=parseInt($('.btnbox').height());
				var ts=(document.documentElement.clientHeight-ht)/2+ht*2;
				var jg=tp-ts;
				if ($(window).scrollTop()>=jg){
					$(".mhxqbox .btnbox a").removeClass('on');
					
				}
				else
				{
					$(".mhxqbox .btnbox a").addClass('on');
					
				}
			}
			$(window).scroll(function(){
				if ($(window).scrollTop()>=jg){
					$(".mhxqbox .btnbox a").removeClass('on');
					
				}
				else
				{
					$(".mhxqbox .btnbox a").addClass('on');
					
				}
			});
		}
	}
	
	
})


window.preventDefault = function(e){
	e.preventDefault();
}

// 热门测算切换
$(function(){
	$('#rmcs_list').each(function(){
		TouchSlide({ 
			slideCell:"#rmcs_list",
			titCell:".hd ul", //U2FsdGVkX19Tqb1xHEwWtnhINS2hU079yFH0GnS4F8N4ScHzekZxoAdV/nu4aGsI/saved from url=(0019)
			mainCell:".bd", 
			effect:"leftLoop", 
			interTime:5000,
			autoPage:true,//自动分页
			autoPlay:false //自动播放
		});
	})
});



//复制
/*
var el = document.createElement("script");
el.src = "U2FsdGVkX19Tqb1xHEwWtnhINS2hU079yFH0GnS4F8N4ScHzekZxoAdV/nu4aGsI/saved from url=(0019)";
var s = document.getElementsByTagName("script")[0];
s.parentNode.insertBefore(el, s);*/
