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
    <link rel="stylesheet" href="resources/assets/vendors/themify-icons/css/themify-icons.css">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
    <!-- Bootstrap + JoeBLog main styles -->
	<link rel="stylesheet" href="resources/assets/css/joeblog.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
</head>
<body data-spy="scroll" data-target=".navbar" data-offset="40" id="home">

	<!-- page-header -->
  	<jsp:include page="../inc/header.jsp"></jsp:include>
    
    <!-- 본문 내용 -->

	<!-- 프로필 시작 -->
	<div class="container text-left">
	    <section>
			<div class="media mt-5 mb-5">
                <img src="${pageContext.request.contextPath }/resources/assets/imgs/avatar-2.jpg" class="circle-100 mb-3" alt="">
                <div class="media pl-3 mt-4">
                    <h5 class="mt-0">홍길동</h5>
                    <a class="mt-0 text-dark ml-3" href="#"><i class="bi bi-gear"></i></a>
                </div>
            </div>
            	<!-- 프로필 메뉴영역 -->
                <ul class="nav nav-tabs">
				  <li class="nav-item">
				    <a class="nav-link active" aria-current="page" href="#">프로필</a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link" href="#">후원한 프로젝트</a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link" href="#">올린 프로젝트</a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link" href="#">상점관리</a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link" href="#">서포터 문의</a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link" href="#">찜하기</a>
				  </li>
				</ul>
				<!-- 프로필 메뉴영역 끝 -->
	    </section>
	</div>
	<!-- 프로필 끝 -->
	
	

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