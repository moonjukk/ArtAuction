<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="./includes/nav.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://use.fontawesome.com/releases/v5.11.0/js/all.js"></script>
    <link rel="stylesheet" href="/resources/css/list.css">
    <script src="/resources/js/list.js"></script>
</head>
<body>
    <div id="wrap" class="container" style="margin-top: 80px;">
    	<!-- 검색창 ----------------------------------------------------------------------->
    	
    		<div id = "searchList">
        		<h1>검색</h1>
     	 	  	<div class = "searchList">
       	    		<select id="selectSearchList" name="searchList">
       	    	 		<option value="" selected>검색종류</option>
       		 	      	<option value="goodsName">물품제목</option>
      	  	 	    	<option value="seller">판매자ID</option>
      		  	 	</select>
        		   	<div class = "searchOption">
       	        		<input type="text" name="keyword" class = "searchListText" placeholder="검색어를 입력하세요" value="${pageMaker.cri.keyword}">
       	        		<button class = "searchListButton">검색</button>
      	 	   		</div>
				</div>
			</div> 
    	<!-- 검색창 -->
    
    
    
        <!-- 카테고리---------------------------------------------------------------------->
        <div>
            <h1 class="category1"><c:out value="${category.categoryname}" /><c:if test="${category.categoryname ne '전체보기'}"> 보기</c:if></h1>
            <div class="categoryList">
                <div class="categoryMargin">
            		<c:forEach items="${listCategory}" var="lc">	
    					<div class='category2 ${param.categoryid == lc.categoryid ? " categoryActive" : ""}'><c:out value="${lc.categoryname}"/></div>
    					<input type="hidden" name='categoryid' value="${lc.categoryid}">
    				</c:forEach>
                </div>
            </div>
        </div>
        <!-- 카테고리 -->
        
        

        
        <!-- 드랍목록 ----------------------------------------------------------->
        <div>
            <div class="dropList">
                <div class="dropListLeft">
                    <i class="far fa-check-circle"></i> 모두 <span><c:out value="${pageMaker.total}" /></span>개의 물품이 검색되었습니다 </div>
                <div>
	            	<div class="dropListRight">
						<select class="select2" name="amount">
                            <option value="5" <c:out value="${pageMaker.cri.amount eq '5'?'selected':''}"/>>5개씩</option>
                            <option value="10" <c:out value="${pageMaker.cri.amount eq '10'?'selected':''}"/>>10개씩</option>
                            <option value="20" <c:out value="${pageMaker.cri.amount eq '20'?'selected':''}"/>>20개씩</option>
                            <option value="50" <c:out value="${pageMaker.cri.amount eq '50'?'selected':''}"/>>50개씩</option>
                        </select>
                    </div>
                    	<div class="dropListRight">
                        <select class="select1" name="type">
                            <option value="close" <c:out value="${pageMaker.cri.type eq 'close'?'selected':''}"/>>마감 임박순</option> 
                            <option value="open" <c:out value="${pageMaker.cri.type eq 'open'?'selected':''}"/>>신규 경매순</option>
                            <option value="high" <c:out value="${pageMaker.cri.type eq 'high'?'selected':''}"/>>높은 가격순</option>
                            <option value="low" <c:out value="${pageMaker.cri.type eq 'low'?'selected':''}"/>>낮은 가격순</option>
                        </select>
                        
                    </div>
                </div>
            </div>
        </div>
        <!-- 드랍목록 -->

        <!-- 물품정보 ---------------------------------------------------------->
        <c:forEach items="${list}" var="goods">
        	<div class="list">
            	<div class="goods">
            		<input type="hidden" value="${goods.gno}">
                	<div class="listImg">
                    	<img src='/img/<c:out value="${goods.uploadpath}"/>/<c:out value="${goods.uuid}"/>_<c:out value="${goods.filename}"/>'>
                    	<div class="title">
                    		<c:choose>
							    <c:when test="${fn:length(goods.gname) > 14}">
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
		<div style="float:left; width:100%; height:30px;"></div>



        <!-- 페이지처리 ----------------------------------------------->
        <div class="">
            <div class="page">
                <ul class="pagination">
                    <c:if test="${pageMaker.prev}">
                        <li class="paginate_button">
                        	<a href="${pageMaker.startPage-1}">
                        		<i class="fas fa-angle-left icon-black"></i>
                        	</a>
                        </li>
                    </c:if>
        
                    <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                        <li class='paginate_button  '>
                            <a class='${pageMaker.cri.pageNum == num ? " pageActive" : ""}' href="${num}">${num}</a>
                        </li>              				        
                    </c:forEach>
                     
                    <c:if test="${pageMaker.next}">
                        <li class="paginate_button">
                        	<a href="${pageMaker.endPage+1}">
                        		<i class="fas fa-angle-right icon-black"></i>
                        	</a>
                        </li>
                    </c:if>
                </ul>
            </div>
        </div>
        <form id="actionForm" action="/list" method="get">
        	<input type="hidden" name="searchList" value="${pageMaker.cri.searchList}">
	        <input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
        	<input type="hidden" name='categoryid' value="${param.categoryid}">
        	<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
        	<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
        	<input type='hidden' name='type' value="${pageMaker.cri.type}">
        </form>
        
        <!-- 페이지처리 -->
    </div>
    
    
    
	<%@ include file="./includes/footer.jsp" %>

</body>
</html>