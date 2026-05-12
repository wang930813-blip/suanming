<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=0"/>
    <title>你和TA该分手吗？塔罗占卜-<{$zhanming}></title>
	<{include file='./ffsm/wx_share.tpl'}>
    <script src="/statics/ffsm/taluo/aiqing/rem_tool.js"></script>
    <link rel="stylesheet" href="/statics/ffsm/taluo/fenshou/common.css">
    <link rel="stylesheet" href="/statics/ffsm/taluo/fenshou/result.css">
    <script src="https://cdn.staticfile.net/translate.js/3.2.1/translate.js"></script>
</head>
<body>
<{include file='./ffsm/tabBar.tpl'}>
<section class="page">
    <section class="main-wrap flex-column">
        <div class="banner-wrap flex-center">
            <img class="banner" src="/statics/ffsm/taluo/fenshou/img/banner.png">
        </div>
        <div class="content-wrap flex-column">
            <div class="content-box flex-column">
                <img class="border border-top" src="/statics/ffsm/taluo/fenshou/img/border_top.png">
                <div class="content-panel">
                    <div class="content flex-column">
                        <div class="top-wrap flex-column">
                            <div class="guide-wrap flex-column">
                                <div class="guide flex-column">
                                    <p class="guide-text first-line" id="first_line">亲爱的<em>测试者</em>：</p>
                                    <p class="guide-text" id="second_line">
                                        你抽到的每张塔罗牌，都有着神圣且独特的意义！接下来，我将透过你所选择的<em>4张牌</em>，揭示你和昔日的爱人是否应该分手...
                                    </p>
                                </div>
                            </div>
                            <div class="card-group flex-column J_testFixedShow">
                                <img class="card-wall"
                                     src="/statics/ffsm/taluo/fenshou/img/card_wall.png">
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
                                    </div>                             </div>
                        </div>
                    </div>
                </div>
                <img class="border border-bot" src="/statics/ffsm/taluo/fenshou/img/border_bot.png">
            </div>

            <div class="content-box flex-column">
                    <img class="border border-top"
                         src="/statics/ffsm/taluo/fenshou/img/border_top.png">
                    <div class="content-panel">
                        <div class="content flex-column">
                            <img class="desc-subtitle"
                                 src="/statics/ffsm/taluo/fenshou/img/nav_01.png">
                            <div class="tarot-box flex-column">
                                <img class="card-image" src="<{$data.data.carinfo.0.img}>">
                                <div class="card-intro flex-center">
                                    <img src="/statics/ffsm/taluo/fenshou/img/num_01.png">
                                    <span>
                                        <{$data.data.carinfo.0.title}>                                        <em>
                                            (<{if $data.data.carinfo.0.zf==0}>逆位<{else}>正位<{/if}>)                                                                                                                                </em>
                                    </span>
                                </div>
                                <div class="explain-box flex-column">
                                    <p class="explain-title">
                                        对方想法:                                                                                                                                                            </p>
                                    <p class="explain-text"><{$data.data.carinfo.0.c1}></p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <img class="border border-bot"
                         src="/statics/ffsm/taluo/fenshou/img/border_bot.png">
                </div><div class="content-box flex-column">
                    <img class="border border-top"
                         src="/statics/ffsm/taluo/fenshou/img/border_top.png">
                    <div class="content-panel">
                        <div class="content flex-column">
                            <img class="desc-subtitle"
                                 src="/statics/ffsm/taluo/fenshou/img/nav_02.png">
                            <div class="tarot-box flex-column">
                                <img class="card-image" src="<{$data.data.carinfo.1.img}>">
                                <div class="card-intro flex-center">
                                    <img src="/statics/ffsm/taluo/fenshou/img/num_02.png">
                                    <span>
                                        <{$data.data.carinfo.1.title}>                                        <em>
                                                                                        (<{if $data.data.carinfo.1.zf==0}>逆位<{else}>正位<{/if}>)                                                                                    </em>
                                    </span>
                                </div>
                                <div class="explain-box flex-column">
                                    <p class="explain-title">
                                                                                感情现状:                                                                                                                    </p>
                                    <p class="explain-text"><{$data.data.carinfo.1.c1}></p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <img class="border border-bot"
                         src="/statics/ffsm/taluo/fenshou/img/border_bot.png">
                </div><div class="content-box flex-column">
                    <img class="border border-top"
                         src="/statics/ffsm/taluo/fenshou/img/border_top.png">
                    <div class="content-panel">
                        <div class="content flex-column">
                            <img class="desc-subtitle"
                                 src="/statics/ffsm/taluo/fenshou/img/nav_03.png">
                            <div class="tarot-box flex-column">
                                <img class="card-image" src="<{$data.data.carinfo.2.img}>">
                                <div class="card-intro flex-center">
                                    <img src="/statics/ffsm/taluo/fenshou/img/num_03.png">
                                    <span>
                                        <{$data.data.carinfo.2.title}>                                        <em>
                                                                                        (<{if $data.data.carinfo.2.zf==0}>逆位<{else}>正位<{/if}>)                                                                                    </em>
                                    </span>
                                </div>
                                <div class="explain-box flex-column">
                                    <p class="explain-title">
                                                                                                                        是否分手:                                                                            </p>
                                    <p class="explain-text"><{$data.data.carinfo.2.c1}></p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <img class="border border-bot"
                         src="/statics/ffsm/taluo/fenshou/img/border_bot.png">
                </div><div class="content-box flex-column">
                    <img class="border border-top"
                         src="/statics/ffsm/taluo/fenshou/img/border_top.png">
                    <div class="content-panel">
                        <div class="content flex-column">
                            <img class="desc-subtitle"
                                 src="/statics/ffsm/taluo/fenshou/img/nav_04.png">
                            <div class="tarot-box flex-column">
                                <img class="card-image" src="<{$data.data.carinfo.3.img}>">
                                <div class="card-intro flex-center">
                                    <img src="/statics/ffsm/taluo/fenshou/img/num_04.png">
                                    <span>
                                        <{$data.data.carinfo.3.title}>                                        <em>
                                                                                        (<{if $data.data.carinfo.3.zf==0}>逆位<{else}>正位<{/if}>)                                                                                    </em>
                                    </span>
                                </div>
                                <div class="explain-box flex-column">
                                    <p class="explain-title">
                                                                                                                                                                塔罗指引:                                    </p>
                                    <p class="explain-text"><{$data.data.carinfo.3.c1}></p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <img class="border border-bot"
                         src="/statics/ffsm/taluo/fenshou/img/border_bot.png">
                </div>        </div>
    </section>
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