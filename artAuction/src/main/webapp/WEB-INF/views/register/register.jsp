<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<%@ include file="../includes/nav.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>아트옥션</title>
    <!-- fontawesome-->
    <link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"
      />
      
    <!-- 제이쿼리 cdn -->
    <script
    src="https://code.jquery.com/jquery-3.5.1.min.js"
    integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
    crossorigin="anonymous"></script>

    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v5.13.0/js/all.js" crossorigin="anonymous"></script>
    <!-- logo googlefont-->
    <link href="https://fonts.googleapis.com/css2?family=Reenie+Beanie&display=swap" rel="stylesheet">
	
	<script>
	var csrfHeaderName ="${_csrf.headerName}"; 
	var csrfTokenValue="${_csrf.token}";
	</script>
	<link rel="stylesheet" href="/resources/css/register.css">
    <script src="/resources/js/register.js"></script>
</head>
<body>
    <div id="registerPage">
    	<div class="wrap">
	        <h2>경매 등록하기</h2>
	        <hr>
	        <form action="/register/goods" method="post">
	            <ul>
	                <li class="leftForm">제목</li>
	                <li class="rightForm" style="float: left;">
	                	<input id="inputGname" type="text" name="gname">
	                </li>
	                <li><img id="banner" src="/resources/img/register/banner.png" alt=""></li><br><br>
	            </ul>
	            <ul>
	                <li class="leftForm">카테고리</li>
	                <li class="rightForm">
	                    <select name="categoryid" style="width: 594px !important;">
	                        <option value="1">그림</option>
	                        <option value="2">목공예</option>
	                        <option value="3">금속공예</option>
	                        <option value="4">의류</option>
	                        <option value="5">DIY</option>
	                        <option value="99">기타</option>
	                    </select>
	                </li>
	            </ul>
	            <ul>
	                <li id="startPrice" class="leftForm">시작가</li>
	                <li class="rightForm" style="float:left;">
	                    <input type="text" id="inputStartPrice" name="startprice" class="moneyBox inputMoney">
	                </li>
	                <li id="endPrice" class="leftForm " style="margin-left: 10px;">즉시구매가</li>
	                <li class="rightForm">
	                	<input type="text" id="inputEndPrice" name="endprice" class="moneyBox inputMoney">
	                </li>
	            </ul>
	            <ul>
	            </ul>
	            <ul>
	            </ul>
	            <ul>
	                <li class="leftForm">은행</li>
	                <li class="rightForm" style="float:left;">
	                    <select name="bankname" id="selectBankName">
	                        <option value="신한은행" <c:if test="${userData.bankname eq '신한은행'}">selected</c:if>>신한은행</option>
	                        <option value="산업은행" <c:if test="${userData.bankname eq '산업은행'}">selected</c:if>>산업은행</option>
	                        <option value="농협" <c:if test="${userData.bankname eq '농협'}">selected</c:if>>농협</option>
	                        <option value='우리은행' <c:if test="${userData.bankname eq '우리은행'}">selected</c:if>>우리은행</option>
	                        <option value="하나은행" <c:if test="${userData.bankname eq '하나은행'}">selected</c:if>>하나은행</option>
	                        <option value="기업은행" <c:if test="${userData.bankname eq '기업은행'}">selected</c:if>>기업은행</option>
	                        <option value="국민은행" <c:if test="${userData.bankname eq '국민은행'}">selected</c:if>>국민은행</option>
	                        <option value="외환은행" <c:if test="${userData.bankname eq '외환은행'}">selected</c:if>>외환은행</option>
	                        <option value="한국씨티은행" <c:if test="${userData.bankname eq '씨티은행'}">selected</c:if>>씨티은행</option>
	                        <option value="수협" <c:if test="${userData.bankname eq '수협'}">selected</c:if>>수협</option>
	                        <option value="대구은행" <c:if test="${userData.bankname eq '대구은행'}">selected</c:if>>대구은행</option>
	                        <option value="부산은행" <c:if test="${userData.bankname eq '부산은행'}">selected</c:if>>부산은행</option>
	                        <option value="광주은행" <c:if test="${userData.bankname eq '광주은행'}">selected</c:if>>광주은행</option>
	                        <option value="제주은행" <c:if test="${userData.bankname eq '제주은행'}">selected</c:if>>제주은행</option>
	                    </select>
	                </li>
	                <li class="leftForm" style="margin-left: 10px;">계좌번호</li>
	                <li class="rightForm">
	                	<input type="text"  id="inputBankAcount" name="bankaccount" class="moneyBox" placeholder="-까지 포함해서 입력해주세요" value="${userData.bankaccount}">
	                </li>
	            </ul>
	            <ul>
	                <li class="leftForm" style="margin-top: 1px;">이미지파일</li>
	                <li class="rightForm">
	                    <input type="file" id="fileSelector" name="" multiple><span id="dragZoneOpen">▼</span>
	                </li>
	                <li id="dragFileZone" class="hidden">
	                    <span class="">파일을 드래그해주세요 <i class="far fa-times-circle closeBtn"></i></span>
	                    <!--파일 드래그/input에서 선택할 경우 다음 코드가 이곳에 추가
	                    <div>
	                    	<input type="checkbox" name="thumbnail" value="파일의uuid">
	                        <i class="far fa-images"></i>
	                        { 파일명 }
	                        <i class="far fa-times-circle fileDeleteBtn"></i>
	                    </div>
	                    -->
	                </li>
	                <span class="inputInfo thumbInfo hidden">* 썸네일로 지정할 이미지를 선택해주세요</span>
	            </ul>
	            <ul>
	                <li class="leftForm">경매종료시간</li>
	                <li class="rightForm"><input type="text" class="" placeholder="등록일로부터 10일 후" readonly></li>
	                <input type="hidden" name="registeruserid" value='<sec:authentication property="principal.username"/>' readonly/>
	                <input type="hidden" name="userid" value='<sec:authentication property="principal.username"/>' readonly/>
	                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	            </ul>
	            <ul>
	                <li class="leftForm">물품설명</li>
	                <li class="rightForm"><textarea name="ginfo"  id="inputGinfo"></textarea></li>
	                <span class="inputInfo">
	                    * 등록 후 물품설명 아래 등록하신 모든 이미지들이 보여집니다.<br>
	                </span>
	                <span class="inputInfo">
	                    * 이미지 등록 시 하나의 이미를 대표이미지로 선택하셔야합니다.<br>
	                </span>
	                <span class="inputInfo">
	                    * 규정에 어긋나는 게시물은 관리자에 의해 동의없이 삭제 될 수 있습니다.
	                </span>
	            </ul>
	        </ul>
	        <ul>
	            <li><input type="submit" value="등록하기"></li>
	        </ul>
	        </form>
	    </div>
    </div>
    
    <%@ include file="../includes/footer.jsp" %>
    
</body>
</html>