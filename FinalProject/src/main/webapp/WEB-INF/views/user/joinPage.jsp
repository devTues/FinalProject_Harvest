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

	<!-- 회원가입 폼 -->
	<div class="container text-center">
	    <section>
	       <div class="btn-group show">
				<div class="col-md-12 text-center">
                     <div class="col-md-12 text-left">
                     <h2 class="mb-4">회원가입</h2>
                     <form action="#" method="post" name="join">
                          <div class="form-group">
                              <label for="exampleInputEmail1">아이디</label>
                              <input type="text"  name="id" class="form-control" id="id" placeholder="아이디">
                          </div>
                          <div class="form-group">
                              <label for="exampleInputEmail1">비밀번호</label>
                              <input type="password" name="pass1" class="form-control" id="pass1" placeholder="비밀번호">
                              <input type="password" name="pass2" class="form-control" id="pass2" placeholder="비밀번호 확인">
                          </div>
                          <div class="form-group">
                              <label for="exampleInputEmail1">이름</label>
                              <input type="text"  name="name" class="form-control" id="name" placeholder="이름">
                          </div>
                          <div class="form-group">
                              <label for="exampleInputEmail1">휴대폰 번호</label>
                              <input type="text"  name="phone" class="form-control" id="phone" placeholder="휴대폰 번호">
                          </div>
                          <div class="form-group">
                              <label for="exampleInputEmail1">이메일</label>
                              <input type="email" name="email"  class="form-control" id="email" placeholder="이메일">
                          </div>
                          <div class="form-group">
                              <label for="exampleInputEmail1">주소</label>
                              <input type="text" name="address1"  class="form-control" id="address1" placeholder="주소입력">
                              <input type="text" name="address2"  class="form-control" id="address2" placeholder="상세주소입력">
                          </div>
                          <div class="form-group">
                              <p class="text-center">이용약관 및 개인정보수집 및 이용 안내 <a href='#' class="text-danger">자세히 보기</a></p>
                          </div>
                          <div class="form-group">
                          	<input type="checkbox" name="ch1" value="이용약관"> 이용약관 동의(필수)<br>
                          	<input type="checkbox" name="ch2" value="개인정보수집"> 개인정보수집 및 이용 동의(필수)
                          </div>	
                          <div class="col-md-12 text-center mb-3">
                              <button type="submit" class="btn btn-block mybtn btn-primary tx-tfm">가입하기</button>
                          </div>
                   	</form>
                   	<!-- 로그인 페이지 이동 버튼 -->
                   	<div class="col-md-12 mb-3">
	                    <input type="button" value="로그인 하러가기" class="btn btn-block mybtn btn-primary tx-tfm"
						onclick="location.href='#'">
	                </div>
                   	</div>
	            </div> 
	       </div>
	    </section>
	</div>
	<!-- 회원가입 폼 끝 -->

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