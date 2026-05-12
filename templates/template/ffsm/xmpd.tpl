<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8"/>
<title><{$data.seotitle}></title>
<meta name="keywords" content="<{$data.keywords}>" />
<meta name="description" content="<{$data.description}>" />
<meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
<meta content="yes" name="apple-mobile-web-app-capable"/>
<meta content="black" name="apple-mobile-web-app-status-bar-style"/>
<meta content="telephone=no" name="format-detection"/>
<link rel="shortcut icon" href="/statics/ffsm/favicon.ico"/>
<link href="/statics/ffsm/public/wap.min-v=0817.css" rel="stylesheet" type="text/css"/>
<link href="/statics/ffsm/xmpeidui/2/style.min.css" rel="stylesheet" type="text/css"/>
   <link href="/statics/quanju.css" rel="stylesheet" type="text/css">
<{include file='./ffsm/wx_share.tpl'}>
<script src="https://apps.bdimg.com/libs/jquery/1.9.1/jquery.min.js"></script>
<{$page_meta}>
</head>
<body>
 <{include file='./ffsm/header.tpl'}>
<div class="banner_top">
	<img src="/statics/ffsm/xmpeidui/2/images/banner.jpg" alt="">
</div>
<div class="banner_form">
	<img src="/statics/ffsm/xmpeidui/2/images/banner_2.jpg" alt="">
	<div class="bf_form J_testFixedShow" id="formTab">
		<form class="J_ajaxForm" action="/?ac=xmpd" method="post">
			<div class="bf_input_box">
				<div class="bf_left">
					<p>男主</p>
					<div class="bf_input">
						<span>姓氏:</span><input type="text" name="malexing" placeholder="输入姓">
					</div>
					<div class="bf_input">
						<span>名字:</span><input type="text" name="malename" placeholder="输入名">
					</div>
				</div>
				<div class="bf_right">
					<p>女主</p>
					<div class="bf_input">
						<span>姓氏:</span><input type="text" name="femalexing" placeholder="输入姓">
					</div>
					<div class="bf_input">
						<span>名字:</span><input type="text" name="femalename" placeholder="输入名">
					</div>
				</div>
			</div>
			<div class="public_agreement" style="color:#ffffff;padding:6px 10px 0;font-size: 14px;">
				<input type="checkbox" checked="checked" id="agreeInput">同意<a href="javascript:;" id="protocolShowBtn">个人隐私协议</a>
			</div>
			<div class="bf_input_down">
            	<input type="submit" value="开始配对" class="J_ajax_submit_btn">
			</div>
		</form>
	</div>
	<a class="bf_search" href="/?ac=history"></a>
</div>
<div class="test_tip">

    <img src="\statics\ffsm\xmpeidui\2\images/peidui_03.jpg" width="100%">
    <img src="\statics\ffsm\xmpeidui\2\images/peidui_04.jpg" width="100%">
    <img src="\statics\ffsm\xmpeidui\2\images/peidui_05.jpg" width="100%">
    <img src="\statics\ffsm\xmpeidui\2\images/peidui_06.jpg" width="100%">
    <img src="\statics\ffsm\xmpeidui\2\images/peidui_07.jpg" width="100%">
	 <img src="\statics\ffsm\xmpeidui\2\images/dh_2662.jpg" width="100%">
</div>

<div class="protocol_pop_box" id="protocolPopBox">
	<div class="ppb_content">
		<div class="ppb_title">
			个人隐私协议
		</div>
		<div class="ppb_text">
			<p>
				尊敬的用户，欢迎阅读本协议：
			</p>
			<p>
				<{$zhanming}>依据本协议的规定提供服务，本协议具有合同效力。您必须完全同意以下所有条款，才能保证享受到更好的服务。您使用服务的行为将视为对本协议的接受，并同意接受本协议各项条款的约束。
			</p>
			<p>
				用户在申请<{$zhanming}>服务过程中，需要填写一些必要的个人信息，为了更好的为用户服务，请保证提供的这些个人信息的真实、准确、合法、有效并注意及时更新。<strong>若因填写的信息不完整或不准确，则可能无法使用本服务或在使用过程中受到限制。如因用户提供的个人资料不实或不准确，给用户自身造成任何性质的损失，均由用户自行承担。</strong>
			</p>
			<p>
				保护用户个人信息是<{$zhanming}>的一项基本原则，<{$zhanming}>运用各种安全技术和程序建立完善的管理制度来保护用户的个人信息，以免遭受未经授权的访问、使用或披露。<strong>未经用户许可<{$zhanming}>不会向第三方（<{$zhanming}>公司或关联、运营合作单位除外）公开、透露用户个人信息，但由于政府要求、法律政策需要等原因除外。</strong>
			</p>
			<p>
				在用户发送信息的过程中和本网站收到信息后，<strong>本网站将遵守行业通用的标准来保护用户的私人信息。但是任何通过因特网发送的信息或电子版本的存储方式都无法确保100%的安全性。因此，本网站会尽力使用商业上可接受的方式来保护用户的个人信息，但不对用户信息的安全作任何担保。</strong>
			</p>
			<p>
				此外，您已知悉并同意：<strong>在现行法律法规允许的范围内，<{$zhanming}>可能会将您非隐私的个人信息用于市场营销，使用方式包括但不限于：在网页或者app平台中向您展示或提供广告和促销资料，向您通告或推荐服务或产品信息，使用，短信等方式推送其他此类根据您使用<{$zhanming}>服务或产品的情况所认为您可能会感兴趣的信息。</strong>
			</p>
			<p>
				本网站有权在必要时修改服务条例，<strong>本网站的服务条例一旦发生变动，将会在本网站的重要页面上提示修改内容，用户如不同意新的修改内容，须立即停止使用本协议约定的服务，否则视为用户完全同意并接受新的修改内容。</strong>根据客观情况及经营方针的变化，本网站有中断或停止服务的权利，用户对此表示理解并完全认同。
			</p>
			<p>
				如果您还有其他问题和建议，可以通过<{$lianxifs}>或者微信关注【<{$weixinhao}>】联系我们。
			</p>
			<p>
				<{$zhanming}>保留对本协议的最终解释权。
			</p>
		</div>
		<div class="ppb_close" id="protocolHideBtn">
			<b>关闭</b>
		</div>
	</div>
</div>
<div class="zt_bottom_r">
	<a href="/?ac=xmpd" class="botpost"><img src="/statics\ffsm\xmpeidui\2\images/lapd_index_04.gif" width="100%" border="0"></a>
  </div>

<style type="text/css">
zt_bottom_r{float: left;
    overflow: hidden;display: block; padding: 2px 0; position: fixed; bottom: 0; width: 100%; z-index: 99999;max-width: 640px;}
</style>
<script>
    //测试底部悬浮
    (function(){
    	var topShow=$(".J_testFixedShow");
    	if(topShow.length){
            var topShow=topShow.offset().top;
    		var testBtn=$("#testFixedBtn");
    		$(window).scroll(function(){
                var wt=$(window).scrollTop();
                wt>topShow?(testBtn.fadeIn(),$('.public_footer_servers').css('padding-bottom','50px')):(testBtn.fadeOut(),$('.public_footer_servers').css('padding-bottom','20px'));
            });
            testBtn.add('.J_testScrollTop').on('click',function(){$('html,body').scrollTop(topNum)})
    	}
    })()
</script>
<script type="text/javascript">
function _resize(){
    var html= document.getElementsByTagName('html')[0];
    var hW = html.offsetWidth > 750 ? 750 : html.offsetWidth;
    var fS = 100/750 * hW;
    html.style.fontSize = fS+"px"
}
_resize();
window.onresize = function(){
    _resize();
};
</script>
<{include file='./ffsm/dl_ck.tpl'}>
</body>
</html>