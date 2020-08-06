<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<%@ include file="../includes/nav2.jsp" %>

<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지</title>
    <!-- bootstrap -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
   <!-- Font Awesome icons (free version)-->
   <!--  <script src="https://use.fontawesome.com/releases/v5.12.1/js/all.js" crossorigin="anonymous"></script> -->
    <!-- jQuery -->
   <!--  <script src="https://code.jquery.com/jquery-3.5.1.min.js"
        integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>  -->

	 <!-- CSS / JS 불러오기 -->
    <link rel="stylesheet" href="/../resources/css/mypage.css" />
    <script src="/../resources/js/mypage.js"></script>
    

</head>
<body>


<body>
    <div class="wrap">
        <!-- 마이페이지 첫번째 줄 --------------------------------------->
        <div id="box1" class="box">
            <h2>마이페이지</h2>

            <div id="mypage" class="row">
                <!-- 첫번째줄 왼쪽 칸 ----------------------------------------->
                <div class="col-xl-3 col mypageCol mypage-1">
                    <div class="row">
                        <div id="name" class="col-sm-6">
             			<c:out value="${userInfo.username}" /> 님          
                        </div>
                        <div id="msg" class="col-sm-6">쪽지[0건]</div>
                    </div>

                    <div class="row info">
                        <button class="infoBtn changeMyInfo" >회원정보 수정</button>
                        <button class="infoBtn">회원등급 안내</button>
                    </div>
                </div>
                <!-- 첫번째줄 왼쪽 칸 -->

                <!-- 가운데 E-money 칸 ----------------------------------------------->
                <div id="eMoneyBox" class="col-xl-3 col mypageCol">
                    <div class="row">
                        <div id="eMoney" class="col-sm-6">E-Money</div>
                        <div id="eMoneyCash" class="col-sm-6">0원</div>
                    </div>
                    <div class="row info">
                        <button class="eMoneyBtn">충전</button>
                        <button class="eMoneyBtn">출금</button>
                    </div>
                </div>
                <!-- 가운데 E-money 칸 -->

                <!-- 첫번째줄 오른쪽 버튼칸 ------------------------------>
                <div class="col-xl-6 col mypageCol mypage-3">
                    <ul id="infoBtnHover">

                        <li id="myInfoModifyBtn" class="changeMyInfo">
                            <span class="fa-stack fa-2x ">
                                <i class="far fa-circle fa-stack-2x iconOutline"></i>
                                <i class="far fa-clipboard fa-stack-1x icon"></i>
                            </span>
                            <br>내정보수정
                        </li>

                        <li id="creditWorthinessBtn"> <span class="fa-stack fa-2x ">
                                <i class="far fa-circle fa-stack-2x iconOutline"></i>
                                <i class="fas fa-chart-line fa-stack-1x icon"></i>
                            </span><br>신용도</li>

                        <li id="msgBoxBtn"> <span class="fa-stack fa-2x ">
                                <i class="far fa-circle fa-stack-2x iconOutline"></i>
                                <i class="far fa-envelope fa-stack-1x icon"></i>
                            </span><br>쪽지함</li>

                        <li id="todayGoodsBtn"> <span class="fa-stack fa-2x ">
                                <i class="far fa-circle fa-stack-2x iconOutline"></i>
                                <i class="far fa-bookmark fa-stack-1x icon"></i>
                            </span><br>오늘본 상품</li>

                        <li id="interestGoodsBtn"> <span class="fa-stack fa-2x ">
                                <i class="far fa-circle fa-stack-2x iconOutline"></i>
                                <i class="far fa-heart fa-stack-1x icon"></i>
                            </span><br>관심물품</li>

                    </ul>
                </div>
                <!-- 첫번째줄 오른쪽 버튼칸 -->
            </div>
        </div>
        <!-- 마이페이지 첫번째 줄 -->

        <!-- 입찰현황 ------------------------------------------->
        <div id="box2" class="box">
            <h3>입찰 현황</h3>
            <div class="topline">
				<c:forEach items="${userTradeGoodsInfo}" var="userTradeGoodsInfo">
					<div class="row outline">
						
							<!-- image칸 -->
							<div class="listInfo ">
							<!-- <div class="col-lg-2 "> -->
								<img src='/img/<c:out value="${userTradeGoodsInfo.uploadpath}"/>/<c:out value="${userTradeGoodsInfo.uuid}"/>_<c:out value="${userTradeGoodsInfo.filename}"/>'>
							</div>
							<!-- 상품정보 -->
							 <div class="listInfo">
							<!-- <div class="col-lg-4"> -->
								<div class="listInfo-2">
									<h6><c:out value="${userTradeGoodsInfo.gname}" /></h6>
								현재 최고가 : <fmt:formatNumber value="${userTradeGoodsInfo.nowprice}" pattern="#,###" />원<br> 마감일 : <fmt:formatDate value="${userTradeGoodsInfo.enddate}" pattern="YYYY년 MM월 dd일 HH:MM"/> 까지
								</div>
							</div>
							<!-- 입력가격 -->
							<div class="listInfo bidPrice">
								<p>나의 응찰가 : <fmt:formatNumber value="${userTradeGoodsInfo.tprice}" pattern="#,###" /> 원</p>
							</div>
							<!-- 상세보기 버튼 -->
							<div class="listInfo PgetBtn">
								<button class="getBtn getBidBtn">상세보기</button>
								<input type="hidden" name="getGno" value="<c:out value="${userTradeGoodsInfo.gno }"/>">
							</div>
						
					</div>
				</c:forEach>
			</div>
        </div>
        
        <!-- 입찰현황 -->

        <!-- 구매현황 ---------------------------------------------->
		<div id="box3" class="box">
			<h3>구매현황</h3>
			<div class="row">
				<div class="col-md-12 text-center buyingtable">
					<table>
						<colgroup>
							<col width="20%">
							<col width="20%">
							<col width="20%">
							<col width="20%">
							<col width="20%">
						</colgroup>
						<thead>
							 <tr>
								<th colspan="4" class="tableHead text-center borderLine">구매 진행</th>
								<th colspan="1" class="tableHead text-center">구매 취소</th>
							</tr> 
							<tr class="text-center tableSub ">
								<td>전  체</td>
								<td>입금대기</td>
								<td>거래중</td>
								<td class="borderLine">거래완료</td>
								<td>거래취소</td>
							</tr>
						</thead>
						<tbody>
							<tr class="text-center">
								
								<td id="buySelect1" class="point" ><c:out value="${buyTotal}" /></td>
								<td id="buySelect2" class="" ><c:out value="${buyWaitCount}" /></td>
								<td id="buySelect3" class="" ><c:out value="${buyTradingCount}" /></td>
								<td id="buySelect4" class="borderLine" ><c:out value="${buysuccessCount}" /></td>
								<td id="buySelect5" class=""><c:out value="${buyCancelCount}" /></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<!-- LIST ------------------------------------------>

				<!-- select 첫번째 -------------------------------------->
				<div id="buySelect1_list" class="">			
					<c:forEach items="${userBuyingGoodsInfo}" var="userBuyingGoodsInfo">
						<div class="row outline">
	
							<!-- image칸 -->
							<div class="listInfo ">
	
								<img src='/img/<c:out value="${userBuyingGoodsInfo.uploadpath}"/>/<c:out value="${userBuyingGoodsInfo.uuid}"/>_<c:out value="${userBuyingGoodsInfo.filename}"/>'>
							</div>
							<!-- 상품정보 -->
							<div class="listInfo">
								<!-- 현재 상태에 따라 flag 표시 -->
								<div class="listInfo-2">
									
									<c:if test="${userBuyingGoodsInfo.flag eq '1'.charAt(0)}">
										<span class="flagWait">입금대기</span>
									</c:if>
									
									<c:if test="${userBuyingGoodsInfo.flag eq '2'.charAt(0)}">
										<span class="flagWait">입금대기</span>
									</c:if>
									
										<c:if test="${userBuyingGoodsInfo.flag eq '3'.charAt(0)}">
										<span class="flagWait">입금대기</span>
									</c:if>
									
									<c:if test="${userBuyingGoodsInfo.flag eq '4'.charAt(0)}">
										<span class="flagIng">거래중</span>
									</c:if>
									
									<c:if test="${userBuyingGoodsInfo.flag eq '5'.charAt(0)}">
										<span class="flagIng">거래중</span>
									</c:if>
									<c:if test="${userBuyingGoodsInfo.flag eq '6'.charAt(0)}">
										<span class="flagIng">거래중</span>
									</c:if>
									<c:if test="${userBuyingGoodsInfo.flag eq '7'.charAt(0)}">
										<span class="flagSuccess">거래완료</span>
									</c:if>
								
									
									<span>
										<c:out value="${userBuyingGoodsInfo.gname}" />
									</span> 
									
									<br>
									<div class="endDate">
										마감일 :
										<fmt:formatDate value="${userBuyingGoodsInfo.enddate}"
											pattern="YYYY년 MM월 dd일 HH:MM" />
										까지
									</div>
								</div>
							</div>
							
							<!-- 입력가격 ---------------------------->
							<div class="listInfo bidPrice">
								<p>
									낙찰가 :
									<fmt:formatNumber value="${userBuyingGoodsInfo.tradeprice}"
										pattern="#,###" />
									원
								</p>
							</div>
							<!-- 상세보기 버튼 -------------------------->
							<div class="listInfo PgetBtn">
								<button class=" getBtn getBuyBtn">상세보기</button>
								<input type="hidden" name="getGno" value="<c:out value="${userBuyingGoodsInfo.gno }"/>">
							</div>
	
						</div>
					</c:forEach>
				</div>	
				<!-- select 첫번째 -->
				
				<!-- select 두번째 -------------------------------------->
				<div id="buySelect2_list" class="hidden">			
					<c:forEach items="${buyWait}" var="buyWait">
						<div class="row outline">
	
							<!-- image칸 -->
							<div class="listInfo ">
	
								<img src='/img/<c:out value="${buyWait.uploadpath}"/>/<c:out value="${buyWait.uuid}"/>_<c:out value="${buyWait.filename}"/>'>
							</div>
							<!-- 상품정보 -->
							<div class="listInfo">
								<!-- 현재 상태에 따라 flag 표시 -->
								<div class="listInfo-2">
									
									<c:if test="${buyWait.flag eq '1'.charAt(0)}">
										<span class="flagWait">입금대기</span>
									</c:if>
									
									<c:if test="${buyWait.flag eq '2'.charAt(0)}">
										<span class="flagWait">입금대기</span>
									</c:if>
									
									<c:if test="${buyWait.flag eq '3'.charAt(0)}">
										<span class="flagWait">입금대기</span>
									</c:if>
									
									<span>
										<c:out value="${buyWait.gname}" />
									</span> 
									
									<br>
									<div class="endDate">
										마감일 :
										<fmt:formatDate value="${buyWait.enddate}"
											pattern="YYYY년 MM월 dd일 HH:MM" />
										까지
									</div>
								</div>
							</div>
							<!-- 입력가격 -->
							<div class="listInfo bidPrice">
								<p>
									낙찰가 :
									<fmt:formatNumber value="${buyWait.tradeprice}"
										pattern="#,###" />
									원
								</p>
							</div>
							<!-- 상세보기 버튼 -->
							<div class="listInfo PgetBtn">
								<button class=" getBtn getBuyBtn">상세보기</button>
								<input type="hidden" name="getGno" value="<c:out value="${buyWait.gno }"/>">
							</div>
	
						</div>
					</c:forEach>
				</div>	
				<!-- select 두번째 -->
			
				<!-- select 세번째 -------------------------------------->
				<div id="buySelect3_list" class="hidden">			
					<c:forEach items="${buyTrading}" var="buyTrading">
						<div class="row outline">
	
							<!-- image칸 -->
							<div class="listInfo ">
	
								<img src='/img/<c:out value="${buyTrading.uploadpath}"/>/<c:out value="${buyTrading.uuid}"/>_<c:out value="${buyTrading.filename}"/>'>
							</div>
							<!-- 상품정보 -->
							<div class="listInfo">
								<!-- 현재 상태에 따라 flag 표시 -->
								<div class="listInfo-2">
									
									<c:if test="${buyTrading.flag eq '4'.charAt(0)}">
										<span class="flagIng">거래중</span>
									</c:if>
									
									<c:if test="${buyTrading.flag eq '5'.charAt(0)}">
										<span class="flagIng">거래중</span>
									</c:if>
									<c:if test="${buyTrading.flag eq '6'.charAt(0)}">
										<span class="flagIng">거래중</span>
									</c:if>
									
									<span>
										<c:out value="${buyTrading.gname}" />
									</span> 
									
									<br>
									<div class="endDate">
										마감일 :
										<fmt:formatDate value="${buyTrading.enddate}"
											pattern="YYYY년 MM월 dd일 HH:MM" />
										까지
									</div>
								</div>
							</div>
							<!-- 입력가격 -->
							<div class="listInfo bidPrice">
								<p>
									낙찰가 :
									<fmt:formatNumber value="${buyTrading.tradeprice}"
										pattern="#,###" />
									원
								</p>
							</div>
							<!-- 상세보기 버튼 -->
							<div class="listInfo PgetBtn">
								<button class=" getBtn getBuyBtn">상세보기</button>
								<input type="hidden" name="getGno" value="<c:out value="${buyTrading.gno }"/>">
							</div>
	
						</div>
					</c:forEach>
				</div>	
				<!-- select 세번째 -->			

				<!-- select 네번째 -------------------------------------->
				<div id="buySelect4_list" class="hidden">			
					<c:forEach items="${buySuccess}" var="buySuccess">
						<div class="row outline">
	
							<!-- image칸 -->
							<div class="listInfo ">
	
								<img src='/img/<c:out value="${buySuccess.uploadpath}"/>/<c:out value="${buySuccess.uuid}"/>_<c:out value="${buySuccess.filename}"/>'>
							</div>
							<!-- 상품정보 -->
							<div class="listInfo">
								<!-- 현재 상태에 따라 flag 표시 -->
								<div class="listInfo-2">
									
									<c:if test="${buySuccess.flag eq '7'.charAt(0)}">
										<span class="flagSuccess">거래완료</span>
									</c:if>
									
									<span>
										<c:out value="${buySuccess.gname}" />
									</span> 
									
									<br>
									<div class="endDate">
										마감일 :
										<fmt:formatDate value="${buySuccess.enddate}"
											pattern="YYYY년 MM월 dd일 HH:MM" />
										까지
									</div>
								</div>
							</div>
							<!-- 입력가격 -->
							<div class="listInfo bidPrice">
								<p>
									낙찰가 :
									<fmt:formatNumber value="${buySuccess.tradeprice}"
										pattern="#,###" />
									원
								</p>
							</div>
							<!-- 상세보기 버튼 -->
							<div class="listInfo PgetBtn">
								<button class=" getBtn getBuyBtn">상세보기</button>
								<input type="hidden" name="getGno" value="<c:out value="${buySuccess.gno }"/>">
							</div>
	
						</div>
					</c:forEach>
				</div>	
				<!-- select 네번째 -->		
				
				<!-- select 다섯번째 -------------------------------------->
				<div id="buySelect5_list" class="hidden">			
					<c:forEach items="${buyCancel}" var="buyCancel">
						<div class="row outline">
	
							<!-- image칸 -->
							<div class="listInfo ">
	
								<img src='/img/<c:out value="${buyCancel.uploadpath}"/>/<c:out value="${buyCancel.uuid}"/>_<c:out value="${buyCancel.filename}"/>'>
							</div>
							<!-- 상품정보 -->
							<div class="listInfo">
								<!-- 현재 상태에 따라 flag 표시 -->
								<div class="listInfo-2">
									
									<c:if test="${buyCancel.flag eq 'a'.charAt(0)}">
										<span class="flagCancel">거래취소</span>
									</c:if>
									<c:if test="${buyCancel.flag eq 'b'.charAt(0)}">
										<span class="flagCancel">거래취소</span>
									</c:if>
									<c:if test="${buyCancel.flag eq 'c'.charAt(0)}">
										<span class="flagCancel">거래취소</span>
									</c:if>
									
									<span>
										<c:out value="${buyCancel.gname}" />
									</span> 
									
									<br>
									<div class="endDate">
										마감일 :
										<fmt:formatDate value="${buyCancel.enddate}"
											pattern="YYYY년 MM월 dd일 HH:MM" />
										까지
									</div>
								</div>
							</div>
							<!-- 입력가격 -->
							<div class="listInfo bidPrice">
								<p>
									낙찰가 :
									<fmt:formatNumber value="${buyCancel.tradeprice}"
										pattern="#,###" />
									원
								</p>
							</div>
							<!-- 상세보기 버튼 -->
							<div class="listInfo PgetBtn">
								<button class=" getBtn getBuyBtn">상세보기</button>
								<input type="hidden" name="getGno" value="<c:out value="${buyCancel.gno }"/>">
							</div>
	
						</div>
					</c:forEach>
				</div>	
				<!-- select 네번째 -->		

			<!-- LIST -->
		</div>
		<!-- 구매현황 -->
        

        <!-- 판매현황 --------------------------------------------->
        <div id="box4" class="box">
            <h3>판매현황</h3>
            <div class="row">
                <div class="col-md-12 text-center buyingtable">
                    <table>
                        <colgroup>
                            <col width="14.28%">
                            <col width="14.28%">
                            <col width="14.28%">
                            <col width="14.28%">
                            <col width="14.28%">
                            <col width="14.28%">
                            <col width="14.28%">
                        </colgroup>
                        <thead>
                           <tr>
                                <th colspan="5" class="tableHead text-center borderLine">판매 진행</th>
                                <th colspan="2" class="tableHead text-center">판매 취소</th>
                            </tr>
                            <tr class="text-center tableSub ">
                            	<td>전  체</td>
                                <td>판매중</td>
                                <td>입금대기</td>
                                <td>거래중</td>
                                <td class="borderLine">거래완료</td>
                                <td>거래취소</td>
                                <td>경매유찰</td>
                            </tr>
                        </thead>
                        <tbody>
                            <tr class="text-center">
                            	<td id="sellSelect1" class="point"><c:out value="${sellTotal}" /></td>
                                <td id="sellSelect2" class=""><c:out value="${sellingCount}" /></td>
                                <td id="sellSelect3" class=""><c:out value="${sellWaitCount}" /></td>
                                <td id="sellSelect4" class=""><c:out value="${sellTradingCount}" /></td>
                                <td id="sellSelect5" class="borderLine"><c:out value="${sellSuccessCount}" /></td>
                                <td id="sellSelect6" class=""><c:out value="${sellCancelCount}" /></td>
                                <td id="sellSelect7" class=""><c:out value="${sellFailCount}" /></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <!-- LIST ------------------------------------------>
			<div>
				<!-- 전체 List 표시 -------------------------------------------->
				<div id="sellSelect1_list" class="">
					<c:forEach items="${userSellGoodsInfo}" var="userSellGoodsInfo">
					<div class="row outline">
						<!-- image칸 -->
						<div class="listInfo ">
							<img src='/img/<c:out value="${userSellGoodsInfo.uploadpath}"/>/<c:out value="${userSellGoodsInfo.uuid}"/>_<c:out value="${userSellGoodsInfo.filename}"/>'>
						</div>
						<!-- 상품정보 -->
						<div class="listInfo">
						<!-- <div class="col-lg-4"> -->
							<div class="listInfo-2">
								<c:if test="${userSellGoodsInfo.flag eq '0'.charAt(0)}">
									<span class="flagBuying">판매중</span>
								</c:if>
									
								<c:if test="${userSellGoodsInfo.flag eq '1'.charAt(0)}">
									<span class="flagWait">입금대기</span>
								</c:if>
								
								<c:if test="${userSellGoodsInfo.flag eq '2'.charAt(0)}">
									<span class="flagWait">입금대기</span>
								</c:if>
								
								<c:if test="${userSellGoodsInfo.flag eq '3'.charAt(0)}">
									<span class="flagWait">입금대기</span>
								</c:if>
								
								<c:if test="${userSellGoodsInfo.flag eq '4'.charAt(0)}">
									<span class="flagIng">거래중</span>
								</c:if>
								
								<c:if test="${userSellGoodsInfo.flag eq '5'.charAt(0)}">
									<span class="flagIng">거래중</span>
								</c:if>
								<c:if test="${userSellGoodsInfo.flag eq '6'.charAt(0)}">
									<span class="flagIng">거래중</span>
								</c:if>
								<c:if test="${userSellGoodsInfo.flag eq '7'.charAt(0)}">
									<span class="flagSuccess">거래완료</span>
								</c:if>
								
								<span><c:out value="${userSellGoodsInfo.gname}" /></span> 
								
								<br>
								<div class="endDate">
									마감일 : <fmt:formatDate value="${userSellGoodsInfo.enddate}" pattern="YYYY년 MM월 dd일 HH:MM"/> 까지
								</div>
							</div>
						</div>
						<!-- 입력가격 -->
						<div class="listInfo bidPrice">
							<c:if test="${userSellGoodsInfo.flag eq '0'.charAt(0)}">
									<p>현재 최고가 : <fmt:formatNumber value="${userSellGoodsInfo.nowprice}" pattern="#,###" />원</p>
							</c:if>
							<c:if test="${userSellGoodsInfo.flag ne '0'.charAt(0)}">
									<p>낙찰가 : <fmt:formatNumber value="${userSellGoodsInfo.tradeprice}" pattern="#,###" />원</p>
							</c:if>
						
							
						</div>
						<!-- 상세보기 버튼 -->
						<div class="listInfo PgetBtn">
							
							<c:if test="${userSellGoodsInfo.flag eq '0'.charAt(0)}">
								<button class="getBtn getBidBtn">상세보기</button>
								<input type="hidden" name="getGno" value="<c:out value="${userSellGoodsInfo.gno }"/>">
							</c:if>
							
							<c:if test="${userSellGoodsInfo.flag ne '0'.charAt(0)}">
								<button class="getBtn getBuyBtn">상세보기</button>
								<input type="hidden" name="getGno" value="<c:out value="${userSellGoodsInfo.gno }"/>">
							</c:if>
							
							
						</div>
					</div>
				</c:forEach>
				</div>
				<!-- 판매중 List 표시 ---------------------->
				
					<div id="sellSelect2_list" class="hidden">
					<c:forEach items="${selling}" var="selling">
					<div class="row outline">
						<!-- image칸 -->
						<div class="listInfo ">
						<!-- <div class="col-lg-2 "> -->
							<img src='/img/<c:out value="${selling.uploadpath}"/>/<c:out value="${selling.uuid}"/>_<c:out value="${selling.filename}"/>'>
						</div>
						<!-- 상품정보 -->
						<div class="listInfo">
						<!-- <div class="col-lg-4"> -->
							<div class="listInfo-2">
							
								<c:if test="${selling.flag eq '0'.charAt(0)}">
									<span class="flagBuying">판매중</span>
								</c:if>
									
								<span><c:out value="${selling.gname}" /></span> 
								
								<br>
								<div class="endDate">
									마감일 : <fmt:formatDate value="${selling.enddate}" pattern="YYYY년 MM월 dd일 HH:MM"/> 까지
								</div>
							</div>
						</div>
						<!-- 입력가격 -->
						<div class="listInfo bidPrice">
							<c:if test="${selling.flag eq '0'.charAt(0)}">
									<p>현재 최고가 : <fmt:formatNumber value="${selling.nowprice}" pattern="#,###" />원</p>
							</c:if>
							<c:if test="${selling.flag ne '0'.charAt(0)}">
									<p>낙찰가 : <fmt:formatNumber value="${selling.tradeprice}" pattern="#,###" />원</p>
							</c:if>
						
							
						</div>
						<!-- 상세보기 버튼 -->
						<div class="listInfo PgetBtn">
							
							<c:if test="${selling.flag eq '0'.charAt(0)}">
								<button class="getBtn getBidBtn">상세보기</button>
								<input type="hidden" name="getGno" value="<c:out value="${selling.gno }"/>">
							</c:if>
							
							<c:if test="${selling.flag ne '0'.charAt(0)}">
								<button class="getBtn getBuyBtn">상세보기</button>
								<input type="hidden" name="getGno" value="<c:out value="${selling.gno }"/>">
							</c:if>
							
							
						</div>
					</div>
				</c:forEach>
				</div>
				<!-- 판매중 List 표시  -->
				
				<!-- 판매 입금대기중List 표시 -------------------------------------------->
					<div id="sellSelect3_list" class="hidden">
					<c:forEach items="${sellWait}" var="sellWait">
					<div class="row outline">
						<!-- image칸 -->
						<div class="listInfo ">
						<!-- <div class="col-lg-2 "> -->
							<img src='/img/<c:out value="${sellWait.uploadpath}"/>/<c:out value="${sellWait.uuid}"/>_<c:out value="${sellWait.filename}"/>'>
						</div>
						<!-- 상품정보 -->
						<div class="listInfo">
						<!-- <div class="col-lg-4"> -->
							<div class="listInfo-2">
							
								<c:if test="${sellWait.flag eq '1'.charAt(0)}">
									<span class="flagWait">입금대기</span>
								</c:if>
								
								<c:if test="${sellWait.flag eq '2'.charAt(0)}">
									<span class="flagWait">입금대기</span>
								</c:if>
								
								<c:if test="${sellWait.flag eq '3'.charAt(0)}">
									<span class="flagWait">입금대기</span>
								</c:if>
									
								<span><c:out value="${sellWait.gname}" /></span> 
								
								<br>
								<div class="endDate">
									마감일 : <fmt:formatDate value="${sellWait.enddate}" pattern="YYYY년 MM월 dd일 HH:MM"/> 까지
								</div>
							</div>
						</div>
						<!-- 입력가격 -->
						<div class="listInfo bidPrice">
							<c:if test="${sellWait.flag eq '0'.charAt(0)}">
									<p>현재 최고가 : <fmt:formatNumber value="${sellWait.nowprice}" pattern="#,###" />원</p>
							</c:if>
							<c:if test="${sellWait.flag ne '0'.charAt(0)}">
									<p>낙찰가 : <fmt:formatNumber value="${sellWait.tradeprice}" pattern="#,###" />원</p>
							</c:if>
						
							
						</div>
						<!-- 상세보기 버튼 -->
						<div class="listInfo PgetBtn">
							
							<c:if test="${sellWait.flag eq '0'.charAt(0)}">
								<button class="getBtn getBidBtn">상세보기</button>
								<input type="hidden" name="getGno" value="<c:out value="${sellWait.gno }"/>">
							</c:if>
							
							<c:if test="${sellWait.flag ne '0'.charAt(0)}">
								<button class="getBtn getBuyBtn">상세보기</button>
								<input type="hidden" name="getGno" value="<c:out value="${sellWait.gno }"/>">
							</c:if>
							
							
						</div>
					</div>
				</c:forEach>
				</div>
				<!-- 판매 입금대기중List 표시 -->
				
				<!-- 판매 거래중 List 표시 -------------------------------------------->
					<div id="sellSelect4_list" class="hidden">
					<c:forEach items="${sellTrading}" var="sellTrading">
					<div class="row outline">
						<!-- image칸 -->
						<div class="listInfo ">
						<!-- <div class="col-lg-2 "> -->
							<img src='/img/<c:out value="${sellTrading.uploadpath}"/>/<c:out value="${sellTrading.uuid}"/>_<c:out value="${sellTrading.filename}"/>'>
						</div>
						<!-- 상품정보 -->
						<div class="listInfo">
						<!-- <div class="col-lg-4"> -->
							<div class="listInfo-2">
							
								<c:if test="${sellTrading.flag eq '4'.charAt(0)}">
									<span class="flagIng">거래중</span>
								</c:if>
								
								<c:if test="${sellTrading.flag eq '5'.charAt(0)}">
									<span class="flagIng">거래중</span>
								</c:if>
								<c:if test="${sellTrading.flag eq '6'.charAt(0)}">
									<span class="flagIng">거래중</span>
								</c:if>
									
								<span><c:out value="${sellTrading.gname}" /></span> 
								
								<br>
								<div class="endDate">
									마감일 : <fmt:formatDate value="${sellTrading.enddate}" pattern="YYYY년 MM월 dd일 HH:MM"/> 까지
								</div>
							</div>
						</div>
						<!-- 입력가격 -->
						<div class="listInfo bidPrice">
							<c:if test="${sellTrading.flag eq '0'.charAt(0)}">
									<p>현재 최고가 : <fmt:formatNumber value="${sellTrading.nowprice}" pattern="#,###" />원</p>
							</c:if>
							<c:if test="${sellTrading.flag ne '0'.charAt(0)}">
									<p>낙찰가 : <fmt:formatNumber value="${sellTrading.tradeprice}" pattern="#,###" />원</p>
							</c:if>
						
							
						</div>
						<!-- 상세보기 버튼 -->
						<div class="listInfo PgetBtn">
							
							<c:if test="${sellTrading.flag eq '0'.charAt(0)}">
								<button class="getBtn getBidBtn">상세보기</button>
								<input type="hidden" name="getGno" value="<c:out value="${sellTrading.gno }"/>">
							</c:if>
							
							<c:if test="${sellTrading.flag ne '0'.charAt(0)}">
								<button class="getBtn getBuyBtn">상세보기</button>
								<input type="hidden" name="getGno" value="<c:out value="${sellTrading.gno }"/>">
							</c:if>
							
							
						</div>
					</div>
				</c:forEach>
				</div>
				<!-- 판매 거래중 List 표시 -->
				
				<!-- 판매 거래완료 List 표시 -------------------------------------------->
					<div id="sellSelect5_list" class="hidden">
					<c:forEach items="${sellSuccess}" var="sellSuccess">
					<div class="row outline">
						<!-- image칸 -->
						<div class="listInfo ">
						<!-- <div class="col-lg-2 "> -->
							<img src='/img/<c:out value="${sellSuccess.uploadpath}"/>/<c:out value="${sellSuccess.uuid}"/>_<c:out value="${sellSuccess.filename}"/>'>
						</div>
						<!-- 상품정보 -->
						<div class="listInfo">
						<!-- <div class="col-lg-4"> -->
							<div class="listInfo-2">
							
								<c:if test="${sellSuccess.flag eq '7'.charAt(0)}">
									<span class="flagSuccess">거래완료</span>
								</c:if>
									
								<span><c:out value="${sellSuccess.gname}" /></span> 
								
								<br>
								<div class="endDate">
									마감일 : <fmt:formatDate value="${sellSuccess.enddate}" pattern="YYYY년 MM월 dd일 HH:MM"/> 까지
								</div>
							</div>
						</div>
						<!-- 입력가격 -->
						<div class="listInfo bidPrice">
							<c:if test="${sellSuccess.flag eq '0'.charAt(0)}">
									<p>현재 최고가 : <fmt:formatNumber value="${sellSuccess.nowprice}" pattern="#,###" />원</p>
							</c:if>
							<c:if test="${sellSuccess.flag ne '0'.charAt(0)}">
									<p>낙찰가 : <fmt:formatNumber value="${sellSuccess.tradeprice}" pattern="#,###" />원</p>
							</c:if>
						
							
						</div>
						<!-- 상세보기 버튼 -->
						<div class="listInfo PgetBtn">
							
							<c:if test="${sellSuccess.flag eq '0'.charAt(0)}">
								<button class="getBtn getBidBtn">상세보기</button>
								<input type="hidden" name="getGno" value="<c:out value="${sellSuccess.gno }"/>">
							</c:if>
							
							<c:if test="${sellSuccess.flag ne '0'.charAt(0)}">
								<button class="getBtn getBuyBtn">상세보기</button>
								<input type="hidden" name="getGno" value="<c:out value="${sellSuccess.gno }"/>">
							</c:if>
							
							
						</div>
					</div>
				</c:forEach>
				</div>
				<!-- 판매 거래완료 List 표시 -->
				
				<!-- 판매 거래취소 List 표시 -------------------------------------------->
					<div id="sellSelect6_list" class="hidden">
					<c:forEach items="${sellCancel}" var="sellCancel">
					<div class="row outline">
						<!-- image칸 -->
						<div class="listInfo ">
						<!-- <div class="col-lg-2 "> -->
							<img src='/img/<c:out value="${sellCancel.uploadpath}"/>/<c:out value="${sellCancel.uuid}"/>_<c:out value="${sellCancel.filename}"/>'>
						</div>
						<!-- 상품정보 -->
						<div class="listInfo">
						<!-- <div class="col-lg-4"> -->
							<div class="listInfo-2">
							
								<c:if test="${sellCancel.flag eq 'a'.charAt(0)}">
									<span class="flagCancel">거래취소</span>
								</c:if>
								<c:if test="${sellCancel.flag eq 'b'.charAt(0)}">
									<span class="flagCancel">거래취소</span>
								</c:if>
								<c:if test="${sellCancel.flag eq 'c'.charAt(0)}">
									<span class="flagCancel">거래취소</span>
								</c:if>	
									
								<span><c:out value="${sellCancel.gname}" /></span> 
								
								<br>
								<div class="endDate">
									마감일 : <fmt:formatDate value="${sellCancel.enddate}" pattern="YYYY년 MM월 dd일 HH:MM"/> 까지
								</div>
							</div>
						</div>
						<!-- 입력가격 -->
						<div class="listInfo bidPrice">
							<c:if test="${sellCancel.flag eq '0'.charAt(0)}">
									<p>현재 최고가 : <fmt:formatNumber value="${sellCancel.nowprice}" pattern="#,###" />원</p>
							</c:if>
							<c:if test="${sellCancel.flag ne '0'.charAt(0)}">
									<p>낙찰가 : <fmt:formatNumber value="${sellCancel.tradeprice}" pattern="#,###" />원</p>
							</c:if>
						
							
						</div>
						<!-- 상세보기 버튼 -->
						<div class="listInfo PgetBtn">
							
							<c:if test="${sellCancel.flag eq '0'.charAt(0)}">
								<button class="getBtn getBidBtn">상세보기</button>
								<input type="hidden" name="getGno" value="<c:out value="${sellCancel.gno }"/>">
							</c:if>
							
							<c:if test="${sellCancel.flag ne '0'.charAt(0)}">
								<button class="getBtn getBuyBtn">상세보기</button>
								<input type="hidden" name="getGno" value="<c:out value="${sellCancel.gno }"/>">
							</c:if>
							
							
						</div>
					</div>
				</c:forEach>
				</div>
				<!-- 판매 거래취소 List 표시 -->
				
				
				<!-- 판매 거래유찰 List 표시 -------------------------------------------->
					<div id="sellSelect7_list" class="hidden">
					<c:forEach items="${sellFail}" var="sellFail">
					<div class="row outline">
						<!-- image칸 -->
						<div class="listInfo ">
						<!-- <div class="col-lg-2 "> -->
							<img src='/img/<c:out value="${sellFail.uploadpath}"/>/<c:out value="${sellFail.uuid}"/>_<c:out value="${sellFail.filename}"/>'>
						</div>
						<!-- 상품정보 -->
						<div class="listInfo">
						<!-- <div class="col-lg-4"> -->
							<div class="listInfo-2">
							
								<c:if test="${sellFail.flag eq 'd'.charAt(0)}">
									<span class="flagFail">경매유찰</span>
								</c:if>	
									
								<span><c:out value="${sellFail.gname}" /></span> 
								
								<br>
								<div class="endDate">
									마감일 : <fmt:formatDate value="${sellFail.enddate}" pattern="YYYY년 MM월 dd일 HH:MM"/> 까지
								</div>
							</div>
						</div>
						<!-- 입력가격 -->
						<div class="listInfo bidPrice">
							<c:if test="${sellFail.flag eq '0'.charAt(0)}">
									<p>현재 최고가 : <fmt:formatNumber value="${sellFail.nowprice}" pattern="#,###" />원</p>
							</c:if>
							<c:if test="${sellFail.flag ne '0'.charAt(0)}">
									<p>낙찰가 : <fmt:formatNumber value="${sellFail.tradeprice}" pattern="#,###" />원</p>
							</c:if>
						
							
						</div>
						<!-- 상세보기 버튼 -->
						<div class="listInfo PgetBtn">
							
							<c:if test="${sellFail.flag eq '0'.charAt(0)}">
								<button class="getBtn getBidBtn">상세보기</button>
								<input type="hidden" name="getGno" value="<c:out value="${sellFail.gno }"/>">
							</c:if>
							
							<c:if test="${sellFail.flag ne '0'.charAt(0)}">
								<button class="getBtn getBuyBtn">상세보기</button>
								<input type="hidden" name="getGno" value="<c:out value="${sellFail.gno }"/>">
							</c:if>
							
							
						</div>
					</div>
				</c:forEach>
				</div>
				<!-- 판매 거래유찰 List 표시 -->
			</div>
			<!-- LIST -->
        </div>
        <!-- 판매현황 -->

        <!-- 마이페이지 마지막 버튼그룹 ---------------------------------------->
        <div id="btnGroup">
            <button>1:1상담문의</button>
            <button>문의게시판</button>
            <button>문의받은게시판</button>
            <button>입찰제한등록</button>
            <button>장바구니</button>
            <button>단골판매자</button>
        </div>
        <!-- 마이페이지 마지막 버튼그룹 -->
        <!-- </div> -->
    </div>

<%@ include file="../includes/footer.jsp" %>

<script>

	

</script>



</body>

</html>