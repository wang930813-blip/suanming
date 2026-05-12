
var verify_flag = false; //验证与否状态
var move_flag = true; //倒计时开关
var date_flag = false;
    
var problem_type = $('#problem_type').val();
$("#birthday_my").on('click',function(){
    date_flag = true;
});

$("#birthday_my2").on('click',function(){
    date_flag = true;
});


if(problem_type == 'problem4') {
	//企业命名验证表单中必填内容  和 内容处理
	function CheckInput(){
	    var birthday = $('#iYear').val();
	    var isNumData = verifyElementData('NumData', 'NumData','');
	    // alert(consultType);
	    if(!isNumData) {
	        layer.open({
	            content: '请填写姓名',
	            skin: 'msg',
	            time: 2
	        });
	        $('#NumData').focus();
	    } else if(!date_flag && birthday == '1985-1-1-00') {
	        layer.open({
	            content: '请选择生辰',
	            skin: 'msg',
	            time: 2
	        });
	        $('html,body').animate({scrollTop: $('#birthday_my').offset().top-1000}, 1000);
	        return false;
	    } else if($('#company_direction').val() == '' || $('#company_direction').val() == '-1') {
	        layer.open({
	            content:'公司资料与起名需求部分-企业起名类型还没选择哦！',
	            skin:'msg',
	            time:2
	        });
	        $('#company_direction').focus();
	        return false;
	    } else if($('#homeplace').val() == '' || $('#homeplace').val() == 'undefined') {
	        layer.open({
	            content:'公司资料与起名需求部分-公司所在地还没有填写哦！',
	            skin:'msg',
	            time:2
	        });
	        $('#homeplace').focus();
	        return false;
	    } else if($('#company_fullname').val() == '' || $('#company_fullname').val() == 'undefined') {
	        layer.open({
	            content:'公司资料与起名需求部分-起名后公司全称还没有填写哦！',
	            skin:'msg',
	            time:2
	        });
	    	$('#company_fullname').focus();
	        return false;
	    } else if($('#company_way').val() == '' || $('#company_way').val() == 'undefined') {
	        layer.open({
	            content:'公司资料与起名需求部分-行业类别还没有填写哦！',
	            skin:'msg',
	            time:2
	        });
	    	$('#company_way').focus();
	        return false;
	    } else if($('#company_nature').val() == '' || $('#company_nature').val() == '-1') {
	        layer.open({
	            content:'请选择公司性质！',
	            skin:'msg',
	            time:2
	        });
	
	    	$('#company_nature').focus();
	        return false;
	    } else if($('#company_area').val() == '' || $('#company_area').val() == '-1') {
	        layer.open({
	            content:'请选择公司经营区域！',
	            skin:'msg',
	            time:2
	        });
	    	$('#company_area').focus();
	        return false;
	    } else if($('#company_wish_name').val() == '' || $('#company_wish_name').val() == '-1') {
	        layer.open({
	            content:'请选择公司取名字数要求！',
	            skin:'msg',
	            time:2
	        });
	        $('html,body').animate({scrollTop: $('#wish_name_position').offset().top-100}, 100);
	        return false;
	    } else {
	        return true
	    }
	
	
	    // //验证邮箱
	    // var isiTel = verifyElementData('tel', 'iMobile');
	    // var isiEmail = verifyElementData('iEmail', 'iEmail'
	}
} else if(problem_type == 'problem3') {
	//宝宝起名验证表单中必填内容  和 内容处理
	function CheckInput() {
	    var birthday = $('#iYear').val();
	    if($('#family_name').val() == '' || $('#family_name').val() == 'undefined') {
	        layer.open({
	            content:'请填写宝宝姓氏！',
	            skin:'msg',
	            time:2
	        });
	        $('#family_name').focus();
	        return false;
	    } else if(!date_flag && birthday == '1985-1-1-00') {
	        layer.open({
	            content: '请选择宝宝生辰',
	            skin: 'msg',
	            time: 2
	        });
	        $('html,body').animate({scrollTop: $('#birthday_my').offset().top-1000}, 1000);
	        return false;
	    } else if($('#infant_name').val() == '' || $('#infant_name').val() == 'undefined') {
	        layer.open({
	            content: '请填写宝宝乳名',
	            skin: 'msg',
	            time: 2
	        });
	        $('#infant_name').focus();
	        return false;
	    } else if($('#father_name').val() == '' || $('#father_name').val() == 'undefined') {
	
	        layer.open({
	            content: '家族资料部分-父亲姓名还没有填写哦！',
	            skin: 'msg',
	            time: 2
	        });
	        $('#father_name').focus();
	        return false;
	    } else if($('#mother_name').val() == '' || $('#mother_name').val() == 'undefined') {
	        layer.open({
	            content:'家族资料部分-母亲姓名还没有填写哦！',
	            skin:'msg',
	            time:2
	        });
	        $('#mother_name').focus();
	        return false;
	    } else if($('#family_rank').val() == '' || $('#family_rank').val() == 'undefined') {
	        layer.open({
	            content:'家族资料部分-兄弟姐妹排行没有填写哦！',
	            skin:'msg',
	            time:2
	        });
	        $('#family_rank').focus();
	        return false;
	    } else if($('#wish_name').val() == '' || $('#wish_name').val() == 'undefined') {
	        layer.open({
	            content:'请选择期望单名或双名！',
	            skin:'msg',
	            time:2
	        });
	        $('html,body').animate({scrollTop: $('#wish_name_position').offset().top-100}, 1000);
	        return false;
	    } else {
	        return true
	    }
	
	
	    // //验证邮箱
	    // var isiTel = verifyElementData('tel', 'iMobile');
	    // var isiEmail = verifyElementData('iEmail', 'iEmail'
	}
} else if(problem_type == 'problem2') {
	//个人命名验证表单中必填内容  和 内容处理
	function CheckInput() {
	    var birthday = $('#iYear').val();
	    var isNumData = verifyElementData('NumData', 'NumData','');
	    // alert(consultType);
	    if(!isNumData) {
	        layer.open({
	            content: '请填写姓名',
	            skin: 'msg',
	            time: 2
	        });
	        $('#NumData').focus();
	    } else if(!date_flag && birthday == '1985-1-1-00') {
	        layer.open({
	            content: '请选择生辰',
	            skin: 'msg',
	            time: 2
	        });
	        $('html,body').animate({scrollTop: $('#birthday_my').offset().top-1000}, 1000);
	        return false;
	    } else if($('#family_name').val() == '' || $('#family_name').val() == 'undefined') {
	        layer.open({
	            content:'请填写姓氏！',
	            skin:'msg',
	            time:2
	        });
	        $('#family_name').focus();
	        return false;
	    } else if($('#father_name').val() == '' || $('#father_name').val() == 'undefined') {
	        layer.open({
	            content: '家族资料部分-父亲姓名还没有填写哦！',
	            skin: 'msg',
	            time: 2
	        });
	        $('#father_name').focus();
	        return false;
	    } else if($('#mother_name').val() == '' || $('#mother_name').val() == 'undefined') {
	        layer.open({
	            content:'家族资料部分-母亲姓名还没有填写哦！',
	            skin:'msg',
	            time:2
	        });
	        $('#mother_name').focus();
	        return false;
	    } else if($('#family_rank').val() == '' || $('#family_rank').val() == 'undefined') {
	        layer.open({
	            content:'家族资料部分-兄弟姐妹排行没有填写哦！',
	            skin:'msg',
	            time:2
	        });
	        $('#family_rank').focus();
	        return false;
	    } else if($('#change_family_name').val() == '' || $('#change_family_name').val() == 'undefined') {
	        layer.open({
	            content:'改名后的姓未填写！',
	            skin:'msg',
	            time:2
	        });
	        $('#change_family_name').focus();
	        return false;
	    } else if($('#wish_name').val() == '' || $('#wish_name').val() == 'undefined') {
	        layer.open({
	            content:'请选择期望单名或双名！',
	            skin:'msg',
	            time:2
	        });
	        $('html,body').animate({scrollTop: $('#wish_name_position').offset().top-100}, 100);
	        return false;
	    } else {
	        return true
	    }
	
	    // var brother_sister_name = $('#brother_sister').val();
	    // $('#brother_sister_name').val(brother_sister_name);
	    // //验证邮箱
	    // var isiTel = verifyElementData('tel', 'iMobile');
	    // var isiEmail = verifyElementData('iEmail', 'iEmail'
	}
} else if(problem_type == 'problem1') {
	//通用老师验证问题类型和问题内容
	function CheckInput(){
	    var qs_question = $("#qs_question").val() ;
	    var consultType = $("#consultType").val();
	    var birthday = $('#iYear').val();
	    var name = $('#NumData').val();
	    // alert(consultType);
	    if(name == '' || name =='undefined') {
	        layer.open({
	            content: '请填写姓名',
	            skin: 'msg',
	            time: 2
	        });
	        $('#NumData').focus();
	        // $('html,body').animate({scrollTop: $('#birthday_my').offset().top-1000}, 1000);
	        return false;
	    } else if(!date_flag && birthday == '1985-1-1-00') {
	        layer.open({
	            content: '请选择生辰',
	            skin: 'msg',
	            time: 2
	        });
	        console.log(birthday);
	        $('html,body').animate({scrollTop: $('#birthday_my').offset().top-1000}, 100);
	        return false;
	    } else if(consultType == 0) {
	        layer.open({
	            content: '请填写咨询问题',
	            skin: 'msg',
	            time: 2
	        });
	        $('html,body').animate({scrollTop: $('#zixun_type').offset().top-1000}, 100);
	        return false;
	    } else if(qs_question.length < 7) {
	        //  flag = true;
	        layer.open({
	            content: '咨询内容为空或过于简单',
	            skin: 'msg',
	            time: 2
	        });
	        $('#qs_question').focus();
	        return false;
	    } else {
	        // $('#question_input').val(qs_question);
	        return true;
	    }
	}
}