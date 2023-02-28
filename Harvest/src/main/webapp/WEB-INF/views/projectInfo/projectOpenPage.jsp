<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<link href="${pageContext.request.contextPath}/resources/harVest_css/projectOpenPage.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">

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
	debugger;
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
function cf_getNumberOnly (str) {
    var len      = str.length;
    var sReturn  = "";

    for (var i=0; i < len; i++){
        if ( (str.charAt(i) >= "0") && (str.charAt(i) <= "9") ){
            sReturn += str.charAt(i);
        }
    }
    return sReturn;
}

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
	<!-- 상품 이미지 및 간략 정보 -->
	<div id="productContent">
		<div class="prod_title">
			<button>${projectDTO.category}</button>
			<div>
		  		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="#e4527f" class="bi bi-calendar-check" viewBox="0 0 16 16">
			  		<path d="M10.854 7.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 1 1 .708-.708L7.5 9.793l2.646-2.647a.5.5 0 0 1 .708 0z"/>
			  		<path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4H1z"/>
		  		</svg>
		  		<strong>${projectDTO.start} 공개 예정</strong>
		  	</div>
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
				    <div class="carousel-item active">
				      <img src="${pageContext.request.contextPath}/resources/harVest_img/${projectDTO.img1}" class="d-block w-100" alt="...">
				    </div>
				    <div class="carousel-item">
				      <img src="${pageContext.request.contextPath}/resources/harVest_img/${projectDTO.img2}" class="d-block w-100" alt="...">
				    </div>
				    <div class="carousel-item">
				      <img src="${pageContext.request.contextPath}/resources/harVest_img/${projectDTO.img3}" class="d-block w-100" alt="...">
				    </div>
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
					  	<div class="funding_btn" id="fundingBtn">알림신청</div>
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
			</div>
		</div>
	</div>
	<!-- 상세 페이지 및 창작자 소개, 금액 -->
	<div class=""></div>
	
	
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
</body>
</html>