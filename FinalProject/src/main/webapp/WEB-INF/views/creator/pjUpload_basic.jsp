<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<link href="${pageContext.request.contextPath }/resources/harVest_css/projectUpload.css" rel="stylesheet">

<title>projectUpload.jsp</title>

</head>
<body>
	<form action="${pageContext.request.contextPath }/creator/createPro" method="post">
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
						<button class="nav-link active" id="pills-home-tab" data-bs-toggle="pill" data-bs-target="#pills-home" type="button" role="tab" aria-controls="pills-home" aria-selected="true">프로젝트 계획</button>
					</li>
					<li class="nav-item" role="presentation">
						<button class="nav-link" id="pills-profile-tab" data-bs-toggle="pill" data-bs-target="#pills-profile" type="button" role="tab" aria-controls="pills-profile" aria-selected="false">펀딩 계획</button>
					</li>
				</ul>
			</div>
		</div>
<div class="proj_cont">
			<div class="tab-content" id="pills-tabContent">
				<div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab" tabindex="0">
					<div class="article_proj">
						<div class="arti_tit1">창작자 이름</div>
						<div class="arti_cont1">
							<input type="text" name="creNm">
						</div>
					</div>
					<div class="article_proj">
						<div class="arti_tit2">프로필 이미지</div>
						<div class="proj_cont2">
<!-- 							<div class="box" style="background: #BDBDBD;"> -->
								<img class="image-box" src="${pageContext.request.contextPath }/resources/harVest_img/mypage.png">
<!-- 							</div> -->
<!-- 							<div class="right"> -->
								<input type="file" id="file" accept=".png, .jpeg, .jpg" name="crePro">
<!-- 							</div> -->
						</div>
					</div>
					<div class="article_proj">
						<div class="arti_tit3">창작자 소개</div>
						<div class="arti_cont3">
							<textarea cols="25" name="creIntro"></textarea>
						</div>
					</div>

					<div class="article_proj">
						<div class="arti_tit4">프로젝트 카테고리</div>
						<div class="arti_cont4">
							<select name="category">
							</select>
						</div>
					</div>
					<div class="article_proj">
						<div class="arti_tit5">프로젝트 제목</div>
						<div class="arti_cont5">
							<input type="text" name="title">
						</div>
					</div>
					<div class="article_proj">
						<div class="arti_tit6">상품 이름</div>
						<div class="arti_cont6">
							<input type="text" name="productMn">
						</div>
					</div>
					<div class="article_proj">
						<div class="arti_tit7">프로젝트 이미지</div>
						<div class="arti_cont7">
							<div class="imgs_wrap">
								<img id="img">
							</div>
							<div class="input_wrap">
								<input multiple="multiple" id="input_imgs" type="file"  accept="image/png, image/jpeg, image/jpg" name="img1" />
							</div>
						</div>
					</div>
					<div class="article_proj">
						<div class="arti_tit8">프로젝트 소개</div>
						<div class="arti_cont8">
							<h3>프로젝트 소개</h3>
							<iframe name="intro" src="${pageContext.request.contextPath }/creator/intro" width="550px" height="550px"> </iframe>
						</div>
					</div>
					<div class="article_proj">
						<div class="arti_tit9">프로젝트 예산</div>
						<div class="arti_cont9">
							<h3>프로젝트 예산</h3>
							<iframe name="budget" src="${pageContext.request.contextPath }/creator/budget" width="550px" height="550px"> </iframe>
						</div>
					</div>
					<div class="article_proj">
						<div class="arti_tit10">프로젝트 일정</div>
						<div class="arti_cont10">
							<h3>프로젝트 일정</h3>
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
window.onload = function(){
	// 프로필 사진 미리보기
	const fileDOM = document.querySelector('#file');
	const preview = document.querySelector('.image-box');

		fileDOM.addEventListener('change', (e) => {
		  const reader = new FileReader();
		  reader.onload = ({ target }) => {
		    preview.src = target.result;
		  };
		  reader.readAsDataURL(fileDOM.files[0]);
		});
				
		// 다중 파일(프로젝트 이미지) 확장자 검사
//	 	var selectedfiles = [];				// 이미지 정보 담는 배열
//	 	 $(document).ready(function() {
//	 		 $("#input_imgs").on("change", handleImgFileSelect);
//	 	 });
		
		// 다중 파일 미리보기
// 		function handleImgFileSelect(e) {
			// 이미지 정보들 초기화
// 			selectedFiles = [];
// 			$(".imgs_wrap").empty();
			 
// 			var files = e.target.files;
// 			var filesArr = Array.prototype.slice.call(files);
			 
// 			var index = 0;
// 			filesArr.forEach(function(f) {
// 				if(!f.type.match("image.*")) {
// 					alert("이미지 확장자만 가능합니다.")
// 				 	return;
// 			 	}
				 
// 				selectedFiles.push(f);
				
// 	 			var reader = new FileReadar();
// 	 			reader.onlaod = funtion(e) {
// 	 				var html = "";
// 	 				$(".imgs_wrap").append(html);
// 	 				index++
// 	 			}
// 	 			reader.readAsDataURL(f);
// 			 });
// 		 }
}

	

</script>

</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
	crossorigin="anonymous"></script>
</html>