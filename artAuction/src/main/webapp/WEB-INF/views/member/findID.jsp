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

    <!-- 쿠키 cdn -->
    
    
    
    <style>
        #wrap{
            width: 70%;
            max-width: 600px;
            min-width: 600px;
            margin: auto;
            background-color: rgb(255, 247, 244);
        }
        .pan{
            width: 100%;
        }
        #logo{
           font-size: 55px;
           text-align: center;
           padding-top: 40px;
           padding-bottom: 20px;
           font-family: 'Reenie Beanie', cursive;
           cursor: pointer;
       }
       #selectBox{
            width: 80%;
            margin: auto;
            height: 58px;
       }
       #selectBox div{
            border: 1px solid rgb(148, 148, 148);
            cursor: pointer;
       }
       #selectBox #selected1{
            float: left;
            text-align: center;
            border-right: 1px solid #001C3C;
            width: 50%;
            padding-top: 18px;
            height: 58px;
            font-weight: 800;
            font-size: 18px;
       }
       #selectBox #selected2{
            float: left;
            text-align: center;
            width: 50%;
            padding-top: 18px;
            height: 58px;
            font-weight: 800;
            font-size: 18px;
           
       }
       .active{
            background-color: #001C3C;
            color: white;
       }
       #selectedZone1{
            width: 90%;
            margin: auto;
       }
       #selectedZone2{
            width: 90%;
            margin: auto;
       }




        #submitBtn{
            background-color: #001C3C;
            border: none;
            display: block;
            width: 80%;
            height: 60px;
            margin: auto;
            margin-top: 60px;
            margin-bottom: 15px;
            color: white;
            font-size: 20px;
        }
        #bookMark{
            text-align: center;
        }
        #bookMark a{
            text-decoration: none;
            font-size: 13px;
            color: rgb(110, 110, 110);
            margin-right: 15px;
        }
        #billBoard img{
            display: block;
            margin: auto;
            width: 90%;
            margin-top: 40px;
        }

        #findInfo{
            margin-left: 50px;
            padding-bottom: 25px;
            padding-top: 30px;
        }
        #findInfo h4{
            margin-top: 30px;
            font-weight: 600;
        }
        #findInfo p{
            font-size: 12px;
        }

        .findInput{
            width: 100%;
            padding-top: 10px;
            padding-bottom: 10px;
        }
        .findInput p{
            float: left;
            width: 80px;
            margin-left: 50px;
            padding-top: 5px;
        }
        .findInput input{
            width: 250px;
            height: 30px;
            border: 1px solid rgb(185, 185, 185);
            font-size: 12px;
            padding-left: 7px;
        }
        .findInput span{
            width: 30px;
            border: 1px solid rgb(185, 185, 185);
            background-color: white;
            margin-left: 5px;
            font-size: 12px;
            padding-left: 7px;
            padding-right: 7px;
            padding-top: 7px;
            padding-bottom: 7px;
            cursor: pointer;
        }
        .findInput span:hover{
            background-color: rgb(235, 235, 235);
        }
        #inputCheckNum1{
            margin-top: 8px;
        }
        #inputCheckNum2{
            margin-top: 8px;
        }
        #centerPan{
            padding-bottom: 50px;
        }

        .hidden{
            display: none;
        }
        
    </style>

    <script>
    $(document).ready(function(){
    	
    	var message='${message}';
		if(message!=""){
			alert(message);
		}
		
		$('#logo').click(function(){
        	location.href = "/";
        });

        $('.getCheckNum').click(function(){
            alert('핸드폰에 인증번호가 발송되었습니다.');
            alert('인증번호 : 321654');
        });
        
        $('#selected1').click(function(){
            $('#selected2').removeClass('active');
            $(this).addClass('active');
            $('#selectedZone2').addClass('hidden');
            $('#selectedZone1').removeClass('hidden');
        });
        $('#selected2').click(function(){
            $('#selected1').removeClass('active');
            $(this).addClass('active');
            $('#selectedZone1').addClass('hidden');
            $('#selectedZone2').removeClass('hidden');
        });
	});

    function submitCheck2(){
        var a = $('#inputName2').val();
        var b = $('#inputPhone2').val();
        if(a==""){
            alert('이름을 반드시 입력해주세요');
            return false;
        }
        if(b==""){
            alert('전화번호를 반드시 입력해주세요');
            return false;
        }
        return true;
    }
    </script>

</head>
<body>

    <div id="wrap">
        <div id="upPan" class="pan">
            <div id="logo">Art Auction</div>
            <div id="selectBox">
                <div id="selected1" class="active">비밀번호 찾기</div>
                <div id="selected2" class="">ID찾기</div>
            </div>
            <div id="selectedZone1" class="">
                <form action="/findUserPassword" method="post" onsubmit="return lastCheck();">
                	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <div id="findInfo">
                        <h4>회원정보에 등록한 휴대전화로 인증하여 비밀번호찾기</h4>
                        <p>회원정보에 등록한 휴대전화 번호와 입력한 휴대전화 번호가 같아야, 인증번호를 받을 수 있습니다.</p>
                    </div>
                    <div class="findInput">
                        <p>아이디</p>
                        <input type="text" id="inputName1" name="userid" value=""/>
                    </div>
                    <div class="findInput">
                        <p>휴대전화</p>
                        <input type="text" id="inputPhone1" name="userphonenum" value="" placeholder="휴대전화번호 ( -를 제외하고 입력 )"/>
                        <span class="getCheckNum">인증번호 받기</span><br>
                        <input id="inputCheckNum1" type="text" name="" value="" placeholder="인증번호 6자리 숫자입력"/>
                    </div>
                    <input type="submit" id="submitBtn" value="비밀번호 찾기"/>
                </form>
            </div>
            <div id="selectedZone2" class="hidden">
                <form action="/findUserId" method="post" onsubmit="return lastCheck();">
                	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <div id="findInfo">
                        <h4>회원정보에 등록한 휴대전화로 인증하여 아이디찾기</h4>
                        <p>회원정보에 등록한 휴대전화 번호와 입력한 휴대전화 번호가 같아야, 인증번호를 받을 수 있습니다.</p>
                    </div>
                    <div class="findInput">
                        <p>이름</p>
                        <input type="text" id="inputName2" name="username"/>
                    </div>
                    <div class="findInput">
                        <p>휴대전화</p>
                        <input type="text" id="inputPhone2" name="userphonenum" placeholder="휴대전화번호 ( -를 제외하고 입력 )"/>
                        <span class="getCheckNum">인증번호 받기</span><br>
                        <input id="inputCheckNum2" type="text" name="" placeholder="인증번호 6자리 숫자입력"/>
                    </div>
                    <input type="submit" id="submitBtn" value="아이디 찾기" onclick="return submitCheck2()"/>
                </form>
            </div>
            <hr>
        </div>
    
        <div id="centerPan" class="pan">
            <div id="bookMark">
                <a href="">로그인</a>
                <a href="">회원가입</a>
            </div>
        </div>
    </div>
</body>
</html>