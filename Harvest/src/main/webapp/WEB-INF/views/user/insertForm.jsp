<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Start your development with JoeBLog landing page.">
    <meta name="author" content="Devcrud">
    <title>harVest/insertForm</title>
    <!-- font icons -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/vendors/themify-icons/css/themify-icons.css">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
    <!-- Bootstrap + JoeBLog main styles -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/joeblog.css">
	<!-- 	눈모양 -->
	<link rel="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
	<!-- 로고이미지 가운데 정렬 -->
	<style>
	   div {
	      text-align: center;
	   }
	   
	   .valid { 
		  font-size: 11px;
		  font-weight: bold; 
		}

		.valid { color: red; }
		
	</style>
	
	
	
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/harVest_js/jquery-3.6.3.js"></script>
	<script type="text/javascript">
	
	let checkResult = false;
	let checkNameResult = false;
	let checkIdResult = false;
	let checkPassResult = false;		
	let checkPhoneResult = false;
	
	
	// 이름 정규표현식 제어
	
	function nameCheck() {
		
		var name = $('#name').val();
		var span = document.getElementById('checkName');
		var nameRegex = /^[가-힣]{2,}|[a-zA-Z]{2,}\s[a-zA-Z]{2,}$/;
		
		if(nameRegex.exec(name)){		//nameRegex 입력한 값이 맞으면
			checkNameResult = true;		//결과가 true
			
			span.innerHTML = '';		//알림텍스트 사라짐
		}else {
			span.innerHTML = '이름이 잘못 되었습니다.';
			span.style.color = 'RED';
			checkNameResult = false;
		}
	}
	
	
	// 이메일(아이디) 정규표현식 제어
	function emailCheck(){
	   
	   var email = $('#email').val();
	   var span = document.getElementById('checkEmail');
	   var emailRegex = /^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/;
	   
	   if(emailRegex.exec(email)){
	      checkEmailResult = true;
	      
	      span.innerHTML = '';
	      
	   } else {
	      span.innerHTML = '이메일 형식이 잘못되었습니다.';
	      span.style.color = 'RED';
	      checkEmailResult = false;
	   }
	} 
	
	
	// 인증번호 메일 발송
	function authKeyCheck() {

		const email = $('#email').val(); // 이메일 주소값 얻어오기!
		console.log('완성된 이메일 : ' + email); // 이메일 오는지 확인
		const checkInput = $('.mail-check-input') // 인증번호 입력하는곳 
	
		
		$.ajax({
			type : 'get',
			url : '${pageContext.request.contextPath }/user/mailCheck?email=' + email,
			success : function (data) {
				console.log("data : " +  data);
				checkInput.attr('disabled',false);
				code = data;
				alert('인증번호가 전송되었습니다.')
			}			
		}); // end ajax
	}
	
	
	// 인증번호 비교 (일치/불일치 메세지)
	function vericodeCheck() {
		
		const inputCode = $('#codeCheck').val();
		const $resultMsg = $('#mail-check-warn');
		debugger;
		if(inputCode === code){
			$resultMsg.html('인증번호가 일치합니다.');
			$resultMsg.css('color','green');
			$('#codeCheck').attr('disabled',true);
// 			$('#join').submit();
			vericode = true;
			
		}else{
			$resultMsg.html('인증번호가 불일치 합니다. 다시 확인해주세요!');
			$resultMsg.css('color','red');
			$('#codeCheck').focus();
			vericode = false;
		}
	}
	
	
	
	
	// 비밀번호 정규표현식 제어
	function passCheck(pass1) {
		var pass1 = $('#pass1').val();
		// 패스워드 검사를 위한 정규표현식 패턴 작성 및 검사 결과에 따른 변수값 변경
		var span = document.getElementById('checkPassResult');
		
		// 정규표현식 패턴 정의
		var lengthRegex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;
	    var engUpperRegex = /[A-Z]/; // 대문자 규칙
	    var engLowerRegex = /[a-z]/; // 소문자 규칙
	    var numRegex = /[0-9]/;       // 숫자 규칙
	    var specRegex = /[!@#$%^&*]/;    // 특수문자 규칙
	    
// 	    var count = 0;		// 각 규칙별 검사 결과를 카운팅 할 변수

		if(lengthRegex.exec(pass1)){
			checkResult = true;
			
			span.innerHTML = '사용 가능한 패스워드 입니다.'; 
			span.style.color = 'GREEN';
		
		}else {
			checkResult = false;
			span.innerHTML = '8 ~ 16 자리 영문자, 숫자, 특수문자(@$!%*#?&)는 필수 입력 값입니다.';
			span.style.color = 'RED';
		}
		checkRetypePass();
	}
	
	// TODO 이거 해야됨
	//	비밀번호 표시/숨기기 눈모양 토글
	//	활성화된 눈모양을 다시 클릭하면 토글로 인해 active 클래스가 사라지므로 다시 처음과 같이 원상복구 시킨다. 
// 	$(document).ready(function(){
// 	  $('.input form-group i').on('click', function(){
// 		$('input').toggleClass('active');   
// 		if($('input').hassClass('active')){	// 비밀번호 입력 input이 active 클래스를 가지고 있으면
// 			$(this).attr('class', "fa fa-eye-slash fa-lg")
// 			.prev('input').attr('type', "text");
// 		}else{
// 			$(this).attr('class', "fa fa-eye fa-lg")
// 			.prev('input').attr('type', 'password');
// 		}
// 	  });
// 	});
	
	
	
	// 비밀번호 재확인 입력 제어
	function checkRetypePass() {
		var span = document.getElementById('checkRetypePassResult');
		
		var pass1 = document.getElementById('pass1').value;
		var pass2 = document.getElementById('pass2').value;
		
		if(pass1 == pass2){
			checkPassResult = true;
			
			span.innerHTML = '비밀번호가 일치합니다.';
			span.style.color = 'GREEN';
		
		}else {
			span.innerHTML = '비밀번호를 다시 확인해 주세요.';
			span.style.color = 'RED';
			
			checkPassResult = false;
		}
	}
	
	
	// 휴대폰 번호 입력 제어
	function phoneCheck() {
	   var phone = $('#phone').val();	
		
	   var phone = document.getElementById('phone').value;
	   
	   var phoneElem = document.getElementById('phone');
	   var phoneRegex = /^(010|011|016|017|018|019)[0-9]{3,4}[0-9]{4}$/;
	   var span = document.getElementById('checkPhone');
	   
	   phoneElem.value = phone.replaceAll('-', '');   
		
	   if(phoneRegex.exec(phone)){
		      checkPhoneResult = true;
		      
		      span.innerHTML = '';
		      
		      
		   } else {
		      span.innerHTML = '휴대전화 형식이 잘못되었습니다.';
		      span.style.color = 'RED';
		      checkPhoneResult = false;
		   } 
	}
	
	// 주소 + 상세주소 작업
	function addrChange() {
		$('#address').val( $('#address1').val() + ' / ' + $('#address2').val() );
	}
	
	
// =========================================================================
	
	// 입력 제어
	function checkSubmit() {
	
		// name 제어
		if($('#name').val() == ""){
			alert("이름을 입력하세요.");
			$('#name').focus();
			
			return false;
		}
		
		// email 제어
		if($('#email').val() == ""){
			alert("이메일을 입력하세요.");
			$('#email').focus();
			
			return false;
		}
		
		// codeCheck 제어
		if($('#codeCheck').val() == ""){
			alert("인증번호를 입력하세요.");
			$('#codeCheck').focus();
			
			return false;
		}

		// pass 제어
		if($('#pass1').val() == "") {
			alert("비밀번호를 입력하세요.");
			$('#pass1').focus();
			
			return false;
		}
		
		// pass2 제어
		if($('#pass2').val() == "") {
			alert("비밀번호를 입력하세요.");
			$('#pass2').focus();
			
			return false;
		}
		
		// phone 제어
		if($('#phone').val() == "") {
			alert("휴대폰 번호를 입력하세요.");
			$('#phone').focus();
			
			return false;
		}
		
// 	}
	
// =========================================================================
		
		// null 체크
		if(!checkNameResult){			// 이름 유효성 체크
			alert("이름을 다시 입력하세요.");
			$('#name').focus();
			return false;
		}
		
		if(!checkEmailResult){				// 이메일 유효성 체크
			alert('이메일을 다시 입력하세요.');
			$('#email').focus();
			return false;
		}
		if(!vericode){				// 인증코드 유효성 체크(일치/불일치)
			alert('인증번호를 다시 확인해주세요.');
			$('#codeCheck').focus();
			return false;
		}
		
		
		if(!checkResult){				// 비밀번호 유효성 체크
			alert('영문, 숫자, 특수문자를 혼합하여 입력하세요.');
			$('#pass1').focus();
			return false;
		}
		
		if(!checkResult){				// 비밀번호 유효성 체크
			alert('확인용 비밀번호를 입력하세요.');
			$('#pass2').focus();
			return false;
		}
		
		if(!checkResult){				// 비밀번호 유효성 체크
			alert('휴대전화를 다시 입력하세요.');
			$('#phone').focus();
			return false;
		}

		
// 		// [프로필 사진 등록]
// 		$("#upload-image").on('change',function(e){
	 
// 	    e.preventDefault();
// 	    var val = $("#upload-image").val();
// 	    if (val=="") {
// 	        alert("이미지 파일을 선택하여 주십시오.");
// 	        return false;
// 	    }
	 	
// 	    var fd = new FormData($("#join")[0]); 
// 	    fd.append("file",$("input[name=file]")[0].files[0]);
	 
// 	        $.ajax({
// 	            type: "post",
// 	            url: "${pageContext.request.contextPath }/user/uploadProfile?profile=",
// 	            data: fd,
// 	            processData: false,
// 	            contentType: false,
// 	            success: function(data,status,xhr) {
// 	                alert("사진이 정상적으로 변경되었습니다.");
// 	                window.location.reload(true);
// 	    //            alert(data);
// 	            },
// 	            error: function(xhr,status,error) {
// 	                alert("사진 업로드시 에러 발생");
// 	                return false;
// 	            }
// 	        });
 
// 		});
		
		
		form.submit();
		alert("회원가입이 완료되었습니다.");
		
	}	
	
	
// 	[체크박스 전체선택, 해제]	
	$(document).ready(function() {
		$("#chk_all").click(function() {
			
			if($("#chk_all").is(":checked"))	$("input[name=agreement]").prop("checked", true),$("input[name=eventAlr]").prop("checked", true)	//name이 agreement인 애들 checked 되어있으면 전체선택 true
			else 								$("input[name=agreement]").prop("checked", false),$("input[name=eventAlr]").prop("checked", false)	//name이 agreement인 애들 checked 안되어있으면 전체선택 false
		});
		
		$("input[name=agreement]").click(function() {		//input name이 agreement인 애들이 클릭되었을 때 이벤트
			var total = $("input[name=agreement]").length;	//total : name이 agreement인 애들 길이만큼
			var checked = $("input[name=agreement]:checked").length;	//checked : agreement인 애들 checked 되어있는 길이만큼
			
			if(total != checked)	$("#chk_all").prop("checked", false)	//total이랑 checked 같지않으면 전체선택 false
			else 					$("#chk_all").prop("checked", true)		//total이랑 checked 같지않으면 전체선택 true
		});
	});
	
	
//	[이용약관 필수항목 필수체크값]
	$(document).ready(function() {
		$("#joinBtn").click(function() {
			
			if($("#chk1").is(":checked") == false){
				return false;
			} 
			
			if($("#chk2").is(":checked") == false){
				return false;
			}
// 			alert("회원가입이 완료되었습니다.");
			
		});
	});
	
	
// ==================================================================
	
	// [우편번호]
	function execPostCode() {
         new daum.Postcode({
             oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
 
                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수
 
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }
 
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                console.log(data.zonecode);
                console.log(fullRoadAddr);
                
                $("[name=zipCode]").val(data.zonecode);
                $("[name=address1]").val(fullRoadAddr);
                
                /* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
                document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
            }
         }).open();
     }
     
     
// ==================================================================
// [프로필 사진 미리보기]
	
	function readURL(input) {
  if (input.files && input.files[0]) {
    var reader = new FileReader();
    reader.onload = function(e) {
      document.getElementById('preview').src = e.target.result;
    };
    reader.readAsDataURL(input.files[0]);
  } else {
    document.getElementById('preview').src = "";
  }
}

	
	
	
	</script>	
	

</head>
<body data-spy="scroll" data-target=".navbar" data-offset="40" id="home">
<div id="joinWrap">

	<!--  로고이미지 들어와야됨 -->
	<div class="harvestLogo"></div>
	<div id="harvest_logo">
	<a href="${pageContext.request.contextPath }/user/mainPage">
	<img src="${pageContext.request.contextPath }/resources/harVest_img/harvest_logo.png" width="200" height="100"></div>
 	</a>
 	<hr>
	
	
	  
	<!-- 회원가입 폼 -->
	<div class="btn-group show">
	  <section>
		<div class="col-md-12 text-center">
             <div class="col-md-12 text-left">
               <h4 class="mb-4">회원가입</h4>
              	  <form action="${pageContext.request.contextPath }/user/insertPro" method="post" id="join" name="join" enctype="multipart/form-data">
              	 
              	 
	              	 <div class="form-group">
	<!-- 			        파일을 입력 받을 input 태그 -->
	<!-- 			        jpg, png 형식만 accept 로 지정해 해당 확장명의 파일 선택을 유도 -->
	<!-- 					기본 프로필 이미지를 src에 넣어둠! -->
						<label for="InputProfile">프로필 사진</label>
					    <img style="width: 100px;" id="preview" src="${pageContext.request.contextPath }/resources/harVest_img/mypage.png">
					    <input type="file" id="upload-image" name="file" accept=".jpg,.png" style="position: absolute; top:181px; left: 63px; font-size: large;" onchange="readURL(this);">
					</div>
              	 	<br><br>
              	 
					 <div class="form-group">
                         <label for="InputName">이름</label>
                         <input type="text"  name="name" class="form-control form-control-sm" id="name" placeholder="이름을 입력해주세요" onkeyup="nameCheck()">
						  <span id="checkName" class="live-validation"></span>
					</div>
					
					
					 <div class="form-group">
		                  <label for="InputEmail">이메일 계정</label>
	                      <div class="input-group">
							   <input type="email" name="id" class="form-control form-control-sm" id="email" placeholder="이메일 계정을 입력해주세요" onkeyup="emailCheck()">
							   <button type="button" class="email_auth_btn" id="email_auth_btn" onclick="authKeyCheck()">인증하기</button>
					  	  </div>
					  	  		<span id="checkEmail" class="live-validation"></span>
					  	  		
						  <div class="mail-check-box">
					          <input type="number" class="form-control mail-check-input" id="codeCheck" placeholder="인증번호 6자리를 입력해주세요!" disabled="disabled" maxlength="6" onkeyup="vericodeCheck()">
					      </div>
							   <span id="mail-check-warn"></span>
				     </div>
				     
<!-- 				     	<input type="file" name="profileImage"> -->
				     
				     <div class="input form-group"> <!-- 비밀번호 입력 -->
                         <label for="InputPass">비밀번호</label>
                         <input type="password" name="pass" class="form-control form-control-sm" id="pass1" placeholder="비밀번호를 입력해주세요"  onkeyup="passCheck()">
						 <i class="fa fa-eye fa-lg"></i>	
	                </div>
	                
	                
	                <div class="check_pass">
	                    <span id="checkPassResult" class="live-validation"></span>
	<!--                          <div class='valid'>비밀번호를 입력하세요. (영문 소문자, 숫자만 입력 가능)</div> -->
	                    <input type="password" name="pass2" class="form-control form-control-sm" id="pass2" placeholder="비밀번호를 확인해주세요"  onkeyup="checkRetypePass()">
	                    <span id="checkRetypePassResult" class="live-validation"></span>
					</div>
					
					
	                <div class="form-group">
                         <label for="InputPhone">휴대폰 번호</label>
                         <input type="text"  name="phone" class="form-control form-control-sm" id="phone" placeholder="휴대폰 번호를 입력해주세요" onkeyup="phoneCheck()">
                         <span id="checkPhone" class="live-validation"></span>
	                </div>
	                
<!-- 						<input type="file" name="profileImage"> -->

	                <div class="form-group">
	                <label for="InputZipcode">우편 번호</label>
						<input class="form-control" style="width: 40%; display: inline;" placeholder="우편번호" name="zipCode" type="text" readonly="readonly">
							<button type="button" class="btn btn-default" onclick="execPostCode();"><i class="fa fa-search"></i> 우편번호 찾기</button>                               
					</div>
						<input type="hidden" name="address" id="address">
					<div class="form-group">
					<label for="InputAddress1">도로명 주소</label>
					      <input class="form-control" style="top: 5px;" placeholder="도로명 주소" name="address1" id="address1" type="text" readonly="readonly" />
					</div>
					<div class="form-group">
					<label for="InputAddress2">상세 주소</label>
					      <input class="form-control" placeholder="상세주소" name="address2" id="address2" type="text" onchange="addrChange()"  />
					</div>
					<div class="form-group">
					<label for="InputAddressNm">배송지명</label>
					      <input class="form-control" placeholder="배송지명" name="addressNm" id="addressNm" type="text"  />
					</div>
	                <br><br><br>


                    <div class="chkbox_group">
                    <hr>
                    <br>
                   	  <p class="text-center text-muted">이용약관 및 개인정보수집 및 이용 안내<p>	
<!--                    	  		<a href='/register/step1' class="text-danger" id="load">자세히 보기</a></p> -->
                   	  		   <textarea rows="20" cols="150" id="more" id="load">
							   		가. 수집하는 개인정보의 항목첫째, 회사는 회원가입, 원활한 고객상담, 각종 서비스의 제공을 위해 최초 회원가입 당시 아래와 같은 최소한의 개인정보를 필수항목으로 수집하고 있습니다.
										[일반 회원가입]
											- 이름, 생년월일, 성별, 아이디, 비밀번호, 별명, 연락처(메일주소, 휴대폰 번호 중 선택), 가입인증정보
										[만14세 미만 아동 회원가입]
											- 이름, 생년월일, 성별, 법정대리인 정보, 아이디, 비밀번호, 연락처 (메일주소, 휴대폰 번호 중 선택), 가입인증정보
										[단체아이디 회원가입]
											- 단체아이디, 회사명, 대표자명, 대표 전화번호, 대표 이메일 주소, 단체주소, 관리자 아이디, 관리자 연락처, 관리자 부서/직위
											- 선택항목 : 대표 홈페이지, 대표 팩스번호
										둘째, 서비스 이용과정이나 사업처리 과정에서 아래와 같은 정보들이 자동으로 생성되어 수집될 수 있습니다.
											- IP Address, 쿠키, 방문 일시, 서비스 이용 기록, 불량 이용 기록
										셋째, 네이버 아이디를 이용한 부가 서비스 및 맞춤식 서비스 이용 또는 이벤트 응모 과정에서 해당 서비스의 이용자에 한해서만 개인정보 추가 수집이 발생할 수 있으며,
											 이러한 경우 별도의 동의를 받습니다.
										넷째, 성인컨텐츠, 유료/게임 등 일부 서비스 이용시 관련 법률 준수를 위해 본인인증이 필요한 경우, 아래와 같은 정보들이 수집될 수 있습니다.
											- 이름, 생년월일, 성별, 중복가입확인정보(DI), 암호화된 동일인 식별정보(CI), 휴대폰 번호(선택), 아이핀 번호(아이핀 이용시), 내/외국인 정보
										다섯째, 유료 서비스 이용 과정에서 아래와 같은 결제 정보들이 수집될 수 있습니다.
											- 신용카드 결제시 : 카드사명, 카드번호 등
											- 휴대전화 결제시 : 이동전화번호, 통신사, 결제승인번호 등
											- 계좌이체시 : 은행명, 계좌번호 등
											- 상품권 이용시 : 상품권 번호
										
										
									나. 개인정보 수집방법회사는 다음과 같은 방법으로 개인정보를 수집합니다.
										- 홈페이지, 서면양식, 팩스, 전화, 상담 게시판, 이메일, 이벤트 응모, 배송요청
										- 협력회사로부터의 제공
										- 생성정보 수집 툴을 통한 수집
							   </textarea>
                  	  <br>
                   	  <hr>
                   	  <br>
                  	  <div><label><input type="checkbox" id="chk_all" value="selectAll">전체동의</label></div>
                   	  <p>
	                       <input type="checkbox" class="chk" id="chk1" name="agreement" value="이용약관"> 이용약관 동의(필수)<br>
                           <input type="checkbox" class="chk" id="chk2" name="agreement" value="개인정보수집"> 개인정보수집 및 이용 동의(필수)<br>
                           <input type="checkbox" class="chk" id="chk3" name="agreement" value="정보제공동의"> 개인정보 제 3자 제공 동의(선택)<br>
                           <input type="checkbox" class="chk" id="chk4" name="eventAlr" value="Y"> 이벤트 알람 수신 동의(선택)<br>
                           <!-- 이벤트 알람 체크했을 경우에만 디비에 Y로 넘어감 -->
	                  </p>
	                 </div>
	                 
	                 
	                 <div class="col-md-12 text-center mb-3">
                         <button type="submit" class="btn btn-block mybtn btn-brown tx-tfm" id="joinBtn" onclick="checkSubmit(); return false;">가입하기</button>
	                 </div>
	                 <hr>
	                 
	               </form>
	               
	             <!-- 로그인 페이지 이동 버튼 -->
	             <p class="text-muted">이미 계정이 있으신가요? <a class="text-danger" href="${pageContext.request.contextPath }/user/login">로그인</a></p>
			</div>
		  </div>
	   </section>
    </div>
</div>  
    


</body>
</html>