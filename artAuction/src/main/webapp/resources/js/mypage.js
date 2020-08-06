
    // 첫번째줄 우측 버튼모음 hover
    $(document).ready(function () {
        $("#myInfoModifyBtn").hover(function () {
            $("#myInfoModifyBtn .iconOutline").toggleClass("far fa");
            $("#myInfoModifyBtn .icon").css({ "color": "white" });
        }, function () {
            $("#myInfoModifyBtn .iconOutline").toggleClass("fa far");
            $("#myInfoModifyBtn .icon").css({ "color": "#40AA82" });
        });

        $("#creditWorthinessBtn").hover(function () {
            $("#creditWorthinessBtn .iconOutline").toggleClass("far fa");
            $("#creditWorthinessBtn .icon").css({ "color": "white" });
        }, function () {
            $("#creditWorthinessBtn .iconOutline").toggleClass("fa far");
            $("#creditWorthinessBtn .icon").css({ "color": "#40AA82" });
        });

        $("#msgBoxBtn").hover(function () {
            $("#msgBoxBtn .iconOutline").toggleClass("far fa");
            $("#msgBoxBtn .icon").css({ "color": "white" });
        }, function () {
            $("#msgBoxBtn .iconOutline").toggleClass("fa far");
            $("#msgBoxBtn .icon").css({ "color": "#40AA82" });
        });

        $("#todayGoodsBtn").hover(function () {
            $("#todayGoodsBtn .iconOutline").toggleClass("far fa");
            $("#todayGoodsBtn .icon").css({ "color": "white" });
        }, function () {
            $("#todayGoodsBtn .iconOutline").toggleClass("fa far");
            $("#todayGoodsBtn .icon").css({ "color": "#40AA82" });
        });

        $("#interestGoodsBtn").hover(function () {
            $("#interestGoodsBtn .iconOutline").toggleClass("far fa");
            $("#interestGoodsBtn .icon").css({ "color": "white" });
        }, function () {
            $("#interestGoodsBtn .iconOutline").toggleClass("fa far");
            $("#interestGoodsBtn .icon").css({ "color": "#40AA82" });
        });


//        상세보기 버튼클릭 시 이동
        $(".getBidBtn").click(function(){
			var gno = $(this).next().val();
			location.href="/get/goods?gno="+gno;
		});
        
        $(".getBuyBtn").click(function(){
			var gno = $(this).next().val();
			location.href="/deal/buy?gno="+gno;
		});
        
//        회원정보수정 버튼선택 시 이동
		$(".changeMyInfo").click(function(){
			location.href="/mypage/myInfoChange";
		});
        
		
    });


    $(document).ready(function(){
//		구매현황 List active / hidden
		$('#buySelect1').click(function(){
			$('#buySelect1').addClass('point');
			$('#buySelect2').removeClass('point');
			$('#buySelect3').removeClass('point');
			$('#buySelect4').removeClass('point');
			$('#buySelect5').removeClass('point');
			$('#buySelect2_list').removeClass('active');
			$('#buySelect3_list').removeClass('active');
			$('#buySelect4_list').removeClass('active');
			$('#buySelect5_list').removeClass('active');
			$('#buySelect1_list').removeClass('hidden');
			$('#buySelect2_list').addClass('hidden');
			$('#buySelect3_list').addClass('hidden');
			$('#buySelect4_list').addClass('hidden');
			$('#buySelect5_list').addClass('hidden');
		});
		
		$('#buySelect2').click(function(){
			$('#buySelect1').removeClass('point');
			$('#buySelect2').addClass('point');
			$('#buySelect3').removeClass('point');
			$('#buySelect4').removeClass('point');
			$('#buySelect5').removeClass('point');
			$('#buySelect1_list').removeClass('active');
			$('#buySelect1_list').addClass('hidden');
			$('#buySelect2_list').removeClass('hidden');
			$('#buySelect2_list').addClass('active');
			$('#buySelect3_list').addClass('hidden');
			$('#buySelect4_list').addClass('hidden');
			$('#buySelect5_list').addClass('hidden');
		});
		
		$('#buySelect3').click(function(){
			$('#buySelect1').removeClass('point');
			$('#buySelect2').removeClass('point');
			$('#buySelect3').addClass('point');
			$('#buySelect4').removeClass('point');
			$('#buySelect5').removeClass('point');
			$('#buySelect1_list').addClass('hidden');
			$('#buySelect2_list').removeClass('active');
			$('#buySelect2_list').addClass('hidden');
			$('#buySelect3_list').removeClass('hidden');
			$('#buySelect3_list').addClass('active');
			$('#buySelect4_list').addClass('hidden');
			$('#buySelect5_list').addClass('hidden');
		});
		
		$('#buySelect4').click(function(){
			$('#buySelect1').removeClass('point');
			$('#buySelect2').removeClass('point');
			$('#buySelect3').removeClass('point');
			$('#buySelect4').addClass('point');
			$('#buySelect5').removeClass('point');
			$('#buySelect1_list').addClass('hidden');
			$('#buySelect2_list').addClass('hidden');
			$('#buySelect3_list').removeClass('active');
			$('#buySelect3_list').addClass('hidden');
			$('#buySelect4_list').addClass('active');
			$('#buySelect4_list').removeClass('hidden');
			$('#buySelect5_list').addClass('hidden');
		});
		
		$('#buySelect5').click(function(){
			$('#buySelect1').removeClass('point');
			$('#buySelect2').removeClass('point');
			$('#buySelect3').removeClass('point');
			$('#buySelect4').removeClass('point');
			$('#buySelect5').addClass('point');
			$('#buySelect1_list').addClass('hidden');
			$('#buySelect2_list').addClass('hidden');
			$('#buySelect3_list').addClass('hidden');
			$('#buySelect4_list').addClass('hidden');
			$('#buySelect4_list').removeClass('active');
			$('#buySelect5_list').removeClass('hidden');
			$('#buySelect5_list').addClass('active');
		});
		
//		판매현황 List active / hidden
		$('#sellSelect1').click(function(){
			$('#sellSelect1').addClass('point');
			$('#sellSelect2').removeClass('point');
			$('#sellSelect3').removeClass('point');
			$('#sellSelect4').removeClass('point');
			$('#sellSelect5').removeClass('point');
			$('#sellSelect6').removeClass('point');
			$('#sellSelect7').removeClass('point');
			$('#sellSelect2_list').removeClass('active');
			$('#sellSelect3_list').removeClass('active');
			$('#sellSelect4_list').removeClass('active');
			$('#sellSelect6_list').removeClass('active');
			$('#sellSelect7_list').removeClass('active');
			$('#sellSelect2_list').addClass('hidden');
			$('#sellSelect3_list').addClass('hidden');
			$('#sellSelect4_list').addClass('hidden');
			$('#sellSelect5_list').addClass('hidden');
			$('#sellSelect6_list').addClass('hidden');
			$('#sellSelect7_list').addClass('hidden');
			$('#sellSelect1_list').removeClass('hidden');
		});
		
		$('#sellSelect2').click(function(){
			$('#sellSelect1').removeClass('point');
			$('#sellSelect2').addClass('point');
			$('#sellSelect3').removeClass('point');
			$('#sellSelect4').removeClass('point');
			$('#sellSelect5').removeClass('point');
			$('#sellSelect6').removeClass('point');
			$('#sellSelect7').removeClass('point');
			$('#sellSelect1_list').removeClass('active');
			$('#sellSelect1_list').addClass('hidden');
			$('#sellSelect2_list').removeClass('hidden');
			$('#sellSelect2_list').addClass('active');
			$('#sellSelect3_list').addClass('hidden');
			$('#sellSelect4_list').addClass('hidden');
			$('#sellSelect5_list').addClass('hidden');
			$('#sellSelect6_list').addClass('hidden');
			$('#sellSelect7_list').addClass('hidden');
		});
		
		$('#sellSelect3').click(function(){
			$('#sellSelect1').removeClass('point');
			$('#sellSelect2').removeClass('point');
			$('#sellSelect3').addClass('point');
			$('#sellSelect4').removeClass('point');
			$('#sellSelect5').removeClass('point');
			$('#sellSelect6').removeClass('point');
			$('#sellSelect7').removeClass('point');
			$('#sellSelect1_list').addClass('hidden');
			$('#sellSelect2_list').removeClass('active');
			$('#sellSelect2_list').addClass('hidden');
			$('#sellSelect3_list').removeClass('hidden');
			$('#sellSelect3_list').addClass('active');
			$('#sellSelect4_list').addClass('hidden');
			$('#sellSelect5_list').addClass('hidden');
			$('#sellSelect6_list').addClass('hidden');
			$('#sellSelect7_list').addClass('hidden');
		});
		
		$('#sellSelect4').click(function(){
			$('#sellSelect1').removeClass('point');
			$('#sellSelect2').removeClass('point');
			$('#sellSelect3').removeClass('point');
			$('#sellSelect4').addClass('point');
			$('#sellSelect5').removeClass('point');
			$('#sellSelect6').removeClass('point');
			$('#sellSelect7').removeClass('point');
			$('#sellSelect1_list').addClass('hidden');
			$('#sellSelect2_list').addClass('hidden');
			$('#sellSelect3_list').removeClass('active');
			$('#sellSelect3_list').addClass('hidden');
			$('#sellSelect4_list').addClass('active');
			$('#sellSelect4_list').removeClass('hidden');
			$('#sellSelect5_list').addClass('hidden');
			$('#sellSelect6_list').addClass('hidden');
			$('#sellSelect7_list').addClass('hidden');
		});
		
		$('#sellSelect5').click(function(){
			$('#sellSelect1').removeClass('point');
			$('#sellSelect2').removeClass('point');
			$('#sellSelect3').removeClass('point');
			$('#sellSelect4').removeClass('point');
			$('#sellSelect5').addClass('point');
			$('#sellSelect6').removeClass('point');
			$('#sellSelect7').removeClass('point');
			$('#sellSelect1_list').addClass('hidden');
			$('#sellSelect2_list').addClass('hidden');
			$('#sellSelect3_list').addClass('hidden');
			$('#sellSelect4_list').addClass('hidden');
			$('#sellSelect4_list').removeClass('active');
			$('#sellSelect5_list').removeClass('hidden');
			$('#sellSelect5_list').addClass('active');
			$('#sellSelect6_list').addClass('hidden');
			$('#sellSelect7_list').addClass('hidden');
		});
		$('#sellSelect6').click(function(){
			$('#sellSelect1').removeClass('point');
			$('#sellSelect2').removeClass('point');
			$('#sellSelect3').removeClass('point');
			$('#sellSelect4').removeClass('point');
			$('#sellSelect5').removeClass('point');
			$('#sellSelect6').addClass('point');
			$('#sellSelect7').removeClass('point');
			$('#sellSelect1_list').addClass('hidden');
			$('#sellSelect2_list').addClass('hidden');
			$('#sellSelect3_list').addClass('hidden');
			$('#sellSelect4_list').addClass('hidden');
			$('#sellSelect5_list').removeClass('active');
			$('#sellSelect5_list').addClass('hidden');
			$('#sellSelect6_list').removeClass('hidden');
			$('#sellSelect6_list').addClass('active');
			$('#sellSelect7_list').addClass('hidden');
		});
		$('#sellSelect7').click(function(){
			$('#sellSelect1').removeClass('point');
			$('#sellSelect2').removeClass('point');
			$('#sellSelect3').removeClass('point');
			$('#sellSelect4').removeClass('point');
			$('#sellSelect5').removeClass('point');
			$('#sellSelect6').removeClass('point');
			$('#sellSelect7').addClass('point');
			$('#sellSelect1_list').addClass('hidden');
			$('#sellSelect2_list').addClass('hidden');
			$('#sellSelect3_list').addClass('hidden');
			$('#sellSelect4_list').addClass('hidden');
			$('#sellSelect5_list').addClass('hidden');
			$('#sellSelect6_list').removeClass('active');
			$('#sellSelect6_list').addClass('hidden');
			$('#sellSelect7_list').removeClass('hidden');
			$('#sellSelect7_list').addClass('active');
		});
		
		
	});
    
