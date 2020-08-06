<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="utf-8">

    
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css2?family=Hi+Melody&family=Piedra&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Merriweather+Sans:400,700" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic" rel="stylesheet" type="text/css" />
    
    <!-- fontawesome-->
    <link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

	<!-- logo googlefont-->
	<link href="https://fonts.googleapis.com/css2?family=Reenie+Beanie&display=swap" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    
    <link rel="stylesheet" href="/resources/css/join.css" />
    <script type="text/javascript" src="/resources/js/join.js"></script>
</head>
<body>
<!--
<% request.setCharacterEncoding("UTF-8"); %>
-->
<form name="form1" action="/member/join" method="post" style="max-width:500px;margin:auto" onsubmit="return lastCheck();">
    
    <div id="logo">ArtAuction</div>

    <div class="input-container">
        <i class="fa fa-envelope icon"></i>
        <input class="input-field" type="text" placeholder="아이디(4~12자 이내)" name="userid" id="userid">
    </div>
    <i id="check1" class="fa fa-check check dis_none"></i>
    <p id="input_email1" class="dis_none warning_text">아이디를 입력하세요.</p>
    <p id="input_email2" class="dis_none warning_text">아이디 형식이 올바르지 않습니다.</p>
    
    <div class="input-container">
        <i class="fa fa-key icon"></i>
        <input class="input-field" type="password" placeholder="비밀번호(영문 숫자 특수문자 2가지이상 6~15자 이내)" name="pw" id="userpw" value="">
    </div>
    <i id="check2" class="fa fa-check check dis_none"></i>
    <p id="input_pw" class="dis_none warning_text">비밀번호는 특수문자를 포함한 6~15자 이내로 입력하셔야 합니다.</p>

    <div class="input-container">
        <i class="fa fa-key icon"></i>
        <input class="input-field" type="password" placeholder="비밀번호 확인" name="pw_check" id="userpw_check" value="">
    </div>
    <i id="check3" class="fa fa-check check dis_none"></i>
    <p id="input_pw_check" class="dis_none warning_text">비밀번호가 일치하지 않습니다.</p>

    <div class="input-container">
        <i class="fa fa-user icon"></i>
        <input class="input-field" type="text" placeholder="이름" name="username" id="username" value="${returnName}">
    </div>
    <i id="check4" class="fa fa-check check dis_none"></i>
    <p id="input_name" class="dis_none warning_text">이름을 정확히 입력하세요.</p>

    <div class="input-container">
        <i class="fas fa-mobile-alt icon"></i>
        <input class="input-field" type="text" placeholder="휴대폰번호" name="userphonenum" id="userphone" value="${returnPhone}">
    </div>
    <i id="check5" class="fa fa-check check check2 dis_none"></i>
    <p id="input_phone" class="dis_none warning_text">휴대폰 번호를 정확하게 입력하세요.</p>
	
	<!-- 토큰 -->
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	
    <input type="submit" class="btn" value="동의하고 가입하기" style="margin-top: 30px; width: 100% !important;">
    
   <br>
   <p id="checkPoint">본인은 만 8세 이상이며, 이용약관, 개인정보 수집 및 이용, 개인정보 제공 내용을 확인 하였으며, 이에 동의합니다</p>
   
   <p id="footer">©artAuction Corp. All rights reserved.</p>
   
</form>
</body>
<script>
$(document).ready(function(){
	var message='${message}';
	if(message!=""){
		alert(message);
	}
});
</script>
</html>