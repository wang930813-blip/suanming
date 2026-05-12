$(function() {
    $.ajax({
        url: "/mobile/article/IsShowXzh",
        dataType: 'json',
        type: 'GET',
        data: {id: 4},
        success: function (data) {
            if (data.ts_type == 2) {
                $('#xzhblock').html('<div class="botblock"><p class="pbotlogo"><img src="https://image.1212.com/static/mobile/skin_img/xzh_logo.png" alt="熊掌号"></p><p class="pbtn"><a href="https://author.baidu.com/home/1550411686370892">查看熊掌号</a></p></div>');
            }
        }
    });
})