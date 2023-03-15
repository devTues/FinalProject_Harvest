<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후원성공 페이지</title>
<link href="${pageContext.request.contextPath }/resources/harVest_css/payment.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/harVest_css/payment/paymentSuccess.css" rel="stylesheet">
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
<jsp:include page="../inc/header.jsp"></jsp:include>
<body data-spy="scroll" data-target=".navbar" data-offset="40" id="home">
<body>
  <div class="inner">
	<p>
		<span class="red">축하합니다. 
			<span class="number"></span>번째<br>
		</span>
		공식 후원자가 되셨습니다! <br>
		<span class="detail">*후원내역은 <a id='detailLink' href="../profile">개인프로필</a>에서 하실수 있습니다.</span>
	
	</p>
<%-- 	<c:if test="${recommendList.size()>3}"> --%>
<!-- 		<div class="title"> -->
<!-- 			<span>이런 프로젝트는 어때요?</span> -->
<!-- 		</div> -->
<!-- 		<div class="recommend-container"> -->
<%-- 			<c:forEach var="dto" items="${recommendList}" begin="0" end="4"> --%>
<!-- 				<div class="project-container"> -->
<%-- 					<input type = "hidden" id="idx" value="${dto.idx}"> --%>
<%-- 					<img class="project-img" src="../thumbnail_image/${dto.thumbnail}" alt=""> --%>
<!-- 					<div class="project-title"> -->
<%-- 						<span>${dto.title}</span> --%>
<!-- 					</div> -->
<!-- 				</div> -->
<%-- 			</c:forEach> --%>
<!-- 		</div> -->
<%-- 	</c:if> --%>
</div>
<%-- <input type="hidden" value="${supportNum}" id="supportNum"> --%>
<!-- <script src="/js/support-success.js"></script> -->
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
