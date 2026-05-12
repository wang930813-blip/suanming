$(function(){
    //获取code
    let urlParams = new URLSearchParams(window.location.search);
    var code = urlParams.get('code');
    var oid = urlParams.get('oid');
    //微信环境下获取code
    if(isWechat() || isWorkWechat()){
        if(!code){
            //回调的url--当前url--跳转以获取code
            window.location="https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx46b16be6a61d9c9a&redirect_uri=" + encodeURIComponent(window.location.href) + "&response_type=code&scope=snsapi_base#wechat_redirect";
        }
    }
    var channel = urlParams.get('channel');
    if(channel.indexOf("bd_") !== -1){
        $('.channel_zfb').hide();
    }

    // //挽留一下啦-已
    // $.ajax({
                
    //             type: 'post',
    //             async: false,
    //             data: {'oid':oid},
    //             success: function (res) {
    //                 if (res.code === 200) {
    //                     $('.mask_bg').css({'display':'block','opacity':'0.6'});
    //                     //若支付了返回当前页面时执行
    //                     $('.pay_oid_box').show();
    //                     //关闭
    //                     $('.pay_oid_box_close').click(function(){
    //                         $('.mask_bg').css({'display':'none','opacity':'0'});
    //                         $('.pay_oid_box').hide();
    //                     })
    //                     //离开-返回上一页
    //                     $('.out').click(function(){
    //                         history.go(-1);
    //                     })
    //                     //去领取
    //                     $('.lingqu').click(function(){
    //                         $.ajax({
    //                             url: 'https://www.zztw1.com/api/goWechat2',
    //                             type: 'post',
    //                             async: false,
    //                             data: {'oid':oid},
    //                             success: function (res) {
    //                                 if (res.code === 200) {
    //                                     window.location=res.url;
    //                                 }
    //                             }
    //                         });
    //                     })
    //                 }
    //             }
    //         });

    // var w_height = $(window).height();
    // if(w_height < 500){
    //     $('.right_text .top_name').css('font-size','16px');
    //     $('.right_text .top_name').css('margin-bottom','5px');
    //     $('.right_text p').css('font-size','12px');
    //     $('.right_text p').css('line-height','18px');
    // }else if(500 <= w_height && w_height < 600){
    //     $('.right_text .top_name').css('font-size','16px');
    //     $('.right_text p').css('font-size','12px');
    //     $('.right_text p').css('line-height','24px');
    // }
    // //默认值
    // $('.tabtop img').hide();
    // $('.center').hide();
    // $('.chart').width(0);
    // $('.measure').hide();
    // $('.payBox').hide();

    // //获取排盘数据
    // var baipanJson = localStorage.getItem('baipan');
    // var data = JSON.parse(baipanJson);
    // if(!data){
    //     $.ajax({
            
    //         type: 'post',
    //         async: false,
    //         data: {'oid':oid,'type':'bazi'},
    //         success: function (res) {
    //             if (res.code === 200) {
    //                 startData(res.data);

    //                 if(res.data.hb === 'true'){
    //                     if(!data || channel.indexOf("ks") !== -1){
    //                         var thisMoney = res.data.money-3>0?res.data.money-3:0.01
    //                     }else{
    //                         var thisMoney = res.data.money-10>0?res.data.money-10:0.01
    //                     }
    //                     setTimeout(function(){
    //                         //修改价格
    //                         var obj2={
    //                             el:$(".money"),
    //                             max:res.data.money,
    //                             end:thisMoney
    //                         }
    //                         down(obj2)
    //                     },12100);
    //                 }
    //             }
    //         }
    //     });
    // }else{
    //     startData(data);
    // }

    // //图片显示
    // setTimeout(function(){
    //     $('.center').show(1000);
    // },8600);
    // setTimeout(function(){
    //     $('.chart').animate({ width: '100%' }, 2000);
    // },9500);

    // //进度条
    // $('.bar').animate({ width: '100%' }, 2900);
    // setTimeout(function(){
    //     $('.bar').animate({ width: '0%' }, 50);
    //     $('.progress_bar p').html('2.正在安命宫');
    //     $('.bar').animate({ width: '100%' }, 2900);
    // },2900);
    // setTimeout(function(){
    //     $('.bar').animate({ width: '0%' }, 50);
    //     $('.progress_bar p').html('3.正在定紫微星');
    //     $('.bar').animate({ width: '100%' }, 2900);
    // },5800);
    // setTimeout(function(){
    //     $('.bar').animate({ width: '0%' }, 50);
    //     $('.progress_bar p').html('4.正在分析命局,生成报告');
    //     $('.bar').animate({ width: '100%' }, 2900);
    // },8700);
    // setTimeout(function(){
    //     $('.progress_bar').hide();
    //     $('.measure').show();
    // },11800);

    // //领取按钮
    // $('.measure').click(function(){
    //     $('.pay_mask').show();
    //     $('.payBox').show();
    // })
    // $('.pay_mask').click(function(){
    //     $('.pay_mask').hide();
    //     $('.payBox').hide();
    // })

    // //倒计时
    // var m=14;
    // var s=59;
    // $('.span4').html(m);
    // $('.span5').html(s);
    // setInterval(function(){
    //     if(s<10){
    //         $('.span5').html('0'+s);
    //     }else{
    //         $('.span5').html(s);
    //     }
    //     s--;
    //     if(s<0){
    //         s=59;
    //         m--;
    //         if(m < 0){
    //             s=0;
    //             m=0;
    //         }
    //         $('.span5').html(s);
    //         $('.span4').html(m);
    //     }
    // },1000)

    // var type = 1;

    // //支付方式选择
    // $('.wx_select1').click(function(){
    //     $('.altPay').removeClass('wx_selected');
    //     $('.wxPay').addClass('wx_selected');
    //     type = 1;
    // })

    // $('.wx_select2').click(function(){
    //     $('.wxPay').removeClass('wx_selected');
    //     $('.altPay').addClass('wx_selected');
    //     type = 2;
    // })

    //提交
//     $('.pay_btn').click(function(){
//         $('.mask_bg').css({'display':'block','opacity':'0'});
//         setTimeout(function(){
//             $('.mask_bg').css('display','none');
//         }, 1000);
//         $.ajax({
//             url: 'https://www.zztw1.com/api/wechatPay',
//             headers:{
//                 Referer:"www.zztw1.com"
//             },
//             type: 'post',
//             async: false,
//             data: {'oid':oid,'pay_type':type,'code':code},
//             success: function (res) {
//                 if (res.code === 200) {
//                     if(type === 1){
//                         if(res.type === 'phone'){
//                             window.location=res.url;
//                         }if(res.type === 'jsapi'){
//                             function onBridgeReady() {
//                                 WeixinJSBridge.invoke('getBrandWCPayRequest', res.data,
//                                     function(payRes) {
//                                         if (payRes.err_msg == "get_brand_wcpay_request:ok") {
//                                             // 使用以上方式判断前端返回,微信团队郑重提示：
//                                             window.location=res.url;
//                                         }
//                                     });
//                             }
//                             if (typeof WeixinJSBridge == "undefined") {
//                                 if (document.addEventListener) {
//                                     document.addEventListener('WeixinJSBridgeReady', onBridgeReady, false);
//                                 } else if (document.attachEvent) {
//                                     document.attachEvent('WeixinJSBridgeReady', onBridgeReady);
//                                     document.attachEvent('onWeixinJSBridgeReady', onBridgeReady);
//                                 }
//                             } else {
//                                 onBridgeReady();
//                             }
//                         }else{
//                             window.location='./wechat_pay.html?title='+res.data.title+'&money='+res.data.money+'&oid='+res.data.oid+'&code_url='+res.data.code_url;
//                         }
//                     }else if(type === 2){
//                         var dom = $(res.data.body);
//                         $('body').append(dom);
//                     }
//                 }
//             }
//         });
//     })

//     /**
//      * 数据填充
//      * @param data
//      */
//     function startData(data){
//         var sizhu = data.baipan.sizhu.split('-');
//         var arr = [];
//         arr.push('年柱','月柱','日柱','时柱',sizhu[0],sizhu[1],sizhu[2],sizhu[3],data.baipan.wh[0]+data.baipan.wh[1],data.baipan.wh[2]+data.baipan.wh[3],data.baipan.wh[4]+data.baipan.wh[5],data.baipan.wh[6]+data.baipan.wh[7],data.baipan.zanggan1,data.baipan.zanggan2,data.baipan.zanggan3,data.baipan.zanggan4,data.baipan.shishen1,data.baipan.shishen2,data.baipan.shishen3,data.baipan.shishen4,data.baipan.changsheng[1],data.baipan.changsheng[2],data.baipan.changsheng[3],data.baipan.changsheng[4]);

//         //数据填充
//         setTimeout(function(){
//             $(".title").html(data.request.username);
//         },500);
//         setTimeout(function(){
//             $('.tabtop img').show(1000);
//             $(".date").html(data.request.date);
//         },1000);

//         $(".tab div").each(function(index, elem){
//             var time = 1500 + index * 300;
//             setTimeout(function(){
//                 $(".tab div").eq(index).html(arr[index]);
//             },time);
//         });
//         var dateArr = data.request.date.split('-');
//         $('.top_name').html(data.request.username+'的生辰详批');
//         $('.pay_date').html(dateArr[0]);
//         $('.ming').html(data.baipan.mingzhum);
//         $('.shen').html(data.baipan.shenzhum);
//         $('.money').html(data.money);
//     }

// });



/**
 * 判断是否是微信环境
 * @returns {boolean}
 */
// function isWechat() {
//     //获取user-agaent标识头
//     var ua = window.navigator.userAgent.toLowerCase();
//     //判断ua和微信浏览器的标识头是否匹配
//     if (ua.match(/micromessenger/i) == 'micromessenger') {
//         return true;
//     } else {
//         return false;
//     }
// }

// /**
//  * 判断是否是企业微信
//  * @returns {boolean}
//  */
// function isWorkWechat() {
//     //获取user-agaent标识头
//     var ua = window.navigator.userAgent.toLowerCase();
//     //判断ua和微信浏览器的标识头是否匹配
//     if ((ua.match(/micromessenger/i) == 'micromessenger') && (ua.match(/wxwork/i) == 'wxwork')) {
//         return true;
//     } else {
//         return false;
//     }
// }

/**
 * 数字跳动
 * @param obj
 */
function down(obj){
    var item=obj.el;
    var num=obj.max;
    var min=obj.end;
    var time1=setInterval(function(){
        num--;
        if(num<min){
            num=min;
            clearInterval(time1)
        }
        item.text(num.toFixed(2))
    },100)
}

