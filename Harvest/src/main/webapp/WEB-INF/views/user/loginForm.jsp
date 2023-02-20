<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="Start your development with JoeBLog landing page.">
<meta name="author" content="Devcrud">
<title>harVest</title>
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

	<script type="text/javascript">
		
		// 입력 제어
		function checkSubmit() {
			// email(= id) 제어
			if($('#id').val() == ""){
				alert("이메일을 입력하세요.");
				$('#id').focus();
				
				return false;
			}
			
			// pass 제어
			if($('#pass').val() == ""){
				alert("비밀번호를 입력하세요");
				$('#pass').focus();
				
				return false;
			}
			
		// ==================================================================
			
			// null 체크
			if(!checkEmailResult){			// 이메일 유효성 체크
				alert("이메일을 다시 입력하세요.");
				$('#id').focus();
				
				return false;
			}
			
			if(!checkPassResult){			// 비밀번호 유효성 체크
				alert("비밀번호를 다시 입력하세요.");
				$('#pass').focus();
				
				return false;
			}
			
			alert("로그인 되었습니다.");
			
			form.submit();
			
		}
	
	</script>
	
	
</head>
<body data-spy="scroll" data-target=".navbar" data-offset="40" id="home">


	<!--  로고이미지 들어와야됨 -->
	<div class="harvestLogo"></div>
	<div id="harvest_logo">
	<a href="${pageContext.request.contextPath }/projectList/main">
	<img src="${pageContext.request.contextPath}/resources/harVest_img/harvest_logo.png" width="200" height="100">
	</div>
	</a>
 	<hr>



	<!-- 로그인 폼 -->
	<div class="container text-center">
	    <section>
	       <div class="btn-group show">
				<div class="col-md-12 text-center">
                    <h2 class="mb-4">로그인</h2>
			            <form action="${pageContext.request.contextPath }/user/loginPro" method="post" name="login">
			                <div class="form-group">
			                    <input type="email" name="id" class="form-control form-control-sm" id="id" aria-describedby="" placeholder="이메일 계정을 입력해주세요" onkeyup="emailCheck()">
			                </div>
			                <div class="input form-group">
			                    <input type="password" name="pass" id="pass" class="form-control form-control-sm" aria-describedby="" placeholder="비밀번호를 입력해주세요" onkeyup="passCheck()">
			                </div>
			                
			                <div class="col-md-12 mb-3">
			                    <button type="submit" class="btn btn-block mybtn btn-brown tx-tfm" onclick="checkSubmit(); return false">로그인</button>
			                </div>
			                <div>
			         		 <a href='${urlNaver}'><img height="40px" src="${pageContext.request.contextPath }/resources/harVest_img/btnG_완성형.png"></a>
			                </div>
			                <hr>
			            </form>
			            <!-- 로그인 연동 API 아이콘 들어와야됨 -->
			            
			         	<div class="position">
					         <!-- 로그인 페이지 이동 버튼 -->
				             <p class="text-muted">아직 계정이 없으신가요? <a class="text-danger" href="${pageContext.request.contextPath }/user/insert">회원가입</a></p>
				             <!-- 로그인 페이지 이동 버튼 -->
				             <p class="text-muted">혹시 비밀번호가 기억나지 않으신가요? <a class="text-danger" href="${pageContext.request.contextPath }/finding/findPass">비밀번호 찾기</a></p>
		            	 </div>
	            </div> 
	       </div>
	    </section>
	</div>
	<!-- 로그인 폼 끝 -->


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