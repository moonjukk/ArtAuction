<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ include file="../includes/nav.jsp" %>


<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>customercenter</title>

<!-- jQuery 1.8 or later, 33 KB -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

<!-- logo googlefont-->
<link href="https://fonts.googleapis.com/css2?family=Reenie+Beanie&display=swap" rel="stylesheet">

<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.13.0/js/all.js" crossorigin="anonymous"></script>

	
<link rel="stylesheet" href="../resources/css/boardlist.css"/>
</head>


<!-- Tab2----------------------------------------------------------->
<div class="nav_tab_menu_container2">
  <button class="nav_tab_menu_btn2" type="button">문의하기</button>
  <button class="nav_tab_menu_btn2" type="button">챗봇</button>
</div>
<!-- Tab2-->

<!--table-------------------------------------------------------------------->

<div class="table1">
<h1>문의하기 <button id='regBtn' type="button" class="btn btn-xs pull-right">
Register New Board</button><br><br></h1>


<table>
<thead>
  <tr>
    <th>번호</th>
    <th>제목</th> 
    <th>작성자</th>
    <th>작성일</th>
    <th>수정일</th>
  </tr>
 </thead>
 <c:forEach items="${list}" var="board">
 
 <tr>
 	<td><c:out value="${board.bno}"/></td>
 	<td><a href='/board/get?bno=<c:out value="${board.bno}"/>'>
 	<c:out value="${board.title}"/></a></td>
 	
 	<td><c:out value="${board.writer}"/></td>
 	<td><fmt:formatDate pattern="yyyy-MM-dd"
 	value="${board.regdate}"/></td>
 	<td><fmt:formatDate pattern="yyyy-MM-dd"
 	value="${board.updateDate}"/></td>
 </tr>
 </c:forEach>
  
</table>
</div>



<script type="text/javascript">
$(document).ready(function(){
	
	var result = '<c:out value="${result}"/>';
	
	checkModal(result);
	
	history.replaceState({},null,null);
	
	function checkModal(result){
		
		if(result === '' || history.state){
			return;
		}
		if(parseInt(result)>0){
			$(".modal-body").html("게시글"+parseInt(result)+
				"번이 등록되었습니다."	);
		}
		
		$("#myModal").modal("show");
	}
		$("#regBtn").on("click",function(){
			self.location="/board/register";
		});
});
</script>

