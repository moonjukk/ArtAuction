
var checkPoint1 = 0;
var checkPoint2 = 0;
var checkPoint3 = 0;
var checkPoint4 = 0;
var checkPoint5 = 0;



function lastCheck(){

		console.log(checkPoint1);
		console.log(checkPoint2);
		console.log(checkPoint3);
		console.log(checkPoint4);
		console.log(checkPoint5);
		
		if(checkPoint1 == 0 || checkPoint2 == 0 || checkPoint3 == 0 || checkPoint4 == 0 || checkPoint5 == 0){
			alert("입력정보를 확인해주세요");
			return false;
		}else{
			$('form').submit();
		}
	}

$(function() {
	//아이디 정규식
	var emailRule = /^[A-Za-z0-9]{4,12}$/;
	function check_email(){
		var check1 = 0;
		var check2 = 0;
		if(!emailRule.test(document.form1.userid.value)){
			$('#userid').addClass('warning');
			$('#input_email1').addClass('dis_none');
			$('#input_email2').removeClass('dis_none');
			$('#check1').addClass('dis_none');
			check2 = 0;
			checkPoint1 = 0;
		}else{
			$('#userid').removeClass('warning');
			$('#input_email1').addClass('dis_none');
			$('#input_email2').addClass('dis_none');
			check2 = 1;
		}

		if(document.form1.userid.value==""){
			$('#userid').addClass('warning');
			$('#input_email1').removeClass('dis_none');
			$('#input_email2').addClass('dis_none');
			$('#check1').addClass('dis_none');
			check1 = 0;
			checkPoint1 = 0;
		}else{
			check1 = 1;
		}

		if(check1==1 && check2==1){
			$('#check1').removeClass('dis_none');
			checkPoint1 = 1;
		}
	}

	function pw_check(){
		var passRule =  /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{6,12}$/;//숫자와 문자 포함 형태의 6~12자리 이내의 암호 정규식
		if(!passRule.test(document.form1.userpw.value)){
			$('#userpw').addClass('warning');
			$('#input_pw').removeClass('dis_none');
			$('#check2').addClass('dis_none');
			checkPoint2 = 0;
		}else{
			$('#userpw').removeClass('warning');
			$('#input_pw').addClass('dis_none');
			$('#check2').removeClass('dis_none');
			checkPoint2 = 1;
		}
	}
	function pw_check2(){
		var pw1 = $('#userpw').val();
		var pw2 = $('#userpw_check').val();

		if(pw1==pw2 && pw1!=""){
			$('#userpw_check').removeClass('warning');
			$('#input_pw_check').addClass('dis_none');
			$('#check3').removeClass('dis_none');
			checkPoint3 = 1;
		}else{
			$('#userpw_check').addClass('warning');
			$('#input_pw_check').removeClass('dis_none');
			$('#check3').addClass('dis_none');
			checkPoint3 = 0;
		}
	}
	function name_check(){
		var nameRule = /^[가-힣]{2,4}$/;
		if(!nameRule.test(document.form1.username.value)){
			$('#username').addClass('warning');
			$('#input_name').removeClass('dis_none');
			$('#check4').addClass('dis_none');
			checkPoint4 = 0;
		}else{
			$('#username').removeClass('warning');
			$('#input_name').addClass('dis_none');
			$('#check4').removeClass('dis_none');
			checkPoint4 = 1;
		}
	}
	function phone_check(){
		var phoneRule = /(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/;
		if(!phoneRule.test(document.form1.userphone.value)){
			$('#userphone').addClass('warning');
			$('#input_phone').removeClass('dis_none');
			$('#check5').addClass('dis_none');
			checkPoint5 = 0;
		}else{
			$('#userphone').removeClass('warning');
			$('#input_phone').addClass('dis_none');
			$('#check5').removeClass('dis_none');
			checkPoint5 = 1;
		}
	}
	
	$('#userid').focusout(function() {
		check_email();
	});
	$('#userpw').focusout(function() {
		pw_check();
	});
	$('#userpw_check').focusout(function() {
		pw_check2();
	});
	$('#username').focusout(function(){
		name_check();
	});
	$('#userphone').focusout(function(){
		phone_check();
	});
	
	
	
	$('#logo').click(function(){
		self.location = "/";
	});
});
