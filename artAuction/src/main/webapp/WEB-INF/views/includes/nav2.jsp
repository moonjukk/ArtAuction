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



<nav>
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
	        $('.goMain').click(function(){
	            location.href="/";
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
	        $('.goService').click(function(){
	            location.href="/service";
	        });
	    });
</script>
  
</nav>