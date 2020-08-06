<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
    
<%@ include file="./includes/nav.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
     <!-- jQuery 1.8 or later, 33 KB -->
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
     <!-- Font Awesome icons (free version)-->
     <script src="https://use.fontawesome.com/releases/v5.13.0/js/all.js" crossorigin="anonymous"></script>
    <!-- logo googlefont-->
    <link href="https://fonts.googleapis.com/css2?family=Reenie+Beanie&display=swap" rel="stylesheet">
    <title>Document</title>
    <link rel="stylesheet" href="/resources/css/faq.css">
	<script src="/resources/js/faq.js"></script>
</head>
<body> 

<!--nav html------------------------------->
    <div id = "wrapFaq">
        <h1>자주 묻는 질문(FAQ)</h1>
        
           <ul class = "searchFaqContainer">
           <div class = "searchFaq">
               <li>자주 묻는 질문(FAQ)검색</li>
                 <li class = "search">
                     <div class = "searchOption">
                        <input type="text" name="keyword" class = "searchFaqText" placeholder="검색어를 입력하세요" value="${pageMaker.cri.keyword}">
                        <button class = "searchFaqButton">검색</button>
                      </div>
               </li>
                 <li class = "quickSearch">
               <div>물품등록 </div>
                     <div>구매절차 </div>
                     <div>판매절차 </div>
                     <div>수수료 </div>
                     <div>신용도 </div>
                     <div>반품/환불 </div>
                     <div>사업자등록</div>
                 </li>
           </div>
           </ul>
        
        <div class = "navFaq">
           <div id="buying" class = "borderLeft activeNavFaq">구매</div>
           <div id = "selling">판매</div>
           <div id = "membership">회원정보</div>
           <div id = "auction">경매진행</div>
           <div id = "deposit">채팅상담</div>
           <div id = "credit">신용도</div>
           <div id = "others">기타</div> 
        </div>
        <div class="mainContentContainer">
            <ul class="topContent">
                <li class="mainContentNumber">번호</li>
                <li class="mainContentCategory">카테고리</li>
                <li class="mainContentTitle">제목</li>
            </ul>
            <!--질문과 답변 --------------------------------------------------------->
              <div class="navFaqChildren">          
                 <ul class="buying contentContainer navActivity">
                  <li class="contentNumber">1</li>
                  <li class="contentCategory">구매</li>
                  <li class="contentTitle">매매 및 등록제한 물품안내</li>
               </ul>
               <ul class="contentDetail">
                  <li class="">■ 매매 제한, 불가 물품 안내<br>

· 법률상 판매가 금지된 상품의 거래를 막고, 유해환경을 차단하기 위해 기타 불법물과 음란한 표현물
(사진,이미지,글,영상,부호 등)의 사용은 제재하고 있습니다.<br>
· 총포, 도검, 화약류, 분사기, 석궁 등은 <총포, 도검, 화약류 등 단속법령>에 의해서 매매제한, 불가물품으로 분류되고 있으며,
  그 제조, 판매, 소지가 금지.제한되고 있는 물품입니다.<br>
· 음란 표현물 (주요 품목: 성인용품) 
  예) 음란한 사진, 언어, 영상, 신호를 사용하여 성적인 수치심을 자극하는 모든 표현물 <br>

따라서 유통이 제한.금지된 물품임을 인식하시고 유의해 주시기 바랍니다.<br>
 
<br>
도검이란?<br>

1) 총포, 도검, 화약류 등 단속법 제2조<br>

칼날의 길이가 15센티미터 이상되는 칼. 검. 창. 치도. 비수 등으로서 성질상 흉기로 쓰여지는 것과 칼날의 길이가
15센티미터 미만이라 할 지라도 흉기로 사용될 위험성이 뚜렷이 있는 것 중에서 대통령령이 정하는 것.<br>

2) 대통령령-도검이란 일단은 15센티 이하라고 하더라도 또 충분히 뾰족하거나 또 면도칼처럼 충분히 예리한 경우.<br>
<br>
■ 등록 제한 및 삭제 안내<br>

· 장물(도난품), 위조, 가짜상품, 법령상 판매가 제한 또는 금지된 품목을 등록할 수 없습니다.<br>
· 허위의 사실을 기재할 수 없습니다.<br>
· 금융상의 편의를 위한 허위의 거래를 한 경우 법률상의 처벌을 받게 됩니다.<br>
· 19세 이상 성인물품은 모자이크 처리를 한 후 등록해야 합니다.<br>
· 허위물품 또는 허위기재라고 의심되는 경우에는 사전 양해없이 삭제될 수 있습니다.<br>
  (단, 복제품일 경우 그 내용을 반드시 기재한 경우에 한해 등록 가능 합니다.)</li>            
               </ul>
            </div>
         <!-- 질문과 답변 -->
         
         <!-- 질문과 답변 -------------------------------------------------------------->
            <div class="navFaqChildren">
               <ul class="buying contentContainer navActivity">
                  <li class="contentNumber">2</li>
                  <li class="contentCategory">구매</li>
                  <li class="contentTitle">구매절차는 어떻게 되나요?</li>
               </ul>
               <ul class="contentDetail">
                  <li class=""><img src="/resources/img/faq/faq_buy_process.gif"></li>            
               </ul>
            </div>
            <!-- 질문과 답변 -->
            
            <!-- 질문과 답변 ------------------------------------------------------------->                 
            <div class="navFaqChildren">
               <ul class="selling contentContainer">
                  <li class="contentNumber">1</li>
                  <li class="contentCategory">판매</li>
                  <li class="contentTitle">물품등록은 어떻게 하나요?</li>
               </ul>
               <ul class="contentDetail">
                  <li class="">1. 아트옥션 사이트 로그인 후, 검색창 바로 아래 물품 등록 버튼을 클릭해 주세요.<br>
                  2. 등록하는 물품의 종류를 확인하신 후, 올바른 카테고리에 등록을 해 주세요.<br>
                  3. 물품명, 시작가, 설명, 사진 등 경매 진행에 필요한 정보를 입력해 주세요.<br>
                  4. 등록하기 버튼을 클릭해 주시면 물품이 등록됩니다.
                  </li>            
               </ul>
            </div>   
            <!-- 질문과 답변 -->
            
            <!-- 질문과 답변 ------------------------------------------------------------->
            <div class="navFaqChildren">            
                 <ul class="membership contentContainer">
                  <li class="contentNumber">1</li>
                  <li class="contentCategory">회원정보</li>
                  <li class="contentTitle">아이디와 비밀번호를 잊어버렸어요.</li>
               </ul>
               <ul class="contentDetail">
                  <li class="">아트옥션 홈페이지 우측 상단 [로그인] > [아이디/비밀번호 찾기]를 클릭하시고, 해당메뉴를 선택하신 후 인증 절차를 거쳐 단계별 요청 정보를 입력하여 확인하시기 바랍니다.</li>            
               </ul>
            </div>   
         <!-- 질문과 답변 -->
         
         <!-- 질문과 답변 ------------------------------------------------------------->
            <div class="navFaqChildren">            
                 <ul class="membership contentContainer">
                  <li class="contentNumber">2</li>
                  <li class="contentCategory">회원정보</li>
                  <li class="contentTitle">회원정보를 변경하고 싶어요.</li>
               </ul>
               <ul class="contentDetail">
                  <li class="">아트옥 홈페이지 로그인 상태에서 우측 상단의 [마이페이지]를 클릭하신 후,
[나의정보수정]에서 변경하실 수 있습니다.</li>            
               </ul>
            </div>   
         <!-- 질문과 답변 -->
         
         
            <div class="navFaqChildren">            
                 <ul class="auction contentContainer">
                  <li class="contentNumber">1</li>
                  <li class="contentCategory">경매진행</li>
                  <li class="contentTitle">경매진행중에 판매자 혹은 입찰자의 연락처를 알 수 있나요?</li>
               </ul>
               <ul class="contentDetail">
                  <li class="">경매 진행중에는 상호 연락처 확인이 불가합니다.<br>
상호 연락처는 최종 낙찰 후 확인이 가능합니다.<br>

개인정보 공개시에는 해당 회원님께 약관에 따라 불이익이 있을 수 있사오니 이 점 참고 부탁드립니다.</li>            
               </ul>
            </div>
            
            <div class="navFaqChildren">            
                 <ul class="auction contentContainer">
                  <li class="contentNumber">2</li>
                  <li class="contentCategory">경매진행</li>
                  <li class="contentTitle">특정 판매자가 진행중인 물품만 찾을 수 있나요?</li>
               </ul>
               <ul class="contentDetail">
                  <li class="">아트옥션 사이트 오른쪽 상단에 있는 [검색]란에 판매자 아이디를 입력하신 후 검색하시면됩니다.</li>
               </ul>
            </div>
               
            <div class="navFaqChildren">            
                 <ul class="deposit contentContainer">
                  <li class="contentNumber">1</li>
                  <li class="contentCategory">채팅상담</li>
                  <li class="contentTitle">상담톡이란 무엇인가요?</li>
               </ul>
               <ul class="contentDetail">
                  <li class="">상담톡이란 카카오톡을 통해 고객과 빠르고 스마트하게 커뮤니케이션할 수 있는 채팅 상담 서비스입니다.</br>
                     국내 최대 가입자 수를 보유한 카카오톡을 상담 창구로 활용함으로써, 고객 접근성을 최대화하고 상담 효율을 높일 수 있습니다.
                  </li>            
               </ul>
            </div>
            
            <div class="navFaqChildren">            
               <ul class="deposit contentContainer">
                <li class="contentNumber">2</li>
                <li class="contentCategory">채팅상담</li>
                <li class="contentTitle">어떻게 사용하나요?</li>
             </ul>
             <ul class="contentDetail">
                <li class="">별도의 채널 추가 없이 언제 어디서나 모바일/Web의 상담톡 버튼 클릭만으로 상담을 요청할 수 있습니다.
                </li>            
             </ul>
          </div> 

            <div class="navFaqChildren">            
                 <ul class="credit contentContainer">
                  <li class="contentNumber">1</li>
                  <li class="contentCategory">신용</li>
                  <li class="contentTitle">신용도를 확인 하고 싶어요.</li>
               </ul>
               <ul class="contentDetail">
                  <li class="">
                     [판매자 신용도]</br>
                     현재 경매진행중에 있는 상세물품정보 페이지에  신용도확인 버튼을 클릭하시면 해당 판매자의 최근 거래 실적을 확인 하실수 있습니다.</br>
                     [구매자 신용도]</br>
                     진행중인 물품의 [경매기록상]에 있는 해당 구매자 아이디를 클릭할 경우 최근 거래실적을 확인 하실수 있습니다.</br>
                     [나의 신용도]</br>
                     마이페이지 > 나의신용도 아이콘을 클릭 하시면 확인 하실 수 있습니다.</br>
                     최근 거래 실적은 최근6개월자료를 기본으로 확인 하실수 있으며 2,3,6개월 단위로 확인 하실 수 있습니다.


                  </li>            
               </ul>
            </div>
            <div class="navFaqChildren">            
                 <ul class="others contentContainer">
                  <li class="contentNumber">1</li>
                  <li class="contentCategory">기타</li>
                  <li class="contentTitle">작성글 비공개와 관련한 아트옥션 약관입니다</li>
               </ul>
               <ul class="contentDetail">
                  <li class="">
                  </br>
                     제18조 (판매자의 의무)</br>

판매자는 물품등록시 직거래를 유도하는 문구나 구매자의 정당한 권리(구매거부 등)를 제한하거나,</br>
허위이거나, 기타 위법한 내용(문구, 사진 또는 설명을 포함)을 등록해서는 아니되며,</br>
스스로 또는 다른 회원을 통하여 고의로 입찰가를 조작하는 행위를 하여서도 안됩니다.</br>
이를 위반한 경우, 아트옥션 관련 회원이나 해당 경매에 대하여 경매(쇼핑)취소,</br>
경매(쇼핑)중지, 게시글 비공개 및 기타 필요한 조치를 취할 수 있습니다.</br>

                  </br>
제22조 (물품구매규정)</br>

구매과정</br>

사. 구매자는 직거래 문구, 판매방해 및 인신 공격성 문구와 그외 아트옥션 약관에 반하는 문구를 등록해서는 안됩니다.</br>
이를 위반한 경우, 아트옥션 해당 게시글 비공개 및 기타 필요한 조치를 취할 수 있습니다.</br>

                  </li>            
               </ul>
            </div>
            <div class="navFaqChildren">            
               <ul class="others contentContainer">
                <li class="contentNumber">2</li>
                <li class="contentCategory">기타</li>
                <li class="contentTitle">면세물품 기준이 무엇인가요?</li>
             </ul>
             <ul class="contentDetail">
                <li class="">
                  <strong>1부가가치세</strong></br>

                  부가가치세 면제대상은 ‘업태/종목상 면제’와 ‘세금 납부 면제’로 구분됩니다.</br>
                  
                  1. 업태/종목 면제</br>
                    - 제작 100년 이하 예술 창작품(미술, 음악, 사진등 창작품)</br>
                  
                  2. 세금납부 면제</br>
                    - 간이과세자중 연 공급대가(판매금액)가 2,400만원 이하인 경우 (신고는 하되 납부 면제)</br>
                  
                  
                  <strong>1. 비과세소득</strong></br>
                    - 미술/음악/사진: 원작자가 대가를 받고 직접 판매한 것을 제외한 모든 건.</br>
                    - 서화/골동품:</br> 1) 점당 양도가액 6천만원 미만인 거래.</br>
                                         2) 생존하고 있는 국내 원작자 작품.</br>
                                         3) 국가지정 문화재.</br>
                                         4) 박물관, 미술관에 양도(납품).</br>
                </li>            
             </ul>
          </div>  
        </div>
    </div>
<%@ include file="./includes/footer.jsp" %>
</body>
</html>