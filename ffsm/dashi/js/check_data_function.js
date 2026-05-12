
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
	function data_check(){
	    var birthday = $('#iYear').val();
	    var name = $('#NumData').val();
	    // alert(consultType);
	    if(name == '' || name =='undefined') {
	        return false;
	    } else if(!date_flag && birthday == '1985-1-1-00') {
	        return false;
	    } else if($('#company_direction').val() == '' || $('#company_direction').val() == '-1') {
	        return false;
	    } else if($('#homeplace').val() == '' || $('#homeplace').val() == 'undefined') {
	        return false;
	    } else if($('#company_fullname').val() == '' || $('#company_fullname').val() == 'undefined') {
	        return false;
	    } else if($('#company_way').val() == '' || $('#company_way').val() == 'undefined') {
	        return false;
	    } else if($('#company_nature').val() == '' || $('#company_nature').val() == '-1') {
	        return false;
	    } else if($('#company_area').val() == '' || $('#company_area').val() == '-1') {
	        return false;
	    } else if($('#company_wish_name').val() == '' || $('#company_wish_name').val() == '-1') {
	        return false;
	    } else {
	        return true
	    }
	}
} else if(problem_type == 'problem3') {
	//宝宝起名验证表单中必填内容  和 内容处理
	function data_check() {
	    var birthday = $('#iYear').val();
	    if($('#family_name').val() == '' || $('#family_name').val() == 'undefined') {
	        return false;
	    } else if(!date_flag && birthday == '1985-1-1-00') {
	        return false;
	    } else if($('#infant_name').val() == '' || $('#infant_name').val() == 'undefined') {
	        return false;
	    } else if($('#father_name').val() == '' || $('#father_name').val() == 'undefined') {
	        return false;
	    } else if($('#mother_name').val() == '' || $('#mother_name').val() == 'undefined') {
	        return false;
	    } else if($('#family_rank').val() == '' || $('#family_rank').val() == 'undefined') {
	        return false;
	    } else if($('#wish_name').val() == '' || $('#wish_name').val() == 'undefined') {
	        return false;
	    } else {
	        return true
	    }
	}
} else if(problem_type == 'problem2') {
	//个人命名验证表单中必填内容  和 内容处理
	function data_check() {
	    var birthday = $('#iYear').val();
	    var name = $('#NumData').val();
	    // alert(consultType);
	    if(name == '' || name =='undefined') {
	        return false;
	    } else if(!date_flag && birthday == '1985-1-1-00') {
	        return false;
	    } else if($('#family_name').val() == '' || $('#family_name').val() == 'undefined') {
	        return false;
	    } else if($('#father_name').val() == '' || $('#father_name').val() == 'undefined') {
	        return false;
	    } else if($('#mother_name').val() == '' || $('#mother_name').val() == 'undefined') {
	        return false;
	    } else if($('#family_rank').val() == '' || $('#family_rank').val() == 'undefined') {
	        return false;
	    } else if($('#change_family_name').val() == '' || $('#change_family_name').val() == 'undefined') {
	        return false;
	    } else if($('#wish_name').val() == '' || $('#wish_name').val() == 'undefined') {
	        return false;
	    } else {
	        return true
	    }
	}
} else if(problem_type == 'problem1') {
	//通用老师验证问题类型和问题内容
	function data_check(){
	    var qs_question = $("#qs_question").val() ;
	    var consultType = $("#consultType").val();
	    var birthday = $('#iYear').val();
	    var name = $('#NumData').val();
	    // alert(consultType);
	    if(name == '' || name =='undefined') {
	        return false;
	    } else if(!date_flag && birthday == '1985-1-1-00') {
	        return false;
	    } else if(consultType == 0) {
	        return false;
	    } else if(qs_question.length < 7) {
	        return false;
	    } else {
	        return true;
	    }
	}
}