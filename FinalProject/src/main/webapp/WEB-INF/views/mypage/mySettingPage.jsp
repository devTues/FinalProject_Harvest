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
			<div class="media mb-5">
				<h2 class="mt-0">설정</h2>
            </div>
            	<!-- 프로필 메뉴영역 -->
                <ul class="nav nav-tabs">
				  <li class="nav-item">
				    <a class="nav-link active" aria-current="page" href="#">프로필</a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link" href="#">계정</a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link" href="#">결제수단</a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link" href="#">배송지</a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link" href="#">알림</a>
				  </li>
				</ul>
				<!-- 프로필 메뉴영역 끝 -->
	    </section>
	</div>
	<!-- 프로필 끝 -->
	
	<div class="container">

      <!-- typography -->
      <h5 class="components-section-title">프로필 사진</h5>
      <img src="${pageContext.request.contextPath }/resources/assets/imgs/avatar-2.jpg" class="thumb-sm rounded-circle" alt="...">
      
      <hr>
      
      <h5 class="components-section-title">이름</h5>
      <div>홍길동</div>
      <hr>
      
      <h5 class="components-section-title">이메일</h5>
      <hr>
      
      <h5 class="components-section-title">비밀번호</h5>
      <hr>
      
      <h5 class="components-section-title">연락처</h5>
      <hr>
      
      <h5 class="components-section-title">결제수단</h5>
      <div>아직 없음</div>
      <hr>
      
      <h5 class="components-section-title">배송지</h5>
      <div>홍길동</div>
      <div>부산 어쩌구</div>
      <hr>
      
      <h5 class="components-section-title">알림</h5>
      <hr>
   </div>
	
	

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