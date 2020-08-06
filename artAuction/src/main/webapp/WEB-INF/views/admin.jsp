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

	<!-- CSS / JS 불러오기 -->
    <link rel="stylesheet" href="/resources/css/admin.css" />
    <!-- <script src="/resources/js/get.js"></script> -->
	
</head>
<body>

	<script>
			$(document).ready(function(){
				var message='${message}';
				if(message!=""){
					alert(message);
				}
				$('#goAdmin').click(function(){
					location.href = "/admin";
				});
				$('#goAdminGoods').click(function(){
					location.href = "/adminGoods";
				});
			});
			
	</script>








	<!-- 총 페이지 수 count -->
	<%-- <c:set var="getMaxPageTemp" value="${getTotalUser%10}"/>
	<c:if test="${getMaxPageTemp > 0.0001}" >
		<c:set var="userMaxPage" value="${(getTotalUser/10+1) - (getMaxPageTemp*0.1)}"/>
	</c:if>
	<c:if test="${getMaxPageTemp < 0.0001}" >
		<c:set var="userMaxPage" value="${getTotalUser/10}"/>
	</c:if> --%>
	
	<!-- 총 페이지 수 count -->
	<c:set var="getMaxPageTemp" value="${getTotalUser%10}"/>
	<c:if test="${getMaxPageTemp > 0}" >
		<c:set var="userMaxPage" value="${(getTotalUser/10+1) - (getMaxPageTemp*0.1)}"/>
	</c:if>
	<c:if test="${getMaxPageTemp < 1}" >
		<c:set var="userMaxPage" value="${getTotalUser/10}"/>
	</c:if>
	
	
    <div id="admin_nav">
        <div id="admin_logo" class="admin_nav_borderBottom">Art Auction</div>
        <div id="admin_who" class="admin_nav_borderBottom">
            <i class="fas fa-user-circle admin_nav_icon"></i>
            <sec:authentication property="principal.username"/> 관리자님
        </div>
        <div id="admin_nav_selector_zone">
            <div id="goAdmin" class="admin_nav_selector selected">
                <i class="fas fa-user-edit icons"></i>
                <span>회원정보 관리</span>
            </div>
            <div id="goAdminGoods" class="admin_nav_selector">
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
        <h1>회원정보 관리</h1>

        <hr/>
		
        <div id="admin_manage_member_box">
            <div id="admin_member_outputzone">

                <div>
                    <span id="admin_member_outputzone_output1">
                        <span class="fontCorRed">${getTotalUser}명</span>의 회원정보 조회결과
                    </span>
                    <span id="admin_member_outputzone_output2">
                        <button id="admin_member_beforeBtn"><</button>
                        <input id="inputPage" type="text" value="${adminCriPage}"/>
                        /
                        <input id="inputMaxPage" type="text" value="<fmt:parseNumber value='${userMaxPage}' integerOnly='true'/>" readonly/>
                        <button id="admin_member_nextBtn">></button>
                    </span>
                </div>

                <div id="admin_member_outputzone_table">
                    <ul>
                        <li class="borderLeft borderTop myBackColor1">아이디</li>
                        <li class="borderTop myBackColor1 myWidth3">이름</li>
                        <li class="borderTop myBackColor1">전화번호</li>
                        <li class="borderTop myBackColor1">은행</li>
                        <li class="borderTop myBackColor1">계좌번호</li>
                        <li class="borderTop myBackColor1 myWidth2">계정상태</li>
                        <li class="borderTop myBackColor1 myWidth1">수정하기</li>
                    </ul>
                    <div>
                    	<c:forEach items="${userlist}" var="dataList">
                    		<ul class="userListUl">
	                            <li class="borderLeft"><input type="text" value="${dataList.userid}" readonly/></li>
	                            <li class="myWidth3"><input type="text" value="${dataList.username}" /></li>
	                            <li><input type="text" value="${dataList.userphonenum}" /></li>
	                            <li><input type="text" value="${dataList.bankname}" /></li>
	                            <li><input type="text" value="${dataList.bankaccount}" /></li>
                            	<li class="myWidth2"><input type="text" value="${dataList.enabled}"/></li>
	                            <li class="myWidth1">
	                                <button class="admin_member_modify">수정</button>
                                	<button class="admin_member_promote">관리자권한</button>
	                            </li>
	                        </ul>
                    	</c:forEach>	
                        
                    </div>
                </div>
            </div>
            <div id="searchZone">
                <form action="/adminMember" method="get">
                    <select name="type">
                        <option value="byId">아이디</option>
                        <option value="byName">이름</option>
                    </select>
                    <input type="text" name="query">
                    <input type="hidden" name="pageNum" value="${adminCriPage}">
                    <input type="submit" value="조회">
                </form>
            </div>
            <!-- 수정 및 삭제를 처리할 form , 숨겨져있다가 js에 의해 호출 -->
            <div class="hidden">
            	<form id="manageMemberByAdmin" action="adminMemberModify" method="post">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            	</form>
            </div>
            <!-- 관리자 등용/해지에 대한 form , 숨겨져있다가 js에 의해 호출 -->
            <div class="hidden">
            	<form id="adminMemberAuth" action="adminMemberAuth" method="post">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            	</form>
            </div>
        </div>
    </div>
    <script>
        $(document).ready(function(){
            $('#admin_logo').click(function(){
                location.href = "/";
            });
            $('.admin_member_modify').click(function(){
                var userid = $(this).parents('ul').children().eq(0).children().eq(0).val();
            	if(confirm(userid+' 의 계정정보를 수정하시겠습니까?')){
            		var username = $(this).parents('ul').children().eq(1).children().eq(0).val();
                    var userphonenum = $(this).parents('ul').children().eq(2).children().eq(0).val();
                    var bankname = $(this).parents('ul').children().eq(3).children().eq(0).val();
                    var bankaccount = $(this).parents('ul').children().eq(4).children().eq(0).val();
                    var enabled = $(this).parents('ul').children().eq(5).children().eq(0).val();
                    
                    var form2 = $('#manageMemberByAdmin');
                    str = "<input type='text' name='userid' value='"+userid+"'>";
                    str += "<input type='text' name='username' value='"+username+"'>";
                    str += "<input type='text' name='userphonenum' value='"+userphonenum+"'>";
                    if(bankname != ""){
                        str += "<input type='text' name='bankname' value='"+bankname+"'>";
                    }
                    if(bankaccount != ""){
                        str += "<input type='text' name='bankaccount' value='"+bankaccount+"'>";
                    }
                    str += "<input type='text' name='enabled' value='"+enabled+"'>";
                    
                    var a = window.location.href;
                    var b = a.split('/');
                    url = b[3];
                    str += "<input type='hidden' name='beforeURL' value='" + url + "'>";
                    
                    alert("정보를 수정하였습니다");
                    form2.append(str).submit();
            	}
            });
            
            $('.admin_member_remove').click(function(){
                if(confirm('삭제된 데이터는 복구 할 수 없습니다.\n정말로 삭제하시겠습니까?')){
                    var a = $(this).parents('ul').children().eq(0).children().eq(0).val();
                    if(confirm(a+' 의 계정정보를 영구적으로 삭제합니다')){
                        alert("삭제처리");
                    }
                }
                /* 
                *
                * Ajax로 페이지 처리
                *
                */
            });
            
            $('.admin_member_promote').click(function(){
                var circle=0;
                while(circle==0){
                    var userid = $(this).parents('ul').children().eq(0).children().eq(0).val();
                    var form4 = $('#adminMemberAuth');
                    var str = ""
                    var temp = prompt('[ '+userid+' ] 에게 관리자 권한을 부여하거나 해지합니다.\n[ 1 ] 관리자 임명\n[ 2 ] 관리자 해지\n')
                    if(temp=='1'){
                    	var userauth = 'ROLE_ADMIN';
                        alert(userid+' 에게 관리자 권한을 부여했습니다.');
                        
                        str += "<input type='hidden' name='userid' value='"+userid+"'>";
                        str += "<input type='hidden' name='userauth' value='"+userauth+"'>";
                    	
                        var a = window.location.href;
                        var b = a.split('/');
                        url = b[3];
                        str += "<input type='hidden' name='beforeURL' value='" + url + "'>";
                        form4.append(str).submit();
                        
                        circle++;
                    }
                    else if(temp=='2'){
                    	var userauth = 'ROLE_USER';
                        alert(userid+' 에게 관리자 권한을 해지하였습니다');
                        
                        str += "<input type='hidden' name='userid' value='"+userid+"'>";
                        str += "<input type='hidden' name='userauth' value='"+userauth+"'>";
                    	
                        var a = window.location.href;
                        var b = a.split('/');
                        url = b[3];
                        str += "<input type='hidden' name='beforeURL' value='" + url + "'>";
                        form4.append(str).submit();

                        circle++;
                    }
                    else if(temp==null){
                        circle++;
                    }
                    else{
                        alert('1또는 2를 명확하게 입력해주세요');
                    }
                }
            });

            var maxPage = $('#inputMaxPage').val();
            $('#inputPage').change(function(){
                var a = $(this).val();
                if(a>maxPage || a<1){
                	alert("페이지 범위를 초과하였습니다");
                    location.href="/admin?pageNum=1";
                }else{
                    location.href="/admin?pageNum="+a;
                }
            });
            $('#admin_member_nextBtn').click(function(){
                var nowPage = $('#inputPage').val();
                nowPage++;
                if(nowPage <= maxPage){
                    location.href="/admin?pageNum="+nowPage;
                }else{
                    location.href="/admin?pageNum=1";
                }
            });
            $('#admin_member_beforeBtn').click(function(){
                var nowPage = $('#inputPage').val();
                nowPage--;
                if(nowPage > 0){
                    location.href="/admin?pageNum="+nowPage;
                }else{
                    location.href="/admin?pageNum="+maxPage;
                }
            });

			
        });
    </script>

</body>
</html>