<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<%@ include file="./includes/nav.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- 제이쿼리 cdn -->
    <script
    src="https://code.jquery.com/jquery-3.5.1.min.js"
    integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
    crossorigin="anonymous"></script>
</head>

<style>
    .container {
        width: 1200px;
        margin: 0 auto;
        margin-top: 30px;
    }

    .pictureContainer {
        display: flex;
    }

    .picture1 img {
        width: 200px;
        height: 400px;
        margin-top: 30px;
    }

    .picture2 img {
        width: 300px;
        height: 400px;
        margin-top: 30px;
        margin-left: 15px;
    }

    .subContent {
        margin-top: 30px;
    }

    .titleTwo {
        margin-top: 70px;
    }

    .contentTwo {
        margin-top: 30px;
    }

    .pictureContent {
        margin-top: 50px;
        margin-left: 5px;
    }

    .consultButton {
        width: 500px;
        height: 70px;
        border-radius: 20px;
        border: none;
        cursor: pointer;
        background-color: #001C3C;
        color: white;
        font-size: 20px;
        margin-top: 80px;
        margin-bottom: 100px;
    }

    .consultButton:hover {
        background-color: #001124;
    }

    .consultButton:focus {
        outline: none;
    }

	.consultButton2 {
        width: 500px;
        height: 70px;
        border-radius: 20px;
        border: none;
        cursor: pointer;
        background-color: #001C3C;
        color: white;
        font-size: 20px;
        margin-top: 80px;
        margin-bottom: 100px;
    }

    .consultButton2:hover {
        background-color: #001124;
    }

    .consultButton2:focus {
        outline: none;
    }


    .buttonContainer {
        text-align: center;
        margin-bottom: 50px;
    }
    
</style>

<body>
    <div class = 'container'>
    	<div>
    		<img src="/resources/img/service/ServiceBanner.PNG">
    	</div>
        <h1>아트옥션 웹 상담톡을 통한 실시간 웹 채팅 상담</h1>
        <div>
            아트옥션 상담톡이란 별도의 소프트웨어 없이 웹페이지에서 바로<br>
            고객과 빠르고 스마트하게 커뮤니케이션을 할 수 있는 채팅 상담 서비스입니다.</br>
            고객과 접근성을 최대화하고 상담 효율을 높일 수 있습니다.
        </div>
        <div class = 'pictureContainer'>
            <div class = 'picture1'>
            	<img src="/resources/img/service/cunsult2.PNG">
            </div>
            <div class = 'picture2'>
            	<img src="/resources/img/service/cunsult3.PNG">
            </div>
        </div>
        <div class = 'subContent'>
            한번의 버튼 클릭으로 고객은 언제 어디서나 제약없이 아트옥션과 커뮤니케이션 할 수 있습니다.</br>
            별도 앱 설치 필요없이 간편하게 접근 가능하며, 다양한 기능이 제공되는 채팅 상담은 기존 음성
            상담의 단점을 보완하여 고객 만족도를 높일 수 있습니다.
        </div>

        <h1 class = 'titleTwo'>기존 채팅 상담의 기능 개선을 통한 효율적인 고객관리</h1>
        <div class = 'contentTwo'>상담톡은 다음과 같이 기존의 카카오톡 채널 1:1 채팅의 기능을 보완하여 보다
            효율적인 고객 관리가 가능하도록 전문적인 상담 환경을 제공합니다.<br>
            웹 채팅을 위해서는 본 페이지에 반드시 로그인 하셔야합니다.
        </div>
        <div class = 'pictureContent'>
            <img src="/resources/img/service/content1.PNG">
        </div>
        <div class = 'buttonContainer'>
        
        <sec:authorize access="isAuthenticated() and !hasRole('ROLE_ADMIN')">
			<button class='consultButton'>상담톡 상담 하기</button>
		</sec:authorize>
		<sec:authorize access="hasRole('ROLE_ADMIN')"> 
			<button class='consultButton2'>상담사계정 접속</button>
		</sec:authorize>
		
		
		<script>
			$(document).ready(function(){
				<sec:authorize access="isAuthenticated()"> 
				$('.consultButton').click(function(){
					var id = "";
					id = '<sec:authentication property="principal.username" />';
					window.open("http://localhost:3000/chatting/"+id, "상담하기", "width=450, height=750, toolbar=no, menubar=no, scrollbars=no, resizable=yes" );
				});
				$('.consultButton2').click(function(){
					window.open("http://localhost:3000/chatting/consult", "상담관리", "width=700, height=750, toolbar=no, menubar=no, scrollbars=no, resizable=yes" );
				});
				</sec:authorize>
			});
		</script>
		
            
        </div>
    </div>
    <%@ include file="./includes/footer.jsp" %>
</body>
</html>