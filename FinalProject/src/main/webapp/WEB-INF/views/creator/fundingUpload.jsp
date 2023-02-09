<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<link href="${pageContext.request.contextPath }/resources/harVest_css/projectUpload.css" rel="stylesheet">

<title>projectUpload.jsp</title>

</head>
<body>
<c:if test="${empty sessionScope.id}">
	<c:redirect url="${pageContext.request.contextPath }/user/login"></c:redirect>
</c:if>
	<form action="${pageContext.request.contextPath }/creator/createPro" method="post">
	<div id="projectContent">
		<div class="proj_top">
			<div class="top_content1">
				<button class="top_back">
					<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-arrow-left" viewBox="0 0 16 16">
						<path fill-rule="evenodd" d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z"/>
					</svg>
				</button>
				<h1>펀딩 계획</h1>
				<div class="top_save_box">
<!-- 					<input type="submit" value="임시저장" class="top_save"> -->
					<input type="submit" value="업로드" class="top_upload">
				</div>
			</div>
		<div class="top_content2">
				<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
					<li class="nav-item" role="presentation">
						<button class="nav-link" id="pills-home-tab" data-bs-toggle="pill" data-bs-target="#pills-home" 
						type="button" role="tab" aria-controls="pills-home" aria-selected="false">
						<a href="${pageContext.request.contextPath }/creator/project">프로젝트 계획</a></button>
					</li>
					<li class="nav-item" role="presentation">
						<button class="nav-link active" id="pills-profile-tab" data-bs-toggle="pill" data-bs-target="#pills-profile" 
						type="button" role="tab" aria-controls="pills-profile" aria-selected="true">펀딩 계획</button>
					</li>
				</ul>
			</div>
		</div>
<div class="proj_cont">
			<div class="tab-content" id="pills-tabContent">
				<div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab" tabindex="0">
					<div class="article_proj">
						<div class="arti_tit1">최소 후원 금액</div>
						<div class="arti_cont1">
							<input type="text" name="minDona">
						</div>
					</div>
					<div class="article_proj">
						<div class="arti_tit2">목표 금액</div>
						<div class="arti_cont2">
							<input type="text" name="targetAmt">
						</div>
					</div>
					<div class="article_proj">
						<div class="arti_tit3">펀딩 시작일</div>
						<div class="arti_cont3">
							<input type="date" name="start">
						</div>
						<div class="arti_tit4">펀딩 종료일</div>
						<div class="arti_cont4">
							<input type="date" name="end">
						</div>
						<div class="sub_article">
							<div class="arti_cont4">
								펀딩 기간
							</div>
							<div class="arti_cont5">
								후원자 결제 종료일
							</div>
							<div class="arti_cont6">
								정산일
							</div>
						</div>
					</div>
				<div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab" tabindex="0">...</div>
			</div>	
		</div>
	</div>
</form>


</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
	crossorigin="anonymous"></script>
</html>