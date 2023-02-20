<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html id="AllContent">
<head>
<meta name="viewport" content="width=device-width,initial-scale=1">
<meta charset="UTF-8">
<link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<link href="${pageContext.request.contextPath }/resources/harVest_css/projectUpload.css" rel="stylesheet">

<!-- TODO: js 파일로 떼기 -->
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/harVest_js/jquery-3.6.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/harVest_js/Upload.js"></script>
<title>planUpload.jsp</title>
<script type="text/javascript">
$(document).ready(function() {

	$(window).scroll(function() {
		var window = $(this).scrollTop();
		if (window) {
			$('#header').addClass('fixed', 1000);
			return;
		}
		$('#header').removeClass('fixed', 1000);
	});

	// 	TODO : 클릭시 null이면 빨간색 테두리, 필수입력 제어

});

</script>
</head>
<body>
	<c:if test="${empty sessionScope.id}">
		<c:redirect url="/user/login"></c:redirect>
	</c:if>
	<form action="${pageContext.request.contextPath }/creator/createPro" name="project" method="post">
		<input type="hidden" name="id" value="${sessionScope.id}">
		<div id="layout"></div>
		<div id="projectContent">
			<div class="top">
				<!-- 		<div class="proj_top"> -->
				<div class="top_header">
					<div class="header_wrap">
						<a class="top_left" onclick="history.back()"> <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-arrow-left" viewBox="0 0 16 16">
					<path fill-rule="evenodd" d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z" />
				</svg>
						</a>
						<div class="top_right">
							<!-- 				<button class="dis pre_width pre" disabled> : 비활성화-->
							<button class="able pre_width pre">
								<div class="topb icon">
									<svg viewBox="0 0 48 48">
										<path fill-rule="evenodd" clip-rule="evenodd"
											  d="M13.7 23.9943C13.8 29.506 18.4 34.0342 24 33.935C29.6 34.0342 34.2 29.506 34.3 23.9943C34.2 18.4826 29.6 13.9563 24 14.0545C18.4 13.9563 13.8 18.4826 13.7 23.9943ZM2 23.9943C5.5 15.2355 14.4 9.62552 24 10.0195C33.6 9.62552 42.5 15.2355 46 23.9943C42.5 32.8523 33.6 38.4623 24 37.97C14.4 38.364 5.5 32.7541 2 23.9943ZM30.6 23.9944C30.6 20.4614 27.646 17.5974 24 17.5974C20.355 17.5974 17.4 20.4614 17.4 23.9944C17.4 27.5274 20.355 30.3913 24 30.3913C27.646 30.3913 30.6 27.5274 30.6 23.9944Z"></path>
									</svg>
								</div>
								<span class="previewText">미리 보기</span>
							</button>
							<!-- TODO : 시작일 오류, 심사요청으로 자동 변경되게 만들기 -->
							<!-- 시작일 오류  -->
<!-- 							<button class="err_btn err_button" color="white" disabled> -->
							<button class="top_btn top_button" onsubmit="">
<!-- 								<span> -->
<!-- 									<div name="error" class="topb"> -->
<!-- 										<svg viewBox="0 0 48 48"> -->
<!-- 											<path d="M21.009 15.1083C21.0042 15.05 21.0502 15 21.1087 15H26.8913C26.9498 15 26.9958 15.05 26.991 15.1083L26.0076 26.9083C26.0033 26.9601 25.96 27 25.908 27H22.092C22.04 27 21.9967 26.9601 21.9924 26.9083L21.009 15.1083Z"></path> -->
<!-- 											<path d="M21 32C21 30.3431 22.3431 29 24 29C25.6569 29 27 30.3431 27 32C27 33.6569 25.6569 35 24 35C22.3431 35 21 33.6569 21 32Z"></path> -->
<!-- 											<path fill-rule="evenodd" clip-rule="evenodd" -->
<!-- 												d="M24 40C32.8366 40 40 32.8366 40 24C40 15.1634 32.8366 8 24 8C15.1634 8 8 15.1634 8 24C8 32.8366 15.1634 40 24 40ZM24 44C35.0457 44 44 35.0457 44 24C44 12.9543 35.0457 4 24 4C12.9543 4 4 12.9543 4 24C4 35.0457 12.9543 44 24 44Z"></path></svg> -->
<!-- 									</div>시작일 오류 -->
<!-- 								</span> -->
<!-- 							</button> -->
							<span>임시저장</span>
							<!-- <span>심사요청</span> -->
						</button>
						</div>
					</div>
				</div>
				<div class="top_contentWrap">
					<div class="top_title">프로젝트 기획</div>
				</div>
				<div id="header">
					<div class="top_contentFix">
						<div class="top_tap">
							<ul class="subtab">
								<li class="item"><button class="nav-link" id="basic-tab" data-bs-toggle="tab" data-bs-target="#basic-tab-pane" type="button" role="tab" aria-controls="basic-tab-pane" aria-selected="true"
									onclick="location.href='${pageContext.request.contextPath}/creator/project'">
									기본정보</button></li>
								<li class="item"><button class="nav-link active" id="plan-tab" data-bs-toggle="tab" data-bs-target="#plan-tab-pane" type="button" role="tab" aria-controls="plan-tab-pane" aria-selected="false"
									>
									프로젝트 계획</button></li>
								<li class="item"><button class="nav-link" id="funding-tab" data-bs-toggle="tab" data-bs-target="#funding-tab-pane" type="button" role="tab" aria-controls="funding-tab-pane" aria-selected="false"
									onclick="location.href='${pageContext.request.contextPath}/creator/funding'">
									펀딩 계획</button></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="proj_cont">
				<div class="tab-content">
					<div class="article_proj">
						<dl class="sub_article">
						<dt class="arti_tit">프로젝트 소개</dt>
						<dd class="defi">무엇을 만들기 위한 프로젝트인지 소개해 주세요.</dd>
						</dl>
						<div class="arti_cont">
							<div class="con_width">
<%-- 							<iframe id="iframe_intro" src="${pageContext.request.contextPath }/creator/intro" width="550px" height="550px"> </iframe> --%>
								<textarea name="intro" style="white-space:pre;">
										<p>막연하다면 아래의 질문에 대한 답이 내용에 포함되도록 작성해보세요.</p>

										<p>Q. 이 프로젝트를 시작하게 된 배경이 무엇인가요?</p>
								
										<p>Q. 무엇을 만들기 위한 프로젝트인가요?</p>
								
										<p>Q. 프로젝트를 간단히 소개한다면?</p>
								
										<p>Q. 이 프로젝트가 왜 의미있나요?</p>
							</textarea>
						</div>
					</div>
					</div>
					<div class="article_proj">
						<dl class="sub_article">
						<dt class="arti_tit">프로젝트 예산</dt>
						<dd class="defi">펀딩 목표 금액을 제작에 어떻게 사용할 것인지 구체적으로 알려주세요. ‘인건비', ‘배송비’, ‘인쇄비’, ‘대관료’ 등 세부 항목별로 작성해야 합니다.</dd>
						</dl>
						<div class="arti_cont">
							<div class="con_width">
							<textarea name="budget">
									<p>설정하신 목표 금액을 어디에 사용 예정이신지 구체적인 지출 항목으로 적어 주세요.</p>
									<ul>
										<li>예산은 ‘제작비’가 아닌 구체적인 ‘항목’으로 적어 주세요.</li>
										<li>이번 프로젝트의 실행에 필요한 비용으로만 작성해 주세요.</li>
										<li>기부, 다음 프로젝트에 사용하기 등은 이번 프로젝트의 예산으로 볼 수 없어요.</li>
										<li>만일 전체 제작 비용 중 일부만 모금하시는 경우라면, 나머지 제작 비용은 어떻게 마련 예정인지 추가로 작성해 주세요.</li>
									</ul>
								
									<p>(예시)</p>
								
									<p>목표 금액은 아래의 지출 항목으로 사용할 예정입니다.</p>
									<ul>
										<li>인건비</li>
										<li>배송비</li>
										<li>발주비</li>
										<li>디자인</li>
										<li>의뢰비</li>
										<li>수수료</li>
									</ul>
							</textarea>
							</div>
						</div>
					</div>
					<div class="article_proj">
					<dl class="sub_article">
						<dt class="arti_tit">프로젝트 일정</dt>
						<dd class="defi">작업 일정을 구체적인 날짜와 함께 작성하세요. 후원자가 일정을 보면서 어떤 작업이 진행될지 알 수 있어야 합니다. 펀딩 종료 이후의 제작 일정을 반드시 포함하세요.</dd>
					</dl>
					<div class="arti_cont">
						<div class="con_width">
							<textarea name="schedule">
								<p>( 예시 )</p>

								<p>
									0월 0일: 현재 제품 시안 및 1차 샘플 제작<br>
									0월 0일: 펀딩 시작일<br> 
									0월 0일: 샘플 작업 보완<br> 
									0월 0일: 펀딩 종료일<br> 
									0월 0일: 2차 샘플 제작<br> 
									0월 0일: 제품 디테일 보완<br> 
									0월 0일: 제품 발주 시작<br> 
									0월 0일: 후가공 처리 및포장 작업<br> 
									0월 0일: 선물 예상 전달일뢰비
								</p>
							</textarea>
							</div>
						</div>
					</div>
				</div>
				<div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab" tabindex="0">...</div>
			</div>
		</div>
		<!-- 	</div> -->
	</form>
	<script src="https://cdn.tiny.cloud/1/6d0eescgzo66t0hqfeu0aeu5fyxbu2c0415q0gzufzi1uyaa/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>
	<script type="text/javascript">
// 		var submitSendForm = function() {
// 			var frmObj = document.getElementById("iframe_intro").contentWindow.document.sendform;
// 			frmObj.submit();
// 		}
$(function() {
		var plugins = [ "advlist", "autolink", "lists", "link", "image",
				"charmap", "print", "preview", "anchor", "searchreplace",
				"visualblocks", "code", "fullscreen", "insertdatetime",
				"media", "table", "paste", "code", "help", "wordcount", "save" ];
		var edit_toolbar = 'formatselect fontselect fontsizeselect |'
				+ ' forecolor backcolor |'
				+ ' bold italic underline strikethrough |'
				+ ' alignjustify alignleft aligncenter alignright |'
				+ ' bullist numlist |' + ' table tabledelete |' + ' link image';

		tinyMCE
				.init({
					
					forced_root_block : false,
				    force_br_newlines : true,
				    force_p_newlines : false,
					language : "ko_KR", //한글판으로 변경
					mode: "textareas",
					
// 					selector : 'Editor',
					height : 500,
					menubar : false,
					plugins : plugins,
					toolbar : edit_toolbar,

					/*** image upload ***/
					image_title : true,
					/* enable automatic uploads of images represented by blob or data URIs*/
					automatic_uploads : true,
					/*
					    URL of our upload handler (for more details check: https://www.tiny.cloud/docs/configure/file-image-upload/#images_upload_url)
					    images_upload_url: 'postAcceptor.php',
					    here we add custom filepicker only to Image dialog
					 */
					file_picker_types : 'image',
					/* and here's our custom image picker*/
					file_picker_callback : function(cb, value, meta) {
						var input = document.createElement('input');
						input.setAttribute('type', 'file');
						input.setAttribute('accept', 'image/*');

						/*
						Note: In modern browsers input[type="file"] is functional without
						even adding it to the DOM, but that might not be the case in some older
						or quirky browsers like IE, so you might want to add it to the DOM
						just in case, and visually hide it. And do not forget do remove it
						once you do not need it anymore.
						 */
						input.onchange = function() {
							var file = this.files[0];

							var reader = new FileReader();
							reader.onload = function() {
								/*
								Note: Now we need to register the blob in TinyMCEs image blob
								registry. In the next release this part hopefully won't be
								necessary, as we are looking to handle it internally.
								 */
								var id = 'blobid' + (new Date()).getTime();
								var blobCache = tinymce.activeEditor.editorUpload.blobCache;
								var base64 = reader.result.split(',')[1];
								var blobInfo = blobCache.create(id, file,
										base64);
								blobCache.add(blobInfo);

								/* call the callback and populate the Title field with the file name */
								cb(blobInfo.blobUri(), {
									title : file.name
								});
							};
							reader.readAsDataURL(file);
						};
						input.click();
					},
					/*** image upload ***/

					content_style : 'body { font-family:Helvetica,Arial,sans-serif; font-size:14px }'
				});
		
// 	    $("#save").on("click", function(){
// 	        var content = tinymce.activeEditor.getContent();
// 	        console.log(content);
// 	        window.parent.postMessage({ childData : 'test data' }, 'https://localhost:8080/${pageContext.request.contextPath }/creator/project');
// 	    });
// 	    window.onload = function() {

// 	    	  console.log('child load');  
	    	  
	    	  //targetWindow.postMessage(message, targetOrigin, [transfer]);
	    	 
	    	  
	    	  //모든 도메인에 대해서 허용하고자 하는 경우 targetOrigin(두번째인자) 인자를 '*'로 작성
	    	  //보안을 위해 추천하지 않음
	    	  //window.parent.postMessage({ childData : 'test data' }, '*');
	    	  
// 	    	};
	});
	</script>


</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
	crossorigin="anonymous"></script>
</html>