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



<!-- 로그인 하면 비밀번호 보여주는 비밀번호 찾기 페이지 -->
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
</head>
<body data-spy="scroll" data-target=".navbar" data-offset="40" id="home">

	<!--  로고이미지 들어와야됨 -->
	<div class="harvestLogo"></div>
	<div id="harvest_logo">
	<a href="${pageContext.request.contextPath }/user/login">
	<img src="${pageContext.request.contextPath}/resources/harVest_img/harvest_logo.png" width="200" height="100"></div>
 	</a>
 	<hr>


	<!-- page-header -->
	<!--     <header class="page-header"></header> -->
	<!-- end of page header -->

	<!-- 로그인 폼 -->
	<div class="container text-center">
	    <section>
	       <div class="btn-group show">
				<div class="col-md-12 text-center">
                    <h2 class="mb-4">비밀번호 찾기</h2>
			            <form action="${pageContext.request.contextPath }/finding/findpassPro" method="post" name="findPass">
			                <div class="form-group">
			                    <input type="text" name="id" class="form-control" id="id" aria-describedby="" placeholder="가입하신 이메일 계정을 입력해주세요">
			                </div>
			                <div class="form-group">
			                </div>
			                <div class="col-md-12 mb-3">
			                    <button type="submit" class="btn btn-block mybtn btn-brown tx-tfm">비밀번호 찾기</button>
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