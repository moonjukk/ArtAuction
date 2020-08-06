<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    
    <!-- jQuery -->
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    
    <!-- Bootstrap Core CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css2?family=Hi+Melody&family=Piedra&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Merriweather+Sans:400,700" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic" rel="stylesheet" type="text/css" />
    <!-- logo googlefont-->
    <link href="https://fonts.googleapis.com/css2?family=Reenie+Beanie&display=swap" rel="stylesheet">

	<!-- CSS / JS 불러오기 -->
    <link rel="stylesheet" href="/../resources/css/myInfoChange.css" />
    <script src="/../resources/js/myInfoChange.js"></script>


</head>
<body>

	<div id="wrap">
		<div id="upPan" class="pan">
			<div id="logo">Art Auction</div>

			<div id="selectedZone2" class="">
				<form action="/mypage/myInfoChange" id="form" name="form"
					method="POST" accept-charset="utf-8" onsubmit="return checkForm()">
					<div id="findInfo">
						<h3>회원정보 변경</h3>
					</div>
					<div class="findInput">
						<p>아이디</p>
						<input type="text" id="" name="userid"
							value=<c:out value="${userInfo.userid}"/> readonly />
					</div>

					<div class="findInput">
						<p>이름</p>
						<input type="text" id="" name="username"
							value=<c:out value="${userInfo.username}"/> readonly />
					</div>

					<div class="findInput">
						<p>비밀번호</p>
						<input type="password" id="pwcheck1" name="pw"
							placeholder="비밀번호(영문 숫자 특수문자 2가지이상 6~15자 이내)" />
					</div>
					<p id="pwAlert1" class="alert" />

					<div class="findInput">
						<p>비밀번호 확인</p>
						<input type="password" id="pwcheck2"
							placeholder="비밀번호(영문 숫자 특수문자 2가지이상 6~15자 이내)" />
					</div>
					<p id="pwAlert2" class="alert" />

					<div class="findInput">
						<p>휴대전화</p>
						<input type="text" id="phoneNum" name="userphonenum"
							value="<c:out value="${userInfo.userphonenum}"/>" />
					</div>
					<p id="phoneAlert" class="alert" />

					<div class="findInput">
						<p>은행명</p>
						<select name="bankname" id="selectBankName">
							<option value="신한은행"
								<c:if test="${userInfo.bankname eq '신한은행'}">selected</c:if>>신한은행</option>
							<option value="산업은행"
								<c:if test="${userInfo.bankname eq '산업은행'}">selected</c:if>>산업은행</option>
							<option value="농협"
								<c:if test="${userInfo.bankname eq '농협'}">selected</c:if>>농협</option>
							<option value='우리은행'
								<c:if test="${userInfo.bankname eq '우리은행'}">selected</c:if>>우리은행</option>
							<option value="하나은행"
								<c:if test="${userInfo.bankname eq '하나은행'}">selected</c:if>>하나은행</option>
							<option value="기업은행"
								<c:if test="${userInfo.bankname eq '기업은행'}">selected</c:if>>기업은행</option>
							<option value="국민은행"
								<c:if test="${userInfo.bankname eq '국민은행'}">selected</c:if>>국민은행</option>
							<option value="외환은행"
								<c:if test="${userInfo.bankname eq '외환은행'}">selected</c:if>>외환은행</option>
							<option value="한국씨티은행"
								<c:if test="${userInfo.bankname eq '씨티은행'}">selected</c:if>>씨티은행</option>
							<option value="수협"
								<c:if test="${userInfo.bankname eq '수협'}">selected</c:if>>수협</option>
							<option value="대구은행"
								<c:if test="${userInfo.bankname eq '대구은행'}">selected</c:if>>대구은행</option>
							<option value="부산은행"
								<c:if test="${userInfo.bankname eq '부산은행'}">selected</c:if>>부산은행</option>
							<option value="광주은행"
								<c:if test="${userInfo.bankname eq '광주은행'}">selected</c:if>>광주은행</option>
							<option value="제주은행"
								<c:if test="${userInfo.bankname eq '제주은행'}">selected</c:if>>제주은행</option>
						</select>
					</div>

					<div class="findInput">
						<p>계좌번호</p>
						<input type="text" id="bankaccount" name="bankaccount"
							value="<c:out value="${userInfo.bankaccount}"/>" />
					</div>
					<p id="bankAlert" class="alert" />

					<p>

						<input type="submit" id="submitBtn" value="회원정보 변경" />

						<!-- 토큰 -->
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />
				</form>
			</div>
			<hr>
		</div>

	</div>
</body>

<script>

$(document).ready(function(){
	var result = '<c:out value="${result}"/>';
});

</script>

</html>