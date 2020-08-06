<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
    <link rel="stylesheet" href="/resources/css/login.css" />
    <script src="/resources/js/login.js"></script>
    <script>
			$(document).ready(function(){
				var result='${result}';
				var error='${error}';
				var message='${message}';
				if(result!=""){
					alert(result);
				}
				if(error!=""){
					alert(error);
				} 
				if(message!=""){
					alert("임시 비밀번호 [ "+message+" ]가 발급되었습니다.\n로그인 후 반드시 비밀번호를 변경해주세요.");
				}
			});
	</script>
</head>
<body>

    <div id="wrap">
        <div id="upPan" class="pan">
            <div id="logo">Art Auction</div>
            <form action="/login" method="POST" onsubmit="return lastCheck();">
                <input type="text" id="inputID" class="inputlogin" name="username" placeholder="  아이디"/>
                <input type="password" id="inputPW" class="inputlogin" name="password" placeholder="  비밀번호"/>
                <input type="submit" id="submitBtn" value="로그인"/>
                <div id="autoLoginBox" >
                    <input type="checkbox" id="autoLogin" name='_spring_security_remember_me'><span class="font1"> 자동로그인</span>
                </div>
                
                <!-- 토큰 -->
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                
            </form>
            <hr>
        </div>
    
        <div id="centerPan" class="pan">
            <div id="bookMark">
                <a href="/member/findID">아이디 찾기</a>
                <a href="/member/findID">비밀번호 찾기</a>
                <a href="/member/join">회원가입</a>
            </div>
        </div>
    
        <div id="downPan" class="pan">
            <div id="billBoard">
                <img src="/resources/img/member/samsung_banner.png"/>
            </div>
        </div>
        
    </div>
</body>
</html>