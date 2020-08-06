<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <!-- logo googlefont-->
    <link href="https://fonts.googleapis.com/css2?family=Reenie+Beanie&display=swap" rel="stylesheet">
    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v5.13.0/js/all.js" crossorigin="anonymous"></script>
    <!-- google font-->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
    <!-- jQuery -->
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


    <style>
        *{
            margin: 0;
            padding: 0;
            font-family: 'Noto Sans KR', sans-serif;
        }
        body{
            width: 1400px;
            height: 1000px;
            background-color: rgb(230, 230, 230);
        }
        #admin_nav{
            float: left;
            background-color: #343A40;
            height: 100%;
            width: 250px;
        }
        #admin_logo{
            height: 50px;
            font-family: 'Reenie Beanie', cursive;
            font-size: 35px;
            margin-top: 25px;
            color: rgb(231, 231, 231);
            width: 100%;
            text-align: center;
            cursor: pointer;
        }
        #admin_who{
            color: white;
            width: 100%;
            height: 40px;
            text-align: center;
            padding-top: 15px;
            margin: auto;
        }


        .admin_nav_borderBottom{
            border-bottom: 1px solid rgb(180, 180, 180);
            width: 90% !important;
            margin: auto;
        }
        .admin_nav_icon{
            font-size: 30px;
            color: white;
            position: absolute;
            margin-top: -3px;
            margin-left: -40px;

        }
        #admin_nav_selector_zone{
            margin-top: 10px;
        }

        .admin_nav_selector{
            width: 80%;
            height: 35px;
            color: rgb(216, 216, 216);
            background-color: #343A40;
            margin: auto;
            margin-top: 10px;
            border-radius: 10px;
            padding-top: 10px;
            padding-left: 15px;
            cursor: pointer;
        }
        .admin_nav_selector:hover{
            background-color: rgb(195, 214, 205);
            color: #343A40;
        }
        
        .icons{
            position: absolute;
            font-size: 20px;
            padding-top: 1px;
        }
        #admin_nav_selector_zone span{
            padding-left: 38px;
        }

        .selected{
            color: black !important;
            background-color: rgb(255, 255, 255) !important;

        }




        .admin_contentZone{
            float: left;
            height: 940px;
            width: 1000px;
            background-color: rgb(230, 230, 230);
            padding : 30px;
            color: #343A40;
        }
        .admin_contentZone hr{
            margin-top: 30px;
            margin-bottom: 30px;
        }
        .admin_contentZone ul{
            width: 1000px;
            margin-top: 30px;
        }
        .admin_contentZone ul li{
            list-style: none;
            float: left;
            width: 14%;
            height: 30px;
            border-bottom: 1px solid #343A40;
            border-right: 1px solid #343A40;
            text-align: center;
            padding-top: 8px;
            padding-bottom: 8px;
        }
        .borderLeft{
            border-left: 1px solid #343A40 !important;
            z-index: 100;
        }
        .borderTop{
            border-top: 1px solid #343A40;
        }

        #admin_manage_member_box{
            width: 100%;
            height: 130px;
        }
        .admin_member_inputzone{
            float: left;
            width: 40%;
            height: 35px;
            margin-bottom: 15px;
        }
        .admin_member_leftBox{
            float: left;
            width: 10%;
            height: 75%;
            text-align: right;
            font-size: 18px;
            padding-top: 15px;
            padding-right: 10px;
        }
        .admin_member_rightBox{
            float: left;
            width: 90%;
        }
        .admin_member_rightBox input{
            margin-left: 10px;
            margin-top: 12px;
            height: 30px;
            width: 120px;
            padding-left: 15px;
        }
        .admin_member_rightBox button{
            margin-left: 10px;
            height: 37px;
            padding-bottom: 3px;
            width: 60px;
        }
        #admin_member_outputzone{
            margin-top: 30px;
            width: 100%;
            height: 500px;
            padding: 30px;
        }
        #admin_member_outputzone div input{
            width: 25px;
            height: 25px;
            padding-left: 5px;
            text-align: center;
        }
        #admin_member_outputzone div button{
            width: 30px;
            height: 30px;
            margin-left: 10px;
            margin-right: 10px;
        }
        #admin_member_outputzone_output2{
            float: right;
        }
        #admin_member_outputzone_table div ul li{
            height: 73px;
        }
        #admin_member_outputzone_table div ul li:nth-child(n+2){
            padding-top: 31px;
            height: 50px;
        }
        #admin_member_outputzone_table div ul li img{
            width: 53% !important;
            height: 70px;
        }
        #admin_member_outputzone_table ul li button{
            width: 36%;
            margin-right: 2px;
        }
        #admin_member_outputzone_table ul li input{
            width: 90%;
            margin: 0;
            border: none;
            background-color: rgb(230, 230, 230);
            text-align: center;
        }
        #inputMaxPage{
            border: none;
            background-color: rgb(230, 230, 230);;
        }
        .admin_member_remove{
            background-color: rgb(247, 165, 165);
            border: 1px solid rgb(161, 161, 161);
        }
        .admin_member_remove:hover{
            background-color: red !important;
            color: white !important;
        }
        .myBackColor1{
            background-color: rgb(85, 85, 85) !important;
            color: white !important;
        }
        .fontCorRed{
            color: red;
        }
        .borderRightNo{
            border-right: none !important;
        }
        .goBuyingPage{
        	cursor: pointer;
        }
        .goBuyingPage:hover{
        	border: 1px solid #1a7de0;
        }
        
        .hidden{
        	display: none;
        }
        
                #searchZone{
                    width: 100%;
                    height: 100px;
                    padding-left: 20px;
                    padding-top: 20px;
                    margin-top: 60px;
                }
                #searchZone form{
                    height: 40%;
                    width: 80%;
                    padding-left: 100px;
                    
                }
                #searchZone form select{
                    margin-top: 5px;
                    height: 80%;
                    width: 80px;
                    margin-left: 190px;
                }
                #searchZone form input[type="text"]{
                    height: 70%;
                    width: 300px;
                    margin-left: 3px;
                }
                #searchZone form input[type="submit"]{
                    height: 80%;
                    padding-left: 10px;
                    padding-right: 10px;
                }

    </style>
    <script>
    	$(document).ready(function(){
			var message='${message}';
			if(message!=""){
				alert(message);
			}
			$('#admin_logo').click(function(){
                location.href = "/";
            });
    		$('#goAdmin').click(function(){
				location.href = "/admin";
			});
			$('#goAdminGoods').click(function(){
				location.href = "/adminGoods";
			});
    	});
    </script>
</head>
<body>
	
	<!-- 총 페이지 수 count -->
	<c:set var="getMaxPageTemp" value="${getTotalGoods%7}"/>
	<c:if test="${getMaxPageTemp > 0}" >
		<c:set var="getMaxPage" value="${(getTotalGoods/7+1) - (getTotalGoods%7)*0.1}"/>
	</c:if>
	<c:if test="${getMaxPageTemp < 1}" >
		<c:set var="getMaxPage" value="${getTotalGoods/7}"/>
	</c:if>
    
    <div id="admin_nav">
        <div id="admin_logo" class="admin_nav_borderBottom">Art Auction</div>
        <div id="admin_who" class="admin_nav_borderBottom">
            <i class="fas fa-user-circle admin_nav_icon"></i>
            <sec:authentication property="principal.username"/> 관리자님
        </div>
        <div id="admin_nav_selector_zone">
            <div id="goAdmin" class="admin_nav_selector">
                <i class="fas fa-user-edit icons"></i>
                <span>회원정보 관리</span>
            </div>
            <div id="goAdminGoods" class="admin_nav_selector selected">
                <i class="fas fa-user-edit icons"></i>
                <span>물품 관리</span>
            </div>
            <div class="admin_nav_selector">
                <i class="fas fa-user-edit icons"></i>
                <span>서버 이미지 관리</span>
            </div>
            <div class="admin_nav_selector">
                <i class="fas fa-user-edit icons"></i>
                <span>서버 통계</span>
            </div>
            <div class="admin_nav_selector">
                <i class="fas fa-user-edit icons"></i>
                <span>환경설정</span>
            </div>
        </div>
    </div>
    
    <div class="admin_contentZone">
        <h1>경매정보 관리</h1>

        <hr/>

        <div id="admin_manage_member_box">
            <div id="admin_member_outputzone">
                <div>
                    <span id="admin_member_outputzone_output1">
                        <span class="fontCorRed">${getTotalGoods}</span>개의 상품정보 조회결과
                    </span>
                    <span id="admin_member_outputzone_output2">
                        <button id="admin_member_beforeBtn"><</button>
                        <input id="inputPage" type="text" value="${adminCriPage}"/>
                        /
                        <input id="inputMaxPage" type="text" value="<fmt:parseNumber value='${getMaxPage}' integerOnly='true'/>" readonly/>
                        <button id="admin_member_nextBtn">></button>
                    </span>
                </div>
				
                <div id="admin_member_outputzone_table">
                    <ul>
                        <li class="borderLeft borderTop myBackColor1">이미지</li>
                        <li class="borderTop myBackColor1">상품명</li>
                        <li class="borderTop myBackColor1">판매자</li>
                        <li class="borderTop myBackColor1">마감시간</li>
                        <li class="borderTop myBackColor1">경매상태</li>
                        <li class="borderTop myBackColor1">구매자</li>
                        <li class="borderTop myBackColor1">수정하기</li>
                    </ul>
                    
                    <!-- 수정 및 삭제를 처리할 form , 숨겨져있다가 js에 의해 호출 -->
			        <div class="hidden">
			           	<form id="manageMemberByAdmin" action="adminGoodsModify" method="post">
			                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			           	</form>
			           	<form id="deleteGoodsByAdmin" action="deleteGoodsByAdmin" method="post">
			                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			           	</form>
			        </div>
			        
                    <div id="pointEach">
                    	<c:forEach items="${goodsList}" var="dataList">
                    		<ul>
	                            <li class="borderRightNo borderLeft">
	                            	<img src="/img/<c:out value='${dataList.uploadpath}'/>/<c:out value='${dataList.uuid}'/>_<c:out value='${dataList.filename}'/>" class="goBuyingPage">
	                            	<input type="hidden" name="gno" value="${dataList.gno}"/>
	                            </li>
	                            <li class="borderLeft">
	                            	<input type="text" name="gname" value="${dataList.gname}"/>
	                            </li>
	                            <li><input type="text" name="userid" value="${dataList.registeruserid}" readonly/></li>
	                            <li><input type="text" name="enddate" value="${dataList.enddate}"/></li>
	                            <li><input type="text" name="flag" value="${dataList.flag}"/></li>
	                            <li><input type="text" name="buyinguserid" value="${dataList.buyinguserid}" readonly/></li>
	                            <li>
	                                <button class="admin_member_modify">수정</button>
	                                <button class="admin_member_remove">삭제</button>
	                            </li>
                        	</ul>
                    	</c:forEach>
                    	
                    	<script>
                    		$(document).ready(function(){
                    			$('#pointEach').delegate(".goBuyingPage", "click", function(){
                    				var gno = $(this).next().val();
                    				var flag = $(this).parent().parent().children().eq(4).children().eq(0).val();
                    				
                    				if(flag == 0){
                    					// 경매진행중인 물품이라면
                    					location.href="/get/goods?gno="+gno;
                    				}else{
                    					// 거래중인 물품이라면
                    					location.href="/deal/buy?gno="+gno;
                    				}
                    			});
                    			
                    			var maxPage = $('#inputMaxPage').val();
                                $('#inputPage').change(function(){
                                    var a = $(this).val();
                                    if(a>maxPage || a<1){
                                    	alert("페이지 범위를 초과하였습니다");
                                        location.href="/adminGoods?pageNum=1";
                                    }else{
                                        location.href="/adminGoods?pageNum="+a;
                                    }
                                });
                                $('#admin_member_nextBtn').click(function(){
                                    var nowPage = $('#inputPage').val();
                                    nowPage++;
                                    if(nowPage <= maxPage){
                                        location.href="/adminGoods?pageNum="+nowPage;
                                    }else{
                                        location.href="/adminGoods?pageNum=1";
                                    }
                                });
                                $('#admin_member_beforeBtn').click(function(){
                                    var nowPage = $('#inputPage').val();
                                    nowPage--;
                                    if(nowPage > 0){
                                        location.href="/adminGoods?pageNum="+nowPage;
                                    }else{
                                        location.href="/adminGoods?pageNum="+maxPage;
                                    }
                                });
                                
                                $('.admin_member_modify').click(function(){
                                    var gno = $(this).parents('ul').children().eq(0).children().eq(1).val();
                                	if(confirm('물품번호 ['+gno+'] 의 물품정보를 수정하시겠습니까?')){
                                		var gname = $(this).parents('ul').children().eq(1).children().eq(0).val();
                                		var enddate = $(this).parents('ul').children().eq(3).children().eq(0).val();
                                		var flag = $(this).parents('ul').children().eq(4).children().eq(0).val();
                                		
                                        var form3 = $('#manageMemberByAdmin');
                                        str = "<input type='text' name='gno' value='"+gno+"'>";
                                        str += "<input type='text' name='gname' value='"+gname+"'>";
                                        /* str += "<input type='text' name='enddate' value='"+enddate+"'>"; */
                                        str += "<input type='text' name='flag' value='"+flag+"'>";
                                        
                                        var a = window.location.href;
                                        var b = a.split('/');
                                        url = b[3];
                                        str += "<input type='hidden' name='beforeURL' value='" + url + "'>";
                                        
                                        alert("정보를 수정하였습니다");
                                        
                                        form3.append(str).submit();
                                	}
                                });
                                
                                $('.admin_member_remove').click(function(){
                                	var gno = $(this).parents('ul').children().eq(0).children().eq(1).val();
                                	var gname = $(this).parents('ul').children().eq(1).children().eq(0).val();
                                    if(confirm('[ '+gname+' ]\n삭제된 데이터는 복구 할 수 없습니다.\n정말로 삭제하시겠습니까?')){
                                       	var flag = $(this).parents('ul').children().eq(4).children().eq(0).val();
                                       	var form4 = $('#deleteGoodsByAdmin');
                                       	var str = ""
                                        if(confirm('['+gname+'] 의 경매정보를 영구적으로 삭제합니다')){
                                            if(flag!=0){
                                            	if(confirm('이 상품은 거래중인 상품입니다.\n정말로 해당 거래를 삭제하시겠습니까?')){
                                            		str += "<input type='text' name='gno' value='"+gno+"'>";
                                            		var a = window.location.href;
                                                    var b = a.split('/');
                                                    url = b[3];
                                                    str += "<input type='hidden' name='beforeURL' value='" + url + "'>";
                                            		alert('['+gname+'] 의 경매정보가 삭제되었습니다.');
                                                    form4.append(str).submit();
                                            	}
                                            }else{
                                            	str += "<input type='text' name='gno' value='"+gno+"'>";
                                            	var a = window.location.href;
                                                var b = a.split('/');
                                                url = b[3];
                                                str += "<input type='hidden' name='beforeURL' value='" + url + "'>";
                                        		alert('['+gname+'] 의 경매정보가 삭제되었습니다.');
                                                form4.append(str).submit();
                                            }
                                        }
                                    }
                                    /* 
                                    *
                                    * Ajax로 페이지 처리
                                    *
                                    */
                                });
                    		});
                    	</script>
                    	
                    	
                    	
                        
                    </div>
                </div>
            </div>
            <div id="searchZone">
                <form action="/adminGoodsSearch" method="get">
                    <select name="type">
                        <option value="byGoods">상품명</option>
                        <option value="byId">판매자ID</option>
                    </select>
                    <input type="text" name="query">
                    <input type="hidden" name="pageNum" value="${adminCriPage}">
                    <input type="submit" value="조회">
                </form>
            </div>
        </div>
    </div>
    <script>
    </script>

</body>
</html>