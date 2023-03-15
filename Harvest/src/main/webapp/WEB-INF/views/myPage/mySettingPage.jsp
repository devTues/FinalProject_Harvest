<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Start your development with JoeBLog landing page.">
    <meta name="author" content="Devcrud">
    <title>harVest</title>
    <!-- font icons -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/vendors/themify-icons/css/themify-icons.css">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
    <!-- Bootstrap + JoeBLog main styles -->
   <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/joeblog.css">
   <link rel="icon" href="data:;base64,iVBORw0KGgo=">
   <style>
    /* Make the image fully responsive */
    .carousel-inner img {width: 100%; height: 100%;}
    
    img.profile_img {
    width: 100px;
    height: 100px;
    border-radius: 50%;
    overflow: hidden;
    }
    
    input[type=text] {border:0 solid black;} 

   </style>
   
   
   
</head>
<body data-spy="scroll" data-target=".navbar" data-offset="40" id="home">
<c:if test="${empty sessionScope.id}">
	<c:redirect url="/user/login"></c:redirect>
</c:if>
   <!-- page-header -->
     <jsp:include page="../inc/header.jsp"></jsp:include>
    
    <!-- 본문 내용 -->
    
   <!-- 프로필 시작 -->
   <div class="container text-left">
       <section>
         <div class="media mb-5">
            <h2 class="mt-0" id="mt-0">설정</h2>
            </div>
              <!-- 프로필 메뉴영역 -->
               <ul class="nav nav-tabs">
           <li class="nav-item">
             <a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath }/myPage/mySettingPage">계정</a>
           </li>
           <li class="nav-item">
             <a class="nav-link" href="${pageContext.request.contextPath }/myPage/myAddress">배송지</a>
           </li>
           <li class="nav-item">
             <a class="nav-link" href="${pageContext.request.contextPath }/myPage/mySupport">후원한 프로젝트</a>
           </li>
           <li class="nav-item">
             <a class="nav-link" href="${pageContext.request.contextPath }/myPage/myCreate">내가 만든 프로젝트</a>
           </li>
           <li class="nav-item">
             <a class="nav-link" href="${pageContext.request.contextPath }/myPage/myFavorite">찜한 프로젝트</a>
           </li>
           <li class="nav-item">
             <a class="nav-link" href="${pageContext.request.contextPath }/myPage/myAlarm">알림 </a>
           </li>
         </ul>
         <!-- 프로필 메뉴영역 끝 -->
       </section>
   </div>
   

   <div class="container">
<form action="${pageContext.request.contextPath }/myPage/updatePro" method="post" name="updateUser" id="updateUser">
        <div class="page-container">
            <div class="page-content">
                <div class="card">
               <div class="container">
                        <!-- TODO 히든으로 숨기기 -->
                        <input type="hidden" name="idx" class="idx" id="idx" value="${userDto.idx}" readonly>
                  <div class="media test">
                     <h5 class="components-section-title col-10 pl-0">프로필 사진</h5>
                     <label class="btn-ch btn btn-outline-dark btn-sm rounded" id="modifyProfile" for="ch1">수정</label> <!-- 버튼처럼 이용할 레이블-->
                  </div>
                     <img alt="" src="${pageContext.request.contextPath }/resources/upload/${userDto.profile}" class="profile_img" width="300" height="300">
                  <input type="checkbox" class="chck" name="profile" id="ch1"> <!-- 체크 기능만 있고 숨기는 체크박스 -->
                  <div class="box">
                        <input type="hidden" name="hidden_profile" class="hidden_profile" id="hidden_profile" value="${userDto.profile}">
                        
                        <input type="file" id="file"  style="display:none;" >
                        <label for="file">파일첨부</label>
                        <input type="text" name="Profile" class="profile" id="profile" value="${userDto.profile}" readonly>
<!--                         <button type="button" class="btn btn-dark" name="checkProfile" id="checkProfile">확인</button> -->
                        <button type="button" class="btn btn-dark save" name="saveProfile" id="saveProfile">저장</button>
<!--                         </form> -->
                  </div>
                  <hr>
                  
                     <div class="media">
                     <h5 class="components-section-title col-10 pl-0">이메일</h5>
<!--                      <label class="btn-ch btn btn-outline-dark btn-sm rounded" id="modifyId" for="ch3">수정</label> 버튼처럼 이용할 레이블 -->
                  </div>
<%--                         <input type="hidden" name="hidden_id" class="hidden_id" id="hidden_id" value="${userDto.id}"> --%>
                        <input type="text" name="id" class="id" id="id" value="${userDto.id}"
                           required="required" readonly>
                  <input type="checkbox" class="chck" name="id" id="ch3"> <!-- 체크 기능만 있고 숨기는 체크박스 -->
                  <div class="box">
                        <button type="button" class="btn btn-dark" name="checkId" id="checkId">확인</button>
                        <button type="button" class="btn btn-dark" name="saveId" id="saveId">저장</button>
                  </div>
                  <hr>
                  
                  <div class="media">
                     <h5 class="components-section-title col-10 pl-0">이름</h5><br>
                     <label class="btn-ch btn btn-outline-dark btn-sm rounded" id="modifyName" for="ch2">수정</label> <!-- 버튼처럼 이용할 레이블--> 
                  </div>
                        <input type="hidden" name="hidden_name" class="hidden_name" id="hidden_name" value="${userDto.name}">
                        <input type="text" name="name" class="name" id="name" value="${userDto.name}" placeholder="이름을 입력해주세요." readonly>
                  <input type="checkbox" class="chck" name="name" id="ch2"> <!-- 체크 기능만 있고 숨기는 체크박스 -->
                  <div class="box">
<!--                         <button type="button" class="btn btn-dark" name="checkName" id="checkName">확인</button> -->
                        <button type="button" class="btn btn-dark save" name="saveName" id="saveName">저장</button>
                  </div>
                  <hr>
                  
                  <!-- TODO 비번 숨김 -->
                  <div class="media">
                     <h5 class="components-section-title col-10 pl-0">비밀번호</h5>
                     <label class="btn-ch btn btn-outline-dark btn-sm rounded" id="modifyPass" for="ch4">수정</label> <!-- 버튼처럼 이용할 레이블-->
                  </div>
                  <!-- TODO 비번 삭제 -->
                        히든처리하기<input type="text" name="hidden_pass" class="hidden_pass" id="hidden_pass" value="${userDto.pass}">
                  <input type="checkbox" class="chck" name="pass" id="ch4"> <!-- 체크 기능만 있고 숨기는 체크박스 -->
                  <div class="box">
                        type=password 처리하기
                        현재 비밀번호<br> 
                        <input type="text" name="pass" class="pass" id="pass" placeholder="현재 비밀번호" readonly><br>
                        <br>
                        변경할 비밀번호<br>
                        <input type="text" name="pass2" class="pass2" id="pass2" placeholder="변경할 비밀번호"><br>
                        <input type="text" name="pass3" class="pass3" id="pass3" placeholder="변경할 비밀번호 확인"><br>
<!--                         <button type="button" class="btn btn-dark" name="checkPass" id="checkPass">확인</button> -->
                        <button type="button" class="btn btn-dark save" name="savePass" id="savePass">저장</button>
                  </div>
                  <hr>
                  
                  <div class="media">
                     <h5 class="components-section-title col-10 pl-0">연락처</h5>
                     <label class="btn-ch btn btn-outline-dark btn-sm rounded" id="modifyPhone" for="ch5">수정</label> <!-- 버튼처럼 이용할 레이블-->
                  </div>
                  <!-- TODO 비번 삭제 -->
                        <input type="hidden" name="hidden_phone" class="hidden_phone" id="hidden_phone" value="${userDto.phone}">
                        <input type="text" name="phone" class="phone" id="phone" value="${userDto.phone}" placeholder="휴대폰 번호를 입력해주세요." readonly>
                  <input type="checkbox" class="chck" name="phone" id="ch5"> <!-- 체크 기능만 있고 숨기는 체크박스 -->
                  <div class="box">
<!--                         <input type="text" name="phone2" class="phone2" id="phone2"> -->
<!--                         <button type="button" class="btn btn-dark" name="checkPhone" id="checkPhone">확인</button> -->
                        <button type="button" class="btn btn-dark save" name="savePhone" id="savePhone">저장</button>
                  </div>
                  <hr>
                  
               
                  <div class="media">
                     <h5 class="components-section-title col-10 pl-0">회원탈퇴</h5>
                     <label class="btn-ch btn btn-outline-dark btn-sm rounded" for="ch7">탈퇴</label> <!-- 버튼처럼 이용할 레이블-->
                  </div>
                  <input type="checkbox" class="chck" id="ch7">
                  <div class="box">
                     <input type="text" value="회원탈퇴 페이지로 이동합니다">
                     <button type="submit" class="btn btn-dark">확인</button>
                  </div>
   <input type="text" name="unregist" class="unregist" id="unregist" value="${userDto.unregist}">
   <input type="text" name="unregDate" class="unregDate" id="unregDate" value="${userDto.unregDate}">
   <input type="text" name="eventAlr" class="eventAlr" id="eventAlr" value="${userDto.eventAlr}">
               </div>
            </div>
         </div>
      </div>
   <!-- 프로필 끝 -->
   
    <hr>
            <!-- Sidebar -->
<!--             <div class="page-sidebar text-left"> -->
<!--             <div class="card mb-4"> -->
<!--                     <a href="single-post.html" class="overlay-link"></a> -->
<!--                     <div class="card-body px-0"> -->
<!--                         <h5 class="card-title mb-2">어떤 정보가 프로필에 공개되나요?</h5>    -->
<!--                         <p class="my-2">프로필 사진과, 이름, 회원님과 관련된 프로젝트 등이 프로필 페이지에 공개 됩니다.</p> -->
<!--                     </div>       -->
<!--                 </div> -->
<!--             </div> -->
<!--         </div> -->
      </form>
    </div>


    <!-- Page Footer -->
    <jsp:include page="../inc/footer.jsp"></jsp:include>
</body>

   <!-- core  -->
    <script type="text/javascript" src="${pageContext.request.contextPath }/resources/harVest_js/jquery-3.6.3.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/vendors/bootstrap/bootstrap.bundle.js"></script>
      <!-- JoeBLog js -->
    <script src="${pageContext.request.contextPath }/resources/assets/js/joeblog.js"></script>
    
   <!-- 제이쿼리 validate -->
<!--    <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.js"></script> -->
<!--    <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script> -->

<!--    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
  
<!--   jQuery 라이브러리를 로드합니다. --> 
<!-- <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> -->
<!-- jQuery Validate 플러그인을 로드합니다. --> 
<!-- <script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script> -->

   <script type="text/javascript" src="${pageContext.request.contextPath }/resources/harVest_js/jquery.validate.js"></script>
   <script type="text/javascript" src="${pageContext.request.contextPath }/resources/harVest_js/jquery.validate.min.js"></script>
   <script type="text/javascript" src="${pageContext.request.contextPath }/resources/harVest_js/additional-methods.js"></script>
   <script type="text/javascript" src="${pageContext.request.contextPath }/resources/harVest_js/additional-methods.min.js"></script>
   <script type="text/javascript" src="${pageContext.request.contextPath }/resources/harVest_js/messages_ko.min.js"></script>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function address_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('address_postcode').value = data.zonecode;
                document.getElementById("address_roadAddress").value = roadAddr;
                document.getElementById("address_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("address_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("address_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>


   <!-- ajax (필요한가? 잘모름..) -->
<!--    <script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.0/jquery.validate.min.js" ></script> -->
<!--     <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.js"></script>  -->
    
    <script type="text/javascript">
   
   $(document).ready(function() {
      
       // custom validation 정의
//       $.validator.addMethod('spaceCheck', function (value, element, params) {
//                //검사하는 name태그의 value 중 공백이 없으면 true, 있으면 false리턴
//                return $(element).val().indexOf(" ") = -1 ? true : false;
//             }, '공백을 제거해주세요.'
//       );

       $.validator.addMethod(
           'mobilephone', function (value, element, params) {
               return (value.substring(0, 1) == 0) ? true : false;
           }, '0으로 시작하여야 합니다.'
       );

       $.validator.addMethod(
          'passRegx', function(value, element, params) {
             return (this.optional(element) ||  /^.*(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/.test(value)) ? true : false;
           },'8~16자 이내 영문, 숫자, 특수문자를 반드시 포함해야 합니다.'
       );


      // form validate 함수 호출
      $("#updateUser").validate({
         
         rules : {
                  name : {
                        required: true,
//                         required: '#ch2:checked',
                        rangelength: [ 2, 10 ]
                        },
                  
                  pass: {
                        required: true,
                          equalTo: '#hidden_pass',
                          passRegx: true
                        },
                    
                  pass2: {
                        required: function (element) {
                                return $('#ch4').is(':checked');
                               },
                     
//                         spaceCheck: true,
//                         required: true, 
                          rangelength: [ 8, 16 ],
                          passRegx: true
                        },   

                  pass3: {
                          required: true,
                          equalTo: '#pass2'
                        },
                    
                  phone : {
//                           required: true,
                          rangelength: [ 11 , 11 ],

                          required: function (element) {
                                return $('#ch5').is(':checked');
                            },
                           
//                             minlength: 11,
                            mobilephone: true,
                            digits: true
                          },
               },
               
         messages : {
                  name : {
                        required : "비워두시면 안됩니다.",
                        rangelength : "2자 이상 입력해주세요."
                        },
                  
                  pass: {
                         required:"비워두시면 안됩니다.",
                          equalTo: "현재 비밀번호와 다릅니다."
                        },
                      
                  pass2: {
   // //                      spaceCheck: "공백을 제거해주세요!",
                         required: "비워두시면 안됩니다."
   //                       rangelength : "비밀번호는 8자 이상 16자 이하로 입력해주세요."
                         },
                         
                  pass3: {
                         required:"비워두시면 안됩니다.",
                          equalTo: "비밀번호가 일치하지 않습니다."
                        },
                    
                  phone: {
   //                   required: "휴대폰번호를 입력해주세요.",
                        rangelength: $.validator.format("'-'제외 최소 {0} 글자 이상 입력해주세요."),
//                      digits: "' - ' 제외 숫자만 입력해주세요." 
                     
                        required: "비워두시면 안됩니다.",
//                      minlength: $.validator.format("'-'제외 최소 {0} 글자 이상 입력해주세요."),
                        digits: "숫자만 입력해주세요." 
                           },
                  },
                  
         submitHandler : function(form) {
        	 form.submit();
//         	 debugger;
            
//            $('.save').click(function(){
// 				btnId = this.id.replace("save","").toLowerCase();
				
// 				$.ajax({
// 					url:'${pageContext.request.contextPath}/myPage/mylistUpdate',
// 					type: "GET", 
// 				    contentType: "application/json;charset=UTF-8",
// 				    dataType : "json",
// 					async : false,
// 					data:{
// 						value : $('#' + btnId).val(),
// 						valueNm : btnId
						
// 					},
// 					success: function(rdata){
// 					}
				 
// 				});	// end ajax()
			
// 			}); // end save() 
            
         }
      });   // end validate

//       // keyup 이벤트 핸들러 등록
//       $('#'+this.id).on('keyup', function() {
// //          alert(this.id);
//          $("#updateUser").valid(); // 입력 필드가 변경될 때마다 validate 함수 호출
//       });   // end on keyup
      
      
      $('input').on('focus focusout keyup', function () {
           $(this).valid();
//            $(element).valid();
      });

   if (typeof jQuery === 'undefined') {
       console.log('jQuery library is not found!');
   } else {
       console.log('jQuery library is loaded successfully!');
   }

   if (typeof jQuery.validator === 'undefined') {
       console.log('jQuery Validate plugin is not found!');
   } else {
       console.log('jQuery Validate plugin is loaded successfully!');
   }
   
   
  });   // end ready
   
  $(document).ready(function() {
	  	
	  	let btnId;
		let ckId;
		let ckName;
		
		// 수정버튼(체크박스) checked 여부
		$(".chck").change(function(){
			ckId = this.id;
			ckName = this.name;
			alert(ckId);	// ch2
			alert(ckName);	// name
			
	        if($('#' + ckId).is(":checked")){
				$('#' + ckName).prop('readonly', false);
	        }else{
				$('#' + ckName).prop('readonly', true);
				

			var a = $('#hidden_'.concat(ckName)).val();
				alert(a);
				$('#' + ckName).val(a);
	        }
	    });	// 체크박스 .change 함수
	    
	  
	  
	  
	    $('.save').click(function() {
	        btnId = this.id.replace("save", "").toLowerCase();
	        
	        if ($("#updateUser").valid()) { // Validate the form before making the AJAX call
	            $.ajax({
	                url: '${pageContext.request.contextPath}/myPage/mylistUpdate',
	                type: "GET",
	                contentType: "application/json;charset=UTF-8",
	                dataType: "json",
	                async: false,
	                data: {
	                    value: $('#' + btnId).val(),
	                    valueNm: btnId
	                },
	                success: function(rdata) {
	                    // Handle successful response here
	                	$("#" + ckId).prop("checked", false); 
						$('#' + btnId).prop('readonly', true);
	                    
	                    
	                },
	                error: function(xhr, status, error) {
	                    // Handle error here
	                }
	            }); // end ajax()
	        }
	    }); // end save() 
	}); // end ready

	
$(document).ready(function() {
	$("#saveProfile").click(function(){
		var formData = new FormData();
		var inputFile = $('input[name="Profile"]');
		var file = inputFile[0].files
		formData.append('file', file)
		
		
		$.ajax({
            url: '${pageContext.request.contextPath}/myPage/updateFile',
            type: "POST",
            data: formData,
//             enctype: 'multipart/form-data',
            processData: false,
            contentType: false,
            cache: false,
            success: function(rdata) {
            },
            error :  function(request,status,error){
                alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                }
        }); // end ajax()
        
        
		
	});
});	
	
	
	
	
	
	$("#file").on('change',function(e){
		  var files = e.target.files;
// 		  var allFiles ="";
// 		  for(var i = 0; i < files.length; i++){
// 			      allFiles += files[i].name;
// 		   }
		//해당자리에 val값 바꾸기
		  $(".profile").val(files[0].name);
	});
	
	

	window.onload = function(){
		const fileDOM = document.querySelector('#file');
		const preview = document.querySelector('.profile_img');
		
		
		fileDOM.addEventListener('change', () => {
// 			debugger;
	 		const reader = new FileReader();
	  		reader.onload = ({ target }) => {
	    	preview.src = target.result;
	  		};
	  		reader.readAsDataURL(fileDOM.files[0]);
		});
		
	};
	
	
   </script>
</html>