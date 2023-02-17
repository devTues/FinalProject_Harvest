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
                     <h4 class="mb-4">회원가입</h4>
	                     <form action="${pageContext.request.contextPath }/user/joinPro" method="post" name="join">
	                     	  <div class="form-group">
	                              <label for="exampleInputEmail1">이름</label>
	                              <input type="text"  name="name" class="form-control form-control-sm" id="name" placeholder="이름을 입력해주세요">
	                          </div>
	                          <div class="form-group">
	                          	  <label for="exampleInputEmail1">이메일 계정</label>
	                          	  <div class="input-group">
									  <input type="email" name="id" class="form-control form-control-sm" id="id" placeholder="이메일 계정 입력해주세요">
									  <button class="btn btn-sm btn-outline-secondary" type="button" id="button-addon2">중복확인</button>
							  	  </div>
							  </div>
	                          <div class="form-group">
	                              <label for="exampleInputEmail1">비밀번호</label>
	                              <input type="password" name="pass1" class="form-control form-control-sm" id="pass1" placeholder="비밀번호를 입력해주세요">
	                              <input type="password" name="pass2" class="form-control form-control-sm" id="pass2" placeholder="비밀번호를 확인해주세요">
	                          </div>
	                          <div class="form-group">
	                              <label for="exampleInputEmail1">휴대폰 번호</label>
	                              <input type="text"  name="phone" class="form-control form-control-sm" id="phone" placeholder="휴대폰 번호를 입력해주세요">
	                          </div>
	                          <div class="form-group">
	                              <label for="exampleInputEmail1">주소</label>
	                              <div class="input-group">
									  <input type="text" name="addressnumber" class="form-control form-control-sm" id="addressnumber" placeholder="우편번호">
									  <button class="btn btn-sm btn-outline-secondary" type="button" id="button-addon2">우편번호</button>
								  </div>
	                              <input type="text" name="address1" class="form-control form-control-sm" id="address1" placeholder="주소를 입력해주세요">
	                              <input type="text" name="address2" class="form-control form-control-sm" id="address2" placeholder="상세주소를 입력해주세요">
	                          </div>
	                          <hr>
	                          <div class="form-group">
	                          	<p class="text-center text-muted">이용약관 및 개인정보수집 및 이용 안내 <a href='#' class="text-danger">자세히 보기</a></p>
	                          	<p>
		                          	<input type="checkbox" name="ch1" value="이용약관"> 이용약관 동의(필수)<br>
		                          	<input type="checkbox" name="ch2" value="개인정보수집"> 개인정보수집 및 이용 동의(필수)
	                          	</p>
	                          </div>
	                          <div class="col-md-12 text-center mb-3">
	                              <button type="submit" class="btn btn-block mybtn btn-brown tx-tfm">가입하기</button>
	                          </div>
	                          <hr>
	                   	</form>
	                   	<!-- 로그인 페이지 이동 버튼 -->
	                   	<p class="text-muted">이미 계정이 있으신가요? <a class="text-danger" href="${pageContext.request.contextPath }/user/login">로그인</a></p>
			            
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