
var time; // 슬라이드 넘어가는 시간
var $carouselLi;
var carouselCount; // 캐러셀 사진 갯수
var currentIndex; // 현재 보여지는 슬라이드 인덱스 값
var caInterval;

//사진 연결
var imgW; // 사진 한장의 너비

$(document).ready(function () {

    carouselInit(0); // 캐러셀이미지의 index0

    // 설명 파트 버튼구현
    $('.selectBox').on('click', function () {
        $('.selectBox').removeClass("selected");
        $(this).addClass("selected");

        // 히든태그에 숨겨놓은 index탐색
        var a = $(this).next().val();
        $('.contentBox').addClass('hidden');
        var str = ".box" + a;
        $(str).removeClass('hidden');
    });


    // 입찰하기 -> 입찰모달
    $('#tenderBtn').click(function () {
        $('#modalDobid').removeClass('hidden');
    });

    // 문의하기 -> 문의모달
    $('#doInquiry').click(function () {
        $('#modalInquiry').removeClass('hidden');
    });

    // 모달 닫기
    $('.modalCloseBtn').click(function () {
        $('.modal').addClass('hidden');
    });


    //즉시구매 버튼 클릭 시
    $('#nowBuyBtn').click(function () {
    	$('#modalNowBuy').removeClass('hidden');
    });


    // 상단버튼 문의하기 버튼 클릭 시
    $('#inquireBtn').click(function () {
        $('.selectBox').removeClass("selected");
        $('#inquireBox').addClass("selected");
        $('.contentBox').addClass('hidden');
        var str = ".box" + 2;
        $(str).removeClass('hidden');
        location.href = "#detailInfoHr";
    });

    // 문의하기 모달 내 문의버튼 클릭 시
    $('#inputInquiryBtn').click(function () {
        var a = confirm("정말로 문의하시겠습니까?");
        if (a == true) {
        	var id = $('#inputInquiryID').val();
        	var content = $('#inputInquiryContent').val();
        	
        	
            // 데이터 전달 후 input태그 초기화
            $('#inputInquiryID').val("");
            $('#inputInquiryContent').val("");
            $('.modal').addClass('hidden');
            
            
            $('#inquiryForm').submit();
        }
    });

    // 판매자가 문의의 답변하기 클릭
    $('.rereply').click(function () {
    	var id = $(this).next().val();
    	var rno = $(this).next().next().val();
    	var content = $(this).next().next().next().val();
    	
    	$('#modalInquiryReply').removeClass('hidden');
    	$('#replyId').val(id);
    	$('#replyContent').val(content);
    	$('#replyRno').val(rno);
    });
    
    // 판매자 판매물품 더보기 클릭 시 
    $('#moreGetBySellerBtn').click(function () {
    	var id = $(this).next().val();
    	var url1 = "/list?searchList=seller&keyword=";
    	var url2 = "&categoryid=0&pageNum=1&amount=10&type=close";
    	location.href = url1 + id + url2;
    });
    
    $('#reviewBySeller').click(function () {
    	alert("시스템 준비중입니다.");
    });
    
    
});

function checkNowBuy(){
	var check = prompt("\'즉시구매\' 입력 시 즉시 구매페이지로 이동합니다.\n거래 시 단순 변심으로인해 판매자에게 악영향을 미칠 경우 피해를 보상하셔야 할 수도 있습니다.\n\n정말로 즉시구매를 원하시면 \'즉시구매\'를 입력해주세요.\n")
	if(check=='즉시구매'){
		return true;
	}else if(check==null){
		return false;
	}
	else{
		alert("잘못 입력하셨습니다.");
		return false;
	}
}


$(window).resize(function () {
    carousel_setImgPosition();
});

/* 초기 설정 */
function carouselInit(index) {
    /*
    * height : 캐러셀 높이
    * t : 사진 전환 간격 
    */
    height = 500;
    time = 4000;
    $("#carousel_section").height(height); // 캐너셀 높이 설정
    //$carouselLi = $("#carousel_section > ul >li");
    carouselCount = $("#carousel_section > ul >li").length; // 캐러셀 사진 갯수
    //currentIndex = 0; // 현재 보여지는 슬라이드 인덱스 값
    currentIndex = index;
    carousel_setImgPosition();

}

function carousel_setImgPosition() {
    imgW = $("#carousel_section > ul >li").width(); // 사진 한장의 너비
    // 이미지 위치 조정
    for (var i = 0; i < carouselCount; i++) {
        if (i == currentIndex) {
            $("#carousel_section > ul >li").eq(i).css("left", 0);
        }
        else {
            $("#carousel_section > ul >li").eq(i).css("left", imgW);
        }
    }
}

function carousel() {

    // 사진 넘기기
    // 사진 하나가 넘어간 후 다시 꼬리에 붙어야함
    // 화면에 보이는 슬라이드만 보이기
    var left = "-" + imgW;

    //현재 슬라이드를 왼쪽으로 이동 ( 마이너스 지점 )
    $("#carousel_section > ul >li").eq(currentIndex).animate({ left: left }, function () {
        // 다시 오른쪽 (제자리)로 이동
        $("#carousel_section > ul >li").eq(currentIndex).css("left", imgW);

        if (currentIndex == (carouselCount - 1)) {
            currentIndex = 0;
        }
        else {
            currentIndex++;
        }
    });

    // 다음 슬라이드 화면으로
    if (currentIndex == (carouselCount - 1)) {
        // 마지막 슬라이드가 넘어갈땐 처음 슬라이드가 보이도록
        $("#carousel_section > ul >li").eq(0).animate({ left: 0 });
    }
    else {
        $("#carousel_section > ul >li").eq(currentIndex + 1).animate({ left: 0 });
    }
}


// < !--캐러셀 / 포토라마------------------------------------------------------>

$(document).ready(function () {
	 // 몇개의 이미지가 있는지 count
    var ele = document.getElementById('thumbnail');
    var count = ele.childElementCount-3;

    var rightBtn = $('#imgRightBtn');
    var leftBtn = $('#imgLeftBtn');
    var selectors = $('.thumbnailSelector');
    var nowIndex = 1;
    
    var cntAllImg = $('#thumbnail input').val();
    if(cntAllImg>=4){
       var maxIndex = 4;
    }else{
       var maxIndex = cntAllImg;
    }

    rightBtn.click(function () {
        if (nowIndex < maxIndex) {
            selectors.addClass('hidden');
            nowIndex++;
            var str = "#thumbnailSelector" + nowIndex;
            $(str).removeClass('hidden');
            carouselInit(nowIndex - 1);
        }
        else {
            selectors.addClass('hidden');
            nowIndex = 1;
            var str = "#thumbnailSelector" + nowIndex;
            $(str).removeClass('hidden');
            carouselInit(nowIndex - 1);
        }
    });
    leftBtn.click(function () {
        if (nowIndex > 1) {
            selectors.addClass('hidden');
            nowIndex--;
            var str = "#thumbnailSelector" + nowIndex;
            $(str).removeClass('hidden');
            carouselInit(nowIndex - 1);
        }
        else {
            selectors.addClass('hidden');
            nowIndex = maxIndex;
            var str = "#thumbnailSelector" + nowIndex;
            $(str).removeClass('hidden');
            carouselInit(nowIndex - 1);
        }
    });
    
});

// < !--캐러셀 / 포토라마-- >