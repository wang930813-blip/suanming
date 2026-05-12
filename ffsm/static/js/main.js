$(function(){
    var url = location.href;
    var urlArr = url.split('?')
    $(window).scroll(function(){
        if ($(window).scrollTop()>700){
            $(".bottom").fadeIn(100);
            $(".backtop").fadeIn(100);
        }else{
            $(".bottom").fadeOut(100);
            $(".backtop").fadeOut(100);
        }
    });

    $('.backtop').click(function(){
        $('html,body').animate({
            scrollTop:0
        },1000);
    })

    $('.share').click(function(){
        $('#qt_share').show();
    })

    $('#qt_share').click(function(){
        $('#qt_share').hide();
    })

    $('.service').click(function(){
        window.location="/history?"+urlArr[1];
    })

    $('.complaint').click(function(){
        window.location="/complaint?"+urlArr[1];
    })

    function isMobile() {
        // 判断h5还是pc true就是h5
        let client = /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test( navigator.userAgent );
        if (client) {
            return true;
        }
        return false;
    }

});
