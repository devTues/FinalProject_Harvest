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
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/vendors/themify-icons/css/themify-icons.css">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
    <!-- Bootstrap + JoeBLog main styles -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/joeblog.css">
</head>
<body data-spy="scroll" data-target=".navbar" data-offset="40" id="home">

	<!-- page-header -->
  	<jsp:include page="../inc/header.jsp"></jsp:include>
    
    <!-- 본문 내용 -->

	<!-- 로그인 폼 -->
	<div class="container text-center">
	    <section>
	       <div class="btn-group show">
				<div class="col-md-12 text-left">
                    <h4 class="mb-4">로그인</h4>
		            <form action="${pageContext.request.contextPath }/user/loginPro" method="post" name="loginPro">
		                <div class="form-group">
		                    <input type="email" name="id" class="form-control" id="id" aria-describedby="" placeholder="이메일">
		                </div>
		                <div class="form-group">
		                    <input type="password" name="pass" id="pass" class="form-control" aria-describedby="" placeholder="비밀번호">
		                </div>
		                <div class="form-group">
		                    <button type="submit" class="btn btn-block mybtn btn-brown tx-tfm">로그인</button>
		                </div>
		            </form>
		            <hr>
		            <div class="col-md-12 text-center">
			            <a href="#"><img src="${pageContext.request.contextPath }/resources/assets/imgs/naver.jpg" class="ml-2 mr-2 mb-4 mt-2 thumb-sm rounded-circle" alt=""></a>
			            <a href="#"><img src="${pageContext.request.contextPath }/resources/assets/imgs/google.jpg" class="ml-2 mr-2 mb-4 mt-2 thumb-sm img-thumbnail rounded-circle" alt=""></a>
			            <a href="#"><img src="${pageContext.request.contextPath }/resources/assets/imgs/kakao.jpg" class="ml-2 mr-2 mb-4 mt-2 thumb-sm rounded-circle" alt=""></a>
		            </div>
		            <p class="text-muted">
			            아직 harvest 계정이 없으신가요? <a class="text-danger" href="${pageContext.request.contextPath }/user/join">회원가입</a><br>
			            비밀번호가 기억나지 않으신가요? <a class="text-danger" href="${pageContext.request.contextPath }/user/rePass">비밀번호 재설정</a>
		            </p>
	            </div> 
	       </div>
	    </section>
	</div>
	<!-- 로그인 폼 끝 -->

    <!-- Page Footer -->
    <jsp:include page="../inc/footer.jsp"></jsp:include>

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