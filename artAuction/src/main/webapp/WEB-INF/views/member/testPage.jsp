<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<!-- jQuery -->
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<title>Insert title here</title>
	<script>
			$(document).ready(function(){
				var result='${result}';
				if(result!=""){
					alert(result);
				}
			});
	</script>
</head>
<body>


<h1>buying페이지</h1><br>
<sec:authorize access="isAnonymous()">
	<a href="/member/customLogin">login</a><br>
</sec:authorize>


<a href="/test/user?userId=tester">test?userId=tester</a><br>
<a href="/register/goods">register</a><br>
<a href="/deal/buy?gno=53">buy?gno=53 판매자:moon / 구매자:mrkim</a><br>
<a href="/deal/buy?gno=54">buy?gno=54 판매자:mrkim / 구매자:moon</a><br>

<sec:authorize access="isAuthenticated()">
	<form action="/customLogout" method='post'>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<button>로그아웃</button>
	</form>
</sec:authorize>

<p>-------------------------------------------</p>
<h1>get페이지</h1>
<a href="/get/goods?gno=58">/get/goods?gno=58</a>



<p>-------------------------------------------</p>
<h1>List</h1>
<a href="/list">list</a>



<p>-------------------------------------------</p>
<h1>고객센터</h1>
<a href="/board/list">/board/list</a>


</body>
</html>