


        $(document).ready(function(){
        	
        	
        	var fileCnt = 0;
        	
        	// 썸네일 선택은 하나만 가능하게 delegate 적용
        	//$('input[type="checkbox"]').click(function(){
        	$('#dragFileZone').delegate("input[type='checkbox']", "click", function(){
                $('input[type="checkbox"]').prop("checked", false);
                $(this).prop("checked", true);
            });
            
            // 시작가, 즉시구매가에 입력하고 벗어나는 순간 이벤트처리
            $('.inputMoney').focusout(function() {
                var value= $(this).val();
                // 입력한 값이 숫자형식이 아니라면
                if(value!="" && !is_number(value)){
                    alert("금액 입력값을 확인해주세요.");
                    $(this).addClass('error');
                }
                // 입력한 금액이 '1000'원 이하인 경우
                else if(value!="" && value<1000){
                    alert("최소 입력금액은 1000원입니다.");
                    $(this).addClass('error');
                }
                // 입력한 값이 1000원 이상이거나 비어있는 경우
                else{
                    // 비어있지 않다면 금액에 콤마를 붙여줌
                    if(value!=""){
                        //var money = makeComma(value);
                        //$(this).val(money);
                    }
                    $(this).removeClass('error');
                }
            });

            // 숫자인지 아닌지 구별하는 메소드
            function is_number(x){
                var reg = /^\d+$/;
                return reg.test(x);
            }

            // 금액에 콤마(,) 를 붙여주는 정규식 -> 1,230,000 형식
            function makeComma(str) {
                str = String(str);
                return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
            }

            // 파일 드래그할수있는 구역을 열고 닫을 수 있는 버튼 이벤트처리
            var dragZoneFlag = false;
            $('#dragZoneOpen').click(function(e){
                if(dragZoneFlag == false){
                    $('#dragFileZone').removeClass('hidden');
                    $('.thumbInfo').removeClass('hidden');
                    $('#dragZoneOpen').html('▲');
                    dragZoneFlag = true;
                }
                else{
                    $('#dragFileZone').addClass('hidden');
                    $('.thumbInfo').addClass('hidden');
                    $(this).html('▼');
                    dragZoneFlag = false;
                }
            });
            

        	
            
            // 등록하기 버튼 이벤트
            $("input[type='submit']").click(function(e){
            	
                e.preventDefault();
                e.stopPropagation();
                
            	// 정상적으로 input값들이 채워졌는지 확인
            	if(checkList()){
            		if($('input[type="checkbox"]:checked').length == 0){
                        alert("대표이미지를 선택해주세요");
                        return;
                    }
            		else{
                		var str = "";
                		var thumbnailUUID = $('input[type="checkbox"]:checked').val();
                        $('#dragFileZone div .getImageList').each(function(i, obj){
                        	var jobj = $(obj);
                        	
                        	// 썸네일로 선택한 이미지라면 thumbnail값을 1로 아니면 0으로
                        	if(thumbnailUUID == jobj.data("uuid")){
                        		str += "<input type='hidden' name='imagelist["+i+"].filename' value='"+jobj.data("filename")+"'>";
                            	str += "<input type='hidden' name='imagelist["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
                            	str += "<input type='hidden' name='imagelist["+i+"].uploadpath' value='"+jobj.data("uploadpath")+"'>";
                            	str += "<input type='hidden' name='imagelist["+i+"].thumbnail' value='1'>";                            	
                        	}else{
                        		str += "<input type='hidden' name='imagelist["+i+"].filename' value='"+jobj.data("filename")+"'>";
                            	str += "<input type='hidden' name='imagelist["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
                            	str += "<input type='hidden' name='imagelist["+i+"].uploadpath' value='"+jobj.data("uploadpath")+"'>";
                            	str += "<input type='hidden' name='imagelist["+i+"].thumbnail' value='0'>";
                        	}
                        		
                        	
                        });
                        $('form').append(str).submit();
            		}
            	}
            });
            
            function checkList(){
            	//제목이 입력되있는가
            	var gname = $('#inputGname');
            	if(gname.val().length==0 || gname.val() == ""){
            		alert("제목을 입력해주세요");
            		gname.addClass('error');
                	return false;
            	}else{
            		gname.removeClass('error');
            	}
            	
            	// 즉시구매가가 시작가보다 5천원(최소 금액차) 이상인지 확인
            	var startprice = $('#inputStartPrice');
            	var endprice = $('#inputEndPrice');
            	if(endprice.val()-startprice.val() < 5000 || startprice.val() == "" || endprice.val() == ""){
            		alert("즉시구매가는 시작가보다 최소 5000원 비싸야합니다.");
            		startprice.addClass('error');
            		endprice.addClass('error');
                	return false;
            	}else{
            		startprice.removeClass('error');
            		endprice.removeClass('error');
            	}
            	
            	//계좌번호입력상태 확인
            	var startprice = $('#inputBankAcount');
            	if(startprice.val()=="" || startprice.val().length<8){
            		alert("계좌번호 입력을 확인해주세요");
            		startprice.addClass('error');
                	return false;
            	}else{
            		startprice.removeClass('error');
            	}
            	
            	// 파일이 하나라도 선택되었는지 확인
            	var ginfo = $('#inputBankAcount');
            	if(fileCnt<1){
            		alert("이미지를 최소 1개 등록하셔야합니다");
            		ginfo.addClass('error');
                	return false;
            	}else{
            		ginfo.removeClass('error');
            	}
            	
            	
            	// 물품설명이 빈칸인지 확인
            	var ginfo = $('#inputGinfo');
            	if(ginfo.val()==""){
            		alert("물품설명을 적어주세요");
            		ginfo.addClass('error');
                	return false;
            	}else{
            		ginfo.removeClass('error');
            	}
            	
            	return true;
            }

            
            
            
            
            
            
            
            
            
            
            
            
            
            

            $("input[type='file']").change(function(){
            	// 멀티파일 적용
            	var fileInput = document.getElementById("fileSelector");
                var files = fileInput.files;
                
                var formData = new FormData();
                for (var i = 0; i < files.length; i++) {
                    if(!checkExtension(files[i].name,1000)){
                        $(this).val("");
                        return false;
                    }else{
                    	//var str = dragFile(files[i].name);
                        $('#dragFileZone').removeClass('hidden');
                        $('.thumbInfo').removeClass('hidden');
                        $('#dragZoneOpen').html('▲');
                        dragZoneFlag = true;
                        //$('#dragFileZone').append(str);
                        $('#dragFileZone span').addClass('hidden');
                        
                        formData.append("uploadFile", files[i]);
                        
                        fileCnt++;
                    }
                }
                // ajax처리
                $.ajax({
                	url: '/register/files',
                	processData: false,
                	contentType: false,
                	beforeSend: function(xhr){
                		xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
                	},
                	data: formData,
                	type: 'POST',
                	success: function(result){
                		showUploadResult(result);
                	},
                	fail: function(){
        				alert("파일 등록 중 예상치못한 에러가 발생하였습니다.");
                	},
                	complete: function(result){
                	}
                });
            });

            $('#dragFileZone').on("dragenter dragover",function(e){
                e.preventDefault();//파일이 새롭게 열리는 것을 막는다.
            });
            $('#dragFileZone').on("drop",function(e){
		        e.preventDefault();//파일이 새롭게 열리는 것을 막는다. 
                $('#dragFileZone span').addClass('hidden');
                var files=e.originalEvent.dataTransfer.files;
        		//formData객체에 업로드할 파일들을 추가
                var formData = new FormData();
                for(var i=0; i<files.length; i++){
                    if(!checkExtension(files[i].name,files[i].size)){
                        return false;
                    }else{
                        formData.append("uploadFile", files[i]);
                        fileCnt++;
                    }
                }
                // ajax처리
                $.ajax({
                	url: '/register/files',
                	processData:false,
                	contentType:false,
                	beforeSend: function(xhr){
                		xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
                	},
        			data:formData,
        			type:'POST',
        			dataType:'json',
        			success:function(result){
                		showUploadResult(result);
                	},
                	fail: function(){
        				alert("파일 등록 중 예상치못한 에러가 발생하였습니다.");
                	},
                	complete: function(result){
                	}
                });
            });

            

            var regex=new RegExp("()\.(jpg|JPG|jpeg|JPEG|jfif|JFIF|TIFF|GIF|gif|png|PNG)$");
            var maxSize=8*1024*1024;//8MB
            function checkExtension(fileName,fileSize){
                if(fileSize>=maxSize){
                    alert("파일사이즈 초과");
                    return false;
                }
                if(!regex.test(fileName)){
                    alert("해당 종류의 파일은 업로드할 수 없습니다.");
                    return false;
                }
                return true;
            }
            // 이미지 드래그 존 안내 배너 닫기버튼
            $('.closeBtn').click(function(){
                $('#dragFileZone span').addClass('hidden');
            });

            // dragFileZone fileDeleteBtn
            // 파일 등록 후 삭제 하기 버튼구현 -> delegation
            $('#dragFileZone').delegate(".fileDeleteBtn", "click", function(){
                //$(this).closest('div').remove();
            	if(confirm("정말 삭제하시겠습니까?")){
            		$(this).closest('div').remove();
            		fileCnt--;
            	}
            });
            
            
            // 이미지 파일 클릭시 보기
            function showImage(fileCallPath){
            	alert(fileCallPath);
            }
            function showUploadedFile(uploadResultArr){
            	var str = "";
            }
            
            
            
            
            
            
            
            
            
            
            
            

            // filename을 받아 html에 append시킬 문자열 str만드는 메소드
            /*
            function dragFile(fileName){
                var str = "<div>";
                        str += "<i class=\"far fa-images\"></i>";
                        str += fileName;
                        str += "<i class=\"far fa-times-circle fileDeleteBtn\"></i>";
                    str += "</div>";
                return str;
            }
            */


            function showUploadResult(uploadResultArr){
        		//첨부파일목록이 없으면 중지
        		if(!uploadResultArr || uploadResultArr.length==0){
        			return;
        		}
        		
        		console.log("@@@@@@@@@@@@@@@@@@@@@@@@@");
        		var uploadResult = $('#dragFileZone')
        		
        		//목록초기화
        		//uploadResult.empty();
        		
        		var str="";
        		$(uploadResultArr).each(function(i,obj){
        			var fileCallPath=encodeURIComponent(obj.uploadPath+"/"+obj.uuid+"_"+obj.fileName);
        			var fileLink=fileCallPath.replace(new RegExp(/\\/g),"/");
    				
        			str += "<div>";
        			str += "<input type='checkbox' name='selectedImg' value='" + obj.uuid + "'>";
                    str += "<i class=\"far fa-images\"></i>";
                    
                    // 아래의 주소로 서버의 이미지를 로드
                    // http://localhost:8181/img      
                    // 2020/07/16   /      9423c531-79af-4920-bb25-0d108dc698cc    _      banner.png
                    str += "<a href=\"/img/"+ obj.uploadpath +"/" + obj.uuid + "_" + obj.filename + "\" onclick=\"window.open(this.href, '이미지', 'width=500, height=500'); return false;\">"+obj.filename+"</a>";
                    
                    console.log("!!!! 페이지에 등록 !!!!");
                    console.log("uuid"+obj.uuid);
                    console.log("uploadpath"+obj.uploadpath);
                    console.log("filename"+obj.filename);
                    console.log("!!!!!!!!!!!!!!!!!!!!!");
                    
                    str += "<i class=\"far fa-times-circle fileDeleteBtn getImageList\" data-uuid=\""+ obj.uuid +"\" data-filename=\""+ obj.filename+"\" data-uploadpath=\""+ obj.uploadpath +"\"></i>";
                    // var a = $(this).data("uuid");
                    str += "</div>";
        			
        		});
        		
        		console.log("##################################################");
        		console.log(str);
        		console.log("##################################################");
        		uploadResult.append(str);
        		
        	}
        });