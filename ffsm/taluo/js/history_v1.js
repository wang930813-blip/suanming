
(function (global) {
	'use strict';
	var userId = '',
		deviceId = '';
	var historyBaseUrl = '/sc/history/record.php';
	var ua = window.navigator.userAgent;
	var localData = localStorage.getItem('history_data');
	var browser = {
		isAndroid: function () {
			return ua.match(/Android/i) ? true : false;
		},
		isIOS: function () {
			return ua.match(/iPhone|iPad|iPod/i) ? true : false;
		},
		isWx: function () {
			return ua.match(/micromessenger/i) ? true : false;
		},
		isWp: function () {
			return ua.toLowerCase().indexOf('windows phone') > -1;
		},
		getIOSVersion: function () {
			if (window.MSStream) {
				return false;
			}
			var match = (navigator.appVersion).match(/OS (\d+)_(\d+)_?(\d+)?/),
				version;
			if (match !== undefined && match !== null) {
				version = [
					parseInt(match[1], 10),
					parseInt(match[2], 10),
					parseInt(match[3] || 0, 10)
				];
				return parseFloat(version.join('.'));
			}
			return false;
		}
	};
	if (localData) {
		localData = JSON.parse(localData);
	} else {
		localData = {};
	}
	userId = getQueryValue('userId');
	if (userId === null || userId === '' || userId.toLowerCase() === '[userid]') {
		userId = '';
	}
	userId = userId === '' || userId == null ? userId : userId.replace('?name=', '');
	localData.userId = userId;
	deviceId = getQueryValue('deviceId');
	if (deviceId === null || deviceId === '' || deviceId.toLowerCase() === '[openudid]') {
		deviceId = '';
	}
	localData.deviceId = deviceId;
	var posId = getQueryValue('posId') || getQueryValue('posid');
	localData.posId = posId;
	localStorage.setItem('history_data', JSON.stringify(localData));
	
	
	var historyBtn = global.document.createElement('a');
	historyBtn.innerHTML = '历史订单';
	historyBtn.setAttribute('class', 'history_btn');
	var cssText1 = '.history_btn{font-size:16px;line-height:16px;position: fixed;box-sizing: border-box;text-align: right;z-index: 1000;right: 15px;width: 112px;bottom: 70px;height: 40px;border-radius: 20px;-webkit-backdrop-filter: blur(5px);backdrop-filter: blur(5px);background-color: rgba(0, 0, 0, 0.6);box-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.1);color: #FFF;text-decoration: none;padding: 12px;padding-right: 15px;}';
	var cssText2 = '.history_btn::before{content: "";position: absolute;z-index: 1000;left: 15px;top: 12px;width: 12px;height: 15px;background: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACQAAAAtCAYAAADGD8lQAAAB+UlEQVR4Ae2WNYwdMRCGw9hLYa7SpU0v2Q4zM3bBOoxNeL0bpi7UB/s+nF6hY+a7uRn5nvXegjS790g6W5rFf//5nunNqCwNArUEPPEePNmMZygMfKblO9KMGm6DByvnQyC3gK9Oo+lZE+ok6FWLCmC06LEAiSG786EgWDETfY9ZX8xBuShnFOTeyimYOEg017Id7qrFpDU9I4AZ742/mI7XdYk6yv1851QLhAk/MszPGa1oSgHUOOR/mNGjnwBgNIn388zVPtND8hcbCLUGaJlk6X1xgDMEbaDFfXi5cawxl2fZQKi1o+CJq4zefU/CupDJG5M8vsG9Q+NR84oB84q0iT6Yg3KFvqsbFfurGA308qWoPU76UByndzyPaG/zgYrfHJADqjwQ3Fs5x64sXhwHb9nc4gNZGLux8YO+QajiA2lx1GrSQx0tPlAg12YG8tWa4gMBjMb3N2xRxglTrF13y94B5RlcTz2HaN4BjC46EK2UzKsMV+gI2Idwt82yU2M00i5fdCALlfa/DGHcsnflhys/XPnhlr0DckAVBdKyL7RUL5cNCHOFOqOPgL6GHv4BX14g+pKGyfE3tKN/QSDxyD6odGj5MFcJtlYBTIst5sCXG/FhW+VgsEO02hCa8asW4YtnSPoTzwNlgBgAyuXJp3BPLcxxDAIW7eqU/T4wfwAAAABJRU5ErkJggg==) no-repeat;background-size: cover;}';
	addCSSText(cssText1 + cssText2);
	
//获取 userId 且 deviceId 为空
if ((userId === '' && deviceId === '')) {
		if (localStorage.getItem('go108_tlp_guid')) {
			  userId = localStorage.getItem('go108_tlp_guid');
			  deviceId = localStorage.getItem('go108_tlp_guid');
			  historyBtn.style.display = 'none';
		} else {
			  historyBtn.style.display = 'none';
		}
}

	
var history_url = historyBaseUrl + (historyBaseUrl.indexOf('?') > -1 ? '&' : '?') + 'userId=' + userId +'&deviceId=' + deviceId ;
historyBtn.setAttribute('href', history_url);
global.document.body.appendChild(historyBtn);

	function addCSSText(cssText) {
		var style = document.createElement('style'), //创建一个style元素
			head = document.head || document.getElementsByTagName('head')[0]; //获取head元素
		style.type = 'text/css'; //这里必须显示设置style元素的type属性为text/css，否则在ie中不起作用
		if (style.styleSheet) { //IE
			var func = function () {
				try { //防止IE中stylesheet数量超过限制而发生错误
					style.styleSheet.cssText = cssText;
				} catch (e) {
					console.log(e);
				}
			};
			//如果当前styleSheet还不能用，则放到异步中则行
			if (style.styleSheet.disabled) {
				setTimeout(func, 10);
			} else {
				func();
			}
		} else { //w3c
			//w3c浏览器中只要创建文本节点插入到style元素中就行了
			var textNode = document.createTextNode(cssText);
			style.appendChild(textNode);
		}
		head.appendChild(style); //把创建的style元素插入到head中
	}

	function getQueryValue(key) {
		var reg = new RegExp('(^|&)' + key + '=([^&]*)(&|$)', 'i');
		var r = window.location.search.substr(1).match(reg) || window.location.hash.substr(1).match(reg);
		if (r != null) {
			return decodeURIComponent(r[2]);
		}
		return null;
	}
	
})(window);