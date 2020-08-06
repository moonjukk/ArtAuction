<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../includes/nav.jsp" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>아트옥션</title>

    <!-- jQuery -->
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <!-- 구글 폰트 -->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
    <!--fontawesome-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>

    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v5.13.0/js/all.js" crossorigin="anonymous"></script>
    <!-- logo googlefont-->
    <link href="https://fonts.googleapis.com/css2?family=Reenie+Beanie&display=swap" rel="stylesheet">

	<link rel="stylesheet" href="/resources/css/buying.css">
    <script src="/resources/js/buying.js"></script>
    
    <script>
	$(document).ready(function(){
		var message='${message}';
		if(message!=""){
			alert(message);
		}
	});
	</script>

</head>
<body>
    <div id="buyingPage">
        <div class="wrap">
            <div id="main">
                <div id="mainTitle">
                    <p><c:out value="${goodsData.gname}"/></p>
                    <hr>
                </div>
    
    			<!-- /img/2020/07/17/a3b12b65-3803-4bd5-ab3d-d7db612ea66b_pic3.jpg -->
    			
    			
    			
                <div id="leftPan">
                    <div id="carousel_section">
                        <ul>
                            <li> <img src="<c:out value="${thumbImg}"/>"> </li>
                            
                            <c:forEach items="${imgListData}" var="imgList">
    							<li> <img src="/img/<c:out value='${imgList.uploadpath}'/>/<c:out value='${imgList.uuid}'/>_<c:out value='${imgList.filename}'/>"> </li>
    						</c:forEach>
    						
                            <%-- <li> <img src="/img/<c:out value='${imgListData.uploadpath}'/>/<c:out value='${imgListData.uuid}'/>_<c:out value='${imgListData.filename}'/>"> </li> 
                            <li> <img src="img/pic3.jpg"> </li>
                            <li> <img src="img/pic2.jpg"> </li>
                            --%>
                        </ul>
                        <div id="thumbnail">
                            <span id="imgLeftBtn"><i class="fas fa-chevron-left"></i></span>
                            <span id="imgRightBtn"><i class="fas fa-chevron-right"></i></span>
                            <span id="thumbnailSelector1" class="thumbnailSelector"></span>
                            <span id="thumbnailSelector2" class="thumbnailSelector hidden"></span>
                            <span id="thumbnailSelector3" class="thumbnailSelector hidden"></span>
                            <span id="thumbnailSelector4" class="thumbnailSelector hidden"></span>
                            
                            
                            
                            
                            
                            <img src="<c:out value="${thumbImg}"/>" alt="">
                            <c:forEach items="${imgListData}" var="imgList">
    							<img src="/img/<c:out value='${imgList.uploadpath}'/>/<c:out value='${imgList.uuid}'/>_<c:out value='${imgList.filename}'/>">
    						</c:forEach>
                            
                            <input type="hidden" value="${cntImg}"/>
                            
                        </div>
                    </div>
                    
                </div>
    
                <div id="rightPan">
                    <div id="productInfo">
                        <ul>
                            <li class="infoLeft noColor borderBottom textLeft buyingFont1" style="height: 45px !important;">낙찰가</li>
                            <li class="infoRight borderBottom floatLeft" style="height: 45px !important;">
                                <span class="emphasize"><fmt:formatNumber value="${goodsData.tradeprice}" pattern="#,###" />원</span>
                                
                                
                                <c:if test="${goodsData.flag eq '1'.charAt(0)}">
                                	<span id="tradeBox1" class="tradeBox">
                                    	<span>입금대기</span>
                                	</span>
                                </c:if>
                                <c:if test="${goodsData.flag eq '2'.charAt(0)}">
                                	<span id="tradeBox1" class="tradeBox">
                                    	<span>입금대기</span>
                                	</span>
                                </c:if>
                                <c:if test="${goodsData.flag eq '3'.charAt(0)}">
                                	<span id="tradeBox1" class="tradeBox">
                                    	<span>입금대기</span>
                                	</span>
                                </c:if>
                                
                                
                                <c:if test="${goodsData.flag eq '4'.charAt(0)}">
                                	<span id="tradeBox2" class="tradeBox backColorBlue">
                                    	<span>거래 중</span>
                                	</span>
                                </c:if>
                                <c:if test="${goodsData.flag eq '5'.charAt(0)}">
                                	<span id="tradeBox2" class="tradeBox backColorBlue">
                                    	<span>거래 중</span>
                                	</span>
                                </c:if>
                                <c:if test="${goodsData.flag eq '6'.charAt(0)}">
                                	<span id="tradeBox2" class="tradeBox backColorBlue">
                                    	<span>거래 중</span>
                                	</span>
                                </c:if>
                                
                                
                                <c:if test="${goodsData.flag eq '7'.charAt(0)}">
                                	<span id="tradeBox5" class="tradeBox" style="background-color: rgb(0, 0, 0);">
	                                    <span>거래 종료</span>
	                                </span>
                                </c:if>
                                
                                
                                
                                <c:if test="${goodsData.flag eq 'a'.charAt(0)}">
                                	<span id="tradeBox3" class="tradeBox" style="background-color: #a72020;">
	                                    <span>판매자 취소신청</span>
	                                </span>
                                </c:if>
                                <c:if test="${goodsData.flag eq 'b'.charAt(0)}">
                                	<span id="tradeBox3" class="tradeBox" style="background-color: #a72020;">
	                                    <span>구매자 취소신청</span>
	                                </span>
                                </c:if>
                                <c:if test="${goodsData.flag eq 'c'.charAt(0)}">
                                	<span id="tradeBox4" class="tradeBox" style="background-color: rgb(255, 0, 0);">
	                                    <span>거래 취소</span>
	                                </span>
                                </c:if>
                                
                                
                                
                                <c:if test="${goodsData.flag eq 'd'.charAt(0)}">
                                	<span id="tradeBox4" class="tradeBox" style="background-color: rgb(255, 0, 0);">
	                                    <span>응찰자없음</span>
	                                </span>
                                </c:if>
                            </li>
                        </ul>
                        <ul>
                            <li class="infoLeft textLeft">물품번호</li>
                            <li class="infoRight"><c:out value="${goodsData.gno}"/></li>
                        </ul>
                        <ul>
                            <li class="infoLeft textLeft">경매시간</li>
                            <li class="infoRight"><c:out value="${startTime }" /> ~ <c:out value="${endTime }" /></li>
                        </ul>
                        <ul>
                            <li class="infoLeft textLeft">시작가</li>
                            <li class="infoRight"><fmt:formatNumber value="${goodsData.startprice}" pattern="#,###" /> 원</li>
                            
                        </ul>
                        <ul>
                            <li class="infoLeft textLeft">입찰 수</li>
                            <li class="infoRight"><c:out value="${biddingCount}"/>명</li>
                        </ul>
                        <ul>
                            <li class="infoLeft textLeft borderBottom">최고입찰자</li>
                            <li class="infoRight borderBottom">${goodsData.buyinguserid}</li>
                        </ul>
    
                        <!-- 직거래 선택 시(디폴트)-->
                        <ul>
                            <li class="infoLeft textLeft ">거래방법</li>
                            <li class="infoRight ">직거래</li>
                        </ul>
                        <ul>
                            <li class="infoLeft textLeft ">배송방법</li>
                            <li class="infoRight "></li>
                        </ul>
                        <ul>
                            <li class="infoLeft textLeft borderBottom">배송비용</li>
                            <li class="infoRight borderBottom"></li>
                        </ul>
    
                        <!-- 택배선택 시 -->
                        <!--
                        <ul>
                            <li class="infoLeft textLeft">배송방법</li>
                            <li class="infoRight">택배, 착불</li>
                        </ul>
                        <ul>
                            <li class="infoLeft textLeft borderBottom">배송비용</li>
                            <li class="infoRight borderBottom">착불 5,000원</li>
                        </ul>
                        -->
    				<!-- 
    				
                    		<input type="button" value="입금확인" id="depositCheckBtn" class="btn btnZoneBtn btnMarginLeft">
                    		<input type="button" value="거래취소" id="tradeCancelBtn" class="btn btnZoneBtn backColorRed">
                    		<input type="button" value="거래완료" id="tradeCheckBtn" class="btn btnZoneBtn btnMarginLeft backColorBlue">
                    		<input type="button" value="거래취소" id="tradeCancelBtn" class="btn btnZoneBtn backColorRed">
                    		<input type="button" value="입금확인" id="depositCheckBtn" class="btn btnZoneBtn btnMarginLeft">
                    		<input type="button" value="거래취소" id="tradeCancelBtn" class="btn btnZoneBtn backColorRed">
    				 -->
    
                    </div>
                    <div id="btnZone">
                    	<c:if test="${goodsData.flag eq '1'.charAt(0)}">
                    		<input type="button" value="입금확인" id="depositCheckBtn" class="btn btnZoneBtn btnMarginLeft">
                    		<input type="button" value="거래취소" id="tradeCancelBtn" class="btnZoneBtn backColorRed">
                    	</c:if>
                    	<c:if test="${goodsData.flag eq '2'.charAt(0)}">
                    		<input type="button" value="입금확인" id="depositCheckBtn" class="btn btnZoneBtn btnMarginLeft">
                    		<input type="button" value="거래취소" id="tradeCancelBtn" class="btnZoneBtn backColorRed">
                    	</c:if>
                    	<c:if test="${goodsData.flag eq '3'.charAt(0)}">
                    		<input type="button" value="입금확인" id="depositCheckBtn" class="btn btnZoneBtn btnMarginLeft">
                    		<input type="button" value="거래취소" id="tradeCancelBtn" class="btnZoneBtn backColorRed">
                    	</c:if>
                    	<c:if test="${goodsData.flag eq '4'.charAt(0)}">
                    		<input type="button" value="거래완료" id="tradeCheckBtn" class="btn btnZoneBtn btnMarginLeft backColorBlue">
                    		<input type="button" value="거래취소" id="tradeCancelBtn" class="btnZoneBtn backColorRed">
                    	</c:if>
                    	<c:if test="${goodsData.flag eq '5'.charAt(0)}">
                    		<input type="button" value="거래완료" id="tradeCheckBtn" class="btn btnZoneBtn btnMarginLeft backColorBlue">
                    		<input type="button" value="거래취소" id="tradeCancelBtn" class="btnZoneBtn backColorRed">
                    	</c:if>
                    	<c:if test="${goodsData.flag eq '6'.charAt(0)}">
                    		<input type="button" value="거래완료" id="tradeCheckBtn" class="btn btnZoneBtn btnMarginLeft backColorBlue">
                    		<input type="button" value="거래취소" id="tradeCancelBtn" class="btnZoneBtn backColorRed">
                    	</c:if>
                    	<%-- <c:if test="${goodsData.flag eq '7'.charAt(0)}">
                    	</c:if> --%>
                    	<c:if test="${goodsData.flag eq 'a'.charAt(0)}">
                    		<input type="button" value="거래취소" id="tradeCancelBtn" class="btnZoneBtn backColorRed fullSizeBtn">
                    	</c:if>
                    	<c:if test="${goodsData.flag eq 'b'.charAt(0)}">
                    		<input type="button" value="거래취소" id="tradeCancelBtn" class="btnZoneBtn backColorRed fullSizeBtn">
                    	</c:if>
                    	<%-- <c:if test="${goodsData.flag eq 'c'.charAt(0)}">
                    	</c:if>
                    	<c:if test="${goodsData.flag eq 'd'.charAt(0)}">
                    	</c:if> --%>
                    </div>
                </div>
            </div>
            
            <hr id="detailInfoHr" class="marginBottom" style="width: 1200px;">
    
            <div id="tradeBar">
                <c:if test="${goodsData.flag eq '1'.charAt(0)}">
                	<h3>거래상태</h3>
	                <div id="tradeBar1" class="tradeBarColor"><span>입금대기</span></div>
	                <div id="tradeBar2"><span>거래중</span></div>
	                <div id="tradeBar4"><span>거래종료</span></div>
                </c:if>
                <c:if test="${goodsData.flag eq '2'.charAt(0)}">
                	<h3>거래상태</h3>
	                <div id="tradeBar1" class="tradeBarColor"><span>입금대기</span></div>
	                <div id="tradeBar2"><span>거래중</span></div>
	                <div id="tradeBar4"><span>거래종료</span></div>
                </c:if>
                <c:if test="${goodsData.flag eq '3'.charAt(0)}">
                	<h3>거래상태</h3>
	                <div id="tradeBar1" class="tradeBarColor"><span>입금대기</span></div>
	                <div id="tradeBar2"><span>거래중</span></div>
	                <div id="tradeBar4"><span>거래종료</span></div>
                </c:if>
                <c:if test="${goodsData.flag eq '4'.charAt(0)}">
                	<h3>거래상태</h3>
	                <div id="tradeBar1" class="tradeBarColor"><span>입금대기</span></div>
	                <div id="tradeBar2" class="tradeBarColor"><span>거래중</span></div>
	                <div id="tradeBar4"><span>거래종료</span></div>
                </c:if>
                <c:if test="${goodsData.flag eq '5'.charAt(0)}">
                	<h3>거래상태</h3>
	                <div id="tradeBar1" class="tradeBarColor"><span>입금대기</span></div>
	                <div id="tradeBar2" class="tradeBarColor"><span>거래중</span></div>
	                <div id="tradeBar4"><span>거래종료</span></div>
                </c:if>
                <c:if test="${goodsData.flag eq '6'.charAt(0)}">
                	<h3>거래상태</h3>
	                <div id="tradeBar1" class="tradeBarColor"><span>입금대기</span></div>
	                <div id="tradeBar2" class="tradeBarColor"><span>거래중</span></div>
	                <div id="tradeBar4"><span>거래종료</span></div>
                </c:if>
                <c:if test="${goodsData.flag eq '7'.charAt(0)}">
                	<h3>거래상태</h3>
	                <div id="tradeBar1" class="tradeBarColor"><span>입금대기</span></div>
	                <div id="tradeBar2" class="tradeBarColor"><span>거래중</span></div>
	                <div id="tradeBar4" class="tradeBarColor"><span>거래종료</span></div>
                </c:if>
            </div>
            
    
            <!-- 구매자/판매자 정보 -------------------------------------->
            <div id="traderInfo">
                <div>
                    <h3>판매자정보</h3>
                    <ul>
                        <li class="traderInfoLeft traderInfoBorderTop">아이디</li>
                        <li class="traderInfoBorderTop">${salerInfo.userid}</li>
                    </ul>
                    <ul>
                        <li class="traderInfoLeft">이름</li>
                        <li>${salerInfo.username}</li>
                    </ul>
                    <ul>
                        <li class="traderInfoLeft">전화번호</li>
                        <li>
                        	<span>${salerInfo.userphonenum}</span>
                            <input type="hidden" value="${salerInfo.userphonenum}">
                            <input id="callTheChitBtn" class="theChitBtn" type="button" value="인터넷사기 조회">
                        </li>
                    </ul>
                    <ul>
                        <li class="traderInfoLeft">계좌번호</li>
                        <li>
                            <span id="bankInfo">${salerInfo.bankname}</span>
                            <span>${salerInfo.bankaccount}</span>
                            <input type="hidden" value="${salerInfo.bankaccount}">
                            <input id="backTheChitBtn" class="theChitBtn" type="button" value="계좌유효성 조회">
                        </li>
                    </ul>
                </div>
                <div>
                    <h3>구매자정보</h3>
                    <ul>
                        <li class="traderInfoLeft traderInfoBorderTop">아이디</li>
                        <li class="traderInfoBorderTop">${buyerInfo.userid}</li>
                    </ul>
                    <ul>
                        <li class="traderInfoLeft">이름</li>
                        <li>${buyerInfo.username}</li>
                    </ul>
                    <ul>
                        <li class="traderInfoLeft">전화번호</li>
                        <li>${buyerInfo.userphonenum}</li>
                    </ul>
                </div>
            </div>
            <!-- 구매자/판매자 정보 -->
        </div>
    
    
        <div class="infoBox">
            <h3>거래 주의사항</h3>
            <div>
                <span>
                    안전한 거래를 위해서는
                    반드시 본 사이트의 <a href="#">매매보호서비스</a>를 이용해 주시기 바라며,<br>
                    직거래, 가격흥정 등으로 피해가 발생했을 경우에는 해당 당사자에게 책임이 있습니다<br>
                    본 사이트는, 중간 플랫폼만 제공하는 서비스로 판매자와 구매자 개인간의 직거래에서 발생한 피해에 책임을 지지 않습니다.
                </span>
            </div>
        </div>
    
        <div class="infoBox">
            <h3>상담안내</h3>
            <div>
                <span>
                    고객센터 : 02)123-4567~9<br>
                     * 법정공휴일을 제외한 오전8시~오후8시 고객센터 전화상담을 운영 합니다<br>
                     * 12시~1시에는 전화량이 많아 대기시간이 길어질 수 있습니다
                </span>
            </div>
        </div>
        
        <div class="infoBox">
            <h3>관련법률</h3>
            <div>
                <span>
                    1) 전자금융거래법 <a href="http://www.law.go.kr/lsInfoP.do?lsiSeq=193469&efYd=20171019#0000">바로가기</a><br>
                    2) 전자금융거래법 시행령 <a href="http://www.law.go.kr/lsInfoP.do?lsiSeq=217803&efYd=20200428#0000">바로가기</a><br>
                    3) 할부거래에 관란 법률  <a href="http://www.law.go.kr/lsInfoP.do?lsiSeq=206438&efYd=20190701#0000">바로가기</a><br><br>
                </span>
            </div>
        </div>
    
    


        <!-- 문의하기 모달 modalInquiry ----------------------------------------------->
        <div id="modalInquiry" class="modal hidden">
            <div class="modalBody">
                <div class="modalHeader">
                    <span class="modalTitle">문의하기</span>
                    <span class="modalCloseBtn"><i class="fas fa-times"></i></span>
                </div>
    
                <div class="modalContent">
                    <div id="inquiryContent">
                        <form>
                            <input type="text" value="사용자ID" readonly>
                            <input type="text" id="inputInquiryContent" placeholder="문의하실 내용을 입력해주세요">
                            <input type="button" id="inputInquiryBtn" value="아래 내용에 동의하고 문의하기">
                            <p>
                                * 본 경매와 관련없는 부적절한 내용인 경우 사이트관리자에 의해 삭제 될 수 있습니다.
                                <br>
                                * 허위사실로 본 경매에 피해를 끼치는 경우 처벌의 대상이 될 수 있습니다.
                            </p>
                        </form>
                    </div>
                </div>
                
    
                <div class="modalFooter">
    
                </div>
            </div>
        </div>
        <!-- 문의하기 모달 -->
    </div>
    
    
	
	<input type="hidden" id="getFlag" value="${goodsData.flag}"/>
    <input type="hidden" id="getSalerId" value="${salerInfo.userid}"/>
    <input type="hidden" id="getBuyerId" value="${buyerInfo.userid}"/>
    <input type="hidden" id="getId" value="<sec:authentication property='principal.username'/>"/>
    <input type="hidden" id="getGno" value="${goodsData.gno}"/>
                    
	<form action="/deal/action" method="post" class="hidden">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	</form>		
                    
    <script>
		var flag = $('#getFlag').val();
		var salerId = $('#getSalerId').val();
		var buyerId = $('#getBuyerId').val();
		var Id = $('#getId').val();
		var gno = $('#getGno').val();
	</script>
	
	
	<%@ include file="../includes/footer.jsp" %>
	
</body>
</html>