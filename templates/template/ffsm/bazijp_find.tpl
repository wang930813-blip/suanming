
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8"/>
<title>八字精批测试结果-<{$zhanming}></title>
<meta http-equiv=X-UA-Compatible content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
<meta content="yes" name="apple-mobile-web-app-capable"/>
<meta content="black" name="apple-mobile-web-app-status-bar-style"/>
<meta content="telephone=no" name="format-detection"/>
<link rel="shortcut icon" href="/statics/ffsm/favicon.ico"/>
<link href="static/css/wap.min-v=0817.css" rel="stylesheet" type="text/css"/>
<link href="static/css/page1.css" rel="stylesheet" type="text/css"/>
<link href="static/css/11.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="static/js/jweixin-1.6.0.js"></script>
<script>
//处理支付宝隐藏
function displayzfb(){
    inquiry();
}
displayzfb();
</script>

<script type="text/javascript" src="static/js/jquery.min.js"></script>
<script src="static/js/echarts.min.js"></script>

<script src="static/js/suanming-find.js"></script>
	<script src="static/js/require.min.js"></script>
	<script src="static/js/common.min.js"></script>
	<link href="static/css/ziwei.min.css" rel="stylesheet" type="text/css"/>


</head>
<body>
 <{include file='./ffsm/header.php'}>
<{include file='./ffsm/tabBar.php'}>
<style>
.content{
border: 0px solid #dfdfdf;
}
html {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: Microsoft YaHei, "微软雅黑", Helvetica, STHeiti,
		Droid Sans Fallback;
		max-width: none;
}

.analysefont3{
	color: #000;
	margin-left: 4%;
	margin-right: 4%;
	padding-bottom: 4%;
	font-size: 15px;
	font-weight: 700;
	align-items: center;
	min-height: 180px;
}
.baziFour2 {
    width: 35%;
    border-radius: 18px;
    text-align: center;
    line-height: 2.1875rem;
    background-color: #0614b7;
    font-size: 20px;
    font-family: Source Han Sans CN;
    font-weight: 700;
    border-radius: 1.533333rem;
    color: #fff;
    animation: now_test 1s infinite;
    animation-direction: alternate;
    animation-timing-function: ease-in-out;
    -webkit-animation: now_test 1s infinite;
    -webkit-animation-direction: alternate;
    -webkit-animation-timing-function: ease-in-out;
    padding: 7px 0;
    /* position: absolute; */
    margin-top: 38%;
    right: 6%;
    text-indent: 0rem;
    margin-left: 66%;
    margin-top: 48%;
}
header {
	position: fixed;
	top: 0;
	left: 50%;
	-webkit-transform: translate(-50.1%);
	transform: translate(-50.1%);
	display: flex;
	flex-direction: row;
	align-items: center;
	width: 100%;
	height: 5rem;
	padding: 0 .5rem;
	background-size: 100% 100%;
	background-repeat: no-repeat;
	box-sizing: border-box;
	background:
		url('static/images/bg2.png');
	background-size: 100% 100%;
	z-index: 99;
}
header .header-auto {
    display: flex;
    width:22rem;
    margin: 0 auto;
    align-items: center;
}
header img {
	width: 3.3125rem;
	height: 3.3125rem;
	border-radius: 50%;
}

header .center {
	display: flex;
	flex-direction: column;
	justify-content: center;
	width: 14.4375rem;
	height: 5rem;
	color: #fff;
	margin: auto 6px;
}

header .center .name {
	font-size: .875rem;
}

header .center .explain {
	font-size: .75rem;
	margin: 0;
}

header .right {
	display: flex;
	align-items: center;
	justify-content: center;
	width: 4.0625rem;
	height: 1.75rem;
	background: linear-gradient(0deg, #fad088, #fdf7bd);
	box-shadow: 1px 1px 2px 0 #bb9148;
	border-radius: .3125rem;
	font-size: .875rem;
	font-weight: 600;
	color: #f5303a;
	margin-left: .5rem;
	white-space: nowrap;
	border: none;
}

.banner {
	width: 100%;
	margin-top: 5rem;
}.info {
    padding: 0.8rem 0.266667rem 0.266667rem;
    background-color: #fff;
    border: 0.2rem solid #ffecb8;
    position: relative;
    border-radius: 0.133333rem;
    margin-top: 4%;
}

.banner img {
	width: 100%;
	height: 1.75rem;
}

.report {
	background: url(static/images/find003.png) no-repeat;
    background-size: 100% 100%;
    width: 80%;
    text-align: center;
    position: absolute;
    margin-left: 10%;
    margin-top: -8%;
    color: #fff;
	height: 1.9375rem;
	line-height: 1.9375rem;
}

.info {
	font-size: .875rem;
}
.info p{
   margin-bottom: 5px;
	font-size: 18px;
}
.wuxing-btn {
	border-radius: 0.666667rem;
	background-color: #efbe34;
	text-align: center;
	color: #c92121;
	width: 85%;
	margin-left: 8%;
	font-size: 17px;
	padding: 8px 0;
}

.info .basicInfo {
	display: flex;
    height: 1.875rem;
    flex-direction: row;
    align-items: center;
    font-size: 18px;
    font-family: Source Han Sans CN;
    margin-top: 0.625rem;
    margin-left: 1rem;
    margin-bottom: 10px;
}
.rewrite-text {
	font-size: 20px;
	border: 0.013333rem solid #9e774f;
	border-radius: 0.133333rem;
	padding: 0 0.133333rem;
	margin-left: 0.666667rem;
	color: #9e774f;
	line-height: 1.5rem!important;
}
.rewrite-text img {
	width: 20px;
	height: 20px;
	margin-right: 0.133333rem;
}

.info .basicInfo .textbox {
	font-size: 20px;
	height: 1.875rem;
	line-height: 2.2rem;
}

.info .basicInfo .textbox {
	background-repeat: no-repeat;
	background-size: 100% 100%;
	font-family: Fotor_HelloFont_GongYiTi;
	font-weight: 400;
	margin-right: .3125rem;
}

.bornDay {
	display: flex;
	margin-left: 1rem;
}

.bornDay .bornTime {
	display: flex;
	flex-direction: column;
	    width: 80%;
}

.line {
	border: 1px solid #8a8a8a;
	width: 89%;
	margin: 0 auto;
}

.wuxingstyle {
	display: flex;
	align-items: center;
	justify-content: center;
}

.wuxingstyle button {
	height: 1.9375rem;
	border-radius: 1rem;
	text-align: center;
	font-size: 1rem;
	background: linear-gradient(21deg, rgb(236, 92, 83), rgb(239, 138, 90));
	color:white;
	border:1px white solid;
	padding: 0 10px;
}

.youprivilege img {
	width: 100%;
	height: 100%;
}

.youreport {
	display: flex;
	align-items: center;
	color: #fff;
	background-color: #FBAE1f;
	justify-content: center;
	height: 2.0625rem;
	font-weight: 700;
}

main {
	padding-top: .3125rem;
}

.bazi {

	width: 22.0625rem;
	background-repeat: no-repeat;
	margin: auto;
	font-size: 1.4375rem;
	font-weight: bold;
	padding-bottom: .625rem;
}

.baziFour {
	color: #ffefd8;
    width: 16.25rem;
    height: 2.8125rem;
    margin: auto;
    display: flex;
    align-items: center;
    justify-content: center;
    background: url(static/images/find003.png) no-repeat;
    background-size: 100% 100%;
    font-size: 26px;
}

.bazilayout {
    width: 14.875rem;
    height: 2.2875rem;
    border-radius: 18px;
    text-align: center;
    line-height: 2.1875rem;
    background-color: rgb(255, 202, 123);
    margin: 0 auto;
    margin-bottom: 1.505rem;
    font-size: 20px;
    font-family: Source Han Sans CN;
    font-weight: 700;
    color: #6d4c0e;
    background: linear-gradient(0deg,#fd976a,#ffe1b2);
    border-radius: 1.533333rem;
    color: #5f1b06;
}

.plating {
	font-family: ZiYuKangSongTi;
font-weight: 400;
border-radius: 0.8rem;
font-size: .875rem;
margin-bottom: 0.8rem;
padding: 10px;
background-color: #fffcf3;
border: 0.1rem solid #e7bd82;
margin-top: 4%;
width: 19.9875rem;
margin: auto;
}

.plating table {
	width: 100%;
}

.plating table td {
	height: 1.9375rem;
	width: 3.9375rem;
	border-right: 1px solid #f3e0bf;
	border-top: 1px solid #f3e0bf;
}

.cycle {
	display: flex;
	align-items: center;
	font-size: .9375rem;
	margin-left: 1.25rem;
	color: #fdd085;
	flex-direction: row;
	margin-top:.5rem;
}

.cycle .line {
	width: .1875rem;
	height: .9375rem;
	background-color: #fdd085;
	margin:0;
	margin-right: .625rem;
}

.Spring {
	font-size: .8125rem;
	color: #fff;
	display: flex;
	flex-direction: column;
	margin-left: 1.25rem;
	margin-top:.36rem;
}

.notic {
	display: flex;
	align-items: center;
	border-radius: .5rem;
	background: #fef5e4;
	font-size: .75rem;
	line-height: 1.4375rem;
	margin: .625rem 1.25rem;
}

.notic img {
	width: 5.5rem;
	height: 5.9375rem;
}
.geomancy{
        background-color: rgb(40, 56, 118);
}
.geomancy img {
	width: 100%;
}

.analyse4 {
    font-size: .875rem;
	color: #fff;
    min-height: 190px;
    background: url(static/images/xl001.jpg) no-repeat;
    padding: 0.8rem 0.266667rem 0.266667rem;
    background-size: 100% 100%;
    margin-bottom:10px;
}
.analyse {
	font-size: .875rem;
	color: #000;
	margin-bottom: 0.8rem;
	padding: 0.8rem 0.266667rem 0.266667rem;
	background-color: #fffcf3;
	border: 0.5rem solid #ffecb8;
	margin-top: 4%;
	padding-left: 4%;
	padding-right: 4%;
	padding-bottom: 4%;
}

.analyse p {
	text-indent: 1rem;
}

.askTeacher {
	background:
		url('static/images/yunshifenxi4.png');
	width: 22.75rem;
	height: 6.375rem;
	margin: .4375rem auto;
	background-repeat: no-repeat;
	background-size: 100% 100%;
}

.futrue {

	width: 353px;
	background-repeat: no-repeat;
	margin: auto;
	font-size: 1.4375rem;
	font-weight: bold;
	padding-bottom: .625rem;
	display: flex;
	align-items: center;
	flex-direction: column;
}

.futureAnalyse {
    color: #fff;
    width: 16.25rem;
    height: 2.8125rem;
    margin-top: 1.40625rem;
    margin: auto;
    display: flex;
    align-items: center;
    justify-content: center;
    border-bottom-left-radius: 16px;
    border-bottom-right-radius: 16px;
    background: url(static/images/find003.png) no-repeat;
    background-size: 100% 100%;
}

.futrue .img img {
	width: 19.9375rem;
	height: 5.9375rem;
	margin-top: 1.25rem;
}

.Fortune {
	margin: 0 1.25rem;
}

.Fortune img {
	width: 100%;
	margin-top: 0.25rem;
}

.month {
	background:
		url('static/images/tx604.png');
	width: 21.25rem;
	min-height: 27.4375rem;
	background-repeat: no-repeat;
	background-size: 100% 100%;
	margin: 0 auto;
	padding-top: .625rem;
	margin-top: .9375rem;
	padding-bottom: .9375rem;
	box-sizing: border-box;
}

.exergue {
	font-size: 1rem;
	font-family: SourceHanSerifCN;
	font-weight: 800;
	color: #fff;
	margin-left: .875rem;
}

.month .textbox .date {
	color: #A82028;
	font-size: .9375rem;
	text-align: center;
	margin: auto;
	margin-top: 1.875rem;
	font-weight: 700;
}
.month .textbox .title {
    margin-top: 15px;
    font-weight: 400;
    font-size: .9375rem;
    font-family: Fotor_HelloFont_GongYiTi;
    color: #443632;
    line-height: 1.5rem;
    text-indent: 2rem;
}
.month .textbox .title img{
    margin-top: 15px;
    
}
.warp1-text .month:nth-child(odd) .textbox .title img{
    animation: now_test 1s infinite;
    animation-direction: alternate;
    animation-timing-function: ease-in-out;
    -webkit-animation: now_test 1s infinite;
    -webkit-animation-direction: alternate;
    -webkit-animation-timing-function: ease-in-out;
}
.warp1-text .month:nth-child(even) .textbox .title img{
    animation: now_test1 1s infinite;
    animation-direction: alternate;
    animation-timing-function: ease-in-out;
    -webkit-animation: now_test1 1s infinite;
    -webkit-animation-direction: alternate;
    -webkit-animation-timing-function: ease-in-out;
} 


.month .textbox .title p {
	line-height: 1.5rem;
}

.month .textbox {
	font-size: .875rem;
	color: #443632;
	line-height: 1;
	width: 18.6875rem;
	margin: auto;
}

.month .textbox .text {
	color: #008000;
}

.month .textbox img {
	width: 12.3125rem;
	height: 2.4375rem;
}

.protocol_pop_box .form_item {
    margin-bottom: 10px;
    height: 50px;
    line-height: 50px;
    border-radius: 5px;
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-align: center;
    -ms-flex-align: center;
    align-items: center;
    overflow: hidden;
    border: 2px #dccbc3 solid;
    margin-top:30px;
}
.protocol_pop_box .form_item .label {
    padding-left: 10px;
    color: #9292f4;
    font-size: 14px;
}
.protocol_pop_box .form_item .label img {
    width:36px;
    margin-top:12px;
}
.protocol_pop_box .form_item .info {
    height: 36px;
    line-height: 36px;
    font-size: 14px;
    margin: 10px 0;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
    border: none;
    -webkit-border-radius: 0;
    padding: 0;
        width: 100%;
}

footer {
	position: fixed;
	bottom: 0;
	width: 100%;
	left: 0;
}

footer .select {
	background: white;
	display: flex;
	align-items: center;
	justify-content: space-between;
}

.backHome {
	padding-left: 1.25rem;
	font-size: .875rem;
	display: flex;
	align-items: center;
	justify-content: center;
	flex-direction: column;
}

.backHome img {
	width: 1.375rem;
	height: 1.375rem;
}

.redPack {
	font-size: .875rem;
	display: flex;
	align-items: center;
	justify-content: center;
	flex-direction: column;
}

.redPack img {
	width: 1.375rem;
	height: 1.375rem;
}

.baziFour1 {
	    width: 19.875rem;
    height: 2.2875rem;
    text-align: center;
    line-height: 2.2875rem;
    background-color: #efbe34;
    margin: 0 auto;
    /* margin-bottom: 1.505rem; */
    font-size: 22px;
    font-weight: 700;
    animation: now_test 1s infinite;
    animation-direction: alternate;
    animation-timing-function: ease-in-out;
    -webkit-animation: now_test 1s infinite;
    -webkit-animation-direction: alternate;
    -webkit-animation-timing-function: ease-in-out;
    padding: 7px 0;
    margin-top: 12px;
}

.select button {
    width: 100%;
    background: #fcbe34;
    height: 3.125rem;
    line-height: 3.125rem;
    text-align: center;
    font-size: 1.25rem;
    color: #c92121;
    padding-left: 0.3125rem;
    border: none;
}
.analysefont {
	text-indent: 1rem;
	color: #000;
	font-size: 15px;
	font-weight: 700;
}
@keyframes now_test {
    0% {
        -webkit-transform: scale(.9)
    }

    to {
        -webkit-transform: scale(1)
    }
}

@-webkit-keyframes now_test {
    0% {
        -webkit-transform: scale(.9)
    }

    to {
        -webkit-transform: scale(1)
    }
}
@keyframes now_test1 {
    0% {
        -webkit-transform: scale(1)
    }

    to {
        -webkit-transform: scale(.9)
    }
}

@-webkit-keyframes now_test1 {
    0% {
        -webkit-transform: scale(1)
    }

    to {
        -webkit-transform: scale(.9)
    }
}
</style>

<div id="new-page-2023">
<header>
	<div class="header-auto">
	    <p>
    		<img
    			src="static/picture/top01.png"
    			alt="">
    	</p>
    
    	<div class="center">
    		<span class="name"> <{$data.data.username}>缘主 </span>
    		<p class="explain">近半年您的运势暗藏危机，恐有不测需提前防范，咨询老师发现并逢凶化吉</p>
    	</div>
    	<button class="right "><a style="color: red;" href="/?ac=dashi">请教老师</a></button>
	</div>
</header>

<div class="banner">
	<img src="static/picture/tip.gif"
		alt="">
</div>

<div class="info" >
    <div class="report">
	<span><{$data.data.username}>的运势报告</span>
</div>
	<div class="basicInfo">
		<span>您的姓名：</span>
		<p class="textbox"><{$data.data.username}></p>

	</div>
	<p class="basicInfo" style="margin-left: 16px;">
		<span >您的性别：</span><{if $data.data.gender==1}>男<{else}>女<{/if}>
		<span style="margin-left: 16px;">生肖：</span> <span style="margin-right: 10px;">龙</span>
	</p>
	<div class="bornDay" style="font-size: 17px;">
		<span >生辰(新历)：</span><{$data.data.y}>年<{$data.data.m}>月<{$data.data.d}>日 <{$data.data.h}>时</span>

	</div>
	<div class="bornDay" style="font-size: 17px;">
		<span >生辰(农历)</span><{$data.data.lDate}>
	</div>
    <div class="wuxingstyle"  style="margin-bottom: 5px;">

	</div>
	<div class="line"></div>
	<div style=" margin:5px 16px;">
	    <div class="infor-table">
            <p class="key-text">您的五行八字资料</p>
            <table>
              <tbody>
                <tr>
                 <th>八字</th>
              <th>年柱</th>
              <th>月柱</th>
              <th>日柱</th>
              <th>时柱</th></tr>
            <tr>
              <td>天干</td>
              <td><{$return.user.bazi.0}></td>
              <td><{$return.user.bazi.2}></td>
              <td><{$return.user.bazi.4}></td>
              <td><{$return.user.bazi.6}></td></tr>
            <tr>
              <td>地支</td>
              <td><{$return.user.bazi.1}></td>
              <td><{$return.user.bazi.3}></td>
              <td><{$return.user.bazi.5}></td>
              <td><{$return.user.bazi.7}></td></tr>
              </tbody>
            </table>
          </div>
            <div class="solution-box clearfix">
            <div class="sol-left">
              <p class="wuxing-btn" onclick="opendwin();" style="MARGIN-TOP: 8px;">
                  点击获取您的五行调和方案&gt;&gt;&gt;
                </p>
            </div>
            <div class="sol-left">
              <p>本命属<{$cookies.sx}>，<{$nayin.0.layin}>命。<{$wang.wang}><{$wang.que}>；日主天干为<{$nayin.0.layin}><{$wang.wang}><{$wang.que}><{$cookies.bazi.4}>，生于<{$cookies.siji}>季。</p>
              <p>
              </p>
            </div>
            <div class="sol-left">
              <p><span>五行旺弱：</span> <span>您目前五行失衡，磁场较弱</span></p>
              <p>
              </p>
            </div>

            <div class="sol-left">
              <p><span>喜用神：<{$return.data.xiyongshen.data.xishen}>
              <p>
              </p>
            </div>
            <!--<div class="sol-right">-->
            <!--<img src="static/picture/pic8.png" alt="">-->
            <!--</div>-->
		  </div>
        </div>
	</div>

	<!--
	<div class="youprivilege">
		<img class="page-lianxi-teacher" 
			src="static/picture/top02.png"
			alt="">
	</div>
	-->
	<div class="youreport">
		<span>以下是您的分析报告</span>
	</div>

	<main style="background-color: #ffefd8; width: 100%;margin-bottom: 3.025rem;">
	<div class="bazi">
		<p class="baziFour">八字四柱分析</p>


		<div class="plating" style="margin-top: 9px">
		    <div class="list-text">
                <span class="red">提示:</span>
                <span  >八字命盘从阴阳干支三合历取得。上排是天干，由五行「金水木火土」轮流排列。下排是地支，用十二生肖顺序排列。十二生肖可转换成五行。</span></div>
          <table>
            <tbody>
              <tr>
                <th  style="background: linear-gradient(0deg,#ffddae,#ffddae);">八字</th>
                <th  style="background: linear-gradient(0deg,#ffa679,#ffd8a8);">年柱</th>
                <th  style="background: linear-gradient(0deg,#ffa679,#ffd8a8);">月柱</th>
                <th  style="background: linear-gradient(0deg,#ffa679,#ffd8a8);">日柱</th>
                <th  style="background: linear-gradient(0deg,#ffa679,#ffd8a8);">时柱</th></tr>
              <tr>
                <!--1=天干 2地支 3本气 4余气 5杂气-->
                <th>天干</th>
            <td><{$return.user.bazi.0}>/<{$pp.shishen1}></td>
            <td><{$return.user.bazi.2}>/<{$pp.shishen2}></td>
            <td><{$return.user.bazi.4}>/日主</td>
            <td><{$return.user.bazi.6}>/<{$pp.shishen4}></td></tr>
          <tr>
            <th>地支</th>
            <td><{$return.user.bazi.1}>/<{$pp.z_shishen1}></td>
            <td><{$return.user.bazi.3}>/<{$pp.z_shishen2}></td>
            <td><{$return.user.bazi.5}>/<{$pp.z_shishen3}></td>
            <td><{$return.user.bazi.7}>/<{$pp.z_shishen4}></td></tr>
          <tr>
            <th>藏干</th>
            <td><{$pp.zanggan1}></td>
            <td><{$pp.zanggan2}></td>
            <td><{$pp.zanggan3}></td>
            <td><{$pp.zanggan4}></td></tr>
          <tr>
            <th>命宫</th>
            <td colspan="4"><{$pp.minggong}></td></tr>
          <tr>
            <th>胎元</th>
            <td colspan="4"><{$pp.taiyuan}></td></tr>
          <tr>
            <th>胎息</th>
            <td colspan="4"><{$return.user.bazi.6}><{$return.user.bazi.7}></td></tr>
            </tbody>
          </table>
            
            <div class="">
                  <h3  >
                    <span class="">五行综述</span></h3>
                  <table style="width: 100%;">
                    <tbody>
                      <tr>
                        <th>八字</th>
            <th><{$return.user.bazi.0}><{$return.user.bazi.1}></th>
            <th><{$return.user.bazi.2}><{$return.user.bazi.3}></th>
            <th><{$return.user.bazi.4}><{$return.user.bazi.5}></th>
            <th><{$return.user.bazi.6}><{$return.user.bazi.7}></th></tr>
			<tr>
            <th>五行</th>
            <td><{$cookies.wh.0}><{$cookies.wh.1}></td>
            <td><{$cookies.wh.2}><{$cookies.wh.3}></td>
            <td><{$cookies.wh.4}><{$cookies.wh.5}></td>
            <td><{$cookies.wh.6}><{$cookies.wh.7}></td>
                            </tr>
                    </tbody>
                  </table>
             </div>
		</div>
		
		<div class="notic" style="margin-top:20px;">
			<p>
				<img
					src="static/picture/z51.png"
					alt="">
			</p>
			<p>接下来，老师会针对你个人的八字命 盘特点，全面批算人生各个方面的命格情 况，预测未来运势，提供专属人生规划建
				议报报告内容很多，请耐心观看。</p>
		</div>

		<div class="geomancy">
			<img class="page-lianxi-teacher" 
				src="static/picture/yunshifenxi4.png"
				alt="">
		</div>

		<p class="baziFour">一生八字运势分析</p>
		<div class="bazi">
			<div class="analyse">
				<p class="bazilayout">性格分析</p>
				<p class="analysefont"></p>
                <p class="analysefont">
                		<p>您出生于农历<{$return.user.lDate}>，五行生肖为:<{$return.user.sx}></p>
		<{$return.info.sxgx.sxgx}>
<p><font color="#ff4632">优点</font>:<{if $return.data.zonghe.yx}><{$return.data.zonghe.yx}><{else}>才智高且具优秀的头脑，行动活泼好动且伶俐。好竞争，手腕敏捷有侠义心情，反应快，能见机行事。社交手腕高明善解人意，很快与人打成一片，但不喜欢被人控制，喜爱追求新鲜事务。聪明、机智、创新有才华，能言善道，有极强的自我表现欲。非常适合演艺和推销工作猴年生的男性精力充沛身体健壮，常表现达观机智勇敢，对环境变化有很强的适应能力生性顽强不服输，拥有多项才能而能居主导地位。求知欲很强，记忆力超人，头脑灵活很有创造力。善于把握机会扩大发展，造成时势，成为大企业家。<{/if}></p>
          <p><font color="#ff4632">缺点</font>:<{if $return.data.zonghe.qd}><{$return.data.zonghe.qd}><{else}>平常爱说大话，有时有反对人之意见虚语或伪诈行为。忽略必需遵守社会全体规范，有点不脚踏实地。生性爱玩缺乏耐心毅力，眼光看得不远，犯有今朝有酒今朝醉的毛病。依赖心很重，好夸张和爱慕虚荣且喜新厌旧，不管做任何事都不会持续太久。狡滑伪善，无耐心不忠实狂妄自大，过份乐观，自负心强喜投机。为了达成目的喜爱说谎骗人，尽管才智出众八面玲珑，却不能以德服人，是典型的机会主义者。猴年生人无论说话做事一定要诚实踏实，否则会一塌糊涂。有自以为是急就章的毛病，所以常导致错误失败。<{/if}></font></p>
			</div>

            <div class="analyse">
				<p class="bazilayout">爱情分析</p>
			
          <p>您命中有:红艳桃花<{if $return.data.zonghe.th}><{$return.data.zonghe.th}><{else}>1<{/if}>朵</p>
          <p><{$rglm.aqfx}></p></div>
			</div>
			
			<div class="analyse">
				<p class="bazilayout">事业分析</p>
				<span></span></h3>
        <div class="warp1-text">
		<p><{$rglm.syfx}></p>
		<p><{$tywh.hyhw}></p>
			</div>
				</div>
			<div class="analyse">
				<p class="bazilayout">健康分析</p>
				<p class="analysefont"></p>
        		 <span></span></h3>
        <div class="warp1-text">
		<p><{$return.data.rgxx.jkfx}></p>
		<p>易患疾病:<{$return.info.wharr.whjk.jb}></p>
		<p>易发症状:<{$return.info.wharr.whjk.zz}></p>
		<p>从中医养生上来说，您基本上是<font color="#ff4632"><{$return.info.wharr.wang}></font>型人。</p>
		<p>养生要点:<{$return.info.wharr.whjk.yd}></p>
		<p>生活起居:<{$return.info.wharr.whjk.sh}></p>
		<p>饮食调养:<{$return.info.wharr.whjk.ys}></p>
		<p>保健膳食:<{$return.info.wharr.whjk.bj}></p></div>
      </div>
			</div>
			
			<div class="analyse">
				<p class="bazilayout">财运分析</p>
				<p class="analysefont"><p><{$rglm.cyfx}></p></p>
			</div>
			
			  <div class="analyse">
				<p class="bazilayout">三命通会</p>
				<p class="analysefont">
<p><{$sxth.tf1}></p>
          <p><{$sxth.tf2}></p>。</p>
			</div>
			<p class="baziFour" style="width: 21rem;font-size: 23px;">什么是喜用神</p>
			<div class="analyse">
				<p class="analysefont3">喜用神是中国传统八字命运学上的术语， 喜用神是喜神与用神的合称。八字，即把人出生的年、月、日、时分作四柱，每柱配有一天干和地支，合共八字。八字不同的排列，包含不同的阴阳五行信息，构成各种不同的八字命局。
					命局中有“不及”和“太过”等情况，称作“病”，而“用神”正是针对不同的“病”所下的“药”。“喜神”则是对“用神”能够起到生扶作用的阴阳五行元素。四柱命局以用神为核心， 用神健全有力与否，影响人一生的命。
					一生补救与否, 影响人一生的运。凡用神之力不足，四柱中有生助用神者， 或四柱刑冲克害用神而能化凶神，制凶神者，就是喜神。 四柱没有用神，就得靠行运流年来补。对于命局五行较为平衡，用神不太紧缺的四柱，其一生较为平顺，无大起大落。<span style="color:blue;">你的命盘中五行失衡，会导致个人磁场比较弱，当走到不利于你的大运流年运势时，就容易感到心力憔悴，建议找师兄为您一对一定制专属的五行吉物，调和五行，让自己更顺利</span></p>
			</div>
		</div>

	</div>
	<div class="askTeacher page-lianxi-teacher"></div>
	<div class="futrue">
		<p class="futureAnalyse">未来一年运势分析</p>
		<p class="img">
			<img
				src="static/picture/xbt1.png"
				alt="">
		</p>

		<p class="Fortune">
			<img
				src="static/picture/jy1.png"
				alt="">
		</p>

		<div class="warp1-text">
           <h3>●未来一年:
          <span></span></h3>
        <div class="warp1-text">
          <p><{$myq_text}></p>
        </div>
        </div>
		
	</div>
	</main>
	<footer>
		<div class="select">
			<button class="page-lianxi-teacher"><b>解读报告（98%用户选择）</b></button>
		</div>

	</footer>
</div>
</div>


			</div>
		</div>
	</div>
</form>
<script>
	var sexCheckbox = $(".J_sex");
	if (sexCheckbox.length && sexCheckbox.children("span").on("click", function() {
		$(this).addClass("cur"), $(this).siblings("span").removeClass("cur");
		var e = $(this).data("value");
		$(this).parent().find("input").val(e)
	}), $("form.J_ajaxForm").length > 0) for (var formInput = $("form.J_ajaxForm").find("input"), inp = 0, inpMax = formInput.length; inp < inpMax; inp++) {
		var fthis = formInput.eq(inp),
				fname = fthis.attr("name");
		if ("" != fname && window.localStorage && localStorage.getItem(fname)) switch (!0) {
			case /gender / .test(fname):
				1 == localStorage.getItem(fname) ? fthis.parent(".J_sex").children("span[data-value=1]").addClass("cur").siblings("span").removeClass("cur") : fthis.parent(".J_sex").children("span[data-value=0]").addClass("cur").siblings("span").removeClass("cur"), fthis.val(localStorage.getItem(fname));
				break;
			case /birthday / .test(fname):
				$("#" + fname).attr("data-date", localStorage.getItem(fname));
				break;
			default:
				if ("true" == fthis.attr("nolocal")) break;
				"text" == fthis.attr("type") && fthis.val(localStorage.getItem(fname))
		}
	}
</script>
<style type="text/css">
.ainuo_foot_nav{display: block; padding: 2px 0; background:#ff2e0c; position: fixed; bottom: 0; width: 100%; z-index: 99999;max-width:640px;}
.ainuo_foot_nav ul{margin: 0;padding: 0;}
.ainuo_foot_nav li{width: 20%; text-align: center; float: left;}
.ainuo_foot_nav li a{width: 100%; display: block;}
.ainuo_foot_nav .foothover i{color: #f13030;}
.ainuo_foot_nav li i{display: block; line-height: 25px; height: 25px; margin: auto; padding: 0; width: 25px; overflow: hidden; background-size: 100%;}
.ainuo_foot_nav li a.botpost{position: relative; margin-top: -11px; background-color: rgba(0,0,0,0.0);}
.ainuo_foot_nav li a.botpost em{background: #ffffff; padding: 2px; border: 1px solid #ff5e5e; display: block; border-radius: 50%; width: 30px; height: 30px; margin: 0 auto; margin-bottom: 2px;padding-bottom: 0px;}
.ainuo_foot_nav li p{overflow: hidden; font-size: 12px; height: 16px; line-height: 16px; color: #fff; font-weight: 400;margin: 0;padding: 0;}
.shouye_1{background: url(static/images/shouye.png) no-repeat;}
.wddd_1{background: url(static/images/dingdan.png) no-repeat;}
.lijics_1{background: url(static/images/suan.png) no-repeat;}
.gengduo_1{background: url(static/images/gengduo.png) no-repeat;}
.grzx_1{background: url(static/images/grzx.png) no-repeat;}
</style>
<style type="text/css">
.public_hot_test{
    margin: 0 auto;
}
</style>

<div class="wuxing-pop" style="display:none">
<section class="wuxing-pop-mask"></section>
<section class="wuxing-pop-box">
<div class="content" style="height: 332px;margin-top: 21%;">
<img alt="" src="static/picture/yun1.png" class="yun">
<div class="content-desc"><div class="pie"><div class="chart"><div class="chart-box">
<div class="canvas-box" _echarts_instance_="ec_1681106946289" style="height: 150px; width: 100%; -webkit-tap-highlight-color: transparent; user-select: none;">
<div style="position: relative; width: 294px; height: 150px; padding: 0px; margin: 0px; border-width: 0px;">
<canvas data-zr-dom-id="zr_0" width="588" height="300" style="position: absolute; left: 0px; top: 0px; width: 294px; height: 150px; user-select: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 0px; border-width: 0px;"></canvas>
<div id="canvas_div" name="canvas_div" style="width: 300px;height:200px;left:-20px;"></div>
</canvas>
</div>
</div>
</div>
</div>
</div>
<ul class="tag">
					<li class="tag-jin">
						<div class="li-box"><img src="static/picture/jin.png" class="icon"><div>金</div><div class="text">较弱</div>
						</div>
					</li>
					<li class="tag-mu">
						<div class="li-box"><img src="static/picture/mu.png" class="icon"><div>木</div><div class="text">缺木</div></div>
					</li>
					<li class="tag-shui">
						<div class="li-box"><img src="static/picture/shui.png" class="icon"><div>水</div><div class="text">较弱</div></div></li>
					<li class="tag-huo">
						<div class="li-box"><img src="static/picture/huo.png" class="icon"><div>火</div><div class="text">较弱</div></div>
					</li>
					<li class="tag-tu"><div class="li-box"><img src="static/picture/tu.png" class="icon"><div>土</div><div class="text">旺</div></div>
					</li>
				</ul>
</div>
<p class="analysefont"><{$data.data.username}>缘主，你的命盘中五行失衡，可能会导致个人磁场比较弱，当走到不利于你的大运流年运势时，就容易感到心力憔悴。</p>
</div><div class="btn-box">
<a href="javascript:void(0);" style="display:none;"> 
<img alt="" src="static/picture/yun4.png" class="btn">
<img alt="" src="static/picture/yun1.png" class="yun"></a></div>
<div class="close" onclick="clockwin();">
<img alt="" src="static/picture/close.png"></div>
</section></div>
<script type="text/javascript">
    
function clockwin() {
		$('.wuxing-pop').css('display','none');

	}
	function opendwin() {
		$('.wuxing-pop').css('display','block');

	}
	setTimeout(canvasid(), 5000);

canvasid();
 function canvasid(){
	var chartDom = document.getElementById('canvas_div');
var myChart = echarts.init(chartDom);
var option;
console.log('12.5');
option = {
 
  color: ['yellow', 'green', 'blue', 'red', 'tan'],
  series: [
    {
      type: 'pie',
      radius: '30%',
      data: [
						{ value: '12.5', name: '金'+'12.5'+'%' },
						{ value: '0', name: '木'+'0'+'%'  },
						{ value: '12.5', name: '水'+'12.5'+'%'  },
						{ value: '12.5', name: '火' +'12.5'+'%' },
						{ value: '62.5', name: '土'+'62.5'+'%'  }
					],
      emphasis: {
        itemStyle: {
          shadowBlur: 10,
          shadowOffsetX: 0,
          shadowColor: 'rgba(0, 0, 0, 0.5)'
        }
      }
    }
  ]
};

option && myChart.setOption(option);
 }

</script>
<script type="text/javascript">
function _resize(){
    var html= document.getElementsByTagName('html')[0];
    var hW = html.offsetWidth > 750 ? 750 : html.offsetWidth;
    var fS = 100/750 * hW;
    html.style.fontSize = fS+"px"
}
//_resize();
//window.onresize = function(){
//    _resize();
//};

$(function(){
    $(".page-lianxi-teacher").on("click", function(){
        $(".tuiguang_1").get(0).click();
    });
    
    //获取url参数
    function getQueryString(name) {
        var reg = new RegExp('(^|&)' + name + '=([^&]*)(&|$)', 'i');
        var r = window.location.search.substr(1).match(reg);
        if (r != null) {
        return unescape(r[2]);
        }
        return null;
    }
     //保存手机号
    var protocolShowBtnBD = $("#protocolShowBtn");
    if(protocolShowBtnBD.length) {
		var protocolPopBox = $("#protocolPopBox");
		var popScrollTop = 0;
		protocolShowBtnBD.on("click", function() {
			protocolPopBox.show();
			popScrollTop = $(document).scrollTop();
			$("body").addClass("base_popup");
			$("body").css("top", -popScrollTop);
		});
		protocolPopBox.find("#protocolHideBtn").on("click", function() {
			$("body").removeClass("base_popup");
			$(document).scrollTop(popScrollTop);
			protocolPopBox.hide();
		});
		//填写手机号后，点击确认按钮
		protocolPopBox.find("#sendOrderTotel").on("click", function() {
		    //获取输入的手机哈
		    var telephone_v =  protocolPopBox.find("#vit-telephone").val();
		    //验证
		    if((/^1[3456789]\d{9}$/.test(telephone_v))){
		        //重置
		        protocolPopBox.find("#vit-telephone").val("");
		        //验证通过
		        var dl_v = getQueryString("dl");
		        var oid_v = getQueryString("oid");
		        //构造请求
		        //执行ajax函数
    			$.ajax({
					type:'GET',
					url : './?ac=updatephone&oid='+oid_v+'&tel='+telephone_v+'&dl='+dl_v,
					dataType:'json',
				})
						.success(function(res) {
						    alert('保存成功');
						    console.log(res);
						    console.log(res['code']);

							setTimeout(function() {
								$(".shop-common-tip-layer").remove();
							}, 2000);
						})
						.error(function() {
						});
		        //关闭弹窗
		        $("body").removeClass("base_popup");
    			$(document).scrollTop(popScrollTop);
    			protocolPopBox.hide();
			
		    }else{
		        //提示
		        protocolPopBox.find(".telephone-msg").show();
		    }
		});
	}
	//修改订单信息
		var updateOrderInfo = $("#update_order_info");
		if(updateOrderInfo.length) {
			var update_order_box = $("#update_order_box");
			var popScrollTop = 0;
			updateOrderInfo.on("click", function() {
				update_order_box.show();
				popScrollTop = $(document).scrollTop();
				$("body").addClass("base_popup");
				$("body").css("top", -popScrollTop);
			});
			update_order_box.find("#update_orderBtn").on("click", function() {
				$("body").removeClass("base_popup");
				$(document).scrollTop(popScrollTop);
				update_order_box.hide();
			});
			//填写手机号后，点击确认按钮
			update_order_box.find("#updateOrderTotel1").on("click", function() {
			checkForm();
			var oid_v = getQueryString("oid");
			var username =  update_order_box.find("#username").val();
				var gender =  update_order_box.find("#gender").val();
				//获取
				$.ajax({
					type:'GET',
					url : './?ac=updateorderinfo&username='+username+'&gender='+gender+'&h='+login.h.value+'&y='+login.y.value+'&m='+login.m.value+'&d='+login.d.value+'&i='+login.i.value+'&cY='+login.cY.value+'&cM='+login.cM.value+'&cD='+login.cD.value+'&cH='+login.cH.value+'&term1='+login.term1.value+'&term2='+login.term2.value+'&start_term='+login.start_term.value+'&end_term='+login.end_term.value+'&start_term1='+login.start_term1.value+'&end_term1='+login.end_term1.value+'&lDate='+login.lDate.value+'&oid='+oid_v,
					dataType:'json',
				})
						.success(function(res) {
							if(res['code'] ==1){
    						    alert('修改成功,请刷新页面!');
    						}else{
    						    alert(res['message']);
    						}

							setTimeout(function() {
								$(".shop-common-tip-layer").remove();
							}, 2000);
						})
						.error(function() {
						});
				//关闭弹窗
				$("body").removeClass("base_popup");
				$(document).scrollTop(popScrollTop);
				update_order_box.hide();
			});
		}
	
});

</script>

<link href="static/css/extend_module.css" rel="stylesheet" type="text/css"/>
<div class="public_hot_test">
<div class="zcdgbox"><a href="javascript:void(0)" class="back_top" id="back_top" style="display: inline-block;"></a></div>
</div>
<style type="text/css">
.tuiguang_1,.tuiguang_2{
    display:none;
}
.banner {
    width: 100%;
}

</style>
<link href="static/css/quanju.css" rel="stylesheet" type="text/css"/>
<a class="tuiguang_2" id="orderzixun" href="/?ac=select_orders" style="bottom: 60%;"><img src="static/picture/zixun6.png" style="height: 19px;margin-bottom: 5px;margin-top: 5px;margin-left: 2px;"><em>订单咨询</em></a>
<a class="tuiguang_2" id="complaints_tousu" href="/?ac=complaints" style="bottom: 28%;"><img src="static/picture/tousu.png" style="height: 19px;margin-bottom: 5px;margin-top: 5px;margin-left: 2px;"><em>售后</em></a>
<!--顶部文字提醒内容-->
<script>
    var hrt = document.documentElement.clientHeight; //获取当前可视区域的高度存到hrt变量   弹窗填写手机号码功能放置键盘出现变形
    window.onload = function(){ //在页面整体加载完毕时
        document.getElementById('protocolPopBox').style.height= hrt+'px'//把获取到的高度赋值给根div
    }

</body>
</html>
```