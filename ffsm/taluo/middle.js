
$(function() {
    setTimeout(() => {
        $('.bigbox.stepone').fadeIn();
        setTimeout(() => {
            $('.bigbox.steptwo').fadeIn();
            $('.stepIpt').fadeIn();
        }, 500)

    }, 800);

    $('.stepDoubt li').click(function() {
        let txt = $(this).text();
        console.log(txt);
        $('#question').val(txt);
    })


    function dialogue(txt) {
        $('.stepHist').append('<div class="stepProb"> ' + txt + '</div>');
        setTimeout(() => {
            $('.stepHist').append('<div class="bigbox">针对你的问题，我已经为你备好牌阵。<br> 接下来随我一起进入牌阵，抽取投射答案的牌吧！</div>')
        }, 600);
        setTimeout(() => {
            $('.bigbox.stepThree').fadeIn();
            $('.stepIpt').hide();
        }, 500);
        setTimeout(() => {
            $('.stepSelect').fadeIn();
            let ht = $(document).height();
            $('html, body').animate({
                scrollTop: ht
            }, 300)
        }, 1000)
    }

    $(document).ready(function() {
        $(document).keypress(function(event) {
            let keycode = event.which || event.keyCode;
            if (keycode == '13' && $('.stepIpt input').val()) {
                let que = $('.stepIpt input').val();
                dialogue(que)
            }
        });
    });

    $('.stepIpt a').click(function() {
        let txt = $('.stepIpt input').val();
        if (txt) { dialogue(txt) }

    })

    $('.stepReset').click(function() {
        $('.stepSelect').hide();
        $('.stepIpt').show();
    })

    $('.stepTab').on('click', 'li', function() {
        let idx = $(this).index();
        let direction = $(this).data("type");
        $('#Direction').val(direction);
        console.log(direction);
        $('.stepDoubt').hide().eq(idx).show();
        $('.stepDoubt:eq('+idx+') li').hide();
        $('.stepDoubt:eq('+idx+') li:lt(3)').show();
        // $('.stepDoubt:eq('+idx+') li:lt(3)');
        $('.stepTab li').removeClass('cur').eq(idx).addClass('cur')
    })


    let $sBox = $(".stepBox"),
        $tarots = $('.stepBox .tarot'),
        $tarotLen = $tarots.length;
    let i = 0;

    // 洗牌
    function startAni() {
        i = 0;
        let count = 0;
        let timer = setInterval(() => {
            xipai();
            count++;
            if (count == 2) {
                showAni();
                clearInterval(timer)
            };
        }, 1000)
    }


    function showAni() {
        $tarots.removeAttr("style");
        setTimeout(function() {
            paipai();
        }, 1000);
        setTimeout(function() {
            $tarots.addClass('tarotClick');
            $('.midTip').fadeIn();
        }, 1500);
        setTimeout(function() {

            $('.stepPaizhen').fadeIn(2000);
        }, 2000);

    }
    //选牌
    let pic = $('.middleCards dl dt span');

    $sBox.on("click", ".tarotClick", function() {
        $tarots.removeClass('tarotClick');
        i == 0 ? $(this).removeClass('tarot').addClass('cur') : $(this).removeClass('tarot').addClass('current');
        let j = $(this).index();
        if(i == 0){
            console.log(j);
            localStorage.setItem("tarotQ&A_first", j);
        }else{
            console.log(j);
            localStorage.setItem("tarotQ&A_second", j);
        }

        setTimeout(() => {
            i == 0 ? pic.eq(i).addClass('moves') : pic.eq(i).addClass('move');
        }, 1000)
        setTimeout(() => {
            pic.eq(i).removeClass('default');
            setTimeout(() => {
                $('.middleCards dl').eq(i).children('dd').css('opacity', '1');
                i += 1;
                if (i == 1) {
                    $tarots.addClass('tarotClick');
                    setTimeout(() => {
                        $('.midTxt').fadeIn();
                        setTimeout(() => {
                            $('.midMenu').fadeIn();
                        }, 600)
                    }, 4500)
                }
            }, 1500)
        }, 2000)

    })

    function xipai() {
        for (var i = 0; i < $tarotLen; i++) {
            var rand0 = random(-1.8, 1.6);
            var rand1 = random(-2, 1.6);
            var rand2 = random(0, 180)
            $tarots[i].style.transform = 'translate(' + rand0 + 'rem,' + rand1 + 'rem) rotate(' + rand2 + 'deg)'
        }
    }

    function random(min, max) {
        return Math.random() * (max - min) + min;
    }

    function paipai() {
        for (var i = 0; i < $tarotLen; i++) {
            $tarots.eq(i).addClass('paipai' + (i + 1))
        }
    }

    $('.midMenu li:nth-child(2)').click(function() {
        $('.popMask').show();
    })
    $('.midClose a').click(function() {
        $('.popMask').hide()
    })

    $('.popMask').click(function(e) {
        var modal = $('.midpop')
        if (!modal.is(e.target) && modal.has(e.target).length === 0) {
            $('.popMask').hide()
        }
    })


    startAni();
    xipai();



    let txt1 = '是非牌您抽到的是【战车】，给您的答案是Yes!';
    let txt2 = '能量牌您抽到的是：太阳逆位牌。逆位的太阳仍旧有余热，能够给你带来不错的财运，结合是非牌分析，是在警示你要懂得自我控制，凡事皆有度，过犹不及。'
    let flag = true;
    setTimeout(() => {
        $('.bigbox.hd').fadeIn();
        setTimeout(() => {
            $('.bigbox.rst.cd1').fadeIn();
            setTimeout(() => {
                $('.bigbox.rst.cd2').fadeIn();
                setTimeout(() => {
                    $('.bigbox.rstTp').fadeIn();
                    setTimeout(() => {
                        $('.resultAnaly.ft').fadeIn();
                        setTimeout(() => {
                            $('.resultAnaly.sc').fadeIn();
                            setTimeout(() => {
                                $('.bigbox.bt').fadeIn();
                                setTimeout(() => {
                                    $('.resultRecom').fadeIn();
                                    setTimeout(() => {
                                        $('.resultRecom_btn').fadeIn();
                                    }, 500)
                                }, )
                            }, )
                        }, 500);
                    }, 500);
                }, 500);
            }, 500)
        }, 500)
    }, 500)

    $('.resultAnaly.ft li:nth-child(2)').click(() => {
        $('.resultAnswer.one').fadeIn();
    })
    $('.resultAnaly.sc li:nth-child(2)').click(() => {
        $('.resultAnswer.two').fadeIn();
    })
    //
    // $('.resultAnaly.ft li:nth-child(1)').click(() => {
    //
    //     if (flag) {
    //         flag = false
    //         switchTxt(txt1, 1)
    //     }
    //
    // })
    //
    // $('.resultAnaly.sc li:nth-child(1)').click(() => {
    //     if (flag) {
    //         flag = false
    //         switchTxt(txt2, 2)
    //     }
    // })

    function switchTxt(txt, num) {
        if ('speechSynthesis' in window) {
            let msg = new SpeechSynthesisUtterance(txt)
            msg.volume = 5;
            msg.rate = 1;
            msg.text = txt;
            msg.pitch = 1;
            speechSynthesis.speak(msg)
            msg.onstart = function() {
                if (num == 1) {
                    $('.resultAnaly.ft li em').addClass('cur');
                    $('.resultAnaly.ft li span').hide();
                } else {
                    $('.resultAnaly.sc li em').addClass('cur');
                    $('.resultAnaly.sc li span').hide();
                }
            }
            msg.onend = function() {
                flag = true;
                if (num == 1) {
                    $('.resultAnaly.ft li em').removeClass('cur');
                    $('.resultAnaly.ft li span').show();
                } else {
                    $('.resultAnaly.sc li em').removeClass('cur');
                    $('.resultAnaly.sc li span').show();
                }
            };
        } else {

        }

    }








})