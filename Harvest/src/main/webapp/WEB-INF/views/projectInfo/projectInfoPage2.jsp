<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 시스템 시간 -->
<jsp:useBean id="now" class="java.util.Date" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>productPage.jsp</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/harVest_js/jquery-3.6.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/harVest_js/projectInfoPage.js"></script>
<link href="${pageContext.request.contextPath}/resources/harVest_css/projectInfoPage.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/assets/css/joeblog.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<style>
nav {position: relative !important;}
</style>
<script type="text/javascript">
$(document).ready(function(){
	// 찜하기 버튼
	$("#likeBtn").click(like)
	// 공유하기 열기
	$("#shareBtn").click(shareDisplay)
	// 공유하기 닫기
	$("#shareX").click(offDisplay)
	// 후원하기 열기
	$(".funding_btn").click(showFunding)
	// 후원하기 닫기
	$(".info_x").click(hideFunding)
	// 후원금액 미입력 시 입력창
// 	$('#donaBtn').click(donationPay)
	// 후원금액 미입력 시 이동불가
	$('#donaBtn').click(changeBtn)
	$('#userDona').keydown(keyDown)
	// 최소금액 선택
	$('#minPayment').click(minPayment)
	// 금액 직접 입력
	$('#userPayment').click(userPayment)
	$('div[id^="secBtn"]').click(btnColor)
	$('#secBtn1').click(pageScroll1)
	$('#secBtn2').click(pageScroll2)
	$('#secBtn3').click(pageScroll3)
})

function btnColor() {
// 	$('html, body').animate({scrollTop: $($.attr(this, 'href')).offset(top:50)},100);
// 	var offset = $('div[id="secCont1"]').offset();
// 	$('html, body').animate({scrollTop: offset.top}, 100);
	if($(this).click){
		$('div[class^="section"]').css('background','white')
		$(this).css('background', '#a4bb73')
	}
}
function pageScroll1() {
	var offset = $('#secCont1').offset();
	$('html').animate({scrollTop : offset.top}, 100);
}
function pageScroll2() {
	var offset = $('#secCont2').offset();
	$('html').animate({scrollTop : offset.top}, 100);
}
function pageScroll3() {
	var offset = $('#secCont3').offset();
	$('html').animate({scrollTop : offset.top}, 100);
}


function changeBtn() {
// 	$('#donaBtn').attr('type', 'button');
	if (!$('#userDona').val() && $('#userPayment').is(':checked') == true){ // 후원금액 미입력 시 
		Swal.fire({
			title: '후원금액을 입력해주세요.',
			icon: 'warning',
			confirmButtonColor: '#3085d6',
			cancelButtonColor: '#d33',
			confirmButtonText: '닫기'
		}).then((result) => {
			if(result.value)	return false;
		})
	} else if($('#userDona').val() <= ${projectDTO.sumMoney} && $('#userPayment').is(':checked') == true) { // 최소 후원금 이하일 경우 
		Swal.fire({
			title: '최소금액보다 큰 금액을 입력해주세요.',
			icon: 'warning',
			confirmButtonColor: '#3085d6',
			cancelButtonColor: '#d33',
			confirmButtonText: '닫기'
		}).then((result) => {
			if(result.value) return false;
		})
	} else {
// 		document.getElementById('fundingForm').submit();
		$('#fundingForm').submit();
	}
}

function keyDown(e) {
    if(e.key == 'Enter'||e.keyCode == 13){
    	changeBtn();
    	return false;
    }
}

// 좋아요 버튼
function like() {
	if(${empty sessionScope.iD}) {
		Swal.fire({
			title: '로그인 후 사용할 수 있습니다.',
			icon: 'warning',
			confirmButtonColor: '#3085d6',
			cancelButtonColor: '#d33',
			confirmButtonText: '로그인',
		}).then((result) => {
			if (result.value) {
				window.location = '${pageContext.request.contextPath}/main/mainList';
			}
		})
	}
	$.ajax({
		  url	: "${pageContext.request.contextPath}/project/likePro", // 요청이 전송될 URL 주소
		  type	: "POST", // http 요청 방식 (default: ‘GET’)
		  data  : {'PJ_IDX' : $('#pjIdx').val(),
			  	   'USER_ID' : '${sessionScope.iD}'}, // TODO session 아이디로 바까라 좋은말 할때...
		  //processData : true, // 데이터를 컨텐트 타입에 맞게 변환 여부
		  success : function(data) {
			  var src = $('#likeBtn').attr('src');
			  src = src.substring(0, src.lastIndexOf('/') + 1) + data;
			  if(${!empty sessionScope.iD}) {
				  $('#likeBtn').attr('src', src);
			  }
		  }
		})
}

// 공유하기 열기
function shareDisplay() {
	if($("#shareCont").css("display") == "none") {
		$("#shareCont").show();
		return false;
	}
}
// 공유하기 닫기
function offDisplay() {
	debugger;
	if($("#shareCont").css("display") != "none") {
		$("#shareCont").hide();
		return false;
	}
}
// 공유하기 - 트위터
function shareTwitter() {
    var sendText = "${projectDTO.title}"; // 전달할 텍스트
    var sendUrl = "http://localhost:8080/main/project/projectInfo?idx=${projectDTO.idx}"; // 전달할 URL
    window.open("https://twitter.com/intent/tweet?text=" + sendText + "&url=" + sendUrl);
}
//공유하기 - 페이스북
function shareFacebook() {
    var sendUrl = "http://localhost:8080/main/project/projectInfo?idx=${projectDTO.idx}"; // 전달할 URL
    window.open("http://www.facebook.com/sharer/sharer.php?u=" + sendUrl);
}

// 후원금액 자릿수
function handleInputLength(el, max) {
	if(el.value.length > max) {
	  el.value = el.value.substr(0, max);
	}
}
//후원금액 ',' 표시
// function inputNumberFormat(obj) {
// 	obj.value = comma(uncomma(obj.value));
// }
// function comma(str) {
// 	str = String(str);
// 	return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
// }
// function uncomma(str) {
// 	str = String(str);
// 	return str.replace(/[^\d]+/g, '');
// }
// 후원금액 ',' 없애기
// function cf_getNumberOnly (str) {
//     var len      = str.length;
//     var sReturn  = "";

//     for (var i=0; i < len; i++){
//         if ( (str.charAt(i) >= "0") && (str.charAt(i) <= "9") ){
//             sReturn += str.charAt(i);
//         }
//     }
//     return sReturn;
// }

// 후원하기 나타내기
function showFunding() {
	if(${empty sessionScope.iD}) {
		Swal.fire({
			title: '로그인 후 사용할 수 있습니다.',
			icon: 'warning',
			confirmButtonColor: '#3085d6',
			cancelButtonColor: '#d33',
			confirmButtonText: '로그인',
		}).then((result) => {
			if (result.value) {
				window.location = '${pageContext.request.contextPath}/main/mainList';
			}
		})
	}
	
	if(${!empty sessionScope.iD}) {
		if($(".project_info_box").css("display") == "none") {
			$(".project_info_box, .info_bg").show();
		}
	}
	// 
	
	// 후원 입력 안 보이게
	if($("#minPayment").is(":checked") == true) {
		$(".user_donation").hide();
	}
	$("#minPayment").click(function(){
		$(".user_donation").hide();
	})
	$("#userPayment").click(function(){
		$(".user_donation").show();
	})
}
// 후원하기 닫기
function hideFunding() {
	if($(".project_info_box").css("display") != "none") {
		$(".project_info_box, .info_bg").hide();
// 		return false;
	}
}

// 후원하기 값 선택
function minPayment() {
	if($(this).is(':checked')== true) {
		$('#userDona').val('');
		$('#userDona').attr('readonly',true);
	}
}
function userPayment() {
	if($(this).is(':checked')== true) {
		$('#userDona').attr('readonly',false);
	}
}
</script>

<script type="text/javascript">
// function pay() {
// 	var a = document.getElementById('aa').value;
// 	document.getElementById('bb').value = a
// };

// $(document).ready(function() {
// 	$('#fundingName').click(function() {
// 		if(
// 			$(this).is(':checked')== true
// 		) {
// 			$('#userDona').val('');
// 			$('#userDona').attr('readonly',true);
// 		}
// 	});
// 	$('#fundingName2').click(function() {
// 		if(
// 			$(this).is(':checked')== true
// 		) {
// 			$('#userDona').attr('readonly',false);
// 		}
// 	});
// });
</script>

</head>
<body>
<%-- 	<c:if test="${empty sesssionScope.iD}"> --%>
	<div style="position:fixed;top:0;left:0;z-index:9999;color:red;">
	${sessionScope.iD}님이 로그인했습니다.
	<button onclick="location.href='${pageContext.request.contextPath}/member/logout'">로그아웃</button>
	</div>
<%-- 	</c:if> --%>
<jsp:include page="../inc/header.jsp"></jsp:include>
	<!-- 상품 이미지 및 간략 정보 -->
	<div id="productContent">
		<div class="prod_title">
			<button>${projectDTO.category}</button>
			<h1>${projectDTO.title}</h1>
			<input type="hidden" id="pjIdx" value="${projectDTO.idx}">
		</div>
		<div class="prod_cont">
			<div> <!-- 이미지 캐러셀 -->
				<div id="carouselExampleIndicators" class="carousel slide">
				  <div class="carousel-indicators">
				    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
				    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
				    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
				  </div>
				  <div class="carousel-inner">
				    <c:set var="img" value="${projectDTO.img1}"/>
						<c:if test="${not empty img}">
							<c:forEach var="newImg" items="${fn:split(img,'&')}">
							    <div class="carousel-item active">
							      <img src="${pageContext.request.contextPath}/resources/harVest_img/${newImg[0]}" class="d-block w-100" alt="...">
							    </div>
							    <c:if test="${not empty newImg[1]}">
							    <div class="carousel-item">
							      <img src="${pageContext.request.contextPath}/resources/harVest_img/${newImg[1]}" class="d-block w-100" alt="...">
							    </div>
							    </c:if>
							    <c:if test="${not empty newImg[2]}">
							    <div class="carousel-item">
							      <img src="${pageContext.request.contextPath}/resources/harVest_img/${newImg[2]}" class="d-block w-100" alt="...">
							    </div>
							    </c:if>
				    	</c:forEach>
				    </c:if>
				  </div>
				  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
				    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
				    <span class="visually-hidden">Previous</span>
				  </button>
				  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
				    <span class="carousel-control-next-icon" aria-hidden="true"></span>
				    <span class="visually-hidden">Next</span>
				  </button>
				</div>
			</div>
			<div> <!-- 상품 정보 -->
				<div class="project_info">
					<div class="info_price">
						<span class="info_tit">모인 금액</span>
						<span style="font-size: 1em !important;"><span class="point_font">${Math.round(projectDTO.sumMoney / projectDTO.targetAmt * 100)}%</span></span>
						<h2>
							<fmt:formatNumber value="${projectDTO.sumMoney}" />원
						</h2>
					</div>
					<div class="info_time">
						<span class="info_tit">남은 시간</span>
						<h2>
							<fmt:parseNumber value="${now.time / (1000*60*60*24)}" integerOnly="true" var="nowDtParse" scope="request"/>
							<fmt:parseNumber value="${projectDTO.end.time/ (1000*60*60*24)}" integerOnly="true" var="dbDtParse" scope="request"/>
							<c:if test="${(dbDtParse - nowDtParse) + 1 > 0}">
								<span class="days">${(dbDtParse - nowDtParse) + 1}일</span>
							</c:if>
							<c:if test="${(dbDtParse - nowDtParse) + 1 == 0}">
								<span class="deadline">오늘 마감</span>
							</c:if>
							<c:if test="${(dbDtParse - nowDtParse) + 1 < 0}">
								<span class="deadline">펀딩 종료</span>
							</c:if>
						</h2>
					</div>
					<div class="info_support">
						<span class="info_tit">후원자</span>
						<h2><fmt:formatNumber value="${projectDTO.sumUser}" />명</h2>
					</div>
				</div>
				<div class="project_summary">
					<div>
						<div>목표 금액</div>
						<div><fmt:formatNumber value="${projectDTO.sumMoney}"/>원</div>
						<div><span class="point_font">${Math.round(projectDTO.sumMoney / projectDTO.targetAmt * 100)}%</span></div>
					</div>
					<div>
						<div>펀딩 기간</div>
						<div>${projectDTO.start}~${projectDTO.end}</div>
						<div>
							<c:if test="${(dbDtParse - nowDtParse) + 1 > 0}">
							<span class="deadline_box">${(dbDtParse - nowDtParse) + 1}일 남음</span>
							</c:if>
							<c:if test="${(dbDtParse - nowDtParse) + 1 == 0}">
							<span class="deadline_box">${(dbDtParse - nowDtParse) + 1}일 남음</span>
							</c:if>
							<c:if test="${(dbDtParse - nowDtParse) + 1 < 0}">
							<span class="deadline_box">펀딩 종료</span>
							</c:if>
						</div>
					</div>
					<div>
						<div>결제 일시</div>
						<div>목표금액 달성시 <span class="point_font">2023.03.06</span>에 결제 진행</div>
						<c:if test="${(dbDtParse - nowDtParse) + 1 > 0}">
							<c:if test="${projectDTO.sumMoney > projectDTO.targetAmt}">
							<div>목표 달성</div>
							</c:if>
						</c:if>
						<c:if test="${(dbDtParse - nowDtParse) + 1 > 0}">
							<c:if test="${projectDTO.sumMoney < projectDTO.targetAmt}">
							<div>진행 중</div>
							</c:if>
						</c:if>
						<c:if test="${(dbDtParse - nowDtParse) + 1 <= 0}">
							<c:if test="${projectDTO.sumMoney < projectDTO.targetAmt}">
							<div>달성 실패</div>
							</c:if>
						</c:if>
					</div>
				</div>
				<div class="project_btn">
					<img id="likeBtn" src="${pageContext.request.contextPath}/resources/harVest_img/${projectDTO.heart}">
					<div id="shareBtn" class="share_btn">
						<span>
							<img id=shareBtn" src="${pageContext.request.contextPath}/resources/harVest_img/share.svg">
						</span>
						<div id="shareCont" class="share_cont">
							<span id="shareX" class="share_x">
								<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-x-circle" viewBox="0 0 20 20">
									<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
									<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
								</svg>
							</span>
							<div>
								<a id="btnTwitter" class="link_icon twitter" href="javascript:shareTwitter();"></a>
								<a id="btnFacebook" class="link_icon facebook" href="javascript:shareFacebook();"></a>    
								<a id="btnKakao" class="link_icon kakao" href="javascript:shareKakao();"></a>
							</div>
						</div>
					</div>
					<span class="funding_btn" id="fundingBtn">후원하기</span>
				</div>
			</div>
		</div>
	</div>
	<!-- 탭 메뉴 -->
	<div id="productInfoMore">
		<ul class="nav nav-tabs" id="myTab" role="tablist">
			<li class="nav-item" role="presentation">
				<button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home-tab-pane" type="button" role="tab" aria-controls="home-tab-pane" aria-selected="true">프로젝트 계획</button>
			</li>
			<li class="nav-item" role="presentation">
				<button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile-tab-pane" type="button" role="tab" aria-controls="profile-tab-pane" aria-selected="false">진행사항</button>
		  	</li>
			<li class="nav-item" role="presentation">
				<button class="nav-link" id="contact-tab" data-bs-toggle="tab" data-bs-target="#contact-tab-pane" type="button" role="tab" aria-controls="contact-tab-pane" aria-selected="false">커뮤니티</button>
			</li>
		</ul>
		<div class="fundingInfo">
			<div class="tab-content" id="myTabContent">
				<div class="tab-pane fade show active" id="home-tab-pane" role="tabpanel" aria-labelledby="home-tab" tabindex="0">
					<div id="secCont1" class="section target">
			<div class="scroll_btn">
				<div id="secBtn1" class="section1">프로젝트 소개</div>
				<div id="secBtn2" class="section2">예산</div>
				<div id="secBtn3" class="section3">일정</div>
			</div>
						${projectDTO.intro}
						Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
						Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
						Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
						Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
						Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
						Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
						Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
						Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
					</div>
					<div id="secCont2" class="section target">
					<hr>
					${projectDTO.budget}원
					</div>
					<div id="secCont3" class="section target">
					<hr>
					${projectDTO.start}~${projectDTO.end}
					</div>
				</div>
				<div class="tab-pane fade" id="profile-tab-pane" role="tabpanel" aria-labelledby="profile-tab" tabindex="0">
					<!-- if문으로 공지 있을 때, 없을 때 구분해주기 -->
					<div class="notice_wrapper">
						<div class="creator_box">
							<div class="profile_creator">
								<div>
									<a href="#" class="profile_img">
										<!-- 프로필 이미지 넣기 -->
										<img src="${pageContext.request.contextPath}/resources/harVest_img/test.png">
									</a>
								</div>
							</div>
							<div class="profile_info">
								<div class="info_name"><a href="#">데브시스터즈</a></div><!-- 창작자 넣기 -->
								<div class="info_creator">
									<span class="point creator">♥ 창작자</span>
									<span class="write_date"> | 2022.2.14</span><!-- 날짜값 넣기 -->
								</div>
							</div>
							<!-- 창작자 로그인 시 보이게 해주기 -->
							<div class="write_btn_wrapper">
								<button class="update_write_btn">수정</button>
								<button class="delete_write_btn">삭제</button>
							</div>
						</div>
						<div class="creator_cont">
						Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
						Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
						Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
						</div>
					</div>
					<!-- 창작자 로그인 시 보이게 해주기 -->
					<div class="creator_btn">
						<button>글쓰기</button>
					</div>
					<!-- if문으로 공지 있을 때, 없을 때 구분해주기 끝 -->
				</div>
				<div class="tab-pane fade" id="contact-tab-pane" role="tabpanel" aria-labelledby="contact-tab" tabindex="0">
					<!-- 커뮤니티 탭/탭 내용 -->
					<div class="container">
				      <ul class="list">
				        <li class="tab_button tab_active">응원</li>
				        <li class="tab_button">문의</li>
				        <li class="tab_button">후기</li>
				      </ul>
				      <div class="tab_content tab_show">
				      	<!-- 댓글창 -->
				      	<div class="comment_wrapper">
				      		<div class="cmt_write">
				      			<!-- 후원자만 입력할 수 있게 하기 (+form으로 감싸기?) -->
				      			<textarea placeholder="후원자만 글을 쓸 수 있어요."></textarea>
				      			<div>
				      				<button class="cmt_btn">댓글쓰기</button>
				      			</div>
				      			<!-- 후원자만 입력할 수 있게 하기 (+form으로 감싸기?) 끝 -->
				      		</div>
				      		<!-- if문으로 댓글 돌리기 -->
				      		<div class="cmt_list">
				      			<!-- 프로필 영역 -->
				      			<div class="cmt_profile_box">
				      				<!-- 프로필 이미지 -->
				      				<div class="cmt_profile_img">
				      					<a href="#">
				      						<img src="${pageContext.request.contextPath}/resources/harVest_img/test.png">
				      					</a>
				      				</div>
				      				<!-- 프로필 정보 -->
				      				<div class="cmt_profile_info">
				      					<!-- 닉네임/댓글 유형 -->
				      					<div class="cmt_info">
				      						<span>닉네임</span>
				      						<span>응원</span>
				      						<p class="cmt_time">2022.02.14</p>
				      					</div>
				      				</div>
				      			</div>
				      			<!-- 댓글 내용 영역 -->
				      			<div class="cmt_content">
				      				<span>응원 댓글 내용 적기</span>
				      				<!-- 댓글 작성자만 볼 수 있게 하기 -->
				      				<div class="cmt_cont_btn">
				      					<button class="cmt_update_btn">수정</button>
				      					<button class="cmt_delete_btn">삭제</button>
				      				</div>
				      				<!-- 댓글 작성자만 볼 수 있게 하기 끝-->
				      			</div>
				      		</div>
				      	</div>
				      	<!-- if문으로 댓글 돌리기 끝 -->
				      	<!-- 댓글창 -->
				      </div>
				      <div class="tab_content">
				        <!-- 댓글창 -->
				      	<div class="comment_wrapper">
				      		<div class="cmt_write">
				      			<!-- 후원자만 입력할 수 있게 하기 (+form으로 감싸기?) -->
				      			<textarea placeholder="후원자만 글을 쓸 수 있어요."></textarea>
				      			<div>
				      				<button class="cmt_btn">댓글쓰기</button>
				      			</div>
				      			<!-- 후원자만 입력할 수 있게 하기 (+form으로 감싸기?) 끝 -->
				      		</div>
				      		<!-- if문으로 댓글 돌리기 -->
				      		<div class="cmt_list">
				      			<!-- 프로필 영역 -->
				      			<div class="cmt_profile_box">
				      				<!-- 프로필 이미지 -->
				      				<div class="cmt_profile_img">
				      					<a href="#">
				      						<img src="${pageContext.request.contextPath}/resources/harVest_img/test.png">
				      					</a>
				      				</div>
				      				<!-- 프로필 정보 -->
				      				<div class="cmt_profile_info">
				      					<!-- 닉네임/댓글 유형 -->
				      					<div class="cmt_info">
				      						<span>닉네임</span>
				      						<span>문의</span>
				      						<p class="cmt_time">2022.02.14</p>
				      					</div>
				      				</div>
				      			</div>
				      			<!-- 댓글 내용 영역 -->
				      			<div class="cmt_content">
				      				<span>문의 댓글 내용 적기</span>
				      				<!-- 댓글 작성자만 볼 수 있게 하기 -->
				      				<div class="cmt_cont_btn">
				      					<button class="cmt_update_btn">수정</button>
				      					<button class="cmt_delete_btn">삭제</button>
				      				</div>
				      				<!-- 댓글 작성자만 볼 수 있게 하기 끝-->
				      			</div>
				      		</div>
				      	</div>
				      	<!-- if문으로 댓글 돌리기 끝 -->
				      	<!-- 댓글창 -->
				      </div>
				      <div class="tab_content">
				        <!-- 댓글창 -->
				      	<div class="comment_wrapper">
				      		<div class="cmt_write">
				      			<!-- 후원자만 입력할 수 있게 하기 (+form으로 감싸기?) -->
				      			<textarea placeholder="후원자만 글을 쓸 수 있어요."></textarea>
				      			<div>
				      				<button class="cmt_btn">댓글쓰기</button>
				      			</div>
				      			<!-- 후원자만 입력할 수 있게 하기 (+form으로 감싸기?) 끝 -->
				      		</div>
				      		<!-- if문으로 댓글 돌리기 -->
				      		<div class="cmt_list">
				      			<!-- 프로필 영역 -->
				      			<div class="cmt_profile_box">
				      				<!-- 프로필 이미지 -->
				      				<div class="cmt_profile_img">
				      					<a href="#">
				      						<img src="${pageContext.request.contextPath}/resources/harVest_img/test.png">
				      					</a>
				      				</div>
				      				<!-- 프로필 정보 -->
				      				<div class="cmt_profile_info">
				      					<!-- 닉네임/댓글 유형 -->
				      					<div class="cmt_info">
				      						<span>닉네임</span>
				      						<span>후기</span>
				      						<p class="cmt_time">2022.02.14</p>
				      					</div>
				      				</div>
				      			</div>
				      			<!-- 댓글 내용 영역 -->
				      			<div class="cmt_content">
				      				<span>후기 댓글 내용 적기</span>
				      				<!-- 댓글 작성자만 볼 수 있게 하기 -->
				      				<div class="cmt_cont_btn">
				      					<button class="cmt_update_btn">수정</button>
				      					<button class="cmt_delete_btn">삭제</button>
				      				</div>
				      				<!-- 댓글 작성자만 볼 수 있게 하기 끝-->
				      			</div>
				      		</div>
				      	</div>
				      	<!-- if문으로 댓글 돌리기 끝 -->
				      	<!-- 댓글창 -->
				      </div>
				    </div>
				</div>
			</div>
			<div class="project_info_box" id="fundingDo">
				<span class="info_x">
<!-- 					<svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-x-circle" viewBox="0 0 16 16"> -->
<!-- 						<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/> -->
<!-- 						<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/> -->
<!-- 					</svg> -->
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="white" class="bi bi-x-lg" viewBox="0 0 16 16">
						<path d="M2.146 2.854a.5.5 0 1 1 .708-.708L8 7.293l5.146-5.147a.5.5 0 0 1 .708.708L8.707 8l5.147 5.146a.5.5 0 0 1-.708.708L8 8.707l-5.146 5.147a.5.5 0 0 1-.708-.708L7.293 8 2.146 2.854Z"/>
					</svg>
				</span>
				<div>원하는 후원 방법을 선택해주세요.</div>
				<div class="funding_wrap">
					<form action="${pageContext.request.contextPath}/payment/payment?idx=${projectDTO.idx}" id="fundingForm" method="post">
						<div>
							<input type="hidden" name="idx" value="${projectDTO.idx}">
							<label>
								<!-- value랑 최소금액 값 받아오기 -->
								<input type="radio" name="funding_name" value="${projectDTO.sumMoney}" id="minPayment" checked>
								<span class="min_check"></span><span class="min_title">최소금액 | ${projectDTO.sumMoney}원</span>
							</label>
							<label>
								<input type="radio" name="funding_name" value="0" id="userPayment">
								<span class="user_check"></span><span class="user_title">후원금액 직접 입력</span>
							</label>
							<span class="user_donation">
								<input type="text" name="userDona" id="userDona" maxlength="7" oninput="handleInputLength(this, 7)" onkeyup="javascript:inputNumberFormat(this)" onkeydown="cf_getNumberOnly"><span>원</span>
								<!--  onkeyup="javascript:inputNumberFormat(this)" onkeydown="cf_getNumberOnly" -->
							</span>
						</div>
						<button type="button" id="donaBtn">후원하기</button>
					</form>
				</div>
			</div>
			<div class="info_bg"></div>
		</div>
	</div>
	<!-- 상세 페이지 및 창작자 소개, 금액 -->
	<div class=""></div>
	
	
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
</body>
</html>