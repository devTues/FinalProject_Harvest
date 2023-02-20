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
<title>projectUpload.jsp</title>
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
	
	
	$('#targetAmt').on('change', function() {
		var target = $('#targetAmt').val();
		var fee = target * 0.05;
		var total = target - fee;
		
		$('input[name=totalAmt]').attr('value', total + '원');
		$('input[name=fee]').attr('value', fee + '원');
	
	}); 
	
	var elements = document.getElementsByClassName("move");

	var myFunction = function() {
	    alert(elements.value);
	};
	
// 	Array.from(elements).forEach(function(element) {
// 	      element.addEventListener('click', myFunction);
// 	});

	elements.addEventListener('click', myFunction(), false);
	
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
								<li class="item"><button class="nav-link move" id="porject" value="porject" type="button"
									onclick="test()">
									기본정보</button></li>
								<li class="item"><button class="nav-link move" id="plan" value="plan" type="button"
									onclick="location.href='${pageContext.request.contextPath}/creator/plan'">
									프로젝트 계획</button></li>
								<li class="item"><button class="nav-link active" id="funding-tab" data-bs-toggle="tab" data-bs-target="#funding-tab-pane" type="button"
									>
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
						<dt class="arti_tit">목표 금액</dt>
						<dd class="defi">프로젝트를 완수하기 위해 필요한 금액을 설정해주세요.</dd>
						<div class="notice">
							<div class="noti_tit">
								<div class="topb">
									<svg viewBox="0 0 48 48">
										<path d="M21.5 23.1C21.5 23.0448 21.5448 23 21.6 23H26.4C26.4552 23 26.5 23.0448 26.5 23.1V33.9C26.5 33.9552 26.4552 34 26.4 34H21.6C21.5448 34 21.5 33.9552 21.5 33.9V23.1Z"></path>
										<path d="M21 17C21 15.3431 22.3431 14 24 14C25.6569 14 27 15.3431 27 17C27 18.6569 25.6569 20 24 20C22.3431 20 21 18.6569 21 17Z"></path>
										<path fill-rule="evenodd" clip-rule="evenodd" d="M24 40C32.8366 40 40 32.8366 40 24C40 15.1634 32.8366 8 24 8C15.1634 8 8 15.1634 8 24C8 32.8366 15.1634 40 24 40ZM24 44C35.0457 44 44 35.0457 44 24C44 12.9543 35.0457 4 24 4C12.9543 4 4 12.9543 4 24C4 35.0457 12.9543 44 24 44Z"></path></svg>
								</div>
								목표 금액 설정 시 꼭 알아두세요!
							</div>
							<div>
							<p>* 종료일까지 목표금액을 달성하지 못하면 후원자 결제가 진행되지 않습니다.</p>

							<p>* 종료 전 후원 취소를 대비해 10% 이상 초과 달성을 목표로 해주세요.</p>

							<p>* 제작비, 선물 배송비, 인건비, 예비 비용 등을 함께 고려해주세요.</p>
							</div>
						</dl>
						<div class="arti_cont">
							<div class="goal_con">
								<p class="sub_tit">목표금액</p>
								<div>
									<div class="wrap">
										<span class="input_wrap2 guide">
											<input type="text" inputmode="numeric" class="textInput" name="targetAmt" id="targetAmt" value="" placeholder="50만원 이상의 금액을 입력해 주세요" oninput="this.value = this.value.replaceAll(/\D/g, '')">
											원
										</span>
									</div>
									<div class="notiArea">
										<p></p>
									</div>
								</div>
								<div class="amtShow">
									<div class="totalAmt">
									<span>목표 금액 달성 시 예상 수령액</span>
										<input type="text" id="totalAmt" name="totalAmt" value="0원">
									</div>
									<div class="feeWrap">
										총 수수료 (총 결제액의 5%)<input type="text" id="fee" name="fee" value="0원">
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="article_proj">
						<dl class="sub_article">
						<dt class="arti_tit">최소 후원 금액</dt>
						<dd class="defi"></dd>
						</dl>
						<div class="arti_cont">
							<div class="con_width">
							<p class="sub_tit">최소 후원 금액</p>
							<div>
								<div class="wrap">
									<span class="input_wrap2 guide">
										<input type="text" inputmode="numeric" class="textInput" name="minDona" id="minDona" value="" placeholder="1000원 이상의 금액을 입력해 주세요" oninput="this.value = this.value.replaceAll(/\D/g, '')">
										원
									</span>
								</div>
							</div>
							</div>
						</div>
					</div>
					<div class="article_proj">
						<dl class="sub_article">
						<dt class="arti_tit">펀딩 시작일</dt>
						<dd class="defi"></dd>
						</dl>
						<div class="arti_cont">
							<div class="con_width">
							<input type="date" name="start">
						</div>
					</div>
					</div>
					<div class="article_proj">
						<div class="arti_tit">펀딩 종료일</div>
						<div class="arti_cont">
						<input type="date" name="end">
						</div>
					</div>
					<div class="article_proj">
						<div class="arti_tit">펀딩 기간</div>
						<div class="arti_cont">
						<ul>
						<li>후원자 결제 종료일</li>
						<li>정산일</li>
						</ul>
						</div>
					</div>
					<div class="article_proj">
						<div class="arti_tit">계좌 / 본인인증</div>
						<div class="arti_cont">
						<input type="text" name="targetAmt">
						</div>
					</div>
				</div>
				<div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab" tabindex="0">...</div>
			</div>
		</div>
		<!-- 	</div> -->
	</form>

</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
	crossorigin="anonymous"></script>
</html>