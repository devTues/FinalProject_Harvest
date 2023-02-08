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

	<!-- 비밀번호 찾기 폼 -->
	<div class="container text-center">
		<section>
			<div class="btn-group show">
				<div class="col-md-12 text-left">
                    <h4 class="mb-4">비밀번호 재설정</h4>
		            <form action="#" method="post" name="rePassword">
		                <div class="form-group">
                            <label for="exampleInputEmail1">이메일 계정</label>
                            <input type="email" name="email" class="form-control form-control-sm" id="email" placeholder="가입하신 이메일 계정을 입력해주세요">
                        </div>
                        <p class="text-muted">
	                    	가입 시 사용하신 이메일을 입력하시면 새 비밀번호를 생성할 수 있는 링크를 보내드립니다.<br>
	                    	구글/네이버/카카오 계정으로 가입하신 경우, 구글/네이버/카카오 계정에 쓰이는 이메일을 입력해주세요.
                   		</p>
		                <div class="form-group">
		                    <button type="submit" class="btn btn-block mybtn btn-brown tx-tfm">비밀번호 재설정</button>
		                </div>
		            </form>
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