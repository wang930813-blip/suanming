<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>塔罗问答-<{$zhanming}></title>
    <meta http-equiv="Cache-Control" content="no-cache" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0" />
    <{include file='./ffsm/wx_share.tpl'}>
    <link href="taluo/css/index.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="taluo/css/header_rem.css">
    <link href="taluo/css/layer.css" rel="stylesheet" type="text/css" />
    <link href="taluo/css/font-awesome.min.css" rel="stylesheet">
    <script src="taluo/js/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="taluo/js/resizeevts.js"></script>
    <link rel="stylesheet" href="taluo/css/pingjia.css">
    <link href="taluo/css/calendar.css" rel="stylesheet" type="text/css">
    <link href="taluo/css/pay_rem_new.css" rel="stylesheet" type="text/css">
<{$page_meta}>
</head>

<body>
    <{include file='./ffsm/header.tpl'}>
    <style>
    .common-header{max-width:none !important;}
    .common-header__home{left:0 !important;margin-left:0 !important;}
    .common-header__order{right:0 !important;margin-right:0 !important;}
    </style>
    
    <div id="order-pop-you" style="position: absolute;right: 0;top: 20%;z-index: 10000;">
        <a href="/?ac=history" target="_self"><img style="width: 25px;height: auto; display: block;" src="taluo/picture/fubiao1.png" alt=""></a>
    </div>
    
    <div class="floating_div" style="width: 100%;float: left;margin: 20px 0 0 0;display:none;"></div>
    
    <style>
        .qudaoHead {
            display: flex;
            justify-content: space-between;
            float: left;
            width: 100%;
            padding: 0 .2rem;
            margin: .3rem 0 0 0;
            line-height: .6rem;
        }
        .qudaoHead a {
            position:relative; 
            color: #b58e63;
        }
        .qudaoHead a img {
            display: inline-block;
            width: .58rem;
            vertical-align: middle;
            margin: -.05rem 0 0 0;
        }
        .qudaoHead a span {
            position: absolute;
            left: .3rem;
            top: 0;
            width: .3rem;
            background: #f00;
            border-radius: 50%;
            line-height: .3rem;
            font-size: .24rem;
            color: #fff;
            text-align: center;
        }
    </style>

    <!-- 主要内容区域 -->
    <section class="indexWrap">
        <div class="indexLight"></div>
        <a href="/?ac=taluowenda_form" class="indexBtn"></a>
    </section>

    <a name="save" id="save"></a>
    
    <script src="taluo/js/layer.js" merge="true"></script>
    <script type="text/javascript" src="taluo/js/layermenu.js"></script>
    <script type="text/javascript" src="taluo/js/mainpublicv1.1.8.js"></script>
    <script type="text/javascript" src="taluo/js/history_v1.js"></script>

</body>
</html>
