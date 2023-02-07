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
</head>
<body data-spy="scroll" data-target=".navbar" data-offset="40" id="home">

	<!-- page-header -->
  	<jsp:include page="../inc/header.jsp"></jsp:include>
    
    <!-- 본문 내용 -->
	<div class="container">
		<div class="btn-group show">
			<ul class="navbar-nav">
				<li class="nav-item dropdown"><a class="btn btn-sm btn-outline-secondary dropdown-toggle text-dark" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">달성률</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#"><small class="text-danger">전체보기</small></a>
						<a class="dropdown-item" href="#"><small>75% 이하</small></a>
						<a class="dropdown-item" href="#"><small>75% ~ 100%</small></a>
						<a class="dropdown-item" href="#"><small>100% 이상</small></a>
					</div>
				</li>
			</ul>
		</div>
	</div>
	<div class="container mt-2 mb-4">주문 내역 총 <b style="color: red; white-space: nowrap;">10</b> 건</div>
	
	<!-- !!! 카테고리 메뉴항목 배열로 4줄씩 가져오기 -->
	<div class="container">
		<div class="page-container">
			<div class="page-content">
				<!-- 주목할 만한 프로젝트 4줄 정렬-->
				<div class="row">
					<div class="col-lg-3">
						<div class="card text-left mb-5">
							<div class="card-header p-0">
								<div class="blog-media">
									<img src="resources/assets/imgs/blog-2.jpg" alt="" class="w-100"> <a href="#" class="badge badge-primary text-right">♡</a>
								</div>
							</div>
							<div class="card-body px-0">
								<h5 class="card-title mb-2">테스트1</h5>
								<p class="my-2">테스트내용1</p>
								<span class="text-danger">40%</span> <small>금액 N원</small>
								<div class="progress mt-2 mb-3">
									<div class="progress-bar bg-danger" role="progressbar"
										style="width: 40%" aria-valuenow="25" aria-valuemin="0"
										aria-valuemax="100">
										<span>10일 남음</span>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-3">
						<div class="card text-left mb-5">
							<div class="card-header p-0">
								<div class="blog-media">
									<img src="resources/assets/imgs/blog-3.jpg" alt=""
										class="w-100"> <a href="#"
										class="badge badge-primary text-right">♡</a>
								</div>
							</div>
							<div class="card-body px-0">
								<h5 class="card-title mb-2">테스트2</h5>
								<p class="my-2">테스트내용2</p>
								<span class="text-danger">100%</span> <small>금액 N원</small>
								<div class="progress mt-2 mb-3">
									<div class="progress-bar bg-danger" role="progressbar"
										style="width: 100%" aria-valuenow="25" aria-valuemin="0"
										aria-valuemax="100">
										<span>10일 남음</span>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-3">
						<div class="card text-left mb-5">
							<div class="card-header p-0">
								<div class="blog-media">
									<img src="resources/assets/imgs/blog-4.jpg" alt=""
										class="w-100"> <a href="#"
										class="badge badge-primary text-right">♡</a>
								</div>
							</div>
							<div class="card-body px-0">
								<h5 class="card-title mb-2">테스트3</h5>
								<p class="my-2">테스트내용3</p>
								<span class="text-danger">20%</span> <small>금액 N원</small>
								<div class="progress mt-2 mb-3">
									<div class="progress-bar bg-danger" role="progressbar"
										style="width: 20%" aria-valuenow="25" aria-valuemin="0"
										aria-valuemax="100">
										<span>10일 남음</span>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-3">
						<div class="card text-left mb-5">
							<div class="card-header p-0">
								<div class="blog-media">
									<img src="resources/assets/imgs/blog-5.jpg" alt=""
										class="w-100"> <a href="#"
										class="badge badge-primary text-right">♡</a>
								</div>
							</div>
							<div class="card-body px-0">
								<h5 class="card-title mb-2">테스트4</h5>
								<p class="my-2">테스트내용4</p>
								<span class="text-danger">100%</span> <small>금액 N원</small>
								<div class="progress mt-2 mb-3">
									<div class="progress-bar bg-danger" role="progressbar"
										style="width: 100%" aria-valuenow="25" aria-valuemin="0"
										aria-valuemax="100">
										<span>10일 남음</span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 주목할 만한 프로젝트 4줄 정렬 끝-->
			</div>
		</div>
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