<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html id="AllContent">
<head>
<meta name="viewport" content="width=device-width,initial-scale=1">
<meta charset="UTF-8">
<link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<link href="${pageContext.request.contextPath }/resources/harVest_css/projectUpload.css" rel="stylesheet">

<!-- TODO: js 파일로 떼기 -->
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/harVest_js/jquery-3.6.3.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/harVest_js/Upload.js"></script>
<title>projectUpload.jsp</title>
<script type="text/javascript">
	// 탭 고정
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
	<!-- form 시작 -->
	<form action="${pageContext.request.contextPath}/creator/createPro" name="project" method="post" enctype="multipart/form-data">
		<input type="hidden" name="id" value="${sessionScope.id}">
		<div id="layout"></div>
		<div id="projectContent">
			<!-- 상단 -->
			<div class="top">
				<div class="top_header">
					<div class="header_wrap">
						<a class="top_left" onclick="history.back()"> 
							<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-arrow-left" viewBox="0 0 16 16"> <path fill-rule="evenodd" d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z" /></svg>
						</a>
						<div class="top_right">
							<!-- <button class="dis pre_width pre" disabled> : 비활성화(저장 전) -->
							<button class="able pre_width pre">	<!-- 미리보기 버튼 -->
								<div class="topb icon">
									<svg viewBox="0 0 48 48">
										<path fill-rule="evenodd" clip-rule="evenodd" d="M13.7 23.9943C13.8 29.506 18.4 34.0342 24 33.935C29.6 34.0342 34.2 29.506 34.3 23.9943C34.2 18.4826 29.6 13.9563 24 14.0545C18.4 13.9563 13.8 18.4826 13.7 23.9943ZM2 23.9943C5.5 15.2355 14.4 9.62552 24 10.0195C33.6 9.62552 42.5 15.2355 46 23.9943C42.5 32.8523 33.6 38.4623 24 37.97C14.4 38.364 5.5 32.7541 2 23.9943ZM30.6 23.9944C30.6 20.4614 27.646 17.5974 24 17.5974C20.355 17.5974 17.4 20.4614 17.4 23.9944C17.4 27.5274 20.355 30.3913 24 30.3913C27.646 30.3913 30.6 27.5274 30.6 23.9944Z"></path>
									</svg>
								</div>
								<span class="previewText">미리 보기</span>
							</button>
							<!-- 저장, 심사 요청 버튼 (submit) -->
							<!-- TODO : 시작일 오류, 심사요청으로 자동 변경되게 만들기 -->
							<!-- 시작일 오류  -->
							<!-- <button class="err_btn err_button" color="white" disabled> -->
							<button class="top_btn top_button">
								<!-- <span> -->
								<!-- 	<div name="error" class="topb"> -->
								<!-- 		<svg viewBox="0 0 48 48"> -->
								<!-- 			<path d="M21.009 15.1083C21.0042 15.05 21.0502 15 21.1087 15H26.8913C26.9498 15 26.9958 15.05 26.991 15.1083L26.0076 26.9083C26.0033 26.9601 25.96 27 25.908 27H22.092C22.04 27 21.9967 26.9601 21.9924 26.9083L21.009 15.1083Z"></path> -->
								<!-- 			<path d="M21 32C21 30.3431 22.3431 29 24 29C25.6569 29 27 30.3431 27 32C27 33.6569 25.6569 35 24 35C22.3431 35 21 33.6569 21 32Z"></path> -->
								<!-- 			<path fill-rule="evenodd" clip-rule="evenodd" d="M24 40C32.8366 40 40 32.8366 40 24C40 15.1634 32.8366 8 24 8C15.1634 8 8 15.1634 8 24C8 32.8366 15.1634 40 24 40ZM24 44C35.0457 44 44 35.0457 44 24C44 12.9543 35.0457 4 24 4C12.9543 4 4 12.9543 4 24C4 35.0457 12.9543 44 24 44Z"></path></svg> -->
								<!-- 	</div>시작일 오류 -->
								<!-- </span> -->
								<!-- </button> -->
								<span>임시저장</span>
								<!-- <span>심사요청</span> -->
							</button>
						</div>
					</div>
				</div>
				<!-- 탭 버튼 -->
				<div class="top_contentWrap">
					<div class="top_title">프로젝트 기획</div>
				</div>
				<div id="header">
					<div class="top_contentFix">
						<div class="top_tap">
							<ul class="subtab" id="pills-tab">
								<li class="item">
									<button class="nav-link active" id="basic-tab" data-bs-toggle="tab" data-bs-target="#basic-tab-pane" type="button" role="tab" aria-controls="basic-tab-pane" aria-selected="true"
									>
									기본정보</button></li>
								<li class="item">
									<button class="nav-link" id="plan-tab" data-bs-toggle="tab" data-bs-target="#plan-tab-pane" type="button" role="tab" aria-controls="plan-tab-pane" aria-selected="false"
									onclick="location.href='${pageContext.request.contextPath}/creator/plan'">
									프로젝트 계획</button></li>
								<li class="item">
									<button class="nav-link" id="funding-tab" data-bs-toggle="tab" data-bs-target="#funding-tab-pane" type="button" role="tab" aria-controls="funding-tab-pane" aria-selected="false"
									onclick="location.href='${pageContext.request.contextPath}/creator/funding'">
									펀딩 계획</button></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<!-- 본문 -->
			<div class="proj_cont">
				<div class="tab-content">
					<!-- 1. 기본정보 -->
					<div class="tab-pane fade show active" id="basic-tab-pane" role="tabpanel" aria-labelledby="basic-tab" tabindex="0">
						<div class="article_proj">
							<dl class="sub_article">
								<dt class="arti_tit">창작자 이름</dt>
								<dd class="defi">창작자를 대표할 수 있는 이름을 써주세요.</dd>
							</dl>
							<div class="arti_cont">
								<div class="con_width">
									<div class="wrap">
										<span class="input_wrap guide"> <input type="text" class="textInput creNm" name="creNm">
										</span>
									</div>
									<div class="notiArea">
										<p></p>
										<span class="creNmLength length">0/20</span>
									</div>
								</div>
							</div>
						</div>
						<div class="article_proj">
							<dl class="sub_article">
								<dt class="arti_tit">프로필 이미지</dt>
								<dd class="defi">창작자 용 사진을 올려주세요.</dd>
							</dl>
							<div class="arti_cont">
								<div class="profi_wrap">
									<div class="avatar_wrap dqYcqd">
										<div class="box">
											<img class="image-box" src="${pageContext.request.contextPath }/resources/harVest_img/mypage.png">
										</div>
									</div>
									<div class="right">
										<div class="up_wrap">
											<input type="file" id="file" accept=".png, .jpg" name="profile"> 
												<label for="file" class="up_btn btn_m fileSelBtn" color="grayEditor200">
													<div class="topb">
														<svg viewBox="0 0 48 48"><path fill-rule="evenodd" clip-rule="evenodd" d="M25.9087 8.12155L36.4566 18.3158C37.2603 18.7156 38.2648 18.6156 38.968 18.3158C39.6712 17.5163 39.6712 16.4169 38.968 15.7173L25.3059 2.5247C24.6027 1.8251 23.4977 1.8251 22.7945 2.5247L9.03196 15.8172C8.32877 16.5168 8.32877 17.6162 9.03196 18.3158C9.73516 19.0154 10.9406 19.0154 11.6438 18.3158L22.2922 8.12155V28.4111C22.2922 29.4106 23.0959 30.2091 24.1005 30.2091C25.105 30.2091 25.9087 29.4106 25.9087 28.4111V8.12155ZM5.61644 29.4104C5.61644 28.4109 4.81279 27.6104 3.80822 27.6104C2.80365 27.6104 2 28.5099 2 29.5093V44.202C2 45.2015 2.80365 46 3.80822 46H44.1918C45.1963 46 46 45.2015 46 44.202V29.5093C46 28.5099 45.1963 27.7113 44.1918 27.7113C43.1872 27.7113 42.3836 28.5099 42.3836 29.5093V42.3021H5.61644V29.4104Z"></path></svg>
												</label> 
											이미지파일 업로드
										</div>
									</div>
									<p>파일 형식은 jpg 또는 png 만 가능합니다.</p>
								</div>
							</div>
						</div>
					</div>
					<div class="article_proj">
						<dl class="sub_article">
							<dt class="arti_tit">창작자 소개</dt>
							<dd class="defi">창작자님의 소개를 간단하게 써주세요.</dd>
						</dl>
						<div class="arti_cont">
							<div class="con_width">
								<div class="wrap">
									<span class="ta taInput"> 
										<textarea class="taStyle creIntro" name="creIntro"></textarea>
									</span>
								</div>
								<div class="notiArea">
									<p></p>
									<span class="creIntroLength length">0/300</span>
								</div>
							</div>
						</div>
					</div>
					<div class="article_proj">
						<dl class="sub_article">
							<dt class="arti_tit">프로젝트 카테고리</dt>
							<dd class="defi">프로젝트의 카테고리를 선택해주세요.</dd>
						</dl>
						<div class="arti_cont">
							<div class="sel_box">
								<p class="sub_tit">카테고리</p> 
								<span class="category guide"> 
									<select name="category" class="textInput app select" required>
										<option value="" disabled selected>카테고리 선택</option>
										<c:forEach var="categoryNm" items="${categoryNm}">
											<option value="${categoryNm}">${categoryNm}</option>
										</c:forEach>
									</select> 
								</span>
							</div>
						</div>
					</div>
					<div class="article_proj">
						<dl class="sub_article">
							<dt class="arti_tit">프로젝트 제목</dt>
							<dd class="defi">프로젝트의 주제, 창작물의 특징이 드러나는 멋진 제목을 붙여주세요.</dd>
						</dl>
						<div class="arti_cont">
							<div class="con_width">
								<div class="wrap">
									<span class="input_wrap guide"> 
										<input type="text" class="textInput title" name="title">
									</span>
								</div>
								<div class="notiArea">
									<p></p> <span class="titleLength length">0/20</span>
								</div>
							</div>
						</div>
					</div>
					<div class="article_proj">
						<dl class="sub_article">
							<dt class="arti_tit">프로젝트 상품 이름</dt>
							<dd class="defi">프로젝트에 포함되는 구성 상품을 말합니다. 특별한 물건부터 의미있는 경험까지 선물을 구성할 상품을 만들어 보세요.</dd>
						</dl>
						<div class="arti_cont">
							<div class="con_width">
								<div class="wrap">
									<span class="input_wrap guide"> 
										<input type="text" class="textInput productNm" name="productNm">
									</span>
								</div>
								<div class="notiArea">
									<p></p> <span class="proNmLength length">0/10</span>
								</div>
							</div>
						</div>
					</div>
					<div class="article_proj">
						<dl class="sub_article">
							<dt class="arti_tit">프로젝트 이미지</dt>
							<dd class="defi">후원자들이 프로젝트의 내용을 쉽게 파악하고 좋은 인상을 받을 수 있도록 이미지를 올려 주세요.</dd>
							<div class="notice">
								<div class="noti_tit">
									<div class="topb">
										<svg viewBox="0 0 48 48">
											<path d="M21.5 23.1C21.5 23.0448 21.5448 23 21.6 23H26.4C26.4552 23 26.5 23.0448 26.5 23.1V33.9C26.5 33.9552 26.4552 34 26.4 34H21.6C21.5448 34 21.5 33.9552 21.5 33.9V23.1Z"></path>
											<path d="M21 17C21 15.3431 22.3431 14 24 14C25.6569 14 27 15.3431 27 17C27 18.6569 25.6569 20 24 20C22.3431 20 21 18.6569 21 17Z"></path>
											<path fill-rule="evenodd" clip-rule="evenodd" d="M24 40C32.8366 40 40 32.8366 40 24C40 15.1634 32.8366 8 24 8C15.1634 8 8 15.1634 8 24C8 32.8366 15.1634 40 24 40ZM24 44C35.0457 44 44 35.0457 44 24C44 12.9543 35.0457 4 24 4C12.9543 4 4 12.9543 4 24C4 35.0457 12.9543 44 24 44Z"></path>
										</svg>
									</div>
									1개 이상의 이미지를 등록하면 이미지 슬라이더 형태로 제공됩니다.
								</div>
							</div>
						</dl>
						<div class="arti_cont">
							<div class="con_width">
								<div class="filewrap">
									<div class="filebox clearfix">
										<span> <i>
												<div class="topb">
													<svg viewBox="0 0 48 48">
														<path fill-rule="evenodd" clip-rule="evenodd" d="M25.9087 8.12155L36.4566 18.3158C37.2603 18.7156 38.2648 18.6156 38.968 18.3158C39.6712 17.5163 39.6712 16.4169 38.968 15.7173L25.3059 2.5247C24.6027 1.8251 23.4977 1.8251 22.7945 2.5247L9.03196 15.8172C8.32877 16.5168 8.32877 17.6162 9.03196 18.3158C9.73516 19.0154 10.9406 19.0154 11.6438 18.3158L22.2922 8.12155V28.4111C22.2922 29.4106 23.0959 30.2091 24.1005 30.2091C25.105 30.2091 25.9087 29.4106 25.9087 28.4111V8.12155ZM5.61644 29.4104C5.61644 28.4109 4.81279 27.6104 3.80822 27.6104C2.80365 27.6104 2 28.5099 2 29.5093V44.202C2 45.2015 2.80365 46 3.80822 46H44.1918C45.1963 46 46 45.2015 46 44.202V29.5093C46 28.5099 45.1963 27.7113 44.1918 27.7113C43.1872 27.7113 42.3836 28.5099 42.3836 29.5093V42.3021H5.61644V29.4104Z"></path>
													</svg>
												</div>
										</i> <b>이미지 업로드</b></span>
										<p>최소 1개, 최대 3개까지 업로드 가능</p>
										<p>파일 형식: jpg 또는 png</p>
									</div>
									<div class="inputFile">
										<!-- TODO: 기본 이미지 만들기 -->
										<input type="file" id="AddImgs" name="images" class="upload-hidden" accept=".jpeg, .jpg, .png" multiple>
									</div>
									<ul id="Preview" class="sortable"></ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
	
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
</html>