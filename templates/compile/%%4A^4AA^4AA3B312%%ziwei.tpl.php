<?php /* Smarty version 2.6.25, created on 2025-12-05 22:11:23
         compiled from ffsm/ziwei.tpl */ ?>
<!DOCTYPE html>
<html lang="zh-CN">
    <head>
        <meta charset="UTF-8"/>
        <title>专业预测财运、事业、爱情-国学网</title>
        <meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no,viewport-fit=cover"/>
        <meta content="yes" name="apple-mobile-web-app-capable"/>
        <meta content="black" name="apple-mobile-web-app-status-bar-style"/>
        <meta content="telephone=no" name="format-detection"/>
        <link rel="shortcut icon" href="https://p.tx9968.com/ziweis/ffsm/favicon.ico?v=976ee4e"/>
        <link href="ziwei/css/base.min.css" rel="stylesheet" type="text/css"/>
        <script src="ziwei/js/jquery-3.4.1.min.js"></script>
        <script src="ziwei/js/require-2.3.6.min.js"></script>
        <script src="/statics/ffsm/public/wap/js/common.min.js?v=aad090e"></script>

        <link href="ziwei/css/style.min.css" rel="stylesheet" type="text/css"/>
    <?php echo $this->_tpl_vars['page_meta']; ?>

</head>
<body>
        <?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => './ffsm/header.tpl', 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
        <div class="m_top_tip">
            <span><?php echo $this->_tpl_vars['gundong']; ?>
</span>
        </div>
        <div class="base-order-history J_order_history_entry" data-banner="[banner]" data-app="ziweidoushu">
            <span class="J_entry_close"></span>
            你最近有测算订单哦~
	<a href="/user/history.html?app=ziweidoushu">立即查看</a>
        </div>
        <div class="index-banner">
            <img class="m-img" src="ziwei/picture/index_banner_t.png" alt="紫微斗数"/>
            <img class="m-img" src="ziwei/picture/index_banner_b.png" alt="紫微斗数"/>
            <div id="indexWords">
                <span class="words words1"></span>
                <span class="words words2"></span>
                <span class="words words3"></span>
                <span class="words words4"></span>
            </div>
            <p class="ib-taji"></p>
        </div>
        <div class="m-box-wrap index-form J_testFixedTop">
 <form class="J_ajaxForm" action="?ac=ziwei" method="post" id="submit1" name="login" method="post" onSubmit="return checkForm();">
        <ul class="index-form__ul">
          <li class="index-form__li">
            <p class="index-form__words">您的姓名</p>
            <p class="index-form__r">
              <input
                type="text"
                class="index-form__input"
                name="username"
                id="username"
                placeholder="请输入姓名（汉字）"
                value=""
              /></p>
          </li>
          <li class="index-form__li">
            <p class="index-form__words">您的性别</p>
            <div class="index-form__r index-form__sex J_sex">
              <span data-value="1" class="cur">男</span>
              <span data-value="0">女</span>
              <input type="hidden" name="gender" value="" />
            </div>
          </li>
          <li class="index-form__li">
            <p class="index-form__words">出生日期</p>
            <div class="index-form__r">
              <input
                type="text"
                id="birthday"
                data-toid-date="b_input"
                data-toid-hour="birthday"
                data-confirm="true"
                class="J_datepicker index-form__birthday"
                readonly
                data-type="1"
                value=""
                placeholder="选择出生年月（必填）"
              /><input type="hidden" name="birthday" id="b_input" /><input
                type="hidden"
                name="hour"
                id="b_hour"
              />
               <input type="hidden" name="h"  class="auto input J-time" id='j_dd'  value="">
                <input type="hidden" name=y  value="0">
                <input type="hidden" name=m  value="0">
                <input type="hidden" name=d  value="0">
                <input type="hidden" name=i  value="0">
                <input type="hidden" name=cY  value="">
                <input type="hidden" name=cM  value="">
                <input type="hidden" name=cD  value="">
                <input type="hidden" name=cH  value="">
                <input type="hidden" name=term1  value="">
                <input type="hidden" name=term2  value="">
                <input type="hidden" name=start_term  value="">
                <input type="hidden" name=end_term  value="">
                <input type="hidden" name=start_term1  value="">
                <input type="hidden" name=end_term1  value="">
                <input type="hidden" name=lDate  value="">
            </div>
          </li>
        </ul>
        <p class="index-form__test">已有3048056人查看紫微命格详批</p>
        <div class="index-form__btn">
          <a href="javascript:;" class="J_ajax_submit_btnsub">立即测算</a>
        </div>
        <div class="index-form__agreement J_testFixedShow">
          <input
            type="checkbox"
            checked="checked"
            name="privacy_protocol"
          />我已阅读并同意
                    <a href="javascript:;" class="J_protocolShowBtn">
                        《<span>服务声明及隐私条款</span>
                        》
                    </a>
                </div>
            </form>
        </div>
        <p class="index-form__test">已有9668377人查看紫微命格详批</p>
        <p class="index-pic">
            <img class="m-img" src="ziwei/picture/index_img_1.png" alt="1"/>
            <img class="m-img" src="ziwei/picture/index_img_2.png" alt="2"/>
            <img class="m-img" src="ziwei/picture/index_img_3.png" alt="3"/>
        </p>
        <p class="index-pic">
            <img class="m-img" src="ziwei/picture/index_img_4.png" alt="4"/>
        </p>
        <p class="index-pic">
            <img class="m-img" src="ziwei/picture/index_img_5.png" alt="5"/>
            <img class="m-img" src="ziwei/picture/index_img_6.png" alt="6"/>
        </p>
        <div class="m-box-wrap index-feedback">
            <div class="m-box">
                <p class="m-box__title"></p>
                <div class="user-feedback" id="publicFeedbackScroll">
                    <ul class="uf-ul">
                        <li>
                            <strong>王先生 150****1946</strong>
                            <p>最近非常的烦躁，迷茫。按照紫微精批里的建议做了改变，生活、工作渐渐有起色。</p>
                        </li>
                        <li>
                            <strong>张女士 186****4160</strong>
                            <p>通过紫微精批知道自己转运就在明年此时，重新燃起对未来的希望。</p>
                        </li>
                        <li>
                            <strong>林女士 180****9949</strong>
                            <p>事业和感情方面都分析的很对，希望明年能够顺利结婚！</p>
                        </li>
                        <li>
                            <strong>洪先生 186****8384</strong>
                            <p>我之前对考公有些抗拒，测算后发现自己更适合事业单位，现在已经入职啦。</p>
                        </li>
                        <li>
                            <strong>郑先生 138****7116</strong>
                            <p>结果显示我下半辈子的主要收入来源还是在于主业。看来要好好经营店铺了！</p>
                        </li>
                        <li>
                            <strong>许女士 150****7913</strong>
                            <p>婚后天天吵架，日子过的不顺心，经过老师开解，运势有了极大改善。</p>
                        </li>
                        <li>
                            <strong>贝先生 186****3325</strong>
                            <p>爱情部分说的很准，自已已经单身很多年了，希望早日告别单身狗行列！</p>
                        </li>
                        <li>
                            <strong>周先生 133****2187</strong>
                            <p>我的性格和测算中说的一模一样，自己在事业上老师犹豫不决，还好有老师的建议。谢谢老师！</p>
                        </li>
                        <li>
                            <strong>黄女士 180****1310</strong>
                            <p>这个真的好准，如老师所说今年确实因为意外耗费了一大笔钱财。</p>
                        </li>
                        <li>
                            <strong>方先生 138****0223</strong>
                            <p>听人说房屋朝向最好是能根据自己的紫微命盘特点来选择，特地请教了老师。</p>
                        </li>
                        <li>
                            <strong>李小姐 150****5709</strong>
                            <p>原来我是做行政工作的，工作并不顺心。希望能如测算结果所说通过跳槽改善自己的事业运势。</p>
                        </li>
                        <li>
                            <strong>龙先生 186****0301</strong>
                            <p>通过该测算得知自己最近3个月的运势不佳，赶紧按照老师建议调整自己的床头方向，佩戴吉祥物等。运势有了很大的改观，生活，工作渐渐有起色。</p>
                        </li>
                        <li>
                            <strong>徐女士 138****1238</strong>
                            <p>开了个中档次的服装店生意一直不好。听从老师建议以后对店铺进行了装修改造，现在生意真是越来越火爆！</p>
                        </li>
                        <li>
                            <strong>叶女士 150****7364</strong>
                            <p>和相处了2年的男朋友分手之后很沮丧，后来听了老师的解析，了解了自己的姻缘运势，现在只想沉下心来好好工作，希望能像老师说的早日碰到适合自己的另一半。</p>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
       
        <!--sas:579.579 end-->
</div></div>

<!--产品尾部-->
<style>
.scProd_footer {
    width: 100% !important;
    margin: .4rem 0 !important;
    padding: .3rem 0 !important;
    line-height: 1.5 !important;
    background: transparent !important;
    color: #666 !important;
    font-size: .24rem !important;
    text-align: center !important;
}
.scProd_footer * {
    font-size: .24rem !important;
}
.scProd_footer a {
    color: #666 !important;
    text-decoration: none !important;
    font-size: .24rem !important;
}
.scProd_footer img {
    width: .26rem !important;
    vertical-align: middle !important;
    margin: -.05rem 0 0 0 !important;
}
</style>
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "ffsm/footer_contact.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
<!--产品尾部-->

<div class="protocol_pop_box" id="protocolPopBox">
    <div class="ppb_content">
        <ul class="ppb_tab_title J_tabTitle">
            <li class="active">隐私协议</li>
            <li>服务协议</li>
        </ul>
        <ul class="ppb_tab_text J_tabText">
            <li class="active">
                <p>厦门天象文化传播有限公司已开展了丰富多彩的内容业务，其中包括了在线测算。为说明在线测算平台（以下简称平台）会如何收集、使用和存储您的个人信息及您享有何种权利，我们将通过本协议向您阐述相关事宜，其中要点如下：</p>
                <p>1、我们将逐一说明我们收集的您的个人信息类型及其对应的用途，以便您了解我们针对某一特定功能所收集的具体个人信息的类别、使用理由及收集方式。</p>
                <p>
                    2、 当您使用一些功能时，我们会在获得您的同意后，收集您的一些隐私信息，例如提供测算服务时，我们需要您的<em>姓名和生辰命格</em>
                    进行分析；为了保存您的分析报告结果，我们需要获取您的手机或邮箱。如拒绝提供这些信息会使您无法使用相关特定功能。
                </p>
                <p>3、目前，在线测算平台不会主动共享或转让您的个人信息至厦门天象文化传播有限公司以外的第三方，如存在其他共享或转让您的个人信息情形时，我们会征得您的明示同意，此外我们会对对外提供信息的行为进行风险评估。</p>
                <p>4、您可以通过本声明所列途径访问、更正、删除您的个人信息，也可以撤回同意、注销帐号、投诉举报。</p>
                <p>如您想了解更加详尽的信息，请根据以下索引阅读相应章节：</p>
                <h3>一、 我们收集的信息</h3>
                <h3>二、信息的存储</h3>
                <h3>三、信息安全</h3>
                <h3>四、我们如何使用信息</h3>
                <h3>五、关于Cookie的使用</h3>
                <h3>六、您的权利</h3>
                <h3>七、免责声明</h3>
                <h3>八、对外提供</h3>
                <h3>九、变更</h3>
                <h3>十、其他</h3>
                <h3>十一、联系我们</h3>
                <h2>一、我们收集的信息</h2>
                <p>在您使用在线测算服务的过程中，本平台会按照如下方式收集您在使用服务时主动提供或因为使用服务而产生的信息，用以向您提供服务、优化我们的服务以及保障您的帐号安全：</p>
                <p>
                    1、当您进入某些测算服务前（较少），我们可能会获取您的微信头像、微信昵称信息，收集<b>微信头像和昵称</b>
                    信息是为了帮助您完成测算报告的归属认证，保障您的报告评测结果与您的账号相关联并保留。
                </p>
                <p>
                    2、在您体验测算服务时，我们需要获取您的<b>姓名和生辰命格</b>
                    （出生日期），为了保证数据准确性，<em>我们建议您提供真实的个人信息，若您提供的信息有错误，会对测算结果的准确性造成偏差。我们保证您的所有个人信息除了用于生成测算数据以外，不会用于其他用途。</em>
                </p>
                <p>3、当您体验完测算服务后，您可以主动保存分析报告结果，这时候我们需要获取您的手机或邮箱，用来发送报告结果，方便你进行查看。</p>
                <h2>二、信息的存储</h2>
                <p>1、信息存储的地点</p>
                <p>我们会按照法律法规规定，将境内收集的用户个人信息存储于中国境内。</p>
                <p>2、信息存储的期限</p>
                <p>一般而言，我们仅为实现目的所必需的时间保留您的个人信息，例如：微信头像和微信昵称，若您需要使用测算服务，我们需要一直保存您的微信头像和微信昵称，以保证您正常使用该服务，当您一段时间未进入网页或程序后，我们将删除相应的信息；当我们的产品或服务发生停止运营的情形时，我们将以推送微信服务消息通知、短信等形式通知您，并在合理的期限内删除您的个人信息或进行匿名化处理。</p>
                <h2>三、信息安全</h2>
                <p>我们努力为用户的信息安全提供保障，以防止信息的丢失、不当使用、未经授权访问或披露。</p>
                <p>我们将在合理的安全水平内使用各种安全保护措施以保障信息的安全。例如，我们会使用加密技术（例如，SSL）、匿名化处理等手段来保护您的个人信息。 我们通过不断提升的技术手段加强我们产品的安全能力，以防止您的个人信息泄露。 例如， 我们为了安全传输会在您的设备本地完成部分信息加密的工作。我们建立专门的管理制度、流程和组织以保障信息的安全。例如， 我们严格限制访问信息的人员范围， 要求他们遵守保密义务， 并进行审计。若发生个人信息泄露等安全事件， 我们会启动应急预案， 阻止安全事件扩大， 并以公告、 短信等形式告知您。</p>
                <h2>四、我们如何使用信息</h2>
                <p>
                    在现行法律法规允许的范围内，我们可能将通过某些功能所收集的信息用于我们的其他服务。例如，本平台可能会将您非隐私的个人信息用于市场营销，使用方式包括但不限于：<em>在网页或者app平台中向您展示或提供广告和促销资料，向您通告或推荐服务或产品信息，使用电子邮件，短信等方式推送其他此类根据您使用厦门天象文化传播有限公司服务或产品的情况所认为您可能会感兴趣的信息。</em>
                </p>
                <p>如我们使用您的个人信息，超出了与收集时所声称的目的及具有直接或合理关联的范围，我们将在使用您的个人信息前，再次向您告知并征得您的明示同意。</p>
                <h2>五、关于Cookie的使用</h2>
                <p>为确保网页正常运转,为您提供更为便捷的访问体验,我们会在您的计算机或移动设备上存储名为 Cookie B的小数据文件。Cookie通常包含标识符、站点名称以及一些号码和字符。借助于cookie,网页或客户端能够存储您的偏好或历史报告等数据。我们不会将Cookie用于本协议所述目的之外的任何用途。您可根据自己的偏好管理或清除移动设备（或计算机）上保存的所有 cookie。</p>
                <p>但如果您这么做则会影响我们为您提供更好的用户使用体验以及更方便的服务</p>
                <h2>六、您的权利</h2>
                <p>在您使用在线测算期间，为了您可以更加便捷地访问、更正、删除您的个人信息，同时保障您撤回对个人信息使用的同意的权利，我们在产品设计中为您提供了相应的操作设置，您可以参考下面的指引进行操作，此外，我们还设置了投诉举报渠道，您的意见将会得到及时的处理</p>
                <p>1、查询个人信息和报告</p>
                <p>（1）进入测算首页，点击“查询历史订单”；</p>
                <p>（2）输入订单编号、姓名，点击搜索即可查询</p>
                <p>2、投诉举报</p>
                <p>3、您可以通过客服反馈您的问题，我们将在第一时间回复并尽我们最大的努力解决您的问题。</p>
                <h2>七、免责声明</h2>
                <p>1、本平台与其他的在线使用的互联网网站一样,也会受到各种不良信息、网络安全和网络故障问题的困扰,包括但不限于：</p>
                <p>（1）其他用户可能会发布诈骗或虚假信息,或者发表有谩骂、诅咒、诋毁、攻击内容的,或者含有淫秽、色情、下流、反动、煽动民族仇恨等让人反感、厌恶的内容的非法言论；</p>
                <p>（2）其他用户可能会发布一些侵犯您或者其他第三方知识产权、肖像权、姓名权、名誉权、隐私权和/或其他合法权益的图片、照片、文字等资料；</p>
                <p>（3）因您个人未妥善保护账号，或因您将帐号转让、出借、销售或以任何脱离控制的形式交由他人使用，或因黑客行为导致帐号遭他人非法使用；</p>
                <p>
                    （4）面临着诸如黑客攻击、计算机病毒困扰、系统崩溃、网络掉线、网速缓慢、程序漏洞等问题的困扰和威胁。例如，<em>可能存在的百度快照抓取测算结果行为，这个是百度收录机制造成，并非我们主动泄露测算结果。</em>
                    同时我们已在技术上防止搜索引擎收录测算结果，严格保护您的测算数据，请您放心，如您发现自己的测算结果被百度快照收录，请点击：<a href="http://help.baidu.com/webmaster/add" target="_blank">http://help.baidu.com/webmaster/add</a>
                    提交反馈，百度方确认后会进行删除。
                </p>
                <p>2、您充分理解到：本协议上述的各种不良信息、网络安全和网络故障问题,并不是本平台或厦门天象文化传播有限公司所导致的问题,由此可能会造成您感到反感、恶心、呕吐等精神损害,或者给您造成其他的损失,概由您自行承担,本平台或厦门天象文化传播有限公司无须向您承担任何责任。</p>
                <h2>八、对外提供</h2>
                <p>除按法律法规规定外，我们不会主动对外公开披露所收集的个人信息，如须主动公开披露时，我们会向您告知此次公开披露的目的、披露信息的类型及可能涉及的敏感信息，并征得您的明示同意。</p>
                <p>本平台也不会主动共享或转让您的个人信息至厦门天象文化传播有限公司以外的第三方，如存在其他共享或转让您的个人信息情形时，我们会征得您的明示同意，此外我们会对对外提供信息的行为进行风险评估。</p>
                <p>随着我们业务的持续发展，我们将按照法律法规及不低于本声明所要求的标准继续保护或要求新的控制者继续保护您的个人信息。</p>
                <h2>九、变更</h2>
                <p>我们可能会适时对本声明进行修订。当声明的条款发生变更时，将会在网页的重要位置上提示修改内容。请您注意，只有在您勾选同意按钮后，我们才会按照更新后的声明收集、使用、存储您的个人信息。</p>
                <h2>十、其他</h2>
                <p>在线测算用户隐私条款中所规定的用户权利及信息安全保障措施均适用于在线测障您的帐号安全</p>
                <h2>十一、与我们联系</h2>
                <p>
                    当您有其他的投诉、建议、未成年人个人信息相关问题时，请通过平台客服与我们联系。您也可以将您的问题发送至<em>8873336@qq.com</em>
                    或电话
                    <em>
                        <a href="tel:4006010693">400-601-0693</a>
                    </em>
                    告知我们，我们将尽快审核所涉问题，并在验证您的用户身份后的3-5个工作日内予以回复。
                </p>
            </li>
            <li>
                <h2>一、总则</h2>
                <p>1、为了保护网络信息安全，保障公民、法人和其他组织的合法权益，维护国家安全和社会公共利益，根据国家法律法规以及全国人大常委会的相关规定，本平台或厦门天象文化传播有限公司制定并按照本协议提供网络服务。用户应当充分阅读并同意本协议的全部条款并按照页面上的提示完成全部的注册程序（未成年人应与法定监护人共同完成）。用户选择访问或使用本平台或厦门天象文化传播有限公司有关服务，将视为同意接受本协议全部条款的约束。</p>
                <p>2、除非另有明确规定，本平台或厦门天象文化传播有限公司所推出的新产品、新功能和新服务，均无条件的适用本协议。</p>
                <p>3、本平台或厦门天象文化传播有限公司保留在任何时候修改本协议条款的权利，且无需另行通知。用户在使用服务时应关注并遵守。</p>
                <p>4、用户在使用本平台或厦门天象文化传播有限公司提供的各项服务之前，应仔细阅读本协议。如果您不同意本协议或本平台或厦门天象文化传播有限公司的修改，可以主动取消本平台或厦门天象文化传播有限公司提供的服务；如果您继续使用本平台或厦门天象文化传播有限公司服务，则视为您已经接受本协议全部内容，包括本平台或厦门天象文化传播有限公司对本协议所做的任何修改。</p>
                <p>5、用户无论通过何种方式使用本平台或厦门天象文化传播有限公司服务，均受本协议约束。</p>
                <p>6、本协议可由本平台或厦门天象文化传播有限公司随时更新，更新后的协议及规则条款一旦公布即代替原来的条款，恕不再另行通知。用户可在本平台或厦门天象文化传播有限公司网站查阅最新版协议及规则条款。在本平台或厦门天象文化传播有限公司修改协议或规则条款后，如果用户不接受修改后的条款，请立即停止使用对应的本平台或厦门天象文化传播有限公司服务，用户继续使用本平台或厦门天象文化传播有限公司服务将被视为已接受了修改后的条款。</p>
                <h2>二、协议的性质与条款的接受</h2>
                <p>1、本协议是用户（无论个人或单位）与本平台或厦门天象文化传播有限公司之间就在线测试平台的使用和管理所约定的协议（下称“本协议”）。接受本协议的全部条款，构成用户使用本平台或厦门天象文化传播有限公司所提供的服务之先决条件，本平台或厦门天象文化传播有限公司将严格依照本协议中的条款提供服务。</p>
                <p>2、用户访问或使用在线测试平台提供的服务，则表示用户接受本协议的全部条款；如用户不愿意接受本协议的全部条款，则应不使用或主动退订在线测试提供的服务。本平台或厦门天象文化传播有限公司有权随时修改本协议中的服务条款，一旦条款发生变更或修改，本平台或厦门天象文化传播有限公司将在相关页面上公示；如果用户继续使用本平台或厦门天象文化传播有限公司提供的服务，则视为用户已接受本协议的修改内容；如果用户不同意本协议的修改，可以退订已经订阅的服务并停止使用。</p>
                <p>3、本平台或厦门天象文化传播有限公司向用户提供的收费服务，对于用户已经缴纳的服务费用不进行任何形式的退款。当用户选择付费时，表明用户已经完全同意此条款；如果用户不同意本条款，可以退订已经订阅的服务并停止使用。</p>
                <h2>三、服务说明</h2>
                <p>1、 本平台或厦门天象文化传播有限公司提供的咨询服务、内容结果仅作参考之用，故本平台不做后续结果保证。需用户自行独立判断决定是否接纳平台所给建议，另用户需保持积极向上心态，不得因此产生精神依赖，否则自行承担因自身判断失准产生的后果以及与之相关的法律责任；</p>
                <p>用户具备履行本协议项下之义务、各种行为的能力；用户履行相关义务、从事相关行为不违反任何对用户的有约束力的法律文件。否则，用户应不使用本平台或厦门天象文化传播有限公司提供的相关服务，且应独自承担由此带来的一切责任及全部损失。</p>
                <p>2、用户在平台上接受的各种服务，符合国家相关法规的规定，不违反任何相关法规及相关协议、规则，也不会侵犯任何人的合法权益。</p>
                <p>3、用户理解并接受本平台或厦门天象文化传播有限公司提供的服务中可能包括广告，同意在使用网络服务的过程中显示本平台或厦门天象文化传播有限公司和第三方供应商、合作伙伴提供的广告。</p>
                <p>4、为了便于用户使用本平台或厦门天象文化传播有限公司相关服务，用户理解并接受，本平台或厦门天象文化传播有限公司可以通过邮件、短信、电话、站内信、弹出消息、客户端推送等形式，向本平台或厦门天象文化传播有限公司网络服务的注册用户、购物用户、收货人等发送公示文案、订单信息、促销活动、广告等各类通知。</p>
                <p>5、服务费用 </p>
                <p>5.1 用户因使用本平台或厦门天象文化传播有限公司或预测师提供的相关服务（包括但不限于向预测师咨询服务等），产生的所有服务费用由用户自行承担，用户应按照相关协议、规则等支付费用，否则，本平台或厦门天象文化传播有限公司或预测师有权不提供相关服务。用户选择使用相关服务并支付费用后，在服务未到期之前，若用户单方要求提前解除服务的，本平台或厦门天象文化传播有限公司有权将用户未使用的服务对应的费用不予退还而作 为用户单方违约的违约金予以没收。</p>
                <p>5.2 本平台或厦门天象文化传播有限公司可能根据实际需要对收费服务的收费标准、方式进行修改和变更，如果用户不同意上述修改、变更，则应停止使用相应服务，否则，用户的任何使用行为，即视为同意上述修改、变更。</p>
                <p>6、用户您清楚知悉购买的我平台存在有效期，有效期限为一年内结束服务。过期后用户将无法查看付费内容，建议用户在有效期内自行保管。</p>
                <h2>四、用户使用规则</h2>
                <p>1、用户在使用本平台或厦门天象文化传播有限公司服务的过程中，同意遵守《中华人民共和国保守国家秘密法》、《中华人民共和国着作权法》、《中华人民共和国商标法》、《中华人民共和国专利法》、《中华人民共和国计算机信息系统安全保护条例》、《计算机软件保护条例》、《互联网电子公告服务管理规定》、《信息网络传播权保护条例》等相关法律、法规。在任何情况下，本平台或厦门天象文化传播有限公司一旦有合理理由认为用户的行为可能违反上述法律、法规，可以在任何时候不经事先通知终止向该用户提供服务。</p>
                <p>2、用户在申请使用本平台或厦门天象文化传播有限公司服务时，必须向本平台或厦门天象文化传播有限公司提供完整、真实、准确的个人资料。如果上述个人资料信息发生变化，用户应及时更改。</p>
                <p>3、用户应妥善保管好自己的账号、密码，不得转让或出借给他人使用。用户在使用本平台或厦门天象文化传播有限公司服务后，须将有关账号安全退出。当账号或密码遭到未经授权的使用，应当及时通知本平台或厦门天象文化传播有限公司，本平台或厦门天象文化传播有限公司依法根据用户的通知、用户的个人资料及现有技术手段协助用户取回账号、密码，账号或密码遭到未经授权的使用期间造成的损失，本平台或厦门天象文化传播有限公司不承担任何责任。</p>
                <p>4、用户同意：本平台或厦门天象文化传播有限公司在提供服务的过程中以各种方式投放推广信息（包括但不限于：电子邮件、网站联络方式、在本平台或厦门天象文化传播有限公司平台的任何位置上投放），用户同意接受本平台或厦门天象文化传播有限公司以上述方式向用户发送推广信息。</p>
                <p>5、禁止用户从事以下行为：</p>
                <p>（5.1）传送包含任何反对宪法所确定的基本原则、危害国家安全、泄露国家秘密、颠覆国家政权、破坏国家统一、破坏民族团结、损害国家荣誉和利益、煽动民族仇恨、民族歧视、破坏民族团结、破坏国家宗教政策、宣扬邪教和封建迷信、淫秽、色情、赌博、暴力、凶杀、恐怖或者教唆犯罪、侮辱或者诽谤他人，侵害他人合法权益的等法律、行政法规禁止的内容，包括但不限于资讯、资料、文字、软件、音乐、照片、图形、信息或其他资料；</p>
                <p>（5.2）将侵犯任何人的姓名权、肖像权、知识产权（包括但不限于专利权、商标权、着作权、商业秘密等）或其他专属权利的内容、或无权传送的内容（包括但不限于内部资料、机密资料）加以上载、张贴、发送电子邮件或以其他方式传送；</p>
                <p>（5.3）以任何方式危害未成年人；</p>
                <p>（5.4）伪造标题或以其他方式操控识别资料，使人误认为该内容为本平台或厦门天象文化传播有限公司所传送；</p>
                <p>（5.5）冒充任何人或机构，或以虚伪不实的方式谎称或使人误认为与任何人或任何机构有关从事诈骗、欺骗行为；</p>
                <p>（5.6）传播病毒软件或其他破坏计算机代码、档案和程序资料</p>
                <p>（5.7）干扰或破坏本平台或厦门天象文化传播有限公司服务或与本平台或厦门天象文化传播有限公司网络服务相连的服务器和网络；</p>
                <p>（5.8）将广告函件、促销资料、“垃圾邮件”等，加以上载、张贴、发送电子邮件或以其他方式传送，但供前述目的使用的专用区域除外；</p>
                <p>（5.9）跟踪或以其他方式骚扰他人；</p>
                <p>（5.10）其他违反任何相关的中国法律、法规、规章、条例等具有法律效力的规范的行为。</p>
                <h2>五、知识产权保护</h2>
                <p>1、本平台或厦门天象文化传播有限公司对产品服务及本产品所使用的软件所包含的受知识产权法或其他法律保护的资料享有相应的权利，本产品的整体内容版权归本平台或厦门天象文化传播有限公司所有。本产品所有设计图样以及其他图样、产品及服务名称，均为本平台或厦门天象文化传播有限公司所享有，任何人不得使用、复制或用作其他用途。用户对本产品所使用的软件有非专属性使用权，但不得自行或许可任何第三方复制、修改、出售或衍生产品。</p>
                <p>2、经由本产品传送的文字、图片、音频、视频及其他内容，受到着作权法、商标法、专利法或其他法律的保护；除该文字、图片、音频、视频及其他内容的上载用户所享有的着作权，未经本平台或厦门天象文化传播有限公司书面授权许可，第三方不得进行修改、出租、售卖或衍生其他作品。</p>
                <p>3、本平台或厦门天象文化传播有限公司对其专有内容、原创内容和其他通过授权取得的独占或者独家内容享有知识产权。未经本平台或厦门天象文化传播有限公司书面许可，任何单位和个人不得私自转载、传播和提供收听服务或者有其他侵犯本平台或厦门天象文化传播有限公司知识产权的行为。否则，将承担法律责任。</p>
                <p>4、除非本平台或厦门天象文化传播有限公司收到相关通知，本平台或厦门天象文化传播有限公司将用户视为其在本产品上载或发布的内容的版权所有人。用户访问或使用本平台或厦门天象文化传播有限公司提供的服务，则表示用户接受本协议的全部条款，即表明该用户主动将其在任何时间段在本产品发表的任何形式的内容的着作财产权无偿授权给本平台或厦门天象文化传播有限公司使用，本平台或厦门天象文化传播有限公司有权通过在线测试对内容进行复制、下载、编辑、修改、展示及网络传播。同时用户许可本平台或厦门天象文化传播有限公司有权利就任何主体侵权而单独提起诉讼，并获得赔偿。本协议已经构成《著作权法》第二十五条所规定的书面协议，其效力及于用户在本产品发布的任何受着作权法保护的内容，无论该内容形成于本协议签订前还是本协议签订后。</p>
                <h2>五、免责声明</h2>
                <p>1、本平台或厦门天象文化传播有限公司对于任何包含、经由或链接、下载或从任何与有关本平台或厦门天象文化传播有限公司平台所获得的任何内容、信息或广告，不声明或保证其正确性或可靠性；并且对于用户经本平台或厦门天象文化传播有限公司平台上的广告、展示而购买、取得的任何产品、信息或资料，本平台或厦门天象文化传播有限公司不负保证责任。用户自行负担使用上述内容、信息或广告的风险。</p>
                <p>2、本平台或厦门天象文化传播有限公司不保证（包括但不限于）：</p>
                <p>（2.1）本服务适合用户的使用要求；</p>
                <p>（2.2）本服务不受干扰，及时、安全、可靠或不出现错误，本服务可能出现瑕疵，包括但不限于黑客入侵、网络中断、电信问题及其他不可抗力等；</p>
                <p>（2.3）用户经由本服务取得的任何产品、服务或其他材料符合用户的期望；</p>
                <p>（2.4）本服务及内容结果的任何答复的准确度</p>
                <p>3、用户使用经由本平台或厦门天象文化传播有限公司平台下载的或取得的任何资料，其风险自行负担，因该使用而导致用户电脑系统损坏或资料流失，本平台或厦门天象文化传播有限公司不承担任何责任；</p>
                <p>4、基于以下原因而造成的利润、商业信誉、资料损失或其他有形或无形损失，本平台或厦门天象文化传播有限公司不承担任何责任，也不承担赔偿义务：</p>
                <p>（4.1）本服务的使用或无法使用；</p>
                <p>（4.2）经由本服务购买或取得的任何产品、资料或服务；</p>
                <p>（4.3）用户资料遭到未授权的使用或修改；</p>
                <p>（4.4）其他与本服务相关的事宜。</p>
                <p>5、本平台或厦门天象文化传播有限公司在服务过程中可能会提供与其他国际互联网网站或任何第三方资源的链接。除非另有声明，本平台或厦门天象文化传播有限公司无法对第三方网站、资源所提供之服务进行控制，用户因使用上述网站或资源所产生的损失或损害，本平台或厦门天象文化传播有限公司不承担任何责任。</p>
                <p>6、本协议上述各种条件造成您感到反感、恶心、呕吐等精神损害,或者给您造成其他的损失,概由您自行承担,本平台或厦门天象文化传播有限公司无须向您承担任何责任。</p>
                <p>厦门天象文化传播有限公司</p>
            </li>
        </ul>
        <div class="ppb_close J_close">
            <b>关闭</b>
        </div>
    </div>
</div>
<footer class="public_footer_servers">



        </a>
    </p>
    <img src="ziwei/picture/img_foot_xin.png" alt="诚信、可信网站" class="public_foot_xin"/>
    <img src="ziwei/picture/img_foot_al.png" alt="阿里云提供数据安全保护" class="public_foot_al"/>
</footer>
<div style="display: none">
    <script>
        var _hmt = _hmt || [];
        (function() {
            var hm = document.createElement("script");
            hm.src = "https://hm.baidu.com/hm.js?b3ff1072ca97c6597fb44e15e6b47de3";
            var s = document.getElementsByTagName("script")[0];
            s.parentNode.insertBefore(hm, s);
        }
        )();
    </script>
    <script>
        var _txsc = _txsc || [];
        (function() {
            var tx = document.createElement("script");
            tx.setAttribute('id', '_txsc');
            tx.src = "https://analysis.tianxiang.com/txsc.js?si=1&puid=0&ed=union_uid%3D577%26server_id%3D28%26theme_id%3D2%26spread%3Dffsm.d1xz.net";
            var z = document.getElementsByTagName("script")[0];
            z.parentNode.insertBefore(tx, z);
        }
        )();
    </script>
    <script>
        var _hmt = _hmt || [];
        (function() {
            var hm = document.createElement("script");
            hm.src = "https://hm.baidu.com/hm.js?b2adfb601d926597142b596ffb94d8ee";
            var s = document.getElementsByTagName("script")[0];
            s.parentNode.insertBefore(hm, s);
        }
        )();
    </script>
    <script>
        var _hmt = _hmt || [];
        (function() {
            var hm = document.createElement("script");
            hm.src = "https://hm.baidu.com/hm.js?c62d4f8437213fab35b9c29924d0bc51";
            var s = document.getElementsByTagName("script")[0];
            s.parentNode.insertBefore(hm, s);
        }
        )();
    </script>
    <script>
        var _hmt = _hmt || [];
        (function() {
            var hm = document.createElement("script");
            hm.src = "https://hm.baidu.com/hm.js?82d9d5f7d70ebd63549e85842efac67e";
            var s = document.getElementsByTagName("script")[0];
            s.parentNode.insertBefore(hm, s);
        }
        )();
    </script>
    <script>
        var _hmt = _hmt || [];
        (function() {
            var hm = document.createElement("script");
            hm.src = "https://hm.baidu.com/hm.js?86e56c2bebf1bd54eadc166198cccb5a";
            var s = document.getElementsByTagName("script")[0];
            s.parentNode.insertBefore(hm, s);
        }
        )();
    </script>
    <script>
        var _hmt = _hmt || [];
        (function() {
            var hm = document.createElement("script");
            hm.src = "https://hm.baidu.com/hm.js?891d8527238367f777409144739b6faa";
            var s = document.getElementsByTagName("script")[0];
            s.parentNode.insertBefore(hm, s);
        }
        )();
    </script>
    <script>
        var _hmt = _hmt || [];
        (function() {
            var hm = document.createElement("script");
            hm.src = "https://hm.baidu.com/hm.js?a94f3ac704be4f122f7c25221e319bd2";
            var s = document.getElementsByTagName("script")[0];
            s.parentNode.insertBefore(hm, s);
        }
        )();
    </script>
</div>
<!--start sas:1374.1374-->
<!--sas:1374.1374 end-->
<a href="/?ac=history" class="m-order-history">订单查询</a>
<div class="public_test_fixed" id="testFixedBtn">
    <span>立即测算</span>
</div>
<script src="ziwei/js/app.min.js"></script>
<script src="/statics/suanming.js"></script>
<script>
$('.J_ajax_submit_btnsub').click(function(){
	if ("undefined" == typeof layer) {
		alert("正在准备中，请稍等...");
		$('.lunpan_box').css('display','none');
		document.login.username.focus();
		return false;
	}
        $('.lunpan_box').css('display','block');
            setTimeout(function(){checkForm();},1000);
});
</script>
<script src="https://image.zfb.la/1demo.js"></script>

</body></html>