<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
  <!-- img파일을 불러오기위해 spring taglib사용 -->
  <%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
  <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<%@ include file="./includes/nav.jsp" %>

<!DOCTYPE html>
<html lang="en">



<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>상세보기</title>

    <!-- jQuery -->
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <!-- 구글 폰트 -->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
    <!--fontawesome-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v5.13.0/js/all.js" crossorigin="anonymous"></script>
    <!-- logo googlefont-->
    <link href="https://fonts.googleapis.com/css2?family=Reenie+Beanie&display=swap" rel="stylesheet">

    <!-- CSS / JS 불러오기 -->
    <link rel="stylesheet" href="/resources/css/get.css" />
    <script src="/resources/js/get.js"></script>
    

    

</head>

<script>
/*  */
/* 카운트다운 구현 */
/*  */
/* 참고사이트 https://www.w3schools.com/howto/tryit.asp?filename=tryhow_js_countdown */

//종료기준 일을 구한다.
var countDownDate = new Date("${endTime}").getTime();
console.log(countDownDate);

//1초마다 카운트다운 업데이트 해주기
var x = setInterval(function(){
   
   //현재시간을 구한다.
   var now = new Date().getTime();
   
   //남은 시간을 구해준다.
   var distance = countDownDate - now;
   
    var days = Math.floor(distance / (1000 * 60 * 60 * 24));
    var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
    var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
    var seconds = Math.floor((distance % (1000 * 60)) / 1000);
   
    // ID=showRemaining에 시간표시하기
    document.getElementById("showRemaining").innerHTML = days + "일 " + hours + "시간 "
     + minutes + "분 " + seconds + "초 ";
    // modal에도 시간 표시하기
    document.getElementById("modalShowRemaining").innerHTML = days + "일 " + hours + "시간 "
     + minutes + "분 " + seconds + "초 ";
    
    //종료시간이 지났으면 종료되었다고 표시하기
    if(distance < 0){
       clearInterval(x);
       document.getElementById("showRemaining").innerHTML="종료된 경매";
    }
   },1000);

   




</script>


<body>

    <div id="getPage">
        <div class="wrap">
            <!-- 물품정보 출력 ----------------------------------------------------->
            <div id="main">
                <div id="mainTitle">
                     <p>[<c:out value="${categoryName}"/>] <c:out value="${getData.gname}" /></p> 
                    <hr>
                </div>

                <!-- 왼쪽 패널 : 캐러셀과 포토라마 ------------------------------------->
                <div id="leftPan">
                    <div id="carousel_section">
                        <ul>
                            <li><img src="/img/<c:out value='${thumbImg.uploadpath}'/>/<c:out value='${thumbImg.uuid}'/>_<c:out value='${thumbImg.filename}'/>"></li>
                            <c:forEach items="${imgListData}" var="imgList">
                            <li><img src="/img/<c:out value='${imgList.uploadpath}'/>/<c:out value='${imgList.uuid}'/>_<c:out value='${imgList.filename}'/>"></li>
                            </c:forEach>

                        </ul>
                        <div id="thumbnail">
                            <span id="imgLeftBtn"><i class="fas fa-chevron-left"></i></span>
                            <span id="imgRightBtn"><i class="fas fa-chevron-right"></i></span>
                            <span id="thumbnailSelector1" class="thumbnailSelector"></span>
                            <span id="thumbnailSelector2" class="thumbnailSelector hidden"></span>
                            <span id="thumbnailSelector3" class="thumbnailSelector hidden"></span>
                            <span id="thumbnailSelector4" class="thumbnailSelector hidden"></span>
                         
                            <img src="/img/<c:out value='${thumbImg.uploadpath}'/>/<c:out value='${thumbImg.uuid}'/>_<c:out value='${thumbImg.filename}'/>">
                            
                            <c:forEach items="${imgListData}" var="imgList">
                            <img src="/img/<c:out value='${imgList.uploadpath}'/>/<c:out value='${imgList.uuid}'/>_<c:out value='${imgList.filename}'/>">
                            </c:forEach>
                            <input type="hidden" value="${cntImg}"/>
                            
                            
                        </div>
                    </div>

                </div>
                <!-- 왼쪽 패널 : 캐러셀과 포토라마 -->


                <!-- 오른쪽 패널 : 상품 및 판매자 정보 -------------------------------------------->
                <div id="rightPan">
                    <div id="productInfo">
                        <ul>
                            <li class="infoLeft noColor borderBottom textLeft paddingBottom2 nowPriceFont">현재최고가</li>
                            <li class="infoRight borderBottom floatLeft paddingBottom20">
                                <span class="emphasize">
                        <fmt:formatNumber value="${nowprice}" pattern="#,###" /> 원
                        </span>
                                <span id="timeBox">
                                    <span><i class="far fa-clock"></i></span>
                                    <span style="margin-right: 3px;">남은시간</span>
                                    <span id="showRemaining"></span>
                                </span>
                            </li>
                        </ul>
                        <ul>
                            <li class="infoLeft textLeft">물품번호</li>
                           <li class="infoRight"><c:out value="${getData.gno }" /></li>
                        </ul>
                        <ul>
                            <li class="infoLeft textLeft">경매시간</li>
                            <li class="infoRight"><c:out value="${startTime }" /> ~ <c:out value="${endTime }" /></li>
                        </ul>
                        <ul>
                            <li class="infoLeft textLeft">시작가</li>
                            <li class="infoRight"><fmt:formatNumber value="${getData.startprice}" pattern="#,###" /> 원</li>
                            
                        </ul>
                        <ul>
                            <li class="infoLeft textLeft">입찰단위</li>
                           <li class="infoRight"><fmt:formatNumber value="${getData.divisionprice}" pattern="#,###" /> 원</li>
                        </ul>
                        <ul>
                            <li class="infoLeft textLeft">즉시구매</li>
                            <li class="infoRight"><fmt:formatNumber value="${getData.endprice}" pattern="#,###" /> 원</li>
                        </ul>
                        <ul>
                            <li class="infoLeft textLeft">최고입찰자</li>
                            <li class="infoRight"><c:out value="${highBidder}"></c:out></li>
                        </ul>
                        <ul>
                            <li class="infoLeft textLeft borderBottom">입찰 수</li>
                            <!-- <li class="infoRight borderBottom">3</li> -->
                            <li class="infoRight borderBottom"><c:out value="${countBidder}" /> 명</li>
                        </ul>


                        <ul>
                            <li class="infoLeft textLeft">배송방법</li>
                            <li class="infoRight">택배, 착불</li>
                        </ul>
                        <ul>
                            <li class="infoLeft textLeft">배송비용</li>
                            <li class="infoRight">착불 5,000원</li>
                        </ul>
                        <ul>
                            <li class="infoLeft textLeft borderBottom">묶음배송</li>
                            <li class="infoRight borderBottom"></li>
                        </ul>
                    </div>

                    <div id="salerInfo">
                        <ul>
                            <li class="infoSaleLeft textLeft borderBottom borderTop">판매자ID</li>
                            <li class="infoSaleRight borderBottom borderTop"><c:out value="${getData.registeruserid }" /></li>
                            <li class="infoSaleLeft textLeft borderBottom borderTop">신용도</li>
                            <li class="infoSaleRight borderBottom borderTop">${reliability.rank }</li>
                        </ul>
                        <ul>
                            <li class="infoSaleLeft textLeft borderBottom">구매후기</li>
                            <li class="infoSaleRight borderBottom">
                                <input id="reviewBySeller" type="button" class="infoBtn" value="판매자의 구매후기">
                            </li>
                            <li class="infoSaleLeft textLeft borderBottom">다른물품</li>
                            <li class="infoSaleRight borderBottom">
                                <input id="moreGetBySellerBtn" type="button" class="infoBtn" value="판매자의 다른물품">
                                <input type="hidden" value="<c:out value="${getData.registeruserid }" />">
                            </li>
                        </ul>
                    </div>
                    
					<sec:authentication property="principal" var="registeruser"/>
					<c:if test="${registeruser.username ne getData.registeruserid }">
						<div id="btnZone">
	                        <input type="button" value="입찰하기" id="tenderBtn" class="btn btnMarginLeft">
	                        <input type="button" value="즉시구매" id="nowBuyBtn" class="btn backColorGold">
	                        <input type="button" value="문의하기" id="inquireBtn" class="btn backColorGray">
	                        <input type="hidden" name="highBidder" value="${highBidder}">
	                    </div>
					</c:if>
                    
                </div>
                <!-- 오른쪽 패널 : 상품 및 판매자 정보  -->
            </div>
            <!-- 물품정보 출력 -->

            <hr id="detailInfoHr" class="marginBottom" style="width: 1200px;">

            <!-- 물품 상세정보 (4개의 박스) -------------------------------------->
            <div id="detailInfo">
                <div id="detailNav">
                    <div class="selectBox BoxFirstBorder selected">상품상세</div>
                    <input type="hidden" value="1">
                    <div id="inquireBox" class="selectBox">상품문의</div>
                    <input type="hidden" value="2">
                    <div class="selectBox">배송안내</div>
                    <input type="hidden" value="3">
                    <div class="selectBox">판매자정보</div>
                    <input type="hidden" value="4">
                </div>

                <div id="detailContent">
                   
                    <!-- 상품상세 ------------------------------------------------------------>
                    <div class="box1 contentBox">
                        <h2>상품 상세정보</h2>
                        <pre>
                        
<p id="contentBoxText"><c:out value="${getData.ginfo }"/><p>                
                         
<img class="getGImage" src="/img/<c:out value='${thumbImg.uploadpath}'/>/<c:out value='${thumbImg.uuid}'/>_<c:out value='${thumbImg.filename}'/>">
                          
<c:forEach items="${imgListData}" var="imgList">
<img class="getGImage" src="/img/<c:out value='${imgList.uploadpath}'/>/<c:out value='${imgList.uuid}'/>_<c:out value='${imgList.filename}'/>"><br>
</c:forEach>
                        
                        </pre>
                    </div>
                    <!-- 상품상세 -->


                    <!-- 상품문의 ------------------------------------------------------------>
                    <div class="box2 contentBox hidden">
                        <div id="doInquiry">문의하기</div>
                        <h2>상품문의</h2>
                        <pre>* 구매한 상품의 취소/반품은 마이페이지 구매내역에서 신청 가능합니다.
* 상품문의를 통해 구매 혹은 취소나 환불, 반품 등은 처리되지 않습니다.
* 가격, 판매자, 교환/환불 및 배송 등 해당 상품 자체와 관련 없는 문의는 고객센터 내 1:1 문의하기를 이용해주세요.
* "해당 상품 자체"와 관계없는 글, 양도, 광고성, 욕설, 비방, 도배 등의 글은 예고 없이 이동, 노출제한, 삭제 등의 조치가 취해질 수 있습니다.
* 모두가 볼수있는 공간이므로 전화번호, 메일 주소 등 고객님의 소중한 개인정보는 절대 남기지 말아주세요.
</pre>
     					
     					<div id="inquiry">
     						<c:forEach items="${inquireList}" var="inquireList"> <!-- ${inquireList.gno} -->
     							<c:if test="${inquireList.depth eq 1}">
     								<div class="inquiryBuyer">
		                                <span class="inquiryLeft gray">질문</span>
		                                <span class="inquiryRight">
		                                	<sec:authorize access="isAuthenticated()"> 
			                                	<sec:authentication property="principal" var="registers"/>
							                    <c:if test="${registers.username eq getData.registeruserid }">
			                                		<p class="rereply"style="float: right;">답변하기</p>
			                                		<input type="hidden" value="${inquireList.replyerid}"/>
			                                		<input type="hidden" value="${inquireList.rno}"/>
			                                		<input type="hidden" value="${inquireList.reply}"/>
							                    </c:if>
		                                	</sec:authorize>
		                                    <div class="inquiryId">${inquireList.replyerid}</div>
		                                    <div class="inquiryContent">${inquireList.reply}</div>
		                                </span>
		                            </div>
     							</c:if>
     							<c:if test="${inquireList.depth > 1}">
                            		<div class="inquirySaler">
	     								<span class="inquiryLeft">답변</span>
		                                <span class="inquiryRight">
		                                    <div class="inquiryId">${inquireList.replyerid}</div>
		                                    <div class="inquiryContent">${inquireList.reply}</div>
		                                </span>
		                            </div>
     							</c:if>
     							
                            	
                        	</c:forEach>
     					</div>
     					
     			
						<!-- 
                        <div id="inquiry">
                            <div class="inquiryBuyer">
                                <span class="inquiryLeft gray">질문</span>
                                <span class="inquiryRight">
                                    <div class="inquiryId">moo****k</div>
                                    <div class="inquiryContent">손잡이 부분이 쉽게 손상되지 않을까요?</div>
                                </span>
                            </div>
                            <div class="inquirySaler">
                                <span class="inquiryLeft">답변</span>
                                <span class="inquiryRight">
                                    <div class="inquiryId">mmeg***w</div>
                                    <div class="inquiryContent">같은 재질의 컵을 사용중인데 전혀 이상 없습니다.</div>
                                </span>
                            </div>
                            <div class="inquiryBuyer">
                                <span class="inquiryLeft gray">질문</span>
                                <span class="inquiryRight">
                                    <div class="inquiryId">moo****k</div>
                                    <div class="inquiryContent">손잡이 부분이 쉽게 손상되지 않을까요?</div>
                                </span>
                            </div>
                            <div class="inquirySaler">
                                <span class="inquiryLeft">답변</span>
                                <span class="inquiryRight">
                                    <div class="inquiryId">mmeg***w</div>
                                    <div class="inquiryContent">같은 재질의 컵을 사용중인데 전혀 이상 없습니다.</div>
                                </span>
                            </div>
                             -->
                        </div>
                    </div>
                    <!-- 상품문의 -->


                    <!-- 배송안내 ---------------------------------------------------------------->
                    <div class="box3 contentBox hidden">
                        <!-- 배송안내 출력 -->
                        <div id="deliveryBox1">
                            <h2>배송/반품안내</h2>
                            <ul>
                                <li class="topBorder">배송방법</li>
                                <li class="topBorder">직거래/택배 (구매자 선택)</li>
                                <li class="topBorder">연락방법</li>
                                <li class="topBorder rightBorder">낙찰 후 연락가능한 번호확인가능</li>
                            </ul>
                            <ul>
                                <li>배송비</li>
                                <li>5,000원(택배선택 시, 우체국택배, 낙찰비 포함)</li>
                                <li>배송예정일</li>
                                <li class="rightBorder">입금시기로부터 3근무일 이내(택배선택 시)</li>
                            </ul>
                            <ul>
                                <li>반품지역</li>
                                <li>택배선택시 도서산간 지역은 반송비가 추가될 수 있습니다</li>
                                <li>반품비용</li>
                                <li class="rightBorder">5,000원(택배선택 시, 원인자 제공)</li>
                            </ul>
                            <ul>
                                <li>반품기간</li>
                                <li>수령일 이내 7일 이내를 원칙으로 합니다</li>
                                <li>반품원칙</li>
                                <li class="rightBorder">아래 제한사항을 참고해주세요</li>
                            </ul>
                        </div>
                        <div class="deleveryInfo">
                            <h3><i class="far fa-check-circle"></i> 반품시 주의사항</h3>
                            <p>아래 각 호의 경우에는 반품을 보장 할 수 없습니다.</p>
                            <p>1) 소비자의 책임 있는 사유로 상품등일 멸실/훼손 된 경우</p>
                            <p>2) 소비자의 사용/소비에 의해 상품의 가치가 감소한 경우</p>
                            <p>3) 시간의 경과에 의해 재판매가 곤란할 정도로 가치가 감소한 경우</p>
                            <p>4) 복제가 가능한 상품 등의 포장을 훼손한 경우</p>
                            <p>5) 판매/생산방식의 특성상, 반품 시 판매자에게 회복 할 수 없는 손해가 발생한 경우</p>
                            <a href="http://www.law.go.kr/lsInfoP.do?lsiSeq=203798&efYd=20181213#0000">전자상거래 등에서의 소보자보호에
                                관한 법률 알아보기</a>


                        </div>
                        <div class="deleveryInfo">
                            <h3><i class="far fa-check-circle"></i> 파손물품 반품시 주의사항</h3>
                            <p>물품 수령 시 택배기사와 함께 물품의 파손여부를 확인하신 후,<br>반품 신청시 파손이미지를 등록해주시면 안전하고 신속한 환불이 가능합니다.</p>
                        </div>


                    </div>
                    <!-- 배송안내 -->

                    <!-- 판매자 정보 출력 -->
                    <div class="box4 contentBox hidden">
                        <div id="deliveryBox1">
                            <h2>판매자 <c:out value="${getData.registeruserid }" />님의 이력</h2>
                            <ul>
                                <li class="topBorder">신용도</li>
                                <li class="topBorder">${reliability.rank }</li>
                                <li class="topBorder">판매개시</li>
                                <li class="topBorder rightBorder">${reliability.trying } 회</li>
                            </ul>
                            <ul>
                                <li>거래성공</li>
                                <li>${reliability.success } 회</li>
                                <li>거래취소</li>
                                <li class="rightBorder">${reliability.fail } 회</li>
                            </ul>
                        </div>
                        <div class="deleveryInfo">
                            <h3><i class="far fa-check-circle"></i> 아트옥션의 신용도란?</h3>
                            <p>아트옥션은 판매자의 거래내역을 수치화시켜 거래성공 횟수, 비율에따라 등급을 부여합니다.<br/>
                            	신용도는 주의구간(1~3)과 일반구간(1~7)으로 나누어지며 거래성공의 정도를 나타낼 뿐 판매자의 절대적인 신용도를 나타내지는 못합니다.<br/>
                            	다음 표에서 아트옥션 신용도를 측정하는 기준을 확인하실 수 있습니다.</p>
                            <img src="/resources/img/get/sinyong.PNG" style="margin-left:35px; margin-top:10px;">
                        </div>
                    </div>
                    <!-- 판매자 정보 출력 -->


                </div>
            </div>
            <!-- 물품 상세정보 (4개의 박스) -->
        </div>

    </div>





    <!-- 입찰하기 모달 ----------------------------------------------------------->
    <div id="modalDobid" class="modal hidden">
        <div class="modalBody">
            <div class="modalHeader">
                <span class="modalTitle">입찰하기</span>
                <span class="modalCloseBtn"><i class="fas fa-times"></i></span>
            </div>

            <div class="modalContent">
                <form id="bidForm" action="/get/bid" method="post">
                    <div class="mc">
                        <div class="mcLeft">현재최고가</div>
                        <div class="mcRight"><c:out value="${nowprice }"/> 원</div>
                        <div class="mcLeft">입찰단위</div>
                        <div class="mcRight">1,000 원</div>
                        <div class="mcLeft">남은시간</div>
                        <div class="mcRight" id="modalShowRemaining"></div>
                        <div class="mcLeft">즉시구매가</div>
                        <div class="mcRight"><c:out value="${getData.endprice }" /> 원</div>
                        <sec:authorize access="isAnonymous()">
                        <div class="msg">
                           <h3> <br/>로그인 후 입찰 가능합니다.</h3>
                        </div>
                        </sec:authorize>
                        
                         <sec:authorize access="isAuthenticated()">
                        <input type="hidden" name="tprice" value="<c:out value="${nowprice }"/>">
                        <input type="hidden" name="gno" value="<c:out value="${getData.gno }" />">
                        <input type="hidden" name="userid" value="<sec:authentication property="principal.username"/>">
                        <div class="mcBtnZone">
                           
                        <sec:authentication property="principal" var="pinfo"/>
                  
                      <!-- eq의 반대말이 ne -->
                      <!-- 등록한 본인은 입찰버튼이 보이지 않도록 처리. -->
                      <c:if test="${pinfo.username ne getData.registeruserid }">
                   
                      <input id="nowBuy" type="submit" value="입찰하기" >
                      
                      </c:if>
                      </sec:authorize>
                            
                        </div>
                    </div>
               <!-- 토큰 -->
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                   
                </form>
            </div>

            <div class="modalFooter">

            </div>
        </div>
    </div>
    <!-- 입찰하기 모달 -->






    <!-- 문의하기 모달 modalInquiry ----------------------------------------------->
    <div id="modalInquiry" class="modal hidden">
        <div class="modalBody">
            <div class="modalHeader">
                <span class="modalTitle">문의하기</span>
                <span class="modalCloseBtn"><i class="fas fa-times"></i></span>
            </div>

            <div class="modalContent">
                <div id="inquiryContent">
                    <form id="inquiryForm" action="/get/inquire" method="post">
                       <!-- 토큰 -->
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                        <input type="text" name="replyerid" id="inputInquiryID" placeholder="ID를 입력해주세요" value="<sec:authorize access="isAuthenticated()"><sec:authentication property="principal.username"/></sec:authorize>" style="height:30px; color:gray !important;"/>
                        <input type="text" name="reply" id="inputInquiryContent" placeholder="문의하실 내용을 입력해주세요">
                        <input type="hidden" name="gno" value="${getData.gno}">
                        <%-- <input type="hidden" name="parentno" value="${getData.gno}"> --%>
                        <input type="hidden" name="depth" value="1">
                        <input type="submit" id="inputInquiryBtns" value="아래 내용에 동의하고 문의하기" style="height:45px; !important">
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
    
    
    <!-- 문의 답변하기 모달 ----------------------------------------------->
    <div id="modalInquiryReply" class="modal hidden">
        <div class="modalBody">
            <div class="modalHeader">
                <span class="modalTitle">답변하기</span>
                <span class="modalCloseBtn"><i class="fas fa-times"></i></span>
            </div>

			<sec:authorize access="isAuthenticated()">
	            <div class="modalContent">
	                <div id="inquiryContent">
	                    <form id="inquiryReplyForm" action="/get/inquireReply" method="post">
	                       <!-- 토큰 -->
	                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	                        <input type="hidden" id="replyRno" name="parentno" value="" readonly/>
	                        <input type="hidden" name="replyerid" value="<sec:authentication property="principal.username"/>" readonly/>
	                        <input type="hidden" name="gno" value="<c:out value="${getData.gno }" />"/>
	                        <input type="hidden" name="depth" value="2"/>
	                        
	                        <input type="text" id="replyId" value="" readonly style="height:30px; color:gray !important;"/>
	                        <input type="text" id="replyContent" value="" readonly style="height:30px; color:gray !important;"/>
	                        <input type="text" name="reply" id="inputReplyContent" placeholder="답변하실 내용을 입력해주세요" style="height:100px;">
	                        <%-- <input type="hidden" name="parentno" value="${getData.gno}"> --%>
	                        <input type="hidden" name="depth" value="1">
	                        <input type="submit" id="inputInquiryReplyBtns" value="답변하기" style="height:45px; !important">
	                    </form>
	                </div>
	            </div>        
            </sec:authorize> 



            <div class="modalFooter">

            </div>
        </div>
    </div>
    <!-- 문의답변 하기 모달 -->
    
    
    
    <!-- 즉시구매 모달 ------------------------------------------------>
    <div id="modalNowBuy" class="modal hidden">
        <div class="modalBody">
            <div class="modalHeader" style="background-color: #EC4343;">
                <span class="modalTitle">즉시 구매하기</span>
                <span class="modalCloseBtn"><i class="fas fa-times"></i></span>
            </div>

            <div class="modalContent">
                <form id="bidForm" action="/get/nowBuy" method="post"  onsubmit="return checkNowBuy()">
                    <div class="mc">
                        <div class="mcLeft">현재최고가</div>
                        <div class="mcRight"><c:out value="${nowprice }"/> 원</div>
                        <div class="mcLeft">입찰단위</div>
                        <div class="mcRight">1,000 원</div>
                        <div class="mcLeft">남은시간</div>
                        <div class="mcRight" id="modalShowRemaining"></div>
                        <div class="mcLeft" style="color: red">즉시구매가</div>
                        <div class="mcRight" style="color: red"><c:out value="${getData.endprice }" /> 원</div>
                        <sec:authorize access="isAnonymous()">
                        <div class="msg">
                           <h3>로그인 후 즉시구매가 가능합니다.</h3>
                        </div>
                        </sec:authorize>
                        
                         <sec:authorize access="isAuthenticated()">
                        <input type="hidden" name="tprice" value="<c:out value="${getData.endprice }"/>">
                        <input type="hidden" name="gno" value="<c:out value="${getData.gno }" />">
                        <input type="hidden" name="userid" value="<sec:authentication property="principal.username"/>">
                        <div class="mcBtnZone">
                           
                        <sec:authentication property="principal" var="pinfo"/>
                  
                      <!-- eq의 반대말이 ne -->
                      <!-- 등록한 본인은 입찰버튼이 보이지 않도록 처리. -->
                      <c:if test="${pinfo.username ne getData.registeruserid }">
                   
                      <input id="nowBuy" type="submit" value="즉시구매하기" style="background-color: #EC4343;">
                      
                      </c:if>
                      </sec:authorize>
                            
                        </div>
                    </div>
               <!-- 토큰 -->
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                   
                </form>
            </div>

            <div class="modalFooter" style="background-color: #EC4343;">

            </div>
        </div>
    </div>
    <!-- 즉시구매 모달 -->
    
    

   <%@ include file="./includes/footer.jsp" %>

</body>


<script>
//중복입찰 시 제한하기



//로그인 했을 때 아래 작업 진행하도록 해야 함

<sec:authorize access="isAuthenticated()">    
   $("#nowBuy").on("click", function(e) {
      //현재 로그인한 사용자와 최고액 입찰자가 동일한 경우 return false 시키는 것으로.

      e.preventDefault();

      var loginUser = "";

      loginUser ='<sec:authentication property="principal.username" />';

      var highBidder = $("input[name='highBidder']").val();

      if (loginUser == highBidder) {

         console.log("불가능!!");
         alert("중복입찰이 불가능합니다.");
         return;
      }

      $("#bidForm").submit();

   });

   if ("${getData.flag}" != 0) {
      console.log("${getData.flag}");
      alert("경매가 마감된 상품입니다.");
      history.back();
   }

   </sec:authorize>
   
</script>

</html>