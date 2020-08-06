
var time; // 슬라이드 넘어가는 시간
        var $carouselLi;
        var carouselCount; // 캐러셀 사진 갯수
        var currentIndex; // 현재 보여지는 슬라이드 인덱스 값
        var caInterval;
        
        //사진 연결
        var imgW; // 사진 한장의 너비    
        $(document).ready(function(){
        
            carouselInit(0);
            





            // 설명 파트 버튼구현
            $('.selectBox').on('click', function(){
                $('.selectBox').removeClass("selected");
                $(this).addClass("selected");

                // 히든태그에 숨겨놓은 index탐색
                var a = $(this).next().val();
                $('.contentBox').addClass('hidden');
                var str = ".box"+a;
                $(str).removeClass('hidden');
            });


            // 입찰하기 -> 입찰모달
            $('#tenderBtn').click(function(){
                $('#modalDobid').removeClass('hidden');
            });

            // 문의하기 -> 문의모달
            $('#doInquiry').click(function(){
                $('#modalInquiry').removeClass('hidden');
            });

            // 모달 닫기
            $('.modalCloseBtn').click(function(){
                $('.modal').addClass('hidden');
            });


            //즉시구매 버튼 클릭 시
            $('#nowBuyBtn').click(function(){
                // 3단계 개발과정 시 개발예정
                alert("서비스 준비중입니다.");
            });


            // 상단버튼 문의하기 버튼 클릭 시
            $('#inquireBtn').click(function(){
                $('.selectBox').removeClass("selected");
                $('#inquireBox').addClass("selected");
                $('.contentBox').addClass('hidden');
                var str = ".box"+2;
                $(str).removeClass('hidden');
                location.href="#detailInfoHr";
            });

            // 문의하기 모달 내 문의버튼 클릭 시
            $('#inputInquiryBtn').click(function(){
                var a = confirm("정말로 문의하시겠습니까?");
                if(a==true){
                    // 3단계 개발과정 개발예정
                    alert("서비스 준비 중");
                    $('.modal').addClass('hidden');
                }
            });


        });
        
        $(window).resize(function(){
            carousel_setImgPosition();
        });
        
        /* 초기 설정 */
        function carouselInit(index){
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
        
        function carousel_setImgPosition(){
            imgW = $("#carousel_section > ul >li").width(); // 사진 한장의 너비    
            // 이미지 위치 조정
            for(var i = 0; i < carouselCount; i++)
            {
                if( i == currentIndex)
                {
                    $("#carousel_section > ul >li").eq(i).css("left", 0);
                }
                else
                {
                    $("#carousel_section > ul >li").eq(i).css("left", imgW);
                }
            }
        }
        
        function carousel(){
        
            // 사진 넘기기
            // 사진 하나가 넘어간 후 다시 꼬리에 붙어야함
            // 화면에 보이는 슬라이드만 보이기
            var left = "-" + imgW;
        
                //현재 슬라이드를 왼쪽으로 이동 ( 마이너스 지점 )
                $("#carousel_section > ul >li").eq(currentIndex).animate( { left: left }, function(){
                    // 다시 오른쪽 (제자리)로 이동
                    $("#carousel_section > ul >li").eq(currentIndex).css("left", imgW);
        
                    if( currentIndex == ( carouselCount - 1 ) ){
                        currentIndex = 0;
                    }
                    else{
                        currentIndex ++;
                    }
                } );
        
                // 다음 슬라이드 화면으로
                if( currentIndex == ( carouselCount - 1 ) ){
                    // 마지막 슬라이드가 넘어갈땐 처음 슬라이드가 보이도록
                    $("#carousel_section > ul >li").eq(0).animate( { left: 0 } );
                }
                else{
                    $("#carousel_section > ul >li").eq(currentIndex + 1).animate( { left: 0 } );
                }
        }
        
        
        $(document).ready(function(){
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
            
            

            rightBtn.click(function(){
                if(nowIndex<maxIndex){
                    selectors.addClass('hidden');
                    nowIndex++;
                    var str = "#thumbnailSelector"+nowIndex;
                    $(str).removeClass('hidden');
                    carouselInit(nowIndex-1);
                }
                else{
                    selectors.addClass('hidden');
                    nowIndex = 1;
                    var str = "#thumbnailSelector"+nowIndex;
                    $(str).removeClass('hidden');
                    carouselInit(nowIndex-1);
                }
            });
            leftBtn.click(function(){
                if(nowIndex>1){
                    selectors.addClass('hidden');
                    nowIndex--;
                    var str = "#thumbnailSelector"+nowIndex;
                    $(str).removeClass('hidden');
                    carouselInit(nowIndex-1);
                }
                else{
                    selectors.addClass('hidden');
                    nowIndex = maxIndex;
                    var str = "#thumbnailSelector"+nowIndex;
                    $(str).removeClass('hidden');
                    carouselInit(nowIndex-1);
                }
            });
            
            $('#callTheChitBtn').click(function(){
                var a = $(this).prev().val();
                var url = 'https://cyberbureau.police.go.kr/prevention/nw/sub7.jsp?mid=020600&keyword='+a;
                var win = window.open(url, '_blank');
                win.focus();
            });
            $('#backTheChitBtn').click(function(){
                var a = $(this).prev().val();
                var url = 'https://cyberbureau.police.go.kr/prevention/nw/sub7.jsp?mid=020600&keyword='+a;
                var win = window.open(url, '_blank');
                win.focus();
            });




            
            
            
            
            
            
            
            
            
            /*
            alert("!! test과정 gno : "+gno);
            alert("!! test과정 판매자 : "+salerId);
            alert("!! test과정 구매자 : "+buyerId);
            alert("!! test과정 접속자 : "+Id);
            alert("!! test과정 Flag : "+flag);
            */
            
            
            
            var str = "<input type='hidden' name='gno' value='"+gno+"'>";
            $('.btn').click(function(){
                /*
                 * 
                 * 1 : 입금대기
				 * 2 : 입금대기(판매자만 입금버튼 누름)
				 * 3 : 입금대기(구매자만 입금버튼 누름)
				 * 
                 * */
            	
            	
            	// 만약 접속자가 판매자라면
            	if(salerId===Id){
            		if(flag=='1'){
            			if(confirm('정말로 입금확인하시겠습니까?')){
                			// 사진 전송하는것처럼 form 아래 input태그 만들고 submit시키기
                			str += "<input type='hidden' name='flag' value='2'>";
                			$('form').append(str).submit();
                			//alert("입금확인하셨습니다.\n구매자가 확인버튼을 누를 시 다음 거래가 진행됩니다.")
            			}
            		}
            		else if(flag=='2'){
            			alert("이미 입금확인하셨습니다.\n구매자가 확인버튼을 누를 시 다음 거래가 진행됩니다.")
            		}
            		else if(flag=='3'){
            			if(confirm('구매자가 입금확인을 하였습니다.\n정말로 입금확인하시겠습니까?')){
                			// 사진 전송하는것처럼 form 아래 input태그 만들고 submit시키기
                			str += "<input type='hidden' name='flag' value='4'>";
                			$('form').append(str).submit();
                			//alert("입금확인이 완료되었습니다.\n구매자와 거래 후 거래완료버튼을 눌러주세요.")
            			}
            		}
            		else if(flag=='4'){
            			if(confirm('정말로 거래를 완료하셨습니까?')){
                			// 사진 전송하는것처럼 form 아래 input태그 만들고 submit시키기
                			str += "<input type='hidden' name='flag' value='5'>";
                			$('form').append(str).submit();
                			//alert("거래를 완료하셨습니다.\n구매자가 거래완료버튼을 누를 시 거래가 정상적으로 종료됩니다.")
            			}
            		}
            		else if(flag=='5'){
            			alert("이미 거래완료 확인하셨습니다.\n구매자가 거래완료버튼을 누를 시 거래가 정상적으로 종료됩니다.")
            		}
            		else if(flag=='6'){
            			if(confirm('정말로 거래를 완료하셨습니까?\n확인 시 거래가 정상적으로 종료됩니다.')){
                			// 사진 전송하는것처럼 form 아래 input태그 만들고 submit시키기
                			str += "<input type='hidden' name='flag' value='7'>";
                			$('form').append(str).submit();
                			//alert("거래가 정상적으로 종료되었습니다.");
            			}
            		}
            	}
            	
            	
            	
            	
            	
            	
            	
            	// 만약 접속자가 구매자라면
            	if(buyerId===Id){
            		if(flag=='1'){
            			if(confirm('정말로 입금확인하시겠습니까?')){
                			// 사진 전송하는것처럼 form 아래 input태그 만들고 submit시키기
                			str += "<input type='hidden' name='flag' value='3'>";
                			$('form').append(str).submit();
                			//alert("입금확인하셨습니다.\n판매매자가 확인버튼을 누를 시 다음 거래가 진행됩니다.")
            			}
            		}
            		else if(flag=='2'){
            			if(confirm('판매자가 입금확인을 하였습니다.\n정말로 입금확인하시겠습니까?')){
                			// 사진 전송하는것처럼 form 아래 input태그 만들고 submit시키기
                			str += "<input type='hidden' name='flag' value='4'>";
                			$('form').append(str).submit();
                			//alert("입금확인이 완료되었습니다.\n판매자와 거래 후 거래완료버튼을 눌러주세요.")
            			}
            		}
            		else if(flag=='3'){
            			alert("이미 입금확인하셨습니다.\n판매자가 확인버튼을 누를 시 다음 거래가 진행됩니다.")
            		}
            		else if(flag=='4'){
            			if(confirm('정말로 거래를 완료하셨습니까?')){
                			// 사진 전송하는것처럼 form 아래 input태그 만들고 submit시키기
                			str += "<input type='hidden' name='flag' value='6'>";
                			$('form').append(str).submit();
                			//alert("거래를 완료하셨습니다.\n판매자가 거래완료버튼을 누를 시 거래가 정상적으로 종료됩니다.")
            			}
            		}
            		else if(flag=='5'){
            			if(confirm('정말로 거래를 완료하셨습니까?\n확인 시 거래가 정상적으로 종료됩니다.')){
                			// 사진 전송하는것처럼 form 아래 input태그 만들고 submit시키기
                			str += "<input type='hidden' name='flag' value='7'>";
                			$('form').append(str).submit();
                			//alert("거래가 정상적으로 종료되었습니다.");
            			}
            		}
            		else if(flag=='6'){
            			alert("이미 거래완료 확인하셨습니다.\n판매자가 거래완료버튼을 누를 시 거래가 정상적으로 종료됩니다.")
            		}
            	}
            });
            
            

            // 거래 취소버튼
            $('#tradeCancelBtn').click(function(){
            	if(flag=='a'){
            		if(Id==salerId){
            			alert("이미 취소요청된 물품입니다.\n구매자가 취소요청 시 거래가 정상적으로 취소됩니다.")
            		}else{
            			if(confirm('정말로 거래를 취소하시겠습니까?\n확인시 거래가 정상적으로 취소됩니다.')){
							str += "<input type='hidden' name='flag' value='c'>";
                			$('form').append(str).submit();
                			//alert("거래가 정상적으로 취소되었습니다.\n이용해주셔서 감사합니다.");
            			}
            		}
            	}else if(flag=='b'){
            		if(Id==salerId){
            			if(confirm('정말로 거래를 취소하시겠습니까?\n확인시 거래가 정상적으로 취소됩니다.')){
							str += "<input type='hidden' name='flag' value='c'>";
                			$('form').append(str).submit();
                			//alert("거래가 정상적으로 취소되었습니다.\n이용해주셔서 감사합니다.");
            			}
            		}else{
            			alert("이미 취소요청된 물품입니다.\n판매자가 취소요청 시 거래가 정상적으로 취소됩니다.")
            		}
            	}
            	else{
    				if(confirm('정말로 거래를 취소하시겠습니까?\n고의적 거래방해시 법적처벌의 대상이 될 수 있습니다.')){
    					if(confirm('거래품목이 취소상태로 전환됩니다.\n데이터의 복구가 어렵습니다.\n\n정말로 진행하시겠습니까?')){
    						if(Id==salerId){
    							str += "<input type='hidden' name='flag' value='a'>";
                    			$('form').append(str).submit();
                    			alert("판매자에의해 거래취소요청되었습니다.");
    						}else{
    							str += "<input type='hidden' name='flag' value='b'>";
                    			$('form').append(str).submit();
                    			alert("구매자에의해 거래취소요청되었습니다.");
    						}
    					}
    				}
    			}
            });
            
            
            
        });
        
        
        
        