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

	<!-- 로그인 폼 -->
	<div class="container text-center">
	    <section>
	       <div class="btn-group show">
				<div class="col-md-12 text-center">
                    <h2 class="mb-4">로그인</h2>
		            <form action="#" method="post" name="login">
		                <div class="form-group">
		                    <input type="text" name="id" class="form-control" id="id" aria-describedby="" placeholder="아이디">
		                </div>
		                <div class="form-group">
		                    <input type="password" name="pass" id="pass" class="form-control" aria-describedby="" placeholder="비밀번호">
		                </div>
		                
		                <div class="col-md-12 mb-3">
		                    <button type="submit" class="btn btn-block mybtn btn-primary tx-tfm">로그인</button>
		                </div>
		            </form>
		            <div class="col-md-12 mb-3">
	                    <input type="button" value="회원가입" class="btn btn-block mybtn btn-primary tx-tfm"
						onclick="location.href='../views/joinPage.jsp'">
	                </div>
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