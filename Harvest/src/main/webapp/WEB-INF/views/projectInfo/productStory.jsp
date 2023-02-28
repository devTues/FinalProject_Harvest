<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>productPage.jsp</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/harVest_js/jquery-3.6.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/harVest_js/projectPage.js"></script>
<link href="${pageContext.request.contextPath}/resources/harVest_css/app.d69b58d686469c0a1bc8.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/harVest_css/projectPage.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/harVest_css/productUpdate.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
<!-- <meta name="format-detection" content="telephone=no"> -->
<!-- <meta name="naver-site-verification" content="299b15d3fbbde89ff45ef1d5f80e642902b58b0f" /> -->
<link rel="dns-prefetch" href="https://tumblbug-assets.imgix.net">
<link rel="dns-prefetch" href="https://tumblbug-pci2.imgix.net">
<link rel="dns-prefetch" href="https://tumblbug-psi.imgix.net">
<link rel="dns-prefetch" href="https://tumblbug-upi.imgix.net">
<link rel="dns-prefetch" href="https://www.google-analytics.com">
<link rel="dns-prefetch" href="https://developers.kakao.com">
<link rel="dns-prefetch" href="https://d2om2e6rfn032x.cloudfront.net">
<link rel="dns-prefetch" href="https://qysoaxc73e-dsn.algolia.net">
<link rel="dns-prefetch" href="https://stats.g.doubleclick.net">
<link rel="stylesheet" type="text/css" href="https://d2om2e6rfn032x.cloudfront.net/wpa/app.d69b58d686469c0a1bc8.css">
<link href=https://tumblbug-assets.imgix.net/appicon/favicon/favicon-32x32.png rel="icon" type="image/x-icon">
<link rel="apple-touch-icon-precomposed" href="https://tumblbug-assets.imgix.net/appicon/home-icon/apple-icon-180x180.png">
<link rel="apple-touch-icon" sizes="120x120" href="https://tumblbug-assets.imgix.net/appicon/home-icon/apple-icon-120x120.png">
<link rel="apple-touch-icon" sizes="152x152" href="https://tumblbug-assets.imgix.net/appicon/home-icon/apple-icon-152x152.png">
<link rel="apple-touch-icon" sizes="180x180" href="https://tumblbug-assets.imgix.net/appicon/home-icon/apple-icon-180x180.png">

<link rel="icon" type="image/png" sizes="48x48" href="https://tumblbug-assets.imgix.net/appicon/home-icon/android-icon-48x48.png">
<link rel="icon" type="image/png" sizes="72x72" href="https://tumblbug-assets.imgix.net/appicon/home-icon/android-icon-72x72.png">
<link rel="icon" type="image/png" sizes="96x96" href="https://tumblbug-assets.imgix.net/appicon/home-icon/android-icon-96x96.png">
<link rel="icon" type="image/png" sizes="144x144" href="https://tumblbug-assets.imgix.net/appicon/home-icon/android-icon-144x144.png">
<link rel="icon" type="image/png" sizes="192x192" href="https://tumblbug-assets.imgix.net/appicon/home-icon/android-icon-192x192.png">

<script type="text/javascript">

$(document).ready(function(){
// 	$(".comm").on("click", commSubmit()); // class="comm"이 적힌 버튼을 클릭하면 commSubmit이 작동됨
// $(".comm").on('click',  functiom(){ commSubmit(); });
// $(".comm").on('click',  () => { commSubmit();  });

	// event start
	$('.comm').on('click', commSubmit);			// 클릭하면 commSubmit 실행
	$('#onDisplay').on('click', updateDisplay );	// 클릭하면 업데이트탭 글쓰기폼 보여주기
	$('#onDisplay2').on('click', CommunityDisplay2 );
	
});

// function 
function CommunityDisplay2(){
	if($("#C_write").css("display") == "none"){
		$('#C_write').show();
		$('#C_list').hide();
		
	}  else if(("C_write").css("display") != "none"){
			$('#C_list').show();
			$('#C_write').hide();
			$('#updateWriteForm')[0].reset();
	}
}

function updateDisplay(){
	if($("#U_write").css("display") == "none"){
		$('#U_write').show();
		$('#U_list').hide();
		
	}  else if(("U_write").css("display") != "none"){
			$('#U_list').show();
			$('#U_write').hide();
			$('.CommunityWriteForm')[0].reset();
	}
}

function commSubmit(){
	
	var data = {  idx : ${productUpdateDTO.idx},
				   id : '${sessionScope.id}', // String은 '  ' 안에 넣어줌
			  content : $('#content_' + this.id).val(),  // 아... $()안에 든게 id=""였군....
		 contentLabel : this.id }
	
	$.ajax ({
		  // URL은 필수 요소이므로 반드시 구현해야 하는 Property입니다.
		  url	: "${pageContext.request.contextPath }/project/CommunityWriteAjax", // 요청이 전송될 URL 주소
		  type	: "POST", // http 요청 방식 (default: ‘GET’)
		  data  :  data,  // 요청 시 포함될 데이터. contentLabel이라는 키(변수명같은거)에 id 값을 넣기 
		  content_Type : "application/json", //false, // "application/json", // 요청 컨텐트 타입 
// 		  processData : false,
// 		  enctype : 'multipart/form-data',// 요청 컨텐트 타입 . file은 JSON에 포함될 수 없다. 그래서 FormData 안에 file과 JSON (= data)를 append 시킨다.
//		  dataType    : "json", // 응답 데이터 형식 (명시하지 않을 경우 자동으로 추측)
		  success : function(data) { // function(data)가 성공하면 콘솔에 data찍어줘 
			console.log(data)	  //  콘솔에 data찍어줘. 컨트롤러에서 return값 돌려 받음
			$.each(data,function(index,item){
				var dt=new Date(item.date);
				var d=dt.getFullYear()+"-"+(dt.getMonth()+1)+"-"+dt.getDate()+" "+dt.getHours()+":"+dt.getMinutes()+":"+dt.getSeconds();
				$('table').remove();
				$('table').append(item.profile+'<br>'+ item.name+'<br>'+item.content+'<br>'+ d +'<br><br>');

	 		  });
		  }
		});
	
	$('#content_' + this.id).val('');
	
}
</script>
</head>
<body>
	<!-- 상품 이미지 및 간략 정보 -->
	<input type="checkbox" id="fundingBtn" style="display:none;">
	<div id="productContent">
		<div class="prod_title">
			<button>${projectDTO.category}</button>
			<h1>${projectDTO.title}</h1>
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
				      <img src="https://tumblbug-pci.imgix.net/326f0b30dedd61b1b4ab402a546ed23ff763b676/a942a2f8dc6f8cb765a188a7817e4d132d87ed86/b5f809fa459add77e412896fb41972bf73dbb890/2f162593-feb4-4450-bafa-d11bbcf334f5.jpeg?ixlib=rb-1.1.0&w=1240&h=930&auto=format%2Ccompress&lossless=true&fit=crop&s=e761a6cc2af8edba46fefb72a395250b" class="d-block w-100" alt="...">
				    </div>
				    <div class="carousel-item">
				      <img src="https://tumblbug-pci.imgix.net/326f0b30dedd61b1b4ab402a546ed23ff763b676/a942a2f8dc6f8cb765a188a7817e4d132d87ed86/b5f809fa459add77e412896fb41972bf73dbb890/2f162593-feb4-4450-bafa-d11bbcf334f5.jpeg?ixlib=rb-1.1.0&w=1240&h=930&auto=format%2Ccompress&lossless=true&fit=crop&s=e761a6cc2af8edba46fefb72a395250b" class="d-block w-100" alt="...">
				    </div>
				    <div class="carousel-item">
				      <img src="https://tumblbug-pci.imgix.net/326f0b30dedd61b1b4ab402a546ed23ff763b676/a942a2f8dc6f8cb765a188a7817e4d132d87ed86/b5f809fa459add77e412896fb41972bf73dbb890/2f162593-feb4-4450-bafa-d11bbcf334f5.jpeg?ixlib=rb-1.1.0&w=1240&h=930&auto=format%2Ccompress&lossless=true&fit=crop&s=e761a6cc2af8edba46fefb72a395250b" class="d-block w-100" alt="...">
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
				</div>
			</div>
			<div> <!-- 상품 정보 -->
				<div class="project_info">
					<div class="info_price">
						<span>모인 금액</span>
						<h2>22,003,000원</h2>
					</div>
					<div class="info_time">
						<span>남은 시간</span>
						<h2>29일</h2>
					</div>
					<div class="info_support">
						<span>후원자</span>
						<h2>292명</h2>
					</div>
				</div>
				<div class="project_summary">
					<div>
						<div>목표 금액</div>
						<div>${projectDTO.targetAmt}원</div>
						<div>78%</div>
					</div>
					<div>
						<div>펀딩 기간</div>
						<div>${projectDTO.start}~${projectDTO.end}</div>
						<div>29일 남음</div>
					</div>
					<div>
						<div>결제 일시</div>
						<div>목표금액 달성시 2023.03.06에 결제 진행</div>
						<div>목표 달성</div>
					</div>
				</div>
				<div class="project_btn">
					<label><input type="checkbox" id="likeBtn"> 좋아요</label><!-- input checkbox로 바꾸기!!! -->
					<button>공유</button>
					<label for="fundingBtn" class="funding_btn">후원하기</label>
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
						여기는 연서😘
				</div>
				<div class="tab-pane fade" id="profile-tab-pane" role="tabpanel" aria-labelledby="profile-tab" tabindex="0">
						<div class="updateList" id="U_list">
						
						<!-- 로그인 되어있고 창작자 아이디와 같아야 작성하기 창 보임 -->
<%-- 							<c:if test="${!empty sessionScope.id }"> --%>
	<%-- 							<c:if test="${productUpdateDTO.id eq sessionScope.id }">  --%>
									<div class="WritePostArea__CommunityNewPostWidget-sc-1bsvwui-0 fLctJN">
							      		<div class="WritePostArea__LeftColumn-sc-1bsvwui-1 iaUdeD"  id = "onDisplay">창작자 공지 작성하기</div>
									      	<div name="pen" class="Icon__SVGICON-sc-1xkf9cp-0 ccxeYs WritePostArea__PenIcon-sc-1bsvwui-2 hjWJxN">
										      	<svg viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
										      	<path d="M19.9871 8.01414C20.0048 7.99644 20.0042 7.96716 19.9858 7.94875L16.0513 4.0142C16.0328 3.99578 16.0036 3.99521 15.9859 4.01291L14.1269 5.87191C14.1092 5.88961 14.1097 5.91889 14.1281 5.93731L18.0627 9.87185C18.0811 9.89027 18.1104 9.89085 18.1281 9.87314L19.9871 8.01414Z" fill="#9E9E9E"></path>
												<path d="M17.1653 10.836C17.183 10.8183 17.1824 10.789 17.164 10.7706C17.1455 10.7522 13.2294 6.83604 13.2294 6.83604C13.211 6.81762 13.1817 6.81705 13.164 6.83475C13.1463 6.85245 4.6668 15.332 4.6668 15.332C4.66006 15.3387 4.65571 15.3475 4.65435 15.357L4.00047 19.9454C3.99605 19.9765 4.02351 20.004 4.05455 19.9995L8.64298 19.3457C8.65253 19.3443 8.6613 19.3399 8.66803 19.3332C8.66803 19.3332 17.1476 10.8537 17.1653 10.836Z"fill="#9E9E9E"></path></svg>
											</div>
									</div>
	<%-- 							</c:if> --%>
<%-- 							</c:if> --%>
							
							<c:forEach var="dto" items="${productUpdateList }">
								<tr>
								    <td><img src="${pageContext.request.contextPath }/resources/product_img/${dto.profile}"></td><br>
								    <td>${dto.name}</td><br>
								    <td>${dto.content}</td><br>
								    <td><fmt:formatDate value="${dto.date}" pattern="yyyy.MM.dd"/></td><br><br>
								</tr>
								<input type="hidden" name="pjIdx" id="pjIdx" value="${dto.pjIdx }">
								<input type="button" value="수정" class="btn"
									 onclick="location.href='${pageContext.request.contextPath }/project/update?num=${dto.pjIdx}'">
								<input type="button" value="삭제" class="btn"
									 onclick="location.href='${pageContext.request.contextPath }/project/delete?num=${dto.pjIdx}'">
							</c:forEach>
						</div>
						<div class="updateWrite" id="U_write"  style="display: none;">

						<form action="${pageContext.request.contextPath}/project/productUpdateWritePro" id="updateWriteForm" method="post" enctype="multipart/form-data">
						<div class="style__ProjectContentsBackground-ky14bp-8 caYfnf">
							<div class="Container-gci8y7-0 cXaiVs">
								<div class="style__ProjectContents-ky14bp-9 fbVSPF">
									<div class="style__ProjectContentsMainColumn-ky14bp-10 jXBJgk">
										<div class="style__MainColumnInner-ky14bp-12 jBRpgz">
											<div class="EditorLayout__Wrap-sc-9ka57a-0 cMjFYj">
												<div class="EditorLayout__Header-sc-9ka57a-1 ibiUSB">
													<div class="EditHeader__Wrap-zond9x-0 eVdPsY">
														<button class="SolidButton__Button-sc-1gsinzz-0 icXYZs EditHeader__BackButton-zond9x-1 OAsKY fnt-p1" color="white">
															<span><div name="arrow3-left" class="Icon__SVGICON-sc-1xkf9cp-0 ccxeYs"><svg viewBox="0 0 48 48"><path fill-rule="evenodd" clip-rule="evenodd" d="M43.7014 21.7189L10.1221 21.7189L25.2128 7.06878C26.1112 6.15946 26.2122 4.64393 25.3127 3.73461C24.4133 2.82529 22.9142 2.72425 22.0148 3.63357L2.72663 22.4262C1.82719 23.3355 1.72725 24.75 2.62669 25.7604H2.72663L22.0148 44.4519C22.9142 45.2602 24.4133 45.1592 25.2128 44.2499C26.0123 43.3405 26.0123 41.926 25.1119 41.0167L10.0221 26.4676L43.7014 26.4676C45.0006 26.4676 46 25.4572 46 24.1438C46 22.8303 45.0006 21.7189 43.7014 21.7189Z"></path></svg>
																</div>게시글 작성</span>
														</button>
<!-- 														<button type="submit" class="SolidButton__Button-sc-1gsinzz-0 hgsFUp EditHeader__SubmitButton-zond9x-2 fZQwzk fnt-p1" > -->
<!-- 															<span>등록</span> -->
<!-- 														</button> -->
													</div>
												</div>
												<div class="EditorLayout__Body-sc-9ka57a-2 etJmpB">
													<div class="EditorLayout__LeftSide-sc-9ka57a-3 bKAMOw">
														<div class="InputWithGuideAndLengthCheck__Wrapper-sc-9nmfrw-0 eCSxwJ">
															<div class="InputWithGuideAndLengthCheck__InputWrapper-sc-9nmfrw-3 bBnjVq">
																<div class="Textarea__Wrapper-sc-1mj6ym2-0 vnOMO InputWithGuideAndLengthCheck__StyledTextarea-sc-9nmfrw-2 eyRDXi">
																	<textarea name="content" placeholder="프로젝트 및 창작자님에 대해 어떤 이야기가 하고 싶으신가요?" class="Textarea__StyledTextArea-sc-1mj6ym2-1 cjoUaQ"></textarea>
																</div>
															</div>
<!-- 															<div class="InputWithGuideAndLengthCheck__NoticeArea-sc-9nmfrw-4 ciHGYP"> -->
<!-- 																<p class="InputWithGuideAndLengthCheck__GuideMessage-sc-9nmfrw-5 fduvas"></p> -->
<!-- 																<span class="InputWithGuideAndLengthCheck__CountLength-sc-9nmfrw-6 kEJJPl">0/1000</span> -->
<!-- 															</div> -->
														</div>
														<div></div><input type="file" name="file" multiple="multiple"></div>
													</div>
													<div class="EditorLayout__RightSide-sc-9ka57a-4 fOriWQ">
<!-- 														<div class="NewEditor__TabWrap-sh4rcq-0 kWiCpg"> -->
<!-- 															<div class="NewEditor__ContentTitle-sh4rcq-1 fBVKgb">어떤 내용의 글인가요?</div> -->
<!-- 															<div style="padding: 0" -->
<!-- 																class="style__Tabs-sc-3a505r-0 kTjmVr"> -->
<!-- 																<div class="style__Tab-sc-3a505r-1 blqBuO">응원글</div> -->
<!-- 																<div class="style__Tab-sc-3a505r-1 gygqOn">의견</div> -->
<!-- 															</div> -->
<!-- 														</div> -->
															<input type="hidden" name="id" value="${sessionScope.id }" readonly>
															<input type="hidden" name="pjIdx" value="${productUpdateDTO.pjIdx}">
														<div class="BackerEditRightText__NoteText-sc-114yeue-0 fEHuJA">후원하신 프로젝트 창작자에게 응원의 한마디를 남겨주세요. 창작자에게 후원금만큼 큰 힘이 됩니다.</div>
														<div class="ImportantNotes__ImportantWrap-ssm7kj-0 hzTSWV">
															<div class="ImportantNotes__Title-ssm7kj-1 jBpBce">
																<div name="cation" class="Icon__SVGICON-sc-1xkf9cp-0 ccxeYs ImportantNotes__TitleIcon-ssm7kj-2 iEKYpO">
																	<svg viewBox="0 0 18 18" fill="none"
																		xmlns="http://www.w3.org/2000/svg">
																		<path d="M8.10937 8.0025C8.10937 7.98282 8.12532 7.96687 8.145 7.96687H9.855C9.87467 7.96687 9.89062 7.98282 9.89062 8.0025V12.9187C9.89062 12.9384 9.87467 12.9544 9.855 12.9544H8.145C8.12532 12.9544 8.10937 12.9384 8.10937 12.9187V8.0025Z"
																			fill="#3D3D3D"></path>
																		<path d="M7.93125 6.15C7.93125 5.55975 8.40975 5.08125 9 5.08125C9.59025 5.08125 10.0687 5.55975 10.0687 6.15C10.0687 6.74025 9.59025 7.21875 9 7.21875C8.40975 7.21875 7.93125 6.74025 7.93125 6.15Z"
																			fill="#3D3D3D"></path>
																		<path fill-rule="evenodd" clip-rule="evenodd" d="M9 14.7C12.148 14.7 14.7 12.148 14.7 9C14.7 5.85198 12.148 3.3 9 3.3C5.85198 3.3 3.3 5.85198 3.3 9C3.3 12.148 5.85198 14.7 9 14.7ZM9 16.125C12.935 16.125 16.125 12.935 16.125 9C16.125 5.06497 12.935 1.875 9 1.875C5.06497 1.875 1.875 5.06497 1.875 9C1.875 12.935 5.06497 16.125 9 16.125Z"
																			fill="#3D3D3D"></path></svg>
																</div>
																유의사항
															</div>
															<ul class="ImportantNotes__ContenetLists-ssm7kj-3 gcBHsl">
																<li class="ImportantNotes__ContentItem-ssm7kj-4 kzewdj">창작자에게 궁금하신 점이 있다면 ‘창작자에게 문의'로 질문해주세요.</li>
																<li class="ImportantNotes__ContentItem-ssm7kj-4 kzewdj">텀블벅<!-- -->
																	<a href="https://help.tumblbug.com/hc/ko/articles/360052340593" target="_blank" rel="noreferrer">커뮤니티 운영원칙</a>을 준수해주세요. 프로젝트와 무관한 내용이나 광고, 도배, 욕설, 혐오 조장, 외설, 사칭 등은 예고 없이 삭제될 수 있습니다.
																</li>
																<li class="ImportantNotes__ContentItem-ssm7kj-4 kzewdj">운영원칙
																	위반 누적시 텀블벅 이용이 제한될 수 있으며, 타인에 대한 모욕이나 명예훼손 등의 경우 법적 책임이 발생할 수도 있습니다.</li>
															</ul>
														</div>
													</div>
												</div>
												<button type="submit" class="SolidButton__Button-sc-1gsinzz-0 hgsFUp EditHeader__SubmitButton-zond9x-2 fZQwzk fnt-p1" ><span>등록</span></button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</form>
						</div>

								<div class="clear"></div>
								<div id="page_control"></div>
						</div>
				</div>
				<div class="tab-pane fade" id="contact-tab-pane" role="tabpanel" aria-labelledby="contact-tab" tabindex="0">
					<!-- 커뮤니티 탭/탭 내용 -->
					<div class="container mt-5">
				      <ul class="list">
				        <li class="tab_button tab_active">응원</li>
				        <li class="tab_button">문의</li>
				        <li class="tab_button">후기</li>
				      </ul>
				      <div class="tab_content">
				      
						<form action="${pageContext.request.contextPath}/project/CommunityWritePro" id="communityForm_1" method="post">
							<div class="style__CommentForm-sc-1w2k1pt-0 jmfZuM">
								<div class="InputWithGuideAndLengthCheck__Wrapper-sc-9nmfrw-0 eCSxwJ style__StyledInputWithGuideAndLengthCheck-sc-1w2k1pt-1 kMOyow">
									<div class="InputWithGuideAndLengthCheck__InputWrapper-sc-9nmfrw-3 bBnjVq">
										<div class="Textarea__Wrapper-sc-1mj6ym2-0 vnOMO InputWithGuideAndLengthCheck__StyledTextarea-sc-9nmfrw-2 gswCBK">
											<input type="hidden" name="id" value="${sessionScope.id}">
											<input type="hidden" name="idx" value="${communityDTO.idx}">
											<textarea id="content_COM1" name="content" placeholder="창작자에게 응원의 한마디~!" class="Textarea__StyledTextArea-sc-1mj6ym2-1 cjoUaQ" style="height: 50px;"></textarea>
										</div>
									</div>
								</div>
								<div class="style__ButtonContainer-sc-1w2k1pt-2 bpssQi">
										<button type="button" id="COM1" class="comm">작성하기</button><br>
<!-- 										<button type=submit class="style__ReviewCommentRegister-sc-1w2k1pt-3 deyeeq" >등록</button> -->
								</div>
							</div>
						</form>	
						
									<table>
										<c:forEach var="dto" items="${communityList1 }">
											<tr>
												<td>프로젝트 번호 : ${dto.commIdx}</td>
										    	<td>닉네임 : ${dto.name}</td><br>
										    	<td>프로필 사진 : ${dto.profile}</td><br>
										   	 	<td>응원/문의/후기 : ${dto.contentLabel}</td><br>
										   	 	<td>내용 : ${dto.content}</td><br>
								   				<td>날짜 : <fmt:formatDate value="${dto.date}" pattern="yyyy.MM.dd.hh.mm.ss"/></td><br><br>
 												<div id="ajaxReturn">ajaxReturnOutput</div>
 												</tr>
										</c:forEach>
									</table>	      
							    	
									
									
<!-- 									댓글 시작 -->
<!-- 									<ul> -->
<!-- 									<li> -->
<!-- 										<div> -->
<!-- 											<p>첫번째 댓글 작성자</p> -->
<!-- 											<p>첫번째 댓글</p> -->
<!-- 										</div> -->
<!-- 									</li> -->
<!-- 									<li> -->
<!-- 										<div> -->
<!-- 											<p>두번째 댓글 작성자</p> -->
<!-- 											<p>두번째 댓글</p> -->
<!-- 										</div> -->
<!-- 									</li> -->
<!-- 									<li> -->
<!-- 										<div> -->
<!-- 											<p>세번째 댓글 작성자</p> -->
<!-- 											<p>세번째 댓글</p> -->
<!-- 										</div> -->
<!-- 									</li> -->
<!-- 								</ul> -->
<!-- 									<div> -->
<!-- 										<p> -->
<!-- 											<label>댓글 작성자</label> <input type="text"> -->
<!-- 										</p> -->
<!-- 										<p> -->
<!-- 											<textarea rows="5" cols="50"></textarea> -->
<!-- 										</p> -->
<!-- 										<p> -->
<!-- 											<button type="button">댓글 작성</button> -->
<!-- 										</p> -->
<!-- 									</div> -->
<!-- 									댓글 끝				      	 -->
				      		</div>
				      <div class="tab_content">
						<form action="${pageContext.request.contextPath}/project/CommunityWritePro" id="communityForm_2" method="post">
							<div class="style__CommentForm-sc-1w2k1pt-0 jmfZuM">
								<div class="InputWithGuideAndLengthCheck__Wrapper-sc-9nmfrw-0 eCSxwJ style__StyledInputWithGuideAndLengthCheck-sc-1w2k1pt-1 kMOyow">
									<div class="InputWithGuideAndLengthCheck__InputWrapper-sc-9nmfrw-3 bBnjVq">
										<div class="Textarea__Wrapper-sc-1mj6ym2-0 vnOMO InputWithGuideAndLengthCheck__StyledTextarea-sc-9nmfrw-2 gswCBK">
											<input type="hidden" name="id" value="${sessionScope.id}">
											<input type="hidden" name="idx" value="${communityDTO.idx}">
											<textarea id="content_COM2" name="content" placeholder="창작자에게 응원의 한마디~!" class="Textarea__StyledTextArea-sc-1mj6ym2-1 cjoUaQ" style="height: 50px;"></textarea>
										</div>
									</div>
								</div>
								<div class="style__ButtonContainer-sc-1w2k1pt-2 bpssQi">
									<button type="button" id="COM2" class="comm"  >작성하기</button><br>
<!-- 										<button type=submit class="style__ReviewCommentRegister-sc-1w2k1pt-3 deyeeq" >등록</button> -->
								</div>
							</div>
						</form>		
							<br><br>			      							    
								<c:forEach var="dto" items="${communityList1 }">
										<tr>
											<td>${dto.commIdx}</td>
									    	<td>${dto.name}</td>
									    	<td>${dto.profile}</td>
									   	 	<td>${dto.contentLabel}</td>
									   	 	<td>${dto.content}</td>
							   				<td><fmt:formatDate value="${dto.date}" pattern="yyyy.MM.dd"/><br><br>
										</tr>
									</c:forEach>
									<!-- 댓글 시작 -->
									<ul>
									<li>
										<div>
											<p>첫번째 댓글 작성자</p>
											<p>첫번째 댓글</p>
										</div>
									</li>
									<li>
										<div>
											<p>두번째 댓글 작성자</p>
											<p>두번째 댓글</p>
										</div>
									</li>
									<li>
										<div>
											<p>세번째 댓글 작성자</p>
											<p>세번째 댓글</p>
										</div>
									</li>
								</ul>
									<div>
										<p>
											<label>댓글 작성자</label> <input type="text">
										</p>
										<p>
											<textarea rows="5" cols="50"></textarea>
										</p>
										<p>
											<button type="button">댓글 작성</button>
										</p>
									</div>
									<!-- 댓글 끝 -->				      	
				      </div>
				      <div class="tab_content">
				      	<div class=communityList id="C_list">
							<button id = "onDisplay2" >글쓰기</button><br>
							    	<c:forEach var="dto" items="${communityList1 }">
										<tr>
											<td>${dto.commIdx}</td>
									    	<td>${dto.name}</td><br>
									    	<td>${dto.profile}</td><br>
									   	 	<td>${dto.contentLabel}</td>
									   	 	<td>${dto.imgA}imgA.jsp</td>
									   	 	<td>${dto.imgB}imgB.jsp</td>
									   	 	<td>${dto.imgC}imgC.jsp</td><br>
									   	 	<td>${dto.content}</td><br>
							   				<td><fmt:formatDate value="${dto.date}" pattern="yyyy.MM.dd"/><br><br>
										</tr>
									</c:forEach>
									<!-- 댓글 시작 -->
									<ul>
									<li>
										<div>
											<p>첫번째 댓글 작성자</p>
											<p>첫번째 댓글</p>
										</div>
									</li>
									<li>
										<div>
											<p>두번째 댓글 작성자</p>
											<p>두번째 댓글</p>
										</div>
									</li>
									<li>
										<div>
											<p>세번째 댓글 작성자</p>
											<p>세번째 댓글</p>
										</div>
									</li>
								</ul>
									<div>
										<p>
											<label>댓글 작성자</label> <input type="text">
										</p>
										<p>
											<textarea rows="5" cols="50"></textarea>
										</p>
										<p>
											<button type="button">댓글 작성</button>
										</p>
									</div>
									<!-- 댓글 끝 -->				      	
				      		</div>
				      		<div class = "CommunityWrite" id="C_write" style="display: none;">
				      		
						<form action="${pageContext.request.contextPath}/project/CommunityWritePro" id="communityForm_3" class="CommunityWriteForm" method="post" enctype="multipart/form-data">
						<div class="style__ProjectContentsBackground-ky14bp-8 caYfnf">
							<div class="Container-gci8y7-0 cXaiVs">
								<div class="style__ProjectContents-ky14bp-9 fbVSPF">
									<div class="style__ProjectContentsMainColumn-ky14bp-10 jXBJgk">
										<div class="style__MainColumnInner-ky14bp-12 jBRpgz">
											<div class="EditorLayout__Wrap-sc-9ka57a-0 cMjFYj">
												<div class="EditorLayout__Header-sc-9ka57a-1 ibiUSB">
													<div class="EditHeader__Wrap-zond9x-0 eVdPsY">
														<button class="SolidButton__Button-sc-1gsinzz-0 icXYZs EditHeader__BackButton-zond9x-1 OAsKY fnt-p1" color="white">
															<span><div name="arrow3-left" class="Icon__SVGICON-sc-1xkf9cp-0 ccxeYs"><svg viewBox="0 0 48 48"><path fill-rule="evenodd" clip-rule="evenodd" d="M43.7014 21.7189L10.1221 21.7189L25.2128 7.06878C26.1112 6.15946 26.2122 4.64393 25.3127 3.73461C24.4133 2.82529 22.9142 2.72425 22.0148 3.63357L2.72663 22.4262C1.82719 23.3355 1.72725 24.75 2.62669 25.7604H2.72663L22.0148 44.4519C22.9142 45.2602 24.4133 45.1592 25.2128 44.2499C26.0123 43.3405 26.0123 41.926 25.1119 41.0167L10.0221 26.4676L43.7014 26.4676C45.0006 26.4676 46 25.4572 46 24.1438C46 22.8303 45.0006 21.7189 43.7014 21.7189Z"></path></svg>
																</div>게시글 작성</span>
														</button>
<!-- 														<button type="submit" class="SolidButton__Button-sc-1gsinzz-0 hgsFUp EditHeader__SubmitButton-zond9x-2 fZQwzk fnt-p1" > -->
<!-- 															<span>등록</span> -->
<!-- 														</button> -->
													</div>
												</div>
												<div class="EditorLayout__Body-sc-9ka57a-2 etJmpB">
													<div class="EditorLayout__LeftSide-sc-9ka57a-3 bKAMOw">
														<div class="InputWithGuideAndLengthCheck__Wrapper-sc-9nmfrw-0 eCSxwJ">
															<div class="InputWithGuideAndLengthCheck__InputWrapper-sc-9nmfrw-3 bBnjVq">
																<div class="Textarea__Wrapper-sc-1mj6ym2-0 vnOMO InputWithGuideAndLengthCheck__StyledTextarea-sc-9nmfrw-2 eyRDXi">
																	<textarea  id="content_COM3" name="content" placeholder="프로젝트 및 창작자님에 대해 어떤 이야기가 하고 싶으신가요?" class="Textarea__StyledTextArea-sc-1mj6ym2-1 cjoUaQ"></textarea>
																</div>
															</div>
<!-- 															<div class="InputWithGuideAndLengthCheck__NoticeArea-sc-9nmfrw-4 ciHGYP"> -->
<!-- 																<p class="InputWithGuideAndLengthCheck__GuideMessage-sc-9nmfrw-5 fduvas"></p> -->
<!-- 																<span class="InputWithGuideAndLengthCheck__CountLength-sc-9nmfrw-6 kEJJPl">0/1000</span> -->
<!-- 															</div> -->
														</div>
														<div></div> <input type="file" id="file" name="file" multiple="multiple"></div>
													</div>
													<div class="EditorLayout__RightSide-sc-9ka57a-4 fOriWQ">
<!-- 														<div class="NewEditor__TabWrap-sh4rcq-0 kWiCpg"> -->
<!-- 															<div class="NewEditor__ContentTitle-sh4rcq-1 fBVKgb">어떤 내용의 글인가요?</div> -->
<!-- 															<div style="padding: 0" -->
<!-- 																class="style__Tabs-sc-3a505r-0 kTjmVr"> -->
<!-- 																<div class="style__Tab-sc-3a505r-1 blqBuO">응원글</div> -->
<!-- 																<div class="style__Tab-sc-3a505r-1 gygqOn">의견</div> -->
<!-- 															</div> -->
<!-- 														</div> -->
															<input type="hidden" name="id" value="${sessionScope.id}">
															<input type="hidden" name="idx" value="${communityDTO.idx}">	
														<div class="BackerEditRightText__NoteText-sc-114yeue-0 fEHuJA">후원하신 프로젝트 창작자에게 응원의 한마디를 남겨주세요. 창작자에게 후원금만큼 큰 힘이 됩니다.</div>
														<div class="ImportantNotes__ImportantWrap-ssm7kj-0 hzTSWV">
															<div class="ImportantNotes__Title-ssm7kj-1 jBpBce">
																<div name="cation" class="Icon__SVGICON-sc-1xkf9cp-0 ccxeYs ImportantNotes__TitleIcon-ssm7kj-2 iEKYpO">
																	<svg viewBox="0 0 18 18" fill="none" xmlns="http://www.w3.org/2000/svg">
																		<path d="M8.10937 8.0025C8.10937 7.98282 8.12532 7.96687 8.145 7.96687H9.855C9.87467 7.96687 9.89062 7.98282 9.89062 8.0025V12.9187C9.89062 12.9384 9.87467 12.9544 9.855 12.9544H8.145C8.12532 12.9544 8.10937 12.9384 8.10937 12.9187V8.0025Z"
																			fill="#3D3D3D"></path>
																		<path d="M7.93125 6.15C7.93125 5.55975 8.40975 5.08125 9 5.08125C9.59025 5.08125 10.0687 5.55975 10.0687 6.15C10.0687 6.74025 9.59025 7.21875 9 7.21875C8.40975 7.21875 7.93125 6.74025 7.93125 6.15Z"
																			fill="#3D3D3D"></path>
																		<path fill-rule="evenodd" clip-rule="evenodd" d="M9 14.7C12.148 14.7 14.7 12.148 14.7 9C14.7 5.85198 12.148 3.3 9 3.3C5.85198 3.3 3.3 5.85198 3.3 9C3.3 12.148 5.85198 14.7 9 14.7ZM9 16.125C12.935 16.125 16.125 12.935 16.125 9C16.125 5.06497 12.935 1.875 9 1.875C5.06497 1.875 1.875 5.06497 1.875 9C1.875 12.935 5.06497 16.125 9 16.125Z"
																			fill="#3D3D3D"></path></svg>
																</div>
																유의사항
															</div>
															<ul class="ImportantNotes__ContenetLists-ssm7kj-3 gcBHsl">
																<li class="ImportantNotes__ContentItem-ssm7kj-4 kzewdj">창작자에게 궁금하신 점이 있다면 ‘창작자에게 문의'로 질문해주세요.</li>
																<li class="ImportantNotes__ContentItem-ssm7kj-4 kzewdj">텀블벅<!-- -->
																	<a href="https://help.tumblbug.com/hc/ko/articles/360052340593" target="_blank" rel="noreferrer">커뮤니티 운영원칙</a>을 준수해주세요. 프로젝트와 무관한 내용이나 광고, 도배, 욕설, 혐오 조장, 외설, 사칭 등은 예고 없이 삭제될 수 있습니다.
																</li>
																<li class="ImportantNotes__ContentItem-ssm7kj-4 kzewdj">운영원칙
																	위반 누적시 텀블벅 이용이 제한될 수 있으며, 타인에 대한 모욕이나 명예훼손 등의 경우 법적 책임이 발생할 수도 있습니다.</li>
															</ul>
														</div>
													</div>
												</div>
													<button type="button" id="COM3" class="comm" >작성하기</button><br>
<!-- 												<button type="submit" class="SolidButton__Button-sc-1gsinzz-0 hgsFUp EditHeader__SubmitButton-zond9x-2 fZQwzk fnt-p1" ><span>등록</span></button> -->
											</div>
										</div>
									</div>
								</div>
							</div>
						</form>
						</div>
						
				      		
				      		
<%-- 									<form action="${pageContext.request.contextPath}/project/CommunityWritePro" id="communityForm_3"  class="CommunityWriteForm" method="post" enctype="multipart/form-data"> --%>
<!-- 									<table id="notice"> -->
<!-- 										<tr> -->
<%-- 										    <td><input type="hidden" name="id" value="${sessionScope.id }" readonly></td> --%>
<!-- 										</tr> -->
<!-- 										<tr> -->
<!-- 											<td>글내용</td> -->
<!-- 										    <td><textarea id="content_COM3" name="content" rows="10" cols="20"></textarea></td> -->
<!-- 										</tr> -->
<!-- 										<tr> -->
<!-- 											<td>첨부파일</td> -->
<!-- 										    <td><input type="file"  id="file"  name="file" multiple="multiple"></td> -->
<!-- 										</tr>    -->
<!-- 									</table> -->
<!-- 									<div id="table_search"> -->
<!-- 										<button type="button" id="COM3" class="comm" >작성하기</button><br> -->
<%-- 										<input type="hidden" name="id" value="${sessionScope.id}"> --%>
<%-- 										<input type="hidden" name="idx" value="${communityDTO.idx}">	 --%>
										
<!-- 									</div>	 -->
<!-- 									</form> -->
									<div class="clear"></div>
									<div id="page_control">
									</div>
				      		</div>
				      </div>
				    </div>
				</div>
			</div>
			<div class="project_info_box">
				<label for="fundingBtn" class="info_x">
					<svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-x-circle" viewBox="0 0 16 16">
						<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
						<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
					</svg>
				</label>
				<div class="creator_box">크리에이터 박스</div>
				<div class="prod_option">상품 옵션</div>
			</div>
			<label for="fundingBtn" class="info_bg"></label>
		</div>
	</div>
	<!-- 상세 페이지 및 창작자 소개, 금액 -->
	<div class=""></div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>


</body>
</html>