<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>我的测试订单查询</title>
    <meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta content="yes" name="apple-mobile-web-app-capable">
    <meta content="black" name="apple-mobile-web-app-status-bar-style">
    <meta content="telephone=no" name="format-detection">
    <link rel="shortcut icon" href="/statics/ffsm/favicon.ico">
    <link href="/statics/ffsm/public/wap.min-v=0817.css" rel="stylesheet" type="text/css">
    <link href="/statics/ffsm/inquiry/1/inquiry.min.css" rel="stylesheet" type="text/css">
    <link href="/statics/quanju.css" rel="stylesheet" type="text/css">
    <script src="https://apps.bdimg.com/libs/jquery/1.9.1/jquery.min.js"></script>
    <style>
        .public_footer a {
            color: #ffffff;
        }
    </style>
</head>
<body>
    <p class="public_banner">
        <img src="/statics/ffsm/public/images/banner_wd.png" alt="付费测试">
    </p>
    <ul class="ddztxz">
        <li>
            <a href="/?ac=history" <{if $state==0}>class="on" <{/if}>>未付款</a>
        </li>
        <li>
            <a href="/?ac=history&state=1" <{if $state==1}>class="on" <{/if}>>已付款</a>
        </li>
        <li>
            <a href="/?ac=history&state=2" <{if $state==2}>class="on" <{/if}>>查询订单</a>
        </li>
    </ul>
    <{if $data && $state!=2}>
    <{foreach from=$data item=v}>
    <{if $state==$v.status}>
    <div class="public_ddxx">
        <div class="public_k">
            <span class="public_des">[<{$v.type}>] <{$v.data.username}><{if $v.type != '商城订单' && $v.type != '塔罗问答' && $v.data.y}>.公历<{$v.data.year}><{$v.data.y}>-<{$v.data.month}><{$v.data.m}>-<{$v.data.day}><{$v.data.d}><{/if}></span>
            
            <{* 商城订单显示支付和发货状态 *}>
            <{if $v.shop_order}>
                <{if $v.pay_status == 1}>
                    <span class="public_pyzt">已付款</span>
                <{else}>
                    <span class="public_pyzt public_red">未付款</span>
                <{/if}>
                
                <{if $v.ship_status == 0}>
                    <span class="public_pyzt public_red" style="margin-left:5px;">待发货</span>
                <{elseif $v.ship_status == 1}>
                    <span class="public_pyzt" style="margin-left:5px;background:#1E9FFF;">已发货</span>
                <{else}>
                    <span class="public_pyzt" style="margin-left:5px;background:#5FB878;">已完成</span>
                <{/if}>
            <{else}>
                <{* 测算订单显示付款状态 *}>
                <{if $v.status==1}>
                    <span class="public_pyzt">已付款</span>
                <{else}>
                    <span class="public_pyzt public_red">未付款</span>
                <{/if}>
            <{/if}>
        </div>
        <div class="public_k">
            <span class="public_pyzt_ddxx">订单号：<{$v.oid}></span>
        </div>
        <div class="public_k">
            <span class="public_pyzt_ddxx2"><lang>下单时间：</lang><{$v.createtime}></span>
        </div>
        <div class="public_k public_bddd">
            <{if $v.shop_order}>
                <{* 商城订单 *}>
                <a class="public_pyzt__look" href="<{$v.url}>">查看详情</a>
            <{else}>
                <{* 测算订单 *}>
                <a class="public_pyzt__look" href="<{$v.url}>"><{if $v.status==1}>点击查看<{else}>去付款<{/if}></a>
            <{/if}>
        </div>
    </div>
    <{/if}>
    <{/foreach}>
    <{/if}>
    <{if $state==2}>
    <div class="public_ddxx_search">
        <div class="public_ddxx_form">
            <form class="J_ajaxForm" action="/?ac=select_orders" method="post">
                <input type="text" name="oid" nolocal="true" placeholder="请输入订单号" class="input" value="<{$oids}>" /><input type="submit" value="查询" class="J_ajax_submit_btn btn"/>
            </form>
        </div>
    </div>
    <{/if}>
    <div class="public_orders_search">
        <div class="public_os_info">
            温馨提示：忘记或找不到订单号？请按照下方操作获取
        </div>
    </div>
    <div class="order_history">
        <div class="oh_tit">
            微信支付获取订单号
        </div>
        <ul class="problem_feedback">
            <p class="public_banner">
                <img src="/statics/img/cx_wx.jpg" alt="" style="min-height: 1%;">
            </p>
        </ul>
        <div class="oh_tit">
            支付宝支付获取订单号
        </div>
        <ul class="problem_feedback">
            <p class="public_banner">
                <img src="/statics/img/cx_zfb.jpg" alt="" style="min-height: 1%;">
            </p>
        </ul>
        <div class="oh_list">
        </div>
    </div>
    <script type="text/javascript">
        $('.history').addClass('active')
        function _resize() {
            var html = document.getElementsByTagName('html')[0];
            var hW = html.offsetWidth > 750 ? 750 : html.offsetWidth;
            var fS = 100 / 750 * hW;
            html.style.fontSize = fS + "px"
        }
        _resize();
        window.onresize = function() {
            _resize();
        };
    </script>
    <{include file='./ffsm/dl_ck.tpl'}>
    <footer class="public_footer">
        <span class="words">如需帮助</span>
        <a href="http://wpa.qq.com/msgrd?v=3&uin=<{$lianxifs}>&site=qq&menu=yes" target="blank" class="kf"> 请联系专属售后客服</a>
    </div>
    <p><a href="http://beian.miit.gov.cn/" rel="nofollow" target="_blank"><{$shouyedb}></a> <{$zhanming}></p>
    <img src="/statics/ffsm_lg/public/wap/images/img_foot_xin.png?v=cce4dd4" alt="诚信、可信网站" class="public_foot_xin">
</footer>
<script type="text/javascript" src="/bd/tongji.js"></script>
</body>
</html>