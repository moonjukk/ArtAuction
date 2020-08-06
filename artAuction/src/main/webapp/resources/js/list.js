$(document).ready(function(){
	var actionForm = $("#actionForm");
	var dropListRight = $(".dropListRight");
	var categoryList = $(".categoryList");
	var categoryid = actionForm.find("input[name='categoryid']").val();
	if(categoryid < 0 || (5< categoryid && categoryid< 99) || 99 < categoryid){
		alert("잘못된 카테고리입니다!!");
		var url = '/list';
		location.href = url;
	}
	
	/* 페이지 버튼 클릭시 페이지이동**********/    		
    $(".paginate_button a").on("click",function(e){
		e.preventDefault();
		var searchList = actionForm.find("input[name='searchList']").val();
		var keyword = actionForm.find("input[name='keyword']").val();
		var categoryid = actionForm.find("input[name='categoryid']").val();
		var amount = dropListRight.find("select[name='amount']").val();
		var type = dropListRight.find("select[name='type']").val();
		
		if(searchList != null){
			actionForm.find("input[name='searchList']").val(searchList);
		}
		if(keyword != null){
			actionForm.find("input[name='keyword']").val(keyword);
		}
		if(categoryid == ""){
			categoryid=0;
		}
			
		actionForm.find("input[name='categoryid']").val(categoryid);
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.find("input[name='amount']").val(amount); 
		actionForm.find("input[name='type']").val(type);
		actionForm.submit();
	});
	/* 페이지 버튼 클릭시 페이지이동 */
			
	/* 	드랍박스 선택시 정렬기능 *******************************/
	$(".dropListRight").on("change",function(e){
		var searchList = actionForm.find("input[name='searchList']").val();
		var keyword = actionForm.find("input[name='keyword']").val();
		var categoryid = actionForm.find("input[name='categoryid']").val();
		var pageNum = 1;
		var amount = dropListRight.find("select[name='amount']").val();
		var type = dropListRight.find("select[name='type']").val();
		
		if(searchList != null){
			actionForm.find("input[name='searchList']").val(searchList);
		}
		if(keyword != null){
			actionForm.find("input[name='keyword']").val(keyword);
		}
		if(categoryid == ""){
			categoryid=0;
		}
			
		actionForm.find("input[name='categoryid']").val(categoryid);
		actionForm.find("input[name='pageNum']").val(pageNum);
		actionForm.find("input[name='amount']").val(amount); 
		actionForm.find("input[name='type']").val(type);
		actionForm.submit();
	});
	/* 	드랍박스 선택시 정렬기능 */
	
	/* 카테고리 선택시 카테고리별 리스트 ***********************/
	$(".category2").on("click",function(){
		var categoryid = $(this).next().val();
		var pageNum = 1;
		var amount = dropListRight.find("select[name='amount']").val();
		var type = dropListRight.find("select[name='type']").val();
		
		if(categoryid == ""){
			categoryid=0;
		}
		
		actionForm.find("input[name='searchList']").val("");
		actionForm.find("input[name='keyword']").val("");
		actionForm.find("input[name='categoryid']").val(categoryid);
		actionForm.find("input[name='pageNum']").val(pageNum);
		actionForm.find("input[name='amount']").val(amount); 
		actionForm.find("input[name='type']").val(type);
		actionForm.submit();
	});
	/* 카테고리 선택시 카테고리별 리스트 */
	
	/* 검색버튼 클릭시 키워드별 리스트 **************************/
	$("#searchList button").on("click",function(e){
		if(!$("#searchList").find("option:selected").val()){
			alert("검색종류를 선택하세요");
			return false;
		}
		if(!$("#searchList").find("input[name='keyword']").val()){
			alert("검색어를 입력하세요");
			return false;
		}
		
		e.preventDefault();
		
		var searchList = $("#searchList").find("select[name='searchList']").val();
		var keyword = $("#searchList").find("input[name='keyword']").val();
		var categoryid = 0;
		var pageNum = 1;
		var amount = dropListRight.find("select[name='amount']").val();
		var type = dropListRight.find("select[name='type']").val();
		
		
		actionForm.find("input[name='searchList']").val(searchList);
		actionForm.find("input[name='keyword']").val(keyword);
		actionForm.find("input[name='categoryid']").val(0);
		actionForm.find("input[name='pageNum']").val(pageNum);
		actionForm.find("input[name='amount']").val(amount); 
		actionForm.find("input[name='type']").val(type);
		actionForm.submit();
	});
	/* 검색버튼 클릭시 키워드별 리스트 */
	
	
	
	
	$(".list").click(function(){
		var val = $(this).children().eq(0).children().eq(0).val();
	    var url = "/get/goods?gno="+val;
	    location.href = url;
	});
});