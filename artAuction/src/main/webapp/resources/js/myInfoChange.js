
//////////////////////////////////////////////
//회원정보변경 (myInfoChange)


function checkForm(){
	var pwcheckVal1 = $("#pwcheck1").val();
	var pwcheckVal2 = $("#pwcheck2").val();
	var phoneNumVal = $("#phoneNum").val();

	if( pwcheckVal1 == "" || pwcheckVal2=="" || phoneNumVal=="" ){
		alert("입력하신 정보를 확인 해 주세요");
		return false;
	}else{
		$('form').submit();

	}
} 

$(document).ready(function(){

	$('#logo').click(function(){
		location.href = "/";
	});

	var style = {
			'color' : 'red',
			'margin-left' : '150px',
			'font-size' : '10px'
	};

	$("#pwcheck1").on("focusout",function(){

		var pwcheckVal1 = $("#pwcheck1").val();
		var pwcheckVal2 = $("#pwcheck2").val();
		var passRule =  /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{6,12}$/;//숫자와 문자 포함 형태의 6~12자리 이내의 암호 정규식

		if (pwcheckVal1 == "" ){
			$("#pwAlert1").text("비밀번호를 입력하세요").css(style);
		}else if(!passRule.test(pwcheckVal1)){
			$("#pwAlert1").text("비밀번호를 형식에 맞춰 입력해주세요").css(style);
		}else{
			$("#pwAlert1").text("");
		}

	});

	/* 비밀번호 체크 */
	$("#pwcheck2").on('focusout', function(){
		var pwcheckVal1 = $("#pwcheck1").val();
		var pwcheckVal2 = $("#pwcheck2").val();

		if(pwcheckVal1 != pwcheckVal2){
			$("#pwAlert2").text("비밀번호가 일치하지 않습니다.").css(style);
		}else{
			$("#pwAlert2").text("");
		}
	}) 


	/* 핸드폰번호 체크 */
	$("#phoneNum").on("focusout",function(){
		var phoneNumCheck = $("#phoneNum").val();
		if ( phoneNumCheck == "" ){
			$("#phoneAlert").text("핸드폰번호를 입력하세요").css(style);
		}else{
			$("#phoneAlert").text("");
		}	
	});

});




