<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="UTF-8"/>
	<title>月老姻缘-八字综合详批-<{$zhanming}></title>
	<meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
	<meta content="yes" name="apple-mobile-web-app-capable"/>
	<meta content="black" name="apple-mobile-web-app-status-bar-style"/>
	<meta content="telephone=no" name="format-detection"/>
	<link rel="shortcut icon" href="/statics/ffsm/favicon.ico"/>
	<link href="/statics/ffsm/bzyy/bzyy2.css" rel="stylesheet" type="text/css"/>
	<{include file='./ffsm/wx_share.tpl'}>
	<script src="https://apps.bdimg.com/libs/jquery/1.9.1/jquery.min.js"></script>
  <script src="https://cdn.staticfile.net/translate.js/3.2.1/translate.js"></script>
</head>
<body>
 <{include file='./ffsm/header.tpl'}>
  <{include file='./ffsm/tabBar.tpl'}>
<img style="width:100%; height:auto; margin:0 auto; display:block;" src="/statics/ffsm/bzyy/images/bzyy_pay_banner.jpg" alt="点灯还愿">
<div class="container" id="topAnchor">
  <div class="wrapper" id="wrapper">
    <section id="page-result">
      <div data-reactroot="">
        <div>
          <div>
            <div class="li_title">个人信息</div>
            <ul class="user-info">
              <li>
                <div>姓名:<{$data.data.username}></div></li>
              <li>
                <div>性别:<{if $data.data.gender==1}>男<{else}>女<{/if}></div></li>
              <li>
                <div>公历:<{$data.data.y}>年<{$data.data.m}>月<{$data.data.d}>日 <{$data.data.h}>时</div></li>
            </ul>
          </div>
          <div class="minp">
            <div class="li_title_top"></div>
            <div class="li_title">您的八字命盘</div>
            <table class="minp-tab">
              <tbody>
                <tr>
                  <td></td>
                  <td>年柱</td>
                  <td>月柱</td>
                  <td>日柱</td>
                  <td>时柱</td></tr>
                <tr>
                  <td>十神</td>
                  <td><{$pp.shishen1}></td>
                  <td><{$pp.shishen2}></td>
                  <td><{$pp.shishen3}></td>
                  <td><{$pp.shishen4}></td></tr>
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
                <tr>
                  <td>藏干</td>
                  <td><{$pp.zanggan1}></td>
                  <td><{$pp.zanggan2}></td>
                  <td><{$pp.zanggan3}></td>
                  <td><{$pp.zanggan4}></td></tr>
                <tr>
                  <td>支神</td>
                  <td>伤官</td>
                  <td>食神
                    <br>偏财
                    <br>七杀</td>
                  <td>七杀
                    <br>伤官
                    <br>劫财</td>
                  <td>伤官</td></tr>
                <tr>
                  <td>纳音</td>
                  <td><{$pp.nayin1}></td>
                  <td><{$pp.nayin2}></td>
                  <td><{$pp.nayin3}></td>
                  <td><{$pp.nayin4}></td></tr>
              </tbody>
            </table>
          </div>
          <div>
            <div class="part">
              <div class="li_title_top"></div>
              <div class="li_title">您的感情婚姻总评</div>
              <div class="part_det">
              <h3>您命中有<{if $return.data.zonghe.th}><{$return.data.zonghe.th}><{else}>1<{/if}>朵红艳桃花</h3>
				<{foreach from=$return.sx.yf item=v}>
					<p><{$v.yinyuanb}></p>
				<{/foreach}>
                <p class="part_tips"></p>
                </div>
            </div>
          </div>
          <div>
            <div class="part">
              <div class="li_title_top"></div>
              <div class="li_title">您的婚配建议与补救</div>
              <div class="part_det">
              <{foreach from=$return.sx.yf item=v}>
                <p class="part_tips"><{$v.yinyuanc}></p>
               <{/foreach}>
              </div>
            </div>
          </div>
          <div>
            <div class="analysis">
              <div class="li_title_top"></div>
              <div class="li_title">婚配对象分析</div>
              <ul>
                <p>
                  <span class="ana_type">三合生肖：</span><{$return.data.xiyongshen.sanhe.sanhe.1}>、<{$return.data.xiyongshen.sanhe.sanhe.2}></p>
                <p>
                  <span class="ana_type">六合生肖：</span>狗</p>
                <p>
                  <span class="ana_type">相害生肖：</span><{$return.data.xiyongshen.sanhe.sanhe.1}></p>
                <p>
                  <span class="ana_type">相冲生肖：</span>鸡</p>
                <p>
                  <span class="ana_type">相刑生肖：</span><{$return.data.xiyongshen.sanhe.sanhe.2}></p>
                <p>
                  <span class="ana_type">婚配适宜：</span>猪、<{$return.data.xiyongshen.sanhe.sanhe.2}>、狗，
                  <span>相配大吉，天做良缘，互相扶持，财盛家宁。</span></p>
                <p>
                  <span class="ana_type">婚姻忌配：</span>鸡、<{$return.data.xiyongshen.sanhe.sanhe.1}>、鼠，
                  <span>吉凶各半，甘苦共存，无进取心，内心多忧疑苦惨。</span></p>
              </ul>
            </div>
          </div>
          <div>
            <div class="part">
              <div class="li_title_top"></div>
              <div class="li_title">您今年流年感情运程</div>
              <div class="part_det">
              <{foreach from=$return.sx.yf item=v}>
                <p class="part_tips"><{$v.yinyuana}></p>
               <{/foreach}> 
                </div>
            </div>
          </div>
          <div>
          <div>
            <div class="part">
              <div class="li_title_top"></div>
              <div class="li_title">您的感情婚姻建议</div>
              <div class="part_det">
              <{foreach from=$return.sx.yf item=v}>
                <p class="part_tips"><{$v.yinyuanf}></p>
               <{/foreach}> 
                </div>
            </div>
          </div>
          </div>
          <div>
            <div class="result_title">
              <div class="li_title_top"></div>
              <div class="li_title">爱情运势分析</div>
              <ul>
                <li>
                  <p><{$rglm.aqfx}></p>
                </li>
              </ul>
            </div>
          </div>
          <div>
            <div class="result_title">
              <div class="li_title_top"></div>
              <div class="li_title">未来十年运势分析</div>
              <ul>
                <li>
                  <p><{$myq_text}></p>
                </li>
              </ul>
            </div>
          </div>
          <div>
          <div class="go-top-btn" id="go-top-btn" style="display: block;">
            <a href="#topAnchor"><img src="/statics/ffsm/bzyy/images/go_top.png" alt="回到顶部"></a></div>
        </div>
      </div>
    </section>
  </div>
</div>
 
<br><br><br><br>
 <script>
translate.language.setLocal('chinese_simplified'); 
translate.changeLanguage('<{$lang._changeLanguage}>');
translate.execute();
</script>
<{include file='./ffsm/user_footer.tpl'}>
<{include file='./ffsm/footers.tpl'}>
<{include file='./ffsm/dl_ck.tpl'}>
</body>
</html>