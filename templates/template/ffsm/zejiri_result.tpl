<!doctype html>
<html>
<head>
    <title><{$event}> - 查询结果</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="Cache-Control" content="no-cache" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0" />
    <link rel="stylesheet" href="zeri/css/header_rem.css">
    <link href="zeri/css/layer.css" rel="stylesheet" type="text/css" />
    <link href="zeri/css/font-awesome.min.css" rel="stylesheet">
    <script src="zeri/js/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="zeri/js/resizeevts.js"></script>
    <link rel="stylesheet" href="zeri/css/pingjia.css">
    <link rel="stylesheet" href="zeri/css/pj_rem.css">
    <link href="zeri/css/index.css" rel="stylesheet" type="text/css">
    <link href="zeri/css/font-awesome.min-1.css" rel="stylesheet">
    <style>
        /* 修正背景图片路径 */
        .wrapper {
            background: #e7e0d5 url(zeri/image/wrap-bg.jpg) no-repeat !important;
            background-size: 100% auto !important;
        }
        .bigbox .top {
            background: url(zeri/image/top.png) no-repeat !important;
            background-size: 100% 100% !important;
        }
        .bigbox .mid {
            background: url(zeri/image/mid.jpg) repeat-y !important;
            background-size: 100% auto !important;
        }
        .bigbox .down {
            background: url(zeri/image/down.png) no-repeat !important;
            background-size: 100% auto !important;
        }
        
        /* 统计信息 */
        .stats-box {
            width: 100%;
            float: left;
            padding: .3rem;
            background: linear-gradient(135deg, #ffeaa7 0%, #fdcb6e 100%);
            text-align: center;
        }
        .stats-num {
            font-size: .8rem;
            font-weight: bold;
            color: #d63031;
        }
        .stats-text {
            font-size: .28rem;
            color: #2d3436;
            margin-top: .1rem;
        }
        
        /* 推荐日期 */
        .recommend-box {
            width: 100%;
            float: left;
            background: linear-gradient(135deg, #ffeaa7 0%, #fdcb6e 100%);
            border-radius: .15rem;
            padding: .4rem;
            margin: .3rem 0;
            box-shadow: 0 .04rem .15rem rgba(0,0,0,0.15);
        }
        .recommend-title {
            font-size: .36rem;
            font-weight: bold;
            color: #d63031;
            text-align: center;
            margin-bottom: .3rem;
        }
        .recommend-date {
            font-size: .5rem;
            font-weight: bold;
            color: #d63031;
            text-align: center;
            margin: .2rem 0;
        }
        .recommend-lunar {
            font-size: .28rem;
            color: #666;
            text-align: center;
        }
        .recommend-reason {
            font-size: .26rem;
            color: #666;
            text-align: center;
            margin-top: .2rem;
            line-height: .4rem;
        }
        
        /* 吉日卡片 */
        .day-card {
            width: 100%;
            float: left;
            background: #fff;
            border: solid .02rem #e0e0e0;
            border-radius: .15rem;
            padding: .35rem;
            margin: 0 0 .3rem 0;
            box-shadow: 0 .02rem .1rem rgba(0,0,0,0.08);
            position: relative;
        }
        .day-card.best {
            background: linear-gradient(135deg, #fff9e6 0%, #fffbf0 100%);
            border: solid .02rem #ffd700;
        }
        .day-badge {
            position: absolute;
            top: -.15rem;
            right: .3rem;
            background: #ff4757;
            color: #fff;
            padding: .08rem .2rem;
            border-radius: .3rem;
            font-size: .22rem;
            font-weight: bold;
        }
        .day-header {
            width: 100%;
            float: left;
            margin: 0 0 .25rem 0;
            padding-bottom: .2rem;
            border-bottom: solid .01rem #f0f0f0;
        }
        .day-date {
            font-size: .42rem;
            font-weight: bold;
            color: #b1311b;
            float: left;
        }
        .day-weekday {
            font-size: .24rem;
            color: #999;
            margin-left: .15rem;
            float: left;
            line-height: .55rem;
        }
        .day-lunar {
            font-size: .26rem;
            color: #999;
            float: right;
            line-height: .55rem;
        }
        .day-star {
            width: 100%;
            float: left;
            font-size: .28rem;
            color: #ff9800;
            margin: .15rem 0;
            clear: both;
        }
        .day-info {
            width: 100%;
            float: left;
            font-size: .26rem;
            line-height: .45rem;
            color: #666;
            clear: both;
        }
        .day-info-row {
            width: 100%;
            float: left;
            margin: .12rem 0;
        }
        .day-info .label {
            color: #999;
            font-weight: bold;
            display: inline-block;
            min-width: 1.2rem;
        }
        .day-info .yi {
            color: #52c41a;
        }
        .day-info .ji {
            color: #f44336;
        }
        .day-time {
            width: 100%;
            float: left;
            background: #f8f8f8;
            padding: .2rem;
            margin-top: .2rem;
            border-radius: .1rem;
        }
        .day-time-title {
            font-size: .24rem;
            color: #999;
            margin-bottom: .1rem;
        }
        .day-time-content {
            font-size: .26rem;
            color: #52c41a;
            font-weight: bold;
        }
    </style>
<{$page_meta}>
</head>
<body>
    <!-- 引入公共头部 -->
    <{include file="ffsm/header.tpl"}>

    <section class="wrapper input">
        <section class="main">
            <section class="bigbox">
                <div class="top">
                    <div class="indexTop"><b><{$event}>查询结果</b></div>
                </div>
                <div class="mid">
                    <div class="con">
                        <!-- 统计信息 -->
                        <div class="stats-box">
                            <div class="stats-num"><{$days|@count}></div>
                            <div class="stats-text">为您精选的吉日</div>
                        </div>

                        <!-- 用户信息 -->
                        <{if $man_name || $woman_name}>
                        <div style="width:100%;float:left;padding:.25rem;text-align:center;font-size:.28rem;color:#666;background:#fff;border-radius:.1rem;margin:.2rem 0;">
                            <{if $man_name && $woman_name}>
                                👫 <{$man_name}> & <{$woman_name}> 专属吉日
                            <{elseif $man_name}>
                                🙋‍♂️ <{$man_name}> 专属吉日
                            <{elseif $woman_name}>
                                🙋‍♀️ <{$woman_name}> 专属吉日
                            <{/if}>
                        </div>
                        <{/if}>

                        <!-- 最佳推荐日期 -->
                        <{if $days|@count > 0}>
                        <div class="recommend-box">
                            <div class="recommend-title">🌟 大师精选 · 最佳吉日 🌟</div>
                            <div class="recommend-date"><{$days[0].date}></div>
                            <div class="recommend-lunar"><{$days[0].lunar}></div>
                            <div class="recommend-reason">
                                此日乃黄道吉日，天时地利人和<br/>
                                <{$days[0].yi}>，诸事大吉
                            </div>
                        </div>
                        <{/if}>

                        <!-- 吉日列表 -->
                        <div style="width:100%;float:left;margin:.3rem 0 .2rem 0;">
                            <div style="font-size:.32rem;font-weight:bold;color:#b1311b;text-align:center;margin-bottom:.3rem;">
                                📅 精选吉日一览 (<{$days|@count}>天)
                            </div>
                        </div>
                        
                        <{foreach from=$days item=day name=dayLoop}>
                        <div class="day-card <{if $smarty.foreach.dayLoop.index == 0}>best<{/if}>">
                            <{if $smarty.foreach.dayLoop.index == 0}>
                            <div class="day-badge">最佳推荐</div>
                            <{/if}>
                            
                            <div class="day-header">
                                <span class="day-date"><{$day.date}></span>
                                <{assign var="timestamp" value=$day.date|strtotime}>
                                <{assign var="weekday" value=$timestamp|date_format:"%w"}>
                                <{if $weekday == 0}>
                                    <span class="day-weekday">星期日</span>
                                <{elseif $weekday == 1}>
                                    <span class="day-weekday">星期一</span>
                                <{elseif $weekday == 2}>
                                    <span class="day-weekday">星期二</span>
                                <{elseif $weekday == 3}>
                                    <span class="day-weekday">星期三</span>
                                <{elseif $weekday == 4}>
                                    <span class="day-weekday">星期四</span>
                                <{elseif $weekday == 5}>
                                    <span class="day-weekday">星期五</span>
                                <{elseif $weekday == 6}>
                                    <span class="day-weekday">星期六</span>
                                <{/if}>
                                <span class="day-lunar"><{$day.lunar}></span>
                            </div>
                            
                            <div class="day-star">
                                吉凶等级：
                                <{section name=star start=0 loop=5}>
                                    <{if $smarty.section.star.index < $day.star}>★<{else}>☆<{/if}>
                                <{/section}>
                                <{if $day.star >= 4}>
                                    （大吉）
                                <{elseif $day.star >= 3}>
                                    （中吉）
                                <{else}>
                                    （小吉）
                                <{/if}>
                            </div>
                            
                            <div class="day-info">
                                <div class="day-info-row">
                                    <span class="label">✅ 宜：</span>
                                    <span class="yi"><{$day.yi}></span>
                                </div>
                                <div class="day-info-row">
                                    <span class="label">⛔ 忌：</span>
                                    <span class="ji"><{$day.ji}></span>
                                </div>
                            </div>
                            
                            <div class="day-time">
                                <div class="day-time-title">🕐 黄道吉时推荐</div>
                                <div class="day-time-content">
                                    <{if $smarty.foreach.dayLoop.index % 3 == 0}>
                                        子时(23:00-01:00)、卯时(05:00-07:00)、午时(11:00-13:00)
                                    <{elseif $smarty.foreach.dayLoop.index % 3 == 1}>
                                        寅时(03:00-05:00)、巳时(09:00-11:00)、酉时(17:00-19:00)
                                    <{else}>
                                        辰时(07:00-09:00)、未时(13:00-15:00)、戌时(19:00-21:00)
                                    <{/if}>
                                </div>
                            </div>
                        </div>
                        <{/foreach}>
                    </div>
                </div>
                <div class="down"></div>
            </section>
        </section>
        
        <link href="zeri/css/footer.css" rel="stylesheet" type="text/css">
        <{include file="ffsm/footer_contact.tpl"}>
    </section>

    <script src="zeri/js/layer.js"></script>
    <script type="text/javascript" src="zeri/js/clipboard.min.js"></script>
    <script>
        // 复制微信号
        var copy_wx = new Clipboard('.copy_wx');
        copy_wx.on('success', function(e) {
            e.clearSelection();
            layer.open({
                content: '微信号复制成功！',
                skin: 'msg',
                time: 2
            });
        });
    </script>
</body>
</html>
