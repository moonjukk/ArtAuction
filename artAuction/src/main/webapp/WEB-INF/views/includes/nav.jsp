<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>



<!-- jQuery 1.8 or later, 33 KB -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

<!-- logo googlefont-->
<link href="https://fonts.googleapis.com/css2?family=Reenie+Beanie&display=swap" rel="stylesheet">

<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.13.0/js/all.js" crossorigin="anonymous"></script>
	
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
	
	
<style>

body{
	margin: 0;
	padding:0;
    overflow-x: hidden;
}

.NavTagHidden{
	display:none;
}

nav{
min-width: 1200px;
    
}
.nav ul{
  width: 100%;
  margin-top: auto;
  line-height: 40px;
  background-color: rgb(70,70,70);
  text-align: right;
  height: 43px;
  font-size: 13px;
}
.nav ul div{
    margin-right: 70px;
}

.nav ul div li{
  display:inline;
  border-left: 1px solid #999;
  padding:0 10px;
  color: white;
}

.nav li:first-child{border-left:none;}

.nav ul div li a{
    text-decoration: none;
    color: white;
    font-weight: 100;
    font-size: 14px;  
    
}

.nav{
    min-width: 1200px;
    
}

.nav1{
  color: white;
  float: left;
  margin-left: 20px;
  font-size: 13px;
  
}


#navButton {
  background:none;
  border:0;
  outline:0;
  cursor:pointer;
}

.nav_tab_menu_container {
  display:flex;
  min-width: 1200px;
  border-bottom: 1px solid rgb(179, 179, 179);
}

.nav_tab_menu_btn {
  width:100%;
  height:70px;
  transition:0.3s all;
  border: 0;
  outline: 0;
  background-color:white;
  margin-top: 10px;
  cursor: pointer;
  font-size: 15px;

}

.nav_tab_menu_btn:hover {
  background-color: rgb(138, 138, 138);
  color: white;
}

.nav_tab_box {
  display:none;
  padding:80px;
}
.nav_tab_box.on {
  display:none;
}

.navLogo{
    width: 100%;
    height: 90px;
font-size: 50px;
margin-left: 60px;
}

#navLogoImg{
    cursor: pointer;
    margin-top: 10px;
} 
#navSearcher{
    float: right;
    margin-right: 130px;
    margin-top: 20px;
    height: 35px;
    
    
}
#navSearcher select{
    float: left;
    height: 100%;
    border: 1px solid rgb(126, 126, 126);
    border-radius: 3px;
    margin-right: 7px;
    font-size:small;
}
#navSearcher input{
    float: left;
    width: 200px;
    height: 88%;
    border: 1px solid rgb(126, 126, 126);
    border-radius: 3px;
    padding-left: 7px;
    
}
#navSearcher button{
    float: left;
    height: 100%;
    width: 60px;
    background-color: rgb(236, 236, 236);
    border: 1px solid rgb(126, 126, 126);
    border-radius: 3px;
}
#navSearcher button:hover{
	background-color: rgb(216, 216, 216);
}

.LogoText{
font-family: 'Reenie Beanie', cursive;
font-size: 35px;
position: absolute;
margin-top: 25px;
margin-left: 140px;
}

#select{
  width:80px;
  height:37px;
}

.button{
  border: 1px solid rgb(112, 112, 112);
  
  padding: 7px;
}

.cursor{
	cursor:pointer;
}

#navAlarm{
	color: yellow;
}
	
</style>

<script>
	    $(document).ready(function(){
	    	
			<sec:authorize access="isAuthenticated()">
				let sock = new SockJS("http://localhost:8181/echo");
				socketOpen = '1';
				
				sock.onmessage = onMessage;
				sock.onclose = onClose;
				
				// 서버로부터 메시지를 받았을 때
				function onMessage(msg) {
					var data = msg.data;
					$("#alarmZone").append('<i id="navAlarm" class="fas fa-exclamation-circle "></i>');
					$("#navAlarm").removeClass("NavTagHidden");
				}
				// 서버와 연결을 끊었을 때
				function onClose(evt) {
				}
            </sec:authorize>
	    });
</script>

<nav>
	<sec:authorize access="isAnonymous()">
		<div class="nav">
        <ul>
          <span class="nav1">
              <i class="fas fa-unlock"></i>
              &nbsp;로그인을 하시면 다양한 정보를 보실 수 있습니다.</span>
          <div>
            <li><a href="" class="nav2" >Art Auction이 처음이신가요?</a></li>
            <li><a href="/member/customLogin" class="nav2" >로그인</a></li>
            <li><a href="/member/join" class="nav2" >회원가입</a></li>
          </div>
      	</ul>
  		</div>
	</sec:authorize>
	<sec:authorize access="isAuthenticated()">
		<div class="nav">
        <ul>
          <div>
                <li><i class="fas fa-user-circle" style="font-size: 20px;"></i> <sec:authentication property="principal.username"/>님 환영합니다</li>
                <li>
                	<sapn id="alarmZone">
                		
                	</sapn>
                	<a href="/mypage/home" class="nav2" >
                		마이페이지
                	</a>
                </li>
                <sec:authorize access="hasRole('ROLE_ADMIN')">
			         <li><a href="/admin" class="nav2" style="color: red">시스템관리</a></li>
				</sec:authorize>
                <form id="_nav_logoutForm" action="/member/customLogout" method='post'>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <button class="cursor">로그아웃</button>
                </form>
            </div>
      	</ul>
  		</div>
	</sec:authorize>
	
	<style>
	      #_nav_logoutForm{
	          float: right;
	          width: 80px;
	      }
	      #_nav_logoutForm button{
	          padding-left: 8px;
	          padding-right: 8px;
	          height: 30px;
	          border: 1px solid white;
	          margin-top: 6px;
	          background-color: rgb(70,70,70);
	          color: white;
	      }
	  </style>
  <!--Logo------------------------------------------------------->


  <div class="LogoText">Art Auction</div>

  <div class="navLogo">
      
    <span>
        <img id="navLogoImg" src="/resources/img/nav/logo.png">
    </span>
    
	<style>
		#navSearcher #navInputTxt{
			height: 35px;
			width: 250px;
			margin-right: 5px;
			padding-left: 5px;
		}
	</style>
    <div id="navSearcher">
          <select id="select">
              <option value="" selected>검색종류</option>
              <option value="goodsName">물품제목</option>
              <option value="seller">판매자ID</option>
          </select>
          <input id="navInputTxt" type="text" placeholder="검색어를 입력하세요."></input>
          <button id="navButton">검색</button>     
  
    </div>
    </div>

<!-- Tab---------------------------------------------------------->
  <div class="nav_tab_menu_container">
    <button class="nav_tab_menu_btn goMain" type="button">메인화면</button>
    <button class="nav_tab_menu_btn goList" type="button">진행중경매</button>
    <button class="nav_tab_menu_btn goRegist" type="button">물품등록</button>
    <button class="nav_tab_menu_btn goService" type="button">고객센터</button>
    <button class="nav_tab_menu_btn goFaq" type="button">FAQ</button>
  </div>
  <!--tab-->
  
<script>
	    $(document).ready(function(){
	    	
	        $('#navLogoImg').click(function(){
	        	location.href = "/";
	        });
	        $('#navButton').click(function(){
	            var searchList = $('#select').find(":selected").val();
	            var keyword = $('#navInputTxt').val();
	            if(!searchList){
	    			alert("검색종류를 선택하세요");
	    			return false;
	    		}
	    		if(!keyword){
	    			alert("검색를 입력하세요");
	    			return false;
	    		}
	            location.href = "/list?searchList="+searchList+"&keyword="+keyword+"&categoryid=0&pageNum=1&amount=10&type=close";
	        });
	        $('.goList').click(function(){
	            location.href="/list";
	        });
	        $('.goRegist').click(function(){
	            location.href="/register/goods";
	        });
	        $('.goFaq').click(function(){
	            location.href="/faq";
	        });
	        $('.goBoard').click(function(){
	            location.href="/board/list";
	        });
	        $('.goMain').click(function(){
	            location.href="/";
	        });
	        $('.goService').click(function(){
	            location.href="/service";
	        });
	    });
</script>
  
</nav>