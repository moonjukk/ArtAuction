<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
  <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
    
<%@ include file="./includes/nav.jsp" %>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <title>main</title>

    <!-- jQuery 1.8 or later, 33 KB -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <!-- Fotorama from CDNJS, 19 KB -->
    <link  href="https://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.js"></script>
    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v5.13.0/js/all.js" crossorigin="anonymous"></script>
    <!-- logo googlefont-->
    <link href="https://fonts.googleapis.com/css2?family=Reenie+Beanie&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="resources/css/index.css"/>
    
    
	
</head>

<body>
		
		<script type="text/javascript">
			
		</script>

		
		<script>
			$(document).ready(function(){
				var message='${message}';
				if(message!=""){
					alert(message);
				}

				var params = location.search.substr(location.search.indexOf("?") + 1);
			    var sval = "";
			    params = params.split("&");
			    for (var i = 0; i < params.length; i++) {
			    	sval = params[i].split("=")[1];
			    }
				if(sval=="er1"){
					alert('접근권한이 없습니다.');
				}
				
				$(".list").click(function(){
					var val = $(this).children().eq(0).children().eq(0).val();
					var url = "/get/goods?gno="+val;
					location.href = url;
				});
				
			});
		</script>



  <!-- fotorama------------------------------------------------------>
  <div class="fotorama"data-allowfullscreen="true">
    <img src="/resources/img/main/img01.jpg">
    <img src="/resources/img/main/img02.jpg">
  </div>
  <!-- fotorama-->


  <div class="wrap">
    <!-- 물품정보 ---------------------------------------------------------->
	<div id="messageArea"></div>
    <br><br>
    <div><h1>Art Auction 실시간 추천경매</h1></div>
    <hr class="line">
    
    <!-- 물품정보 ---------------------------------------------------------->
        <c:forEach items="${recommendList}" var="goods">
        	<div class="list">
            	<div class="goods">
            		<input type="hidden" value="${goods.gno}">
                	<div class="listImg">
                    	<img src='/img/<c:out value="${goods.uploadpath}"/>/<c:out value="${goods.uuid}"/>_<c:out value="${goods.filename}"/>'>
                    	<div class="title">
                    		<c:choose>
							    <c:when test="${fn:length(goods.gname) > 11}">
        							<c:out value="${fn:substring(goods.gname,0,11)}"/>...
    							</c:when>
    							<c:otherwise>
        							<c:out value="${goods.gname}"/>
    							</c:otherwise> 
							</c:choose>
						</div>
                	</div>
                	<div class="goodswrap">
                    	<div class="goodswrap1">
                        	<div class="left">시작가</div>
                        	<div class="right"><fmt:formatNumber value="${goods.startprice}" pattern="#,###" /></div>
                    	</div>
                    	<div class="goodswrap2">
                        	<div class="left">현재가</div>
                        	<div class="right"><fmt:formatNumber value="${goods.nowprice}" pattern="#,###" /></div>
                    	</div>
                    	<div class="goodswrap3">
                        	<div class="left">마감</div>
                        	<div class="right">
                        
                        		<fmt:formatDate value="${goods.enddate}" pattern="MM/dd - HH:MM"/>
								
                        	</div>
                    	</div>
                	</div>
                </div>
        	</div>
        </c:forEach>		
        <!-- 물품정보 -->
  </div>
  

<%@ include file="./includes/footer.jsp" %>


</body>
</html>