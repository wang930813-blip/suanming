<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>塔罗问答结果-<{$zhanming}></title>
    <meta http-equiv="Cache-Control" content="no-cache">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0" />
    <{include file='./ffsm/wx_share.tpl'}>
    <link href="taluo/index.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="taluo/header_rem.css">
    <link href="taluo/layer.css" rel="stylesheet" type="text/css">
    <link href="taluo/font-awesome.min.css" rel="stylesheet">
    <script src="taluo/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="taluo/resizeevts.js"></script>
    <link href="taluo/index2021.css" rel="stylesheet" type="text/css">
    <style>
        body {
            background-color: #23233f;
            min-height: 100vh;
            padding-bottom: 1.5rem;
        }
        .result-header {
            width: 100%;
            padding: 0.3rem 0.2rem;
            background: linear-gradient(#d589fc, #efceff);
            color: #6920ba;
            font-size: 0.35rem;
            text-align: center;
        }
        .result-question {
            width: 100%;
            padding: 0.3rem 0.2rem;
            color: #fff;
            text-align: center;
            font-size: 0.32rem;
        }
        .result-question b {
            color: #fcea93;
        }
        .result-cards {
            display: flex;
            justify-content: space-around;
            padding: 0.3rem 0.2rem;
        }
        .result-card-item {
            text-align: center;
        }
        .result-card-item img {
            width: 1.7rem;
            height: 2.46rem;
            display: block;
            margin: 0 auto;
        }
        .result-card-item img.niwei {
            transform: rotate(180deg);
        }
        .result-card-item .card-label {
            display: block;
            margin-top: 0.2rem;
            padding: 0.1rem 0.3rem;
            border-radius: 0.2rem;
            color: #fff;
            font-size: 0.28rem;
        }
        .result-card-item:nth-child(1) .card-label {
            background-color: #addfff;
        }
        .result-card-item:nth-child(2) .card-label {
            background-color: #feb1c5;
        }
        .result-content {
            width: 100%;
            padding: 0 0.2rem 1.5rem 0.2rem;
        }
        .result-section {
            background-color: #343458;
            border-radius: 0.1rem;
            padding: 0.3rem 0.2rem;
            margin-bottom: 0.3rem;
            color: #fff;
        }
        .result-section-title {
            font-size: 0.35rem;
            color: #d08cff;
            margin-bottom: 0.2rem;
            font-weight: bold;
        }
        .result-section-content {
            font-size: 0.3rem;
            line-height: 1.6;
            color: #9a9acd;
            text-align: justify;
        }
        .deep-consultation {
            width: 100%;
            padding: 0.4rem 0.3rem;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            text-align: center;
            margin-top: 0.3rem;
        }
        .deep-title {
            font-size: 0.36rem;
            color: #fff;
            font-weight: bold;
            margin-bottom: 0.15rem;
        }
        .deep-desc {
            font-size: 0.28rem;
            color: #f0e6ff;
            line-height: 1.5;
        }
        .result-footer {
            position: fixed;
            bottom: 0;
            width: 100%;
            max-width: 7.5rem;
            padding: 0.2rem;
            background-color: #343458;
            display: flex;
            justify-content: space-between;
        }
        .result-footer a {
            width: 48%;
            line-height: 0.8rem;
            border-radius: 0.4rem;
            text-align: center;
            font-size: 0.32rem;
            color: #fff;
            text-decoration: none;
        }
        .btn-again {
            background-color: #7833dd;
        }
        .btn-contact {
            background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
            animation: pulse 2s infinite;
        }
        @keyframes pulse {
            0%, 100% {
                transform: scale(1);
            }
            50% {
                transform: scale(1.02);
            }
        }
    </style>
<{$page_meta}>
</head>
<body>
    <{include file='./ffsm/header.tpl'}>
    <style>
    .common-header{max-width:none !important;}
    .common-header__home{left:0 !important;margin-left:0 !important;}
    .common-header__order{right:0 !important;margin-right:0 !important;}
    </style>
    
    <div class="result-header">
        🔮 塔罗师的解答
    </div>

    <div class="result-question">
        你的问题：<b><{if isset($data.data.question)}><{$data.data.question}><{else}>未填写<{/if}></b>
    </div>

    <div class="result-cards">
        <div class="result-card-item">
            <img src="taluo/picture/card<{if isset($data.data.cards_array.0)}><{$data.data.cards_array.0}><{else}>0<{/if}>.png" alt="" class="niwei">
            <span class="card-label">是非牌 - <{if isset($data.card1.card_name)}><{$data.card1.card_name}><{else}>未知<{/if}> (逆位)</span>
        </div>
        <div class="result-card-item">
            <img src="taluo/picture/card<{if isset($data.data.cards_array.1)}><{$data.data.cards_array.1}><{else}>1<{/if}>.png" alt="">
            <span class="card-label">能量牌 - <{if isset($data.card2.card_name)}><{$data.card2.card_name}><{else}>未知<{/if}> (正位)</span>
        </div>
    </div>

    <{if isset($data.card1) && isset($data.card2)}>
    <div class="result-content">
        <!-- 是非答案 -->
        <div class="result-section">
            <div class="result-section-title">💫 是非答案 - <{$data.card1.card_name|default:'未知'}></div>
            <div class="result-section-content">
                <strong>【<{$data.card1.yesno_answer|default:'中立'}>】</strong><br><br>
                <{$data.card1.current_meaning|default:'暂无解读'|nl2br}>
            </div>
        </div>

        <!-- 能量指引 -->
        <div class="result-section">
            <div class="result-section-title">✨ 能量指引 - <{$data.card2.card_name|default:'未知'}></div>
            <div class="result-section-content">
                <{$data.card2.energy_guide|default:'暂无指引'|nl2br}>
            </div>
        </div>

        <!-- 行动建议 -->
        <div class="result-section">
            <div class="result-section-title">🌟 行动建议</div>
            <div class="result-section-content">
                <{$data.card2.action_advice|default:'暂无建议'|nl2br}>
            </div>
        </div>

        <!-- 塔罗师的祝福 -->
        <div class="result-section">
            <div class="result-section-title">🎯 塔罗师的祝福</div>
            <div class="result-section-content">
                <{$data.card2.blessing|default:'愿你一切安好'|nl2br}>
            </div>
        </div>

        <!-- 综合运势分析 -->
        <div class="result-section">
            <div class="result-section-title">🔮 综合运势分析</div>
            <div class="result-section-content">
                根据你抽到的两张塔罗牌：<br><br>
                <strong>【<{$data.card1.card_name|default:'是非牌'}>】</strong>代表事情的核心答案是<{$data.card1.yesno_answer|default:'中立'}>。这张牌逆位出现，提醒你需要注意一些潜在的障碍或需要调整的方向。<br><br>
                <strong>【<{$data.card2.card_name|default:'能量牌'}>】</strong>则为你指引未来的能量走向，这张牌正位出现，意味着积极的能量正在向你汇聚。两张牌结合来看，当前情况虽有挑战，但只要顺应能量指引，积极行动，就能获得理想的结果。
            </div>
        </div>

        <!-- 时间线分析 -->
        <div class="result-section">
            <div class="result-section-title">⏰ 时间线提示</div>
            <div class="result-section-content">
                <strong>【近期（1-2周）】</strong>可能会遇到一些考验，建议保持冷静观察，不要急于做出重大决定。<br><br>
                <strong>【中期（1-3个月）】</strong>是关键转折期，按照行动建议去执行，会看到明显的改善和转机。<br><br>
                <strong>【长期（3个月以上）】</strong>只要方向正确并持之以恒，你会收获满意的结果，事情会朝着有利的方向发展。
            </div>
        </div>

        <!-- 注意事项 -->
        <div class="result-section">
            <div class="result-section-title">⚠️ 特别提醒</div>
            <div class="result-section-content">
                • 塔罗牌反映的是当前能量状态，未来可以通过你的行动改变<br><br>
                • 建议在重要决定前结合理性分析，不要完全依赖占卜<br><br>
                • 如果对结果有疑问，可以过一段时间后重新占卜验证<br><br>
                • 保持积极心态，命运掌握在自己手中
            </div>
        </div>

        <!-- 相关领域建议 -->
        <{if $data.card2.love_meaning_display || $data.card2.career_meaning_display || $data.card2.wealth_meaning_display || $data.card2.health_meaning_display}>
        <div class="result-section">
            <div class="result-section-title">💼 各领域深度指引</div>
            <div class="result-section-content">
                <{if $data.card2.love_meaning_display}>
                <strong>【感情方面】</strong><{$data.card2.love_meaning_display|nl2br}><br><br>
                <{/if}>
                <{if $data.card2.career_meaning_display}>
                <strong>【事业方面】</strong><{$data.card2.career_meaning_display|nl2br}><br><br>
                <{/if}>
                <{if $data.card2.wealth_meaning_display}>
                <strong>【财运方面】</strong><{$data.card2.wealth_meaning_display|nl2br}><br><br>
                <{/if}>
                <{if $data.card2.health_meaning_display}>
                <strong>【健康方面】</strong><{$data.card2.health_meaning_display|nl2br}>
                <{/if}>
            </div>
        </div>
        <{/if}>

        <!-- 塔罗师的专业建议 -->
        <{if $data.card2.suggestion}>
        <div class="result-section">
            <div class="result-section-title">💡 塔罗师的专业建议</div>
            <div class="result-section-content">
                <{$data.card2.suggestion|nl2br}>
            </div>
        </div>
        <{/if}>

        <!-- 需要特别注意 -->
        <{if $data.card2.warning}>
        <div class="result-section">
            <div class="result-section-title">🚨 需要特别注意</div>
            <div class="result-section-content">
                <{$data.card2.warning|nl2br}>
            </div>
        </div>
        <{/if}>
    </div>
    <{else}>
    <div class="result-content">
        <div class="result-section">
            <div class="result-section-title">⚠️ 提示</div>
            <div class="result-section-content">
                数据加载失败，请刷新页面重试。
            </div>
        </div>
    </div>
    <{/if}>

    <!-- 深度解读提示 -->
    <div class="deep-consultation">
        <div class="deep-title">🌟 想要更深层的解答？</div>
        <div class="deep-desc">专业塔罗师一对一咨询，为您提供更精准、更详细的指引</div>
    </div>

    <div class="result-footer">
        <a href="/?ac=taluowenda_form" class="btn-again">再测一次</a>
        <{if $kefu_link}>
        <a href="<{$kefu_link}>" class="btn-contact" target="_blank">联系客服</a>
        <{else}>
        <a href="/" class="btn-contact">返回首页</a>
        <{/if}>
    </div>

    <script src="taluo/js/layer.js" merge="true"></script>
    <script type="text/javascript" src="taluo/js/layermenu.js"></script>
    <script type="text/javascript" src="taluo/js/scrolltop.js"></script>
</body>
</html>
