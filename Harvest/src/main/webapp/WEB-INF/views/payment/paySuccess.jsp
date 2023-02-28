<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후원성공 페이지</title>
<link
	href="${pageContext.request.contextPath }/resources/harVest_css/payment.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/resources/harVest_css/paySuccess.css"
	rel="stylesheet">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description"
	content="Start your development with JoeBLog landing page.">
<meta name="author" content="Devcrud">
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
</style>
</head>
<body data-spy="scroll" data-target=".navbar" data-offset="40" id="home">
<body>

	<!-- page-header -->
	<%--   	<jsp:include page="../inc/header.jsp"></jsp:include> --%>
	<!-- page First Navigation -->
	<nav class="navbar navbar-light bg-white">
		<div class="container">
			<a class="navbar-brand" href="#"> <img
				src="${pageContext.request.contextPath }/resources/harVest_img/harvest_logo.png">
			</a>
			<div class="socials">
				<a href="javascript:void(0)">프로젝트 올리기</a> <a
					href="${pageContext.request.contextPath }/resources/views/loginPage.jsp">로그인</a>
			</div>
		</div>
	</nav>
	<!-- End Of First Navigation -->


	<!-- Page Second Navigation -->
	<nav
		class="navbar custom-navbar navbar-expand-md navbar-light bg-white sticky-top shadow">
		<div class="container">
			<button class="navbar-toggler ml-auto" type="button"
				data-toggle="collapse" data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav">
					<li class="nav-item dropdown"><a
						class="nav-link text-dark dropdown-toggle" href="#"
						id="navbarDropdown" role="button" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"> 카테고리 </a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="#">1</a> <a class="dropdown-item"
								href="#">2</a> <a class="dropdown-item" href="#">3</a>
						</div></li>
					<li class="nav-item"><a class="nav-link text-dark"
						href="${pageContext.request.contextPath }/resources/views/mainPage.jsp">홈</a>
					</li>
					<li class="nav-item"><a class="nav-link text-dark"
						href="${pageContext.request.contextPath }/resources/views/popularPage.jsp">인기</a>
					</li>
					<li class="nav-item"><a class="nav-link text-dark" href="#">신규</a>
					</li>
					<li class="nav-item"><a class="nav-link text-dark" href="#">마감임박</a>
					</li>
					<li class="nav-item"><a class="nav-link text-dark" href="#">공개예정</a>
					</li>
				</ul>
				<div class="navbar-nav ml-auto">
					<div class="input-group">
						<input type="text" class="form-control form-control-sm"
							placeholder="Search" aria-label="Recipient's username"
							aria-describedby="button-addon2">
						<button class="btn btn-outline-secondary btn-sm" type="button"
							id="button-addon2">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
								fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
						<path
									d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
					</svg>
						</button>
					</div>

				</div>
			</div>
		</div>
	</nav>
	<!-- End Of Page Second Navigation -->
	<!-- header 들어갈 부분 -->
</head>
<body>
<!-- 후원성공 페이지 시작 -->
<div class="Container__ContainerComponent-sc-1ey2h1l-0 kUAclQ styled__StyledContainer-z4so9e-5 dCBDHl">
축하합니다 !<br> <!-- readcount처럼 숫자누적....-->
공식후원자가 되셨습니다 <br>
후원내역변경은 마이페이지에서 하실 수 있습니다.<br> <!-- href -->
<input type="button" value="후원목록보기" onclick="${pageContext.request.contextPath}/user/#"> 
<!-- 후원성공 페이지 끝  -->
</div>
<!-- 후원완료페이지 몇번째 후원자, 목록, 취소버튼 만들기 -->
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