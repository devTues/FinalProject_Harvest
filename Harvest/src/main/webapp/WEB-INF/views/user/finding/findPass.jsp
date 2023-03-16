<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="Start your development with JoeBLog landing page.">
<meta name="author" content="Devcrud">
<title>harVest/passCheck</title>



<!-- 이메일 인증 후 인증번호 일치할 경우 비밀번호 보여주는 "비밀번호 찾기" 페이지 -->
<!-- 이 페이지에서는 이메일 입력하면 DB의 이메일이랑 비교해서 일치하면 비밀번호 찾기(= 비밀번호 보여주는 페이지)로 이동하는 것임 -->

<!-- font icons -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/assets/vendors/themify-icons/css/themify-icons.css">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
<!-- Bootstrap + JoeBLog main styles -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/assets/css/joeblog.css">
<style>
/* Make the image fully responsive */
.carousel-inner img {
	width: 100%;
	height: 100%;
}

#harvest_logo {
	text-align: center;
}

div.position {
  position: relative;
  left:10px;
  text-align: left;
}
</style>

	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/harVest_js/jquery-3.6.3.js"></script>
	<script type="text/javascript">
	
	
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
			url : '${pageContext.request.contextPath }/user/findPassCheck?email=' + email,
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
	
// =========================================================================
	
	// 입력 제어
	function checkSubmit() {
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

// =============================================================
		
		// null 체크
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
		form.submit();
		
	}	
	</script>	
	

</head>
<body data-spy="scroll" data-target=".navbar" data-offset="40" id="home">

	<!--  로고이미지 들어와야됨 -->
	<div class="harvestLogo"></div>
	<div id="harvest_logo">
		<a href="${pageContext.request.contextPath }/user/login">
			<img src="${pageContext.request.contextPath}/resources/harVest_img/harvest_logo.png" width="200" height="100">
	 	</a>
 	</div>
 	<hr>



	<!-- 비밀번호 찾기 폼 -->
	<div class="container text-center">
	    <section>
	       <div class="btn-group show">
				<div class="col-md-12 text-center">
                    <h2 class="mb-4">비밀번호 찾기</h2>
			            <form action="${pageContext.request.contextPath }/finding/findpassPro" method="post" name="findPass">
			                <div class="form-group">
			                  <label for="exampleInputEmail">이메일 계정</label>
			                      <div class="input-group">
									   <input type="email" name="id" class="form-control form-control-sm" id="email" placeholder="이메일 계정을 입력해주세요" onkeyup="emailCheck()">
									   
									   <button type="button" class="email_auth_btn" id="email_auth_btn" onclick="authKeyCheck()">인증하기</button>
							  	  </div>
						  	  		<span id="checkEmail" class="live-validation"></span>
						  	</div>  		
			            
      						<div class="mail-check-box">
							          <input type="number" class="form-control mail-check-input" id="codeCheck" placeholder="인증번호 6자리를 입력해주세요!" disabled="disabled" maxlength="6" onkeyup="vericodeCheck()">
									  <span id="mail-check-warn"></span>	<!-- 인증번호 일치/불일치 -->							          
							</div>
							 <div class="col-md-12 mb-3">
			                    <button type="submit" class="btn btn-block mybtn btn-brown tx-tfm" onclick="checkSubmit(); return false;">비밀번호 찾기</button>
			                </div>
			                </form>
				  </div>
			                
			               
	       </div> 
	     </section>
	 </div>
	   
	<!-- 비밀번호 찾기 폼 끝 -->
	
	

	<!-- core  -->
	<script
		src="${pageContext.request.contextPath }/resources/assets/vendors/jquery/jquery-3.4.1.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/assets/vendors/bootstrap/bootstrap.bundle.js"></script>

	<!-- JoeBLog js -->
	<script
		src="${pageContext.request.contextPath }/resources/assets/js/joeblog.js"></script>

</body>
</html>