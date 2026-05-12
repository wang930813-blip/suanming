var _language = localStorage.getItem('_language') || null;
jQuery(function () {
    $("#search_btn").on('click', function () {
        let key = $('#q').val();
        if (!key) {
            return;
        }
        $.post("/?ac=search", { k: key }, function (res) {
            let data = JSON.parse(res)
            if (data.error_code === 1) {
                setTimeout(() => {
                    window.location.href = data.data.url;
                }, 500);
            }
        });
    });

    $('.lang').on('mouseenter', '.switching', function () {
        $('.lang .choose').show()
    }).mouseleave(function () {
        $('.lang .choose').hide()
    });
    $('.switching_m').click(function () {
        $('.choose').toggleClass('block')
    });

    $('.choose').on('click', '.item', function () {
        let lang = $(this).attr('data-lang');
        document.cookie = "_language=" + lang;
        setTimeout(() => {
            location.reload();
            //window.location.href = "/?lang=" + lang;
        }, 300);
    });


});