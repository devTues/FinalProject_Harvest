<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="Start your development with JoeBLog landing page.">
<meta name="author" content="Devcrud">
<title>kakaoLoginSuccess</title>

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

</head>
<body>

	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/harVest_js/jquery-3.6.3.js"></script>
	<script type="text/javascript">
	   $(document).ready(function() {
		var name = "${name}";
		var email = "${email}";
		$("#name").html(name);
		$("#email").html(email);
	   });
	</script>
	
<!-- 	callback URL	 -->
<section class="bg-light">
  <div class="container py-4">
     <div class="row align-items-center justify-content-between">
	   <a class="navbar-brand h1 text-center" href="index.do">
		<span class="text-dark h4">도시</span> <span class="text-primary h4">거북</span>
	   </a>
	</div>
	<div>
	     <h1 class="text-dark text-center">환영합니다!</h1>
		<p class="text-center">
			<span>${name}</span>님의 로그인 성공<br> 이메일 주소는 <strong>${email}</strong>입니다.
		</p>
	</div>
	<div class="d-grid gap-2">
		<button type="button" class="btn btn-primary btn-lg" onclick="location.href='index.do'">시작하기</button>
	</div>
  </div>
</section>





</body>
</html>