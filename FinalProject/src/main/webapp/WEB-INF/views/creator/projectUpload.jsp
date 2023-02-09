<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html id="AllContent">
<head>
<meta charset="UTF-8">
<link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<link href="${pageContext.request.contextPath }/resources/harVest_css/projectUpload.css" rel="stylesheet">

<!-- TODO: js 파일로 떼기 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js" ></script>
<script type="text/javascript" serc="${pageContext.request.contextPath }/resources/js/Upload.js"></script>
<title>projectUpload.jsp</title>

</head>
<body>
<c:if test="${empty sessionScope.id}">
	<c:redirect url="${pageContext.request.contextPath }/user/login"></c:redirect>
</c:if>
	<form action="${pageContext.request.contextPath }/creator/createPro" name="project" method="post" onclick="submitSendForm()">
	<div id="projectContent">
		<div class="proj_top">
			<div class="top_content1">
				<button class="top_back">
					<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-arrow-left" viewBox="0 0 16 16">
						<path fill-rule="evenodd" d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z"/>
					</svg>
				</button>
				<h1>프로젝트 기획</h1>
				<div class="top_save_box">
<!-- 					<input type="submit" value="임시저장" class="top_save"> -->
					<input type="submit" value="업로드" class="top_upload">
				</div>
			</div>
		<div class="top_content2">
				<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
					<li class="nav-item" role="presentation">
						<button class="nav-link active" id="pills-home-tab" data-bs-toggle="pill" data-bs-target="#pills-home" 
						type="button" role="tab" aria-controls="pills-home" aria-selected="true">프로젝트 계획</button>
					</li>
					<li class="nav-item" role="presentation">
						<button class="nav-link" id="pills-profile-tab" data-bs-toggle="pill" data-bs-target="#pills-profile" 
						type="button" role="tab" aria-controls="pills-profile" aria-selected="false">
						<a href="${pageContext.request.contextPath }/creator/funding">펀딩 계획</a></button>
					</li>
				</ul>
			</div>
		</div>
<div class="proj_cont">
			<div class="tab-content" id="pills-tabContent">
				<div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab" tabindex="0">
					<div class="article_proj">
						<div class="arti_tit">창작자 이름</div>
						<div class="arti_cont">
							<input type="text" name="creNm">
						</div>
					</div>
					<div class="article_proj">
						<div class="arti_tit">프로필 이미지</div>
						<div class="proj_cont">
							<div class="box" style="background: #BDBDBD;">
								<img class="image-box" src="${pageContext.request.contextPath }/resources/harVest_img/mypage.png">
							</div>
							<div class="right">
								<input type="file" id="file" accept=".png, .jpeg, .jpg" name="crePro">
							</div>
						</div>
					</div>
					<div class="article_proj">
						<div class="arti_tit">창작자 소개</div>
						<div class="arti_cont">
							<textarea cols="25" name="creIntro"></textarea>
						</div>
					</div>

					<div class="article_proj">
						<div class="arti_tit">프로젝트 카테고리</div>
						<div class="arti_cont">
							<!-- category 불러오기 -->
							<select name="category">
							</select>
						</div>
					</div>
					<div class="article_proj">
						<div class="arti_tit">프로젝트 제목</div>
						<div class="arti_cont">
							<input type="text" name="title">
						</div>
					</div>
					<div class="article_proj">
						<div class="arti_tit">상품 이름</div>
						<div class="arti_cont6">
							<input type="text" name="productMn">
						</div>
					</div>
					<div class="article_proj">
						<div class="arti_tit">프로젝트 이미지</div>
						<div class="arti_cont">
							<div class="filebox clearfix">
   								<div class="inputFile">
   									<!-- TODO: 기본 이미지 만들기 -->
        							<label for="AddImgs" class="addImgBtn">+</label>
       								<input type="file" id="AddImgs" name="Img1" class="upload-hidden" accept=".jpeg, .jpg, .png, .gif" multiple>
    							</div>
    							<ul id="Preview" class="sortable"></ul>
							</div>
						</div>
					</div>
					<div class="article_proj">
						<div class="arti_tit">프로젝트 소개</div>
						<div class="arti_cont">
							<iframe id="iframe_intro" src="${pageContext.request.contextPath }/creator/intro" width="550px" height="550px"> </iframe>
<!-- 							<div id="txt" class="divHide"></div> -->
						</div>
					</div>
					<div class="article_proj">
						<div class="arti_tit">프로젝트 예산</div>
						<div class="arti_cont">
							<iframe name="budget" src="${pageContext.request.contextPath }/creator/budget" width="550px" height="550px"> </iframe>
						</div>
					</div>
					<div class="article_proj">
						<div class="arti_tit">프로젝트 일정</div>
						<div class="arti_cont">
							<iframe name="schedule" src="${pageContext.request.contextPath }/creator/schedule" width="550px" height="550px"> </iframe>
						</div>
					</div>
				</div>
				<div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab" tabindex="0">...</div>
			</div>	
		</div>
	</div>
</form>
<script type="text/javascript">

var submitSendForm = function() {
	 var frmObj = document.getElementById("iframe_intro").contentWindow.document.sendform;
	 frmObj.submit();
}
</script>


</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
	crossorigin="anonymous"></script>
</html>