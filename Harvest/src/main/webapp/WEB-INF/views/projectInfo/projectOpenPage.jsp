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
<script src="${pageContext.request.contextPath }/resources/assets/vendors/jquery/jquery-3.4.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/harVest_js/projectInfoPage.js"></script>
<link href="${pageContext.request.contextPath}/resources/harVest_css/projectOpenPage.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/assets/css/joeblog.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<style>
nav {position: relative !important;}
</style>
<script type="text/javascript">
$(document).ready(function(){
	// 공유하기 열기
	$("#shareBtn").click(shareDisplay)
	// 공유하기 닫기
	$("#shareX").click(offDisplay)
})

function btnColor() {
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


// 공유하기 열기
function shareDisplay() {
	if($("#shareCont").css("display") == "none") {
		$("#shareCont").show();
		return false;
	}
}
// 공유하기 닫기
function offDisplay() {
	if($("#shareCont").css("display") != "none") {
		$("#shareCont").hide();
		return false;
	}
}
// 공유하기 - 트위터
function shareTwitter() {
    var sendText = "${OpenParam.TITLE}"; // 전달할 텍스트
    var sendUrl = "http://localhost:8080/main/project/projectOpen?idx=${OpenParam.IDX}"; // 전달할 URL
    window.open("https://twitter.com/intent/tweet?text=" + sendText + "&url=" + sendUrl);
}
//공유하기 - 페이스북
function shareFacebook() {
    var sendUrl = "http://localhost:8080/main/project/projectOpen?idx=${OpenParam.IDX}"; // 전달할 URL
    window.open("http://www.facebook.com/sharer/sharer.php?u=" + sendUrl);
}
//공유하기 - 카카오톡 
function shareKakao() {
  // 사용할 앱의 JavaScript 키 설정
  Kakao.init('c6695526da12e98bb7f09606bb9a0d92');

  // 카카오링크 버튼 생성
  Kakao.Link.createDefaultButton({
    container: '#btnKakao', // 카카오공유버튼ID
    objectType: 'feed',
    content: {
      title: "harVest", // 보여질 제목
      description: "펀딩사이트, harVest", // 보여질 설명
      imageUrl: "http://localhost:8080/${pageContext.request.contextPath}/project/projectInfo?idx=${projectDTO.idx}", // 콘텐츠 URL
      link: {
         mobileWebUrl: "http://localhost:8080/${pageContext.request.contextPath}/project/projectInfo?idx=${projectDTO.idx}",
         webUrl: "http://localhost:8080/${pageContext.request.contextPath}/project/projectInfo?idx=${projectDTO.idx}"
      }
    }
  });
}
</script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
</head>
<body>
<jsp:include page="../inc/header.jsp"></jsp:include>
	<!-- 상품 이미지 및 간략 정보 -->
	<div id="productContent">
		<div class="prod_title">
			<button>${OpenParam.CATEGORY}</button>
			<div>
		  		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="#e4527f" class="bi bi-calendar-check" viewBox="0 0 16 16">
			  		<path d="M10.854 7.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 1 1 .708-.708L7.5 9.793l2.646-2.647a.5.5 0 0 1 .708 0z"/>
			  		<path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4H1z"/>
		  		</svg>
		  		<strong>${OpenParam.START} 공개 예정</strong>
		  	</div>
			<h1>${OpenParam.TITLE}</h1>
			<input type="hidden" id="title" value="${OpenParam.TITLE}">
			<input type="hidden" id="pjIdx" value="${OpenParam.IDX}">
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
					<c:set var="img" value="${OpenParam.IMG1}"/>
	                     <div class="carousel-item active">
	                        <img src="${pageContext.request.contextPath}/resources/upload/${fn:split(img,'&')[0]}" class="d-block w-100" alt="...">
	                     </div>
	                     <c:if test="${not empty fn:split(img,'&')[1]}">
	                        <div class="carousel-item">
	                           <img src="${pageContext.request.contextPath}/resources/upload/${fn:split(img,'&')[1]}" class="d-block w-100" alt="...">
	                        </div>
	                     </c:if>
	                     <c:if test="${not empty fn:split(img,'&')[2]}">
	                        <div class="carousel-item">
	                           <img src="${pageContext.request.contextPath}/resources/upload/${fn:split(img,'&')[2]}" class="d-block w-100" alt="...">
	                        </div>
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
				  <div class="project_btn_wrap">
				  	<div>
<!-- 					  	<div class="funding_btn" id="fundingBtn">알림신청</div> -->
					  	<button id="btn_${OpenParam.IDX }" class="alram funding_btn" id="fundingBtn" style="border:1px solid transparent;  width:100%;">
							<c:if test="${empty sesssionScope.id}">
								<img width="16" height="16" id="alramBtn" src="${pageContext.request.contextPath}/resources/harVest_img/${fn:split(OpenParam.ALRAM, '.')[0]}.png">
							</c:if>
							알림신청
						</button>
					  	<div class="share_wrap">
							<a id="btnTwitter" class="link_icon twitter" href="javascript:shareTwitter();"></a>
							<a id="btnFacebook" class="link_icon facebook" href="javascript:shareFacebook();"></a>    
							<a id="btnKakao" class="link_icon kakao" href="javascript:shareKakao();"></a>
						</div>
					</div>
				  </div>
				</div>
			</div>
		</div>
	</div> <!-- 알림신청 공유하기 -->
		<div class="project_info">
			<div>
			</div>
		</div>
	<!-- 탭 메뉴 -->
	<div id="productInfoMore">
		<ul class="nav nav-tabs" id="myTab" role="tablist">
			<li class="nav-item" role="presentation">
				<button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home-tab-pane" type="button" role="tab" aria-controls="home-tab-pane" aria-selected="true">프로젝트 계획</button>
			</li>
		</ul>
		<div class="fundingInfo">
			<div class="tab-content" id="myTabContent">
				<div class="tab-pane fade show active" id="home-tab-pane" role="tabpanel" aria-labelledby="home-tab" tabindex="0">
					<div id="secCont1" class="section target">
					<div class="scroll_btn">
						<div id="secBtn1" class="section1">프로젝트 소개</div>
					</div>
						${OpenParam.INTRO}
					</div>
					<div id="secCont2" class="section target">
					<hr>
					${OpenParam.BUDGET}
					</div>
					<div id="secCont3" class="section target">
					<hr>
					${OpenParam.SCHEDULE}
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 상세 페이지 및 창작자 소개, 금액 -->
	<div class=""></div>
	 <!-- Page Footer -->
    <jsp:include page="../inc/footer.jsp"></jsp:include>

	<script type="text/javascript">
	$(document).ready(function(){
		$(".alram").click(alram)
	})
	function alram() {
		$.ajax({
			  url	: "${pageContext.request.contextPath}/project/alramPro", // 요청이 전송될 URL 주소
			  type	: "POST", // http 요청 방식 (default: ‘GET’)
			  data  : {'PJ_IDX' : $('#pjIdx').val(),
				        'USER_ID' : '${sessionScope.id}',
				       	'TITLE' : $('#title').val() },
			  success : function(data) {
				  alert('성공');
				  var src = $('#alramBtn').attr('src');
				  src = src.substring(0, src.lastIndexOf('/') + 1) + data;
				  $('#alramBtn').attr('src', src);
			  },
			 error :  function(request,status,error){
	        	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	       	 }
		});
	}
	</script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
</body>
</html>