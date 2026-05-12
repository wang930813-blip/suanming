<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
	<title><{$data.seotitle}>-<{$zhanming}></title>
	<meta name="keywords" content="<{$data.keywords}>" />
	<meta name="description" content="<{$data.description}>" />
<html lang="en"
  style="--status-bar-height: 0px; --top-window-height: 0px; --window-left: 0px; --window-right: 0px; --window-margin: 0px; --window-top: calc(var(--top-window-height) + 0px); --window-bottom: 0px;">

<head>
  <meta charset="UTF-8">
  <script>var coverSupport = 'CSS' in window && typeof CSS.supports === 'function' && (CSS.supports('top: env(a)') ||
      CSS.supports('top: constant(a)'))
    document.write(
      '<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0' +
      (coverSupport ? ', viewport-fit=cover' : '') + '" />')</script>
  <meta name="viewport"
    content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, viewport-fit=cover">
  <link rel="stylesheet" href="/h5/static/index.2da1efab.css">
  <link rel="shortcut icon" type="image/x-icon" sizes="32x32" href="undefined">
  <title id="titleas"></title>
  <link rel="stylesheet" href="/h5/static/css/xingming.css">
   <link href="/statics/quanju.css" rel="stylesheet" type="text/css">
<{$page_meta}>
</head>
<script src="https://apps.bdimg.com/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="/statics/ffsm/public/js/require/require.min.js"
  data-main="/statics/ffsm/public/js/common.min.js?v=0817"></script>
<script src="/statics/suanming_new.js"></script>

<body class="uni-body pages-xingming-index">
<{include file='./ffsm/header.tpl'}>
 <{include file='./ffsm/tabBar.tpl'}>
  <uni-app class="uni-app--maxwidth">
    <form class="J_ajaxForm" action="/?ac=xmfx" method="post" id="submit1" onSubmit="return checkForm();" name="login">
      <input type="hidden" name="h" class="auto input J-time" id='j_dd' value="">
      <input type="hidden" name=username value="0">
      <input type="hidden" name=y value="0">
      <input type="hidden" name=m value="0">
      <input type="hidden" name=d value="0">

      <input type="hidden" name=i value="0">
      <input type="hidden" name=cY value="">
      <input type="hidden" name=cM value="">
      <input type="hidden" name=cD value="">
      <input type="hidden" name=cH value="">
      <input type="hidden" name=term1 value="">
      <input type="hidden" name=term2 value="">
      <input type="hidden" name=start_term value="">
      <input type="hidden" name=end_term value="">
      <input type="hidden" name=start_term1 value="">
      <input type="hidden" name=end_term1 value="">
      <input type="hidden" name=lDate value="">
      <input type="hidden" name="gender" value="1" />
      <uni-page data-page="pages/xingming/index"><!----><!----><uni-page-wrapper><uni-page-body><uni-view
              data-v-36216bfc="" class="headbox" style="background-color: rgb(234, 207, 163);"><!----><uni-view
                data-v-36216bfc="" class="box1 "><uni-image data-v-36216bfc="">
                  <div
                    style="background-image: url(&quot;/h5/static/image/xingming/8d6d038caca8dfa72a6c89d4c113cf2.png&quot;); background-position: 0% 0%; background-size: 100% 100%; background-repeat: no-repeat;">
                  </div><!----><img src="/h5/static/image/xingming/8d6d038caca8dfa72a6c89d4c113cf2.png"
                    draggable="false">
                </uni-image></uni-view><uni-view data-v-36216bfc="" class="box2 "><uni-view data-v-36216bfc=""
                  class="box2-1"><uni-view data-v-36216bfc="" class="box2-1-1"><uni-text
                      data-v-36216bfc=""><span>填写信息，马上了解你的姓名</span></uni-text></uni-view><uni-view data-v-36216bfc=""
                    class="box2-1-2"><uni-view data-v-36216bfc="" class="box2-2"><uni-text data-v-36216bfc=""
                        class="textin"><span>您的姓氏</span></uni-text><uni-input data-v-36216bfc="">
                        <div class="uni-input-wrapper">
                          <input maxlength="140" step="" name="name1" enterkeyhint="done" autocomplete="off" type=""
                            class="uni-input-input" placeholder="请输入姓氏(汉字)"><!---->
                        </div>
                      </uni-input></uni-view><uni-view data-v-36216bfc="" class="box2-2"><uni-text data-v-36216bfc=""
                        class="textin"><span>您的名字</span></uni-text><uni-input data-v-36216bfc="">
                        <div class="uni-input-wrapper"><input name="name2" maxlength="140" step="" enterkeyhint="done"
                            autocomplete="off" type="" placeholder="请输入名字(汉字)" class="uni-input-input"><!---->
                        </div>
                      </uni-input></uni-view><uni-view data-v-36216bfc="" class="box2-2"><uni-text data-v-36216bfc=""
                        class="textin"><span><{$lang.gender}></span>您的性别</uni-text>男<uni-radio-group data-v-36216bfc="" class="fftt"
                        style="flex: 4 1 0%;"><uni-radio data-v-36216bfc="" style="transform: scale(0.7);">
                          <div class="uni-radio-wrapper" style="--HOVER-BD-COLOR: #EEC87A;">
                            <div class="uni-radio-input uni-radio-input-checked" id="gender_0" onclick="setSex(this)"
                              style="color: rgb(255, 255, 255); background-color: rgb(238, 200, 122); border-color: rgb(238, 200, 122);">
                            </div>
                          </div>
                        </uni-radio><{$lang.boy}><uni-radio data-v-36216bfc="" 
                          style="margin-left: 20px; transform: scale(0.7);">
                          <div class="uni-radio-wrapper">
                            <div class="uni-radio-input" id="gender_1" onclick="setSex(this)"></div>
                          </div>
                        </uni-radio>女<{$lang.girl}></uni-radio-group></uni-view><uni-view data-v-36216bfc="" class="box2-2 date"><uni-text
                        data-v-36216bfc="" class="textin"><span><{$lang.dateofbirth}></span>出生时辰</uni-text><uni-input data-v-36216bfc="">
                        <div class="uni-input-wrapper"><input type="text" id="birthday" data-input-id="b_input"
                            class="uni-input-input Js_date" data-type="0" data-toid-hour="birthday" placeholder="请选择日期"
                            maxlength="140" step="" enterkeyhint="done" autocomplete="off"><!---->
                        </div>
                      </uni-input><div class="icon_date"><uni-image data-v-36216bfc="">
                        <div
                          style="background-image: url(&quot;data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAAFQElEQVRoQ+1ZXWgcVRQ+Z3YTttLa3ckPoVRosELFVis0ZjbpQ/ZBfFCwBX02YqD+tBBp2mY2EQomM6HdYMFoU4hYwTeFRtAnlc1D051owFb7EDGSgKVKk91saDBLM7lH7u7M7Ox29odkNqaw8zb3nnvO+c4595x7z0V4xD98xPWHKoAlre9VRvQlIMysryZDjaFPV4p59V703Z3eHf7vAeAAAnYGpMFvNhMFm/ZAQpOjANjBlaB1er2uXf26mELxSfk19OBXnAaBfghI6ovbBgAj9mZ9cOhqMYUWY72dAgqfZ2hoQpTUUMUALEW7/eTzvYyC0EFE+50F4WEA8KfVIZpBhH+KKUQETYh4wKBJAtBNJ3pEnCXGJjCV+i4QupQsxLNgCCWn5LcY4RAA1G/GQi6sXUSknkCr+oUjUKfBuCZ/hIDdLgh3jQUBXaqT1PfzGT7kgYQWfg8ARrKENA8E36KAi07aEFEnAO4zYnocER1DwlxLRIcB8JhBP4+IjnuGGNUDwitZ3ukVJ0VJ+cSuRw6Ae9EzTR5fzR+IsDOzx6D3Vqp2OBQ6rxcypT0Lub2Jo9Hz3ud8D04DAg9l/iX11bWnG0MXrX2WAyARC/cBwoCh/KgYVN4pFQMJTb5mWnSdWKghODRRbM1CrLfDg0LU9JgoqcdLyoiFLwPC24Ze/WJQGTTX5ALQwjEAkDLG14N10gWtFPPFG/IBj4DnAOB2QFKGS9Hz+SUtfJoI9uvEhhvbhmZLrYlrZyUEL9eNf5ooKcFCABbMrIPEmgPBoflSzLdifinWu49QmDNkLYqS0lAIAFkT2xcAiJJiRU5+CFkAtsKyG5VRBbBRy7m1riwPbONNXN4eqAJwK1543chNo1UPuGjb8li56oFETG4nxC5TtICgewQh8njLwO/m2HJMbmUCdjECLx/jNAKjsd1Bdcqkif907hmBPN0mDR9HojExqE7mw3IXgBZeMm9gtnI+HZCUFvM/oclzecdgfrqaFSX1qSxN+BcA4Lc5+5cUJSVQMQBGR4EDSFs2+9G8KKnNlnKx8H0wj+TmIMGKGFR22UD+BYB785TV9dVkIL+z4aoH4lrfh0DUgwi+tHCCFUGgHn+resVUhp82GcGASUMEKQGh335aTU7JJxjDiAmU0wBipE4a/KBiHihvy7lP5aoH3FevNMcqgNI2qixF1QN2+2aauewkopFKefbwwoDYki1Ay1Phl9YZdUM2U6UED0b8Lyg/Wmn0Z7kddOg3aYhAF1AYcWr2uuYB3uZ41vdgyWq7ZJHdFCXlefM3rsl/I2BTXq24I0rqE8UKGRGs/JqqDeS3cVwDMBft9O3esef+hgoZQM5l3Llag768endXc+hqKsfrbp5GM5074m3HTDUmSDECub5NHbcK2ZT8BhH024DqiDBg728u3pCPCQiqFWbAQwgi9oJo8XMTQGXzjTP38kPIdobZxjeynANffmvxN0A4yO3AGB23h8X/YXlTZjrcBLxmhOxtMagcMufy+kLyRQDsyUzSeDl9y60AZu+/AlBElNQzzgAmwwfBA/ycblxEqMvfqn62FUoWkpE+tRKOGvM6Y3Sovk2dcQTABxNT4ctARic4k2VGhRoh4j8y8OdWAklO9z/J1liP1ZVO60IjYlA9ZdfjoQcOI9fzZ9CjW6lwGbKu31qtDeUXOcc3Mg7C/9iej4nAuvuWIaBiJIgwlvz37qn8AscFFn0nXrh+9oi3xnuCiDqIcK91C6uYqkb6IEgh0h1EnNDX9CsNRy9MFxK56YfuCmMpyb4KoKSJKkzwHxjh/U9bJrj2AAAAAElFTkSuQmCC&quot;); background-position: 0% 0%; background-size: 100% 100%; background-repeat: no-repeat;">
                        </div><!----><img
                          src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAAFQElEQVRoQ+1ZXWgcVRQ+Z3YTttLa3ckPoVRosELFVis0ZjbpQ/ZBfFCwBX02YqD+tBBp2mY2EQomM6HdYMFoU4hYwTeFRtAnlc1D051owFb7EDGSgKVKk91saDBLM7lH7u7M7Ox29odkNqaw8zb3nnvO+c4595x7z0V4xD98xPWHKoAlre9VRvQlIMysryZDjaFPV4p59V703Z3eHf7vAeAAAnYGpMFvNhMFm/ZAQpOjANjBlaB1er2uXf26mELxSfk19OBXnAaBfghI6ovbBgAj9mZ9cOhqMYUWY72dAgqfZ2hoQpTUUMUALEW7/eTzvYyC0EFE+50F4WEA8KfVIZpBhH+KKUQETYh4wKBJAtBNJ3pEnCXGJjCV+i4QupQsxLNgCCWn5LcY4RAA1G/GQi6sXUSknkCr+oUjUKfBuCZ/hIDdLgh3jQUBXaqT1PfzGT7kgYQWfg8ARrKENA8E36KAi07aEFEnAO4zYnocER1DwlxLRIcB8JhBP4+IjnuGGNUDwitZ3ukVJ0VJ+cSuRw6Ae9EzTR5fzR+IsDOzx6D3Vqp2OBQ6rxcypT0Lub2Jo9Hz3ud8D04DAg9l/iX11bWnG0MXrX2WAyARC/cBwoCh/KgYVN4pFQMJTb5mWnSdWKghODRRbM1CrLfDg0LU9JgoqcdLyoiFLwPC24Ze/WJQGTTX5ALQwjEAkDLG14N10gWtFPPFG/IBj4DnAOB2QFKGS9Hz+SUtfJoI9uvEhhvbhmZLrYlrZyUEL9eNf5ooKcFCABbMrIPEmgPBoflSzLdifinWu49QmDNkLYqS0lAIAFkT2xcAiJJiRU5+CFkAtsKyG5VRBbBRy7m1riwPbONNXN4eqAJwK1543chNo1UPuGjb8li56oFETG4nxC5TtICgewQh8njLwO/m2HJMbmUCdjECLx/jNAKjsd1Bdcqkif907hmBPN0mDR9HojExqE7mw3IXgBZeMm9gtnI+HZCUFvM/oclzecdgfrqaFSX1qSxN+BcA4Lc5+5cUJSVQMQBGR4EDSFs2+9G8KKnNlnKx8H0wj+TmIMGKGFR22UD+BYB785TV9dVkIL+z4aoH4lrfh0DUgwi+tHCCFUGgHn+resVUhp82GcGASUMEKQGh335aTU7JJxjDiAmU0wBipE4a/KBiHihvy7lP5aoH3FevNMcqgNI2qixF1QN2+2aauewkopFKefbwwoDYki1Ay1Phl9YZdUM2U6UED0b8Lyg/Wmn0Z7kddOg3aYhAF1AYcWr2uuYB3uZ41vdgyWq7ZJHdFCXlefM3rsl/I2BTXq24I0rqE8UKGRGs/JqqDeS3cVwDMBft9O3esef+hgoZQM5l3Llag768endXc+hqKsfrbp5GM5074m3HTDUmSDECub5NHbcK2ZT8BhH024DqiDBg728u3pCPCQiqFWbAQwgi9oJo8XMTQGXzjTP38kPIdobZxjeynANffmvxN0A4yO3AGB23h8X/YXlTZjrcBLxmhOxtMagcMufy+kLyRQDsyUzSeDl9y60AZu+/AlBElNQzzgAmwwfBA/ycblxEqMvfqn62FUoWkpE+tRKOGvM6Y3Sovk2dcQTABxNT4ctARic4k2VGhRoh4j8y8OdWAklO9z/J1liP1ZVO60IjYlA9ZdfjoQcOI9fzZ9CjW6lwGbKu31qtDeUXOcc3Mg7C/9iej4nAuvuWIaBiJIgwlvz37qn8AscFFn0nXrh+9oi3xnuCiDqIcK91C6uYqkb6IEgh0h1EnNDX9CsNRy9MFxK56YfuCmMpyb4KoKSJKkzwHxjh/U9bJrj2AAAAAElFTkSuQmCC"
                          draggable="false">
                      </uni-image></div></uni-view><uni-view data-v-36216bfc="" class="box2-1-3 hdhx" onclick="submit()"><uni-image
                        data-v-36216bfc="">
                        <div
                          style="background-image: url(&quot;/h5/static/image/xingming/45338e3dc5a4e93e7ef203ce6da8a90.png&quot;); background-position: 0% 0%; background-size: 100% 100%; background-repeat: no-repeat;">
                        </div><!----><img src="/h5/static/image/xingming/45338e3dc5a4e93e7ef203ce6da8a90.png"
                          draggable="false">
                      </uni-image></uni-view><uni-view data-v-36216bfc="" class="box2-1-4" onclick="location.href='/?ac=history'"
                      style="width: auto; height: auto; font-size: 14px; color: rgb(238, 200, 122); text-decoration: underline;">查看订单列表</uni-view></uni-view></uni-view></uni-view><uni-view
                data-v-36216bfc="" class="box4"><uni-image data-v-36216bfc="" style="margin-top: 26px;">
                  <div
                    style="background-image: url(&quot;/h5/static/image/xingming/123e0c4ce9af2985f9162da89c15190.png&quot;); background-position: 0% 0%; background-size: 100% 100%; background-repeat: no-repeat;">
                  </div><!----><img src="/h5/static/image/xingming/123e0c4ce9af2985f9162da89c15190.png"
                    draggable="false">
                </uni-image></uni-view><uni-view data-v-36216bfc="" class="box5"><uni-image data-v-36216bfc=""
                  style="margin-top: 26px;">
                  <div
                    style="background-image: url(&quot;/h5/static/image/xingming/953a4d5e6359922544197a7b53776eb.png&quot;); background-position: 0% 0%; background-size: 100% 100%; background-repeat: no-repeat;">
                  </div><!----><img src="/h5/static/image/xingming/953a4d5e6359922544197a7b53776eb.png"
                    draggable="false">
                </uni-image></uni-view><uni-view data-v-36216bfc="" class="box3"><uni-image data-v-36216bfc=""
                  style="margin-top: 13px;">
                  <div
                    style="background-image: url(&quot;/h5/static/image/xingming/68c76779436d2ac7097a27ed6870c8a.png&quot;); background-position: 0% 0%; background-size: 100% 100%; background-repeat: no-repeat;">
                  </div><!----><img src="/h5/static/image/xingming/68c76779436d2ac7097a27ed6870c8a.png"
                    draggable="false">
                </uni-image></uni-view></uni-view></uni-page-body></uni-page-wrapper></uni-page><!----><!----><uni-actionsheet>
        <div class="uni-mask uni-actionsheet__mask" style="display: none;"></div>
        <div class="uni-actionsheet">
          <div class="uni-actionsheet__menu"><!----><!---->
            <div style="max-height: 260px; overflow: hidden;">
              <div style="transform: translateY(0px) translateZ(0px);"></div>
            </div>
          </div>
          <div class="uni-actionsheet__action">
            <div class="uni-actionsheet__cell" style="color: rgb(0, 0, 0);"> 取消 </div>
          </div>
          <div></div>
        </div><!---->
      </uni-actionsheet>
    </form>
  </uni-app>
  <div
    style="position: absolute; left: 0px; top: 0px; width: 0px; height: 0px; z-index: -1; overflow: hidden; visibility: hidden;">
    <div
      style="position: absolute; width: 100px; height: 200px; box-sizing: border-box; overflow: hidden; padding-bottom: env(safe-area-inset-top);">
      <div
        style="transition: all 0s ease 0s; animation: auto ease 0s 1 normal none running none; width: 400px; height: 400px;">
      </div>
    </div>
    <div
      style="position: absolute; width: 100px; height: 200px; box-sizing: border-box; overflow: hidden; padding-bottom: env(safe-area-inset-top);">
      <div
        style="transition: all 0s ease 0s; animation: auto ease 0s 1 normal none running none; width: 250%; height: 250%;">
      </div>
    </div>
    <div
      style="position: absolute; width: 100px; height: 200px; box-sizing: border-box; overflow: hidden; padding-bottom: env(safe-area-inset-left);">
      <div
        style="transition: all 0s ease 0s; animation: auto ease 0s 1 normal none running none; width: 400px; height: 400px;">
      </div>
    </div>
    <div
      style="position: absolute; width: 100px; height: 200px; box-sizing: border-box; overflow: hidden; padding-bottom: env(safe-area-inset-left);">
      <div
        style="transition: all 0s ease 0s; animation: auto ease 0s 1 normal none running none; width: 250%; height: 250%;">
      </div>
    </div>
    <div
      style="position: absolute; width: 100px; height: 200px; box-sizing: border-box; overflow: hidden; padding-bottom: env(safe-area-inset-right);">
      <div
        style="transition: all 0s ease 0s; animation: auto ease 0s 1 normal none running none; width: 400px; height: 400px;">
      </div>
    </div>
    <div
      style="position: absolute; width: 100px; height: 200px; box-sizing: border-box; overflow: hidden; padding-bottom: env(safe-area-inset-right);">
      <div
        style="transition: all 0s ease 0s; animation: auto ease 0s 1 normal none running none; width: 250%; height: 250%;">
      </div>
    </div>
    <div
      style="position: absolute; width: 100px; height: 200px; box-sizing: border-box; overflow: hidden; padding-bottom: env(safe-area-inset-bottom);">
      <div
        style="transition: all 0s ease 0s; animation: auto ease 0s 1 normal none running none; width: 400px; height: 400px;">
      </div>
    </div>
    <div
      style="position: absolute; width: 100px; height: 200px; box-sizing: border-box; overflow: hidden; padding-bottom: env(safe-area-inset-bottom);">
      <div
        style="transition: all 0s ease 0s; animation: auto ease 0s 1 normal none running none; width: 250%; height: 250%;">
      </div>
    </div>
  </div>
  <script>
    function submit() {
      console.log(123);
      if (checkForm()) {
        document.getElementById('submit1').submit()
      }
    }
    $('.icon_date').click(function(){
      $('#birthday').click();
    })
    function setSex(that) {
      // that.style = 'color: rgb(255, 255, 255); background-color: rgb(238, 200, 122); border-color: rgb(238, 200, 122);'
      $(that).css({
        'color':'rgb(255, 255, 255)',
        'background-color':'rgb(238, 200, 122)',
        'border-color':'rgb(238, 200, 122)',
      })
      $(that).addClass('uni-radio-input-checked')
      var oid = (that.id == 'gender_0'?'gender_1':'gender_0')
      var value = (that.id == 'gender_0'?'1':'0');
      document.login.gender.value = value;
      console.log(('#'+oid))
      $('#'+oid).removeClass('uni-radio-input-checked')
      $('#'+oid).removeAttr('style')
    }
  </script>
</body>

</html>