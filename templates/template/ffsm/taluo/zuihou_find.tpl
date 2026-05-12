<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=0"/>
    <title>你和TA能走到最后吗？塔罗占卜-<{$zhanming}></title>
	<{include file='./ffsm/wx_share.tpl'}>
    <script src="/statics/ffsm/taluo/zuihou/rem_tool.js"></script>
    <link rel="stylesheet" href="/statics/ffsm/taluo/zuihou/common.css">
    <link rel="stylesheet" href="/statics/ffsm/taluo/zuihou/result.css">
    <script src="https://cdn.staticfile.net/translate.js/3.2.1/translate.js"></script>
</head>
<body>
 <{include file='./ffsm/header.tpl'}>
  <{include file='./ffsm/tabBar.tpl'}>
<header class="public_header">
<h1 class="public_h_con">塔罗占卜</h1>
<a class="public_h_home" href="/"></a><a href="/?ac=member" class="public_h_menu">个人中心</a></header>
<section class="page" style="padding-bottom: 1.2rem;">
    <section class="main-wrap flex-column">
        <div class="banner-wrap flex-center">
            <img class="banner" src="/statics/ffsm/taluo/zuihou/img/banner.png">
        </div>
        <div class="content-wrap flex-column">
            <div class="content-box flex-column">
                <img class="border border-top" src="/statics/ffsm/taluo/zuihou/img/border_top.png">
                <div class="content-panel">
                    <div class="content flex-column">
                        <div class="top-wrap flex-column">
                            <div class="guide-wrap flex-column J_testFixedShow">
                                <img class="frame frame-top"
                                     src="/statics/ffsm/taluo/zuihou/img/frame_top.png">
                                <div class="guide flex-column">
                                    <p class="guide-text first-line" id="first_line">亲爱的<em>测试者</em>：</p>
                                    <p class="guide-text" id="second_line">
                                        你心中的那个人，真的适合你吗？你们能够一起携手到老吗？关于你们能否走到最后，我将根据你所选择的4张牌，给予进一步指引...
                                    </p>
                                </div>
                                <img class="frame frame-bot"
                                     src="/statics/ffsm/taluo/zuihou/img/frame_bot.png">
                            </div>
                            <div class="card-group flex-column">
                                <img class="card-wall"
                                     src="/statics/ffsm/taluo/zuihou/img/card_wall.png">
                                <div class="tarot-card tarot-card-1 flex-column">
                                        <img src="<{$data.data.carinfo.0.img}>">
                                        <p class="card-name"><{$data.data.carinfo.0.title}></p>
                                        <span>(<{if $data.data.carinfo.0.zf==0}>逆位<{else}>正位<{/if}>)</span>
                                    </div><div class="tarot-card tarot-card-2 flex-column">
                                        <img src="<{$data.data.carinfo.1.img}>">
                                        <p class="card-name"><{$data.data.carinfo.1.title}></p>
                                        <span>(<{if $data.data.carinfo.1.zf==0}>逆位<{else}>正位<{/if}>)</span>
                                    </div><div class="tarot-card tarot-card-3 flex-column">
                                        <img src="<{$data.data.carinfo.2.img}>">
                                        <p class="card-name"><{$data.data.carinfo.2.title}></p>
                                        <span>(<{if $data.data.carinfo.2.zf==0}>逆位<{else}>正位<{/if}>)</span>
                                    </div><div class="tarot-card tarot-card-4 flex-column">
                                        <img src="<{$data.data.carinfo.3.img}>">
                                        <p class="card-name"><{$data.data.carinfo.3.title}></p>
                                        <span>(<{if $data.data.carinfo.3.zf==0}>逆位<{else}>正位<{/if}>)</span>
                                    </div>                              </div>
                        </div>
                    </div>
                </div>
                <img class="border border-bot" src="/statics/ffsm/taluo/zuihou/img/border_bot.png">
            </div>

            <div class="content-box flex-column">
                    <img class="border border-top"
                         src="/statics/ffsm/taluo/zuihou/img/border_top.png">
                    <div class="content-panel">
                        <div class="content flex-column">
                            <img class="desc-subtitle"
                                 src="/statics/ffsm/taluo/zuihou/img/nav_01.png">
                            <div class="tarot-box flex-column">
                                <img class="card-image" src="<{$data.data.carinfo.0.img}>">
                                <div class="card-intro flex-center">
                                    <img src="/statics/ffsm/taluo/zuihou/img/num_01.png">
                                    <span>
                                        <{$data.data.carinfo.0.title}>                                        <em style="font-size: 14px;">
                                                                                        (<{if $data.data.carinfo.0.zf==0}>逆位<{else}>正位<{/if}>)                                                                                    </em>
                                    </span>
                                </div>
                                <div class="explan-box flex-column">
                                    <p class="explan-title">象征意义:</p>
                                    <p class="explan-text"><{$data.data.carinfo.0.des}></p>
                                    <p class="explan-title">牌面解释:</p>
                                    <p class="explan-text"><{$data.data.carinfo.0.c1}></p>
                                    <p class="explan-title">
                                        是否良缘:                                                                                                                                                            </p>
                                    <p class="explan-text"><{$data.data.carinfo.0.c2}></p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <img class="border border-bot"
                         src="/statics/ffsm/taluo/zuihou/img/border_bot.png">
                </div><div class="content-box flex-column">
                    <img class="border border-top"
                         src="/statics/ffsm/taluo/zuihou/img/border_top.png">
                    <div class="content-panel">
                        <div class="content flex-column">
                            <img class="desc-subtitle"
                                 src="/statics/ffsm/taluo/zuihou/img/nav_02.png">
                            <div class="tarot-box flex-column">
                                <img class="card-image" src="<{$data.data.carinfo.1.img}>">
                                <div class="card-intro flex-center">
                                    <img src="/statics/ffsm/taluo/zuihou/img/num_02.png">
                                    <span>
                                        <{$data.data.carinfo.1.title}>                                        <em style="font-size: 14px;">
                                                                                        (<{if $data.data.carinfo.1.zf==0}>逆位<{else}>正位<{/if}>)                                                                                    </em>
                                    </span>
                                </div>
                                <div class="explan-box flex-column">
                                    <p class="explan-title">象征意义:</p>
                                    <p class="explan-text"><{$data.data.carinfo.1.des}></p>
                                    <p class="explan-title">牌面解释:</p>
                                    <p class="explan-text"><{$data.data.carinfo.1.c1}></p>
                                    <p class="explan-title">
                                                                                感情阻碍:                                                                                                                    </p>
                                    <p class="explan-text"><{$data.data.carinfo.1.c2}></p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <img class="border border-bot"
                         src="/statics/ffsm/taluo/zuihou/img/border_bot.png">
                </div><div class="content-box flex-column">
                    <img class="border border-top"
                         src="/statics/ffsm/taluo/zuihou/img/border_top.png">
                    <div class="content-panel">
                        <div class="content flex-column">
                            <img class="desc-subtitle"
                                 src="/statics/ffsm/taluo/zuihou/img/nav_03.png">
                            <div class="tarot-box flex-column">
                                <img class="card-image" src="<{$data.data.carinfo.2.img}>">
                                <div class="card-intro flex-center">
                                    <img src="/statics/ffsm/taluo/zuihou/img/num_03.png">
                                    <span>
                                        <{$data.data.carinfo.2.title}>                                        <em style="font-size: 14px;">
                                                                                        (<{if $data.data.carinfo.2.zf==0}>逆位<{else}>正位<{/if}>)                                                                                    </em>
                                    </span>
                                </div>
                                <div class="explan-box flex-column">
                                    <p class="explan-title">象征意义:</p>
                                    <p class="explan-text"><{$data.data.carinfo.2.des}></p>
                                    <p class="explan-title">牌面解释:</p>
                                    <p class="explan-text"><{$data.data.carinfo.2.c1}></p>
                                    <p class="explan-title">
                                                                                                                        未来发展:                                                                            </p>
                                    <p class="explan-text"><{$data.data.carinfo.2.c2}></p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <img class="border border-bot"
                         src="/statics/ffsm/taluo/zuihou/img/border_bot.png">
                </div><div class="content-box flex-column">
                    <img class="border border-top"
                         src="/statics/ffsm/taluo/zuihou/img/border_top.png">
                    <div class="content-panel">
                        <div class="content flex-column">
                            <img class="desc-subtitle"
                                 src="/statics/ffsm/taluo/zuihou/img/nav_04.png">
                            <div class="tarot-box flex-column">
                                <img class="card-image" src="<{$data.data.carinfo.3.img}>">
                                <div class="card-intro flex-center">
                                    <img src="/statics/ffsm/taluo/zuihou/img/num_04.png">
                                    <span>
                                        <{$data.data.carinfo.3.title}>                                        <em style="font-size: 14px;">
                                                                                        (<{if $data.data.carinfo.3.zf==0}>逆位<{else}>正位<{/if}>)                                                                                    </em>
                                    </span>
                                </div>
                                <div class="explan-box flex-column">
                                    <p class="explan-title">象征意义:</p>
                                    <p class="explan-text"><{$data.data.carinfo.3.des}></p>
                                    <p class="explan-title">牌面解释:</p>
                                    <p class="explan-text"><{$data.data.carinfo.3.c1}></p>
                                    <p class="explan-title">
                                                                                                                                                                塔罗指引:                                    </p>
                                    <p class="explan-text"><{$data.data.carinfo.3.c2}></p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <img class="border border-bot"
                         src="/statics/ffsm/taluo/zuihou/img/border_bot.png">
                </div>

            

        </div>

        <{include file="./index/taluo/footer.tpl"}>

    </section>

    <div class="toast-wrap flex-center">
        <div class="toast-box flex-center">
            <span></span>
        </div>
    </div>
</section>
 
<script src="/statics/ffsm/taluoyunshi/jquery.min.js"></script>
<script src="/statics/ffsm/taluoyunshi/jquery.raty.min.js"></script>
<{include file='./ffsm/footer.tpl'}>
<{include file='./ffsm/dl_ck.tpl'}>
 <script>
translate.language.setLocal('chinese_simplified'); 
translate.changeLanguage('<{$lang._changeLanguage}>');
translate.execute();
</script>
</body>
</html>