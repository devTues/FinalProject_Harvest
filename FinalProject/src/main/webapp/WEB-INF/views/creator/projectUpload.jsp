<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<!--  <!-- include libraries(jQuery, bootstrap) --> 
<!-- <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet"> -->
<!-- <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script>  -->
<!-- <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>  -->

<!-- <!-- include summernote css/js --> 
<!-- <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.1/summernote.css" rel="stylesheet"> -->
<!-- <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.1/summernote.js"></script> -->

<!-- <!-- include summernote-ko-KR -->
<%-- <script src="${pageContext.request.contextPath }/resources/summernote/lang/summernote-ko-KR.js"></script> --%>

<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<link href="${pageContext.request.contextPath }/resources/harVest_css/projectUpload.css" rel="stylesheet">

<title>projectUpload.jsp</title>


</head>
<body>
<script type="text/javascript">

	$(document).ready(function() {
		$('#summernote').summernote({
			  height: 300,                 // 에디터 높이
			  minHeight: null,             // 최소 높이
			  maxHeight: null,
			  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
			  lang: "ko-KR",					// 한글 설정
			  placeholder: '최대 2048자까지 쓸 수 있습니다'	//placeholder 설정
// 			  toolbar: [
// 				    // [groupName, [list of button]]
// 				    ['fontname', ['fontname']],
// 				    ['fontsize', ['fontsize']],
// 				    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
// 				    ['color', ['forecolor','color']],
// 				    ['table', ['table']],
// 				    ['para', ['ul', 'ol', 'paragraph']],
// 				    ['height', ['height']],
// 				    ['insert',['picture','link','video']],
// 				    ['view', ['fullscreen', 'help']]
// 				  ],
// 				fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
// 				fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
		});
	});

	
</script>

		<div id="projectContent">
			<div class="proj_top">
				<div class="top_content1">
					<button class="top_back">
						<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30"
							fill="currentColor" class="bi bi-arrow-left" viewBox="0 0 16 16">
							<path fill-rule="evenodd"
								d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z" />
						</svg>
					</button>
					<h1>프로젝트 기획</h1>
					<div class="top_save_box">
						<input type="submit" value="임시저장" class="top_save"> <input
							type="submit" value="업로드" class="top_upload">
					</div>
				</div>
	<div class="top_content2">
				<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
					<li class="nav-item" role="presentation">
						<button class="nav-link active" id="pills-home-tab"
							data-bs-toggle="pill" data-bs-target="#pills-home" type="button"
							role="tab" aria-controls="pills-home" aria-selected="true">프로젝트
							계획</button>
					</li>
					<li class="nav-item" role="presentation">
						<button class="nav-link" id="pills-profile-tab"
							data-bs-toggle="pill" data-bs-target="#pills-profile"
							type="button" role="tab" aria-controls="pills-profile"
							aria-selected="false">펀딩 계획</button>
					</li>
				</ul>
			</div>
		</div>
		<div class="proj_cont">
			<div class="tab-content" id="pills-tabContent">
<!-- 				<div class="tab-pane fade show active" id="pills-home" -->
<!-- 					role="tabpanel" aria-labelledby="pills-home-tab" tabindex="0"> -->
					<form action="${pageContext.request.contextPath }/create/createPro">
						<div class="article_proj">
							<div class="arti_tit1">창작자 이름</div>
							<div class="arti_cont1">
								<input type="text" name="creNm">
							</div>
						</div>
						<div class="article_proj">
							<div class="arti_tit2">프로필 이미지</div>
							<div class="proj_pro">
								<div class="box" style="background: #BDBDBD;">
									<img class="profile"
										src="${pageContext.request.contextPath }/resources/img/test_profile.jpg">
								</div>
								<div class="right">
									<input type="file" name="crePro">
								</div>
							</div>
						</div>
						<div class="article_proj">
							<div class="arti_tit3">창작자 소개</div>
							<div class="arti_cont3">
								<textarea cols="25"></textarea>
							</div>
						</div>

						<div class="article_proj">
							<div class="arti_tit4">title</div>
							<div class="arti_cont4">content</div>
						</div>
						<div class="article_proj">
							<div class="arti_tit5">title</div>
							<div class="arti_cont5">content</div>
						</div>
						<div class="article_proj">
							<div class="arti_tit6">title</div>
							<div class="arti_cont6">content</div>
						</div>
						<div class="article_proj">
							<div class="arti_tit7">title</div>
							<div class="arti_cont7">content</div>
						</div>
						<div class="article_proj">
							<div class="arti_tit8">프로젝트 소개</div>
							<div class="arti_cont8">
							 <h3>프로젝트 소개</h3>
								<iframe src="${pageContext.request.contextPath }/creator/editor">
								</iframe>
							</div>
						</div>
						<div class="article_proj">
							<div class="arti_tit9">프로젝트 예산</div>
							<div class="arti_cont9">
							 <h3>프로젝트 예산</h3>
								<iframe src="${pageContext.request.contextPath }/creator/editor">
								</iframe>
							</div>
						</div>
					</form>
				</div>
				<div class="tab-pane fade" id="pills-profile" role="tabpanel"
					aria-labelledby="pills-profile-tab" tabindex="0">...</div>
			</div>
		</div>
<!-- 	</div> -->

</body>
<!-- 	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script> -->
</html>