<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description"
	content="Start your development with JoeBLog landing page.">
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
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<style>
/* Make the image fully responsive */
.carousel-inner img {
	width: 100%;
	height: 100%;
}
</style>



</head>
<body data-spy="scroll" data-target=".navbar" data-offset="40" id="home">
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
				<li class="nav-item"><a class="nav-link"
					href="${pageContext.request.contextPath }/myPage/mySettingPage">계정</a>
				</li>
				<li class="nav-item"><a class="nav-link"
					href="${pageContext.request.contextPath }/myPage/myAddress">배송지</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/myPage/mySupport">후원한 프로젝트</a></li>
				<li class="nav-item"><a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath }/myPage/myCreate">내가 만든 프로젝트</a></li>
				<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/myPage/myFavorite">찜한 프로젝트</a></li>
				<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/myPage/myAlarm">알림 </a></li>
			</ul>
			<!-- 프로필 메뉴영역 끝 -->
		</section>
	</div>


	<!-- 	<div class="d-grid gap-3"> -->

	<c:if test="${empty sessionScope.id}">
		<c:redirect url="/user/login"></c:redirect>
	</c:if>
	
	<div class="container mt-2 mb-4">
		<!-- TODO count구하기, 탭 만들기 -->
		<b style="color: red; white-space: nowrap;">${myCreateCount }</b>개의 프로젝트가 있습니다.
	</div>
	<input type="hidden" value="${sessionScope.id}">
	
	<div class="container">
		<div class="page-container">
			<div class="page-content">
			 	<c:forEach var="myCreateList" items="${myCreateList }">
			 	
				<div class="card mb-3" style="max-width: 540px;">
					<div class="row g-0">
						<div class="col-md-4">
							<img alt="" src="${pageContext.request.contextPath }/resources/upload/${myCreateList.img1}" class="profile_img" width="200" height="150">
						</div>
						<div class="col-md-8">
							<div class="card-body pt-0 pl-5">
								<!-- 작성중일때 버튼 => 관리, 삭제 -->
								<p class="my-2">${myCreateList.codeNm }</p>
								<h5 class="card-title mb-2">${myCreateList.title }</h5>
								<div >
									 <button type="button" class="btn btn-dark" name="manageProject" id="manageProject" onclick="location.href='${pageContext.request.contextPath }/creator/project'">관리</button>
                        			 <button type="button" class="btn btn-dark" name="deleteProject" id="deleteProject">삭제</button>
								</div>
							</div>
						</div>
					</div>
				</div>
				</c:forEach>
			</div>
		</div>
	</div>


	<!-- Page Footer -->
	<jsp:include page="../inc/footer.jsp"></jsp:include>
</body>

<!-- core  -->
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/harVest_js/jquery-3.6.3.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/assets/vendors/bootstrap/bootstrap.bundle.js"></script>
<!-- JoeBLog js -->
<script
	src="${pageContext.request.contextPath }/resources/assets/js/joeblog.js"></script>

</html>