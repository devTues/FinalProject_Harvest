<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Start your development with JoeBLog landing page.">
    <meta name="author" content="Devcrud">
    <title>harVest</title>
    <!-- font icons -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/vendors/themify-icons/css/themify-icons.css">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
    <!-- Bootstrap + JoeBLog main styles -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/joeblog.css">
	
	<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/kenwheeler/slick@1.8.1/slick/slick-theme.css"/>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
				
	<style>
	 /* Make the image fully responsive */
	 .carousel-inner img {width: 100%; height: 100%;}
	</style>
</head>
<body data-spy="scroll" data-target=".navbar" data-offset="40" id="home">

	<!-- page-header -->
  	<jsp:include page="../inc/header.jsp"></jsp:include>
    
    <!-- 본문 내용 -->
    <div class="container">
    <input type="hidden" value="${sessionScope.id}">
    <br>
        <div class="page-container">
            <div class="page-content">
                <div class="card">
                	<!-- 상단 광고슬라이드 -->
                    <div id="demo" class="carousel slide" data-ride="carousel">

						<!-- Indicators -->
						<ul class="carousel-indicators">
							<li data-target="#demo" data-slide-to="0" class="active"></li>
							<li data-target="#demo" data-slide-to="1"></li>
							<li data-target="#demo" data-slide-to="2"></li>
						</ul>
					
						<!-- The slideshow -->
						<div class="carousel-inner">
							<div class="carousel-item active">
							 	<img src="https://tumblbug-assets.s3.ap-northeast-1.amazonaws.com/heroes/2023stationary.jpg?q=80&width=768&height=280&fit=crop" alt="Los Angeles">
							 	<div class="carousel-caption d-none d-md-block text-left">
							        <h4>두근두근 새학기 준비</h4>
							        <p>깜짝 이벤트 찾기</p>
						        </div>
							 </div>
							<div class="carousel-item">
						    	<img src="https://tumblbug-assets.s3.ap-northeast-1.amazonaws.com/heroes/ebfeb.jpg?q=80&width=768&height=280&fit=crop" alt="Chicago">
						  		<div class="carousel-caption d-none d-md-block text-left">
							        <h4>얼리버드 혜택이 가득!</h4>
							        <p>얼리버드 선물 소개</p>
						        </div>
						  	</div>
							<div class="carousel-item">
								<img src="https://tumblbug-assets.s3.ap-northeast-1.amazonaws.com/heroes/thegrapefruit.jpg?q=80&width=768&height=280&fit=crop" alt="New York">
								<div class="carousel-caption d-none d-md-block text-left">
							        <h4>향긋한 자몽향 가득!</h4>
							        <p>향수 모음전 보러가기</p>
						        </div>
							</div>
						</div>
					
						<!-- Left and right controls -->
						<a class="carousel-control-prev" href="#demo" data-slide="prev">
							<span class="carousel-control-prev-icon"></span>
						</a>
						<a class="carousel-control-next" href="#demo" data-slide="next">
					    	<span class="carousel-control-next-icon"></span>
						</a>
					</div>
					<!-- 상단 광고슬라이드 끝 -->
                </div>
                
                <!-- 주목할 만한 프로젝트 4줄 정렬-->
                <hr>
                <h5 class="pb-2">주목할 만한 프로젝트</h5>
                <div class="row">
                <c:forEach var="getAllList" items="${getAllList }" begin="1" end="8">
                    <div class="col-md-3 col-sm-6">
                        <div class="card text-left">
                            <div class="card-header p-0">                                   
                                <!-- 찜버튼 -->
								<div class="blog-media">
									<a href="${pageContext.request.contextPath }/project/projectInfo?idx=${getAllList.IDX }">
										<img src="${pageContext.request.contextPath }/resources/upload/${fn:split(getAllList.IMG1,'&')[0]}" alt="" class="w-100" height="110">
									</a>
                                   		<c:if test="${empty sesssionScope.id}">
										<img style="position:absolute; top:5px;right:5px;z-index:10;cursor:pointer;" width="20" height="20" id="likeBtn_${getAllList.IDX }" class="heart" src="${pageContext.request.contextPath}/resources/harVest_img/${getAllList.HEART}">
										</c:if>
								</div>
                            </div>
                            <div class="mb-2">
                            	<p class="my-2">${getAllList.CATEGORY } | ${getAllList.CRE_NM }</p>
                            	<a href="${pageContext.request.contextPath }/project/projectInfo?idx=${getAllList.IDX }">
                                	<h6 class="m-0">${getAllList.TITLE }</h6>
                                </a>
                                <span class="text-danger">${getAllList.PERCENT}%</span>
                                <small class="small text-danger"> 달성</small>
                            </div>
                        </div>
                    </div>
                </c:forEach>            
                </div>
                <!-- 주목할 만한 프로젝트 4줄 정렬 끝-->
            </div>

            <!-- Sidebar -->
            <div class="page-sidebar text-left">
				<!--  인기 프로젝트 -->
            	<h6 class="sidebar-title section-title">인기프로젝트</h6>
            	<c:forEach var="getPopList" items="${getPopList }" begin="1" end="8">
	                <div class="media text-left">
	                    <a href="#" class="overlay-link"></a>
	                    <div>
	                    <a href="${pageContext.request.contextPath }/project/projectInfo?idx=${getPopList.IDX }">
	                    	<img class="mr-3" src="${pageContext.request.contextPath }/resources/upload/${fn:split(getPopList.IMG1,'&')[0]}" width="100px" alt="">
	                    </a>
	                    <c:if test="${empty sesssionScope.id}">
										<img style="position:absolute; top:5px;left:75px;z-index:10;cursor:pointer;" width="20" height="20" id="likeBtn_${getPopList.IDX }" class="heart" src="${pageContext.request.contextPath}/resources/harVest_img/${getPopList.HEART}">
										</c:if>
	                    </div>
	                    <div class="media-body">
	                    	<p class="my-0">${getPopList.CATEGORY } | ${getPopList.CRE_NM }</p>
	                    	<a href="${pageContext.request.contextPath }/project/projectInfo?idx=${getPopList.IDX }">
	                        	<h6 class="m-0">${getPopList.TITLE }</h6>
	                        </a>
	                        <p class="small text-danger">${getPopList.PERCENT}% 달성</p>
	                    </div>
	                </div>
				</c:forEach>
				<div class="text-center">
					<a href="${pageContext.request.contextPath }/projectList/popular" class="btn btn-outline-secondary btn-sm rounded">전체보기</a>
				</div>
				<!-- 인기 프로젝트 끝 -->
            </div>
        </div>
    </div>
    
	<!--     1번째 배너 -->
    <div class="container">
    	<section>
    	<img src="https://tumblbug-assets.imgix.net/main_banners/pc_images/000/000/007/original/849fc934-c410-4143-bd8d-b08bba270aa8.jpg" alt="" class="w-100">
    	</section>
    </div>
    
	<!--     신규 마감임박 공개예정 프로젝트 -->
    <div class="container">
    <hr>
    <h5>신규 프로젝트</h5>
    <div class="items">
    	<c:forEach var="getNewList" items="${getNewList }">
        	<div>
				<!-- 찜버튼 -->
				<div class="blog-media">
					<a href="${pageContext.request.contextPath }/project/projectInfo?idx=${getNewList.IDX }">
						<img src="${pageContext.request.contextPath }/resources/upload/${fn:split(getNewList.IMG1,'&')[0]}" alt="" class="w-100">
					</a>
                        <c:if test="${empty sesssionScope.id}">
						<img style="position:absolute; top:5px;right:5px;z-index:10;cursor:pointer;" width="20" height="20" id="likeBtn_${getNewList.IDX }" class="heart" src="${pageContext.request.contextPath}/resources/harVest_img/${getNewList.HEART}">
						</c:if>
				</div>
              	<p class="my-2">${getNewList.CATEGORY } | ${getNewList.CRE_NM }</p>
              	<a href="${pageContext.request.contextPath }/project/projectInfo?idx=${getNewList.IDX }">
                	<h6 class="m-0">${getNewList.TITLE }</h6>
                </a>
                <span class="text-danger">${getNewList.PERCENT}%</span>
                <small class="small text-danger"> 달성</small>
			</div>
		</c:forEach>
    </div>
	<hr>
	<h5>마감임박 프로젝트</h5>
	<div class="items">
    	<c:forEach var="getDeadList" items="${getDeadList }">
        	<div>
				<!-- 찜버튼 -->
				<div class="blog-media">
					<a href="${pageContext.request.contextPath }/project/projectInfo?idx=${getDeadList.IDX }">
						<img src="${pageContext.request.contextPath }/resources/upload/${fn:split(getDeadList.IMG1,'&')[0]}" alt="" class="w-100">
					</a>
                        <c:if test="${empty sesssionScope.id}">
						<img style="position:absolute; top:5px;right:5px;z-index:10;cursor:pointer;" width="20" height="20" id="likeBtn_${getDeadList.IDX }" class="heart" src="${pageContext.request.contextPath}/resources/harVest_img/${getDeadList.HEART}">
						</c:if>
				</div>
              	<p class="my-2">${getDeadList.CATEGORY } | ${getDeadList.CRE_NM }</p>
              	<a href="${pageContext.request.contextPath }/project/projectInfo?idx=${getDeadList.IDX }">
                	<h6 class="m-0">${getDeadList.TITLE }</h6>
                </a>
                <span class="text-danger">${getDeadList.PERCENT }%</span>
                <small class="small text-danger"> 달성</small>
			</div>
		</c:forEach>
    </div>
	<hr>
	<h5>공개예정 프로젝트</h5>
	<div class="items">
    	<c:forEach var="getExpList" items="${getExpList }">
        	<div>
				<!-- 찜버튼 -->
				<div class="blog-media">
					<a href="${pageContext.request.contextPath }/project/projectInfo?idx=${getExpList.IDX }">
					<img src="${pageContext.request.contextPath }/resources/upload/${fn:split(getExpList.IMG1,'&')[0]}" alt="" class="w-100">
					</a>
				</div>
              	<p class="my-2">${getExpList.CATEGORY } | ${getExpList.CRE_NM }</p>
              	<a href="${pageContext.request.contextPath }/project/projectOpen?idx=${getExpList.IDX }">
                	<h6 class="m-0">${getExpList.TITLE }</h6>
                </a>
                <span class="text-muted">${getExpList.START } 공개예정</span>
			</div>
		</c:forEach>
    </div>
	<hr>
    </div>
    
    <!-- 하단 배너 -->
    <div class="container">
    	<section>
    	<img src="${pageContext.request.contextPath }/resources/assets/imgs/banner.jpg" alt="" class="w-100">
    	</section>
    </div>

    <!-- Page Footer -->
    <jsp:include page="../inc/footer.jsp"></jsp:include>

	<!-- core  -->
    <script src="${pageContext.request.contextPath }/resources/assets/vendors/jquery/jquery-3.4.1.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/vendors/bootstrap/bootstrap.bundle.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/js/slide.js"></script>

    <!-- JoeBLog js -->
    <script src="${pageContext.request.contextPath }/resources/assets/js/joeblog.js"></script>
	
	<script type="text/javascript">
	$(document).ready(function(){
		$(".heart").click(like)
	})
	
	function like() {
		let pjIdx = this.id.split('_')[1];
		if(${empty sessionScope.id}){
			alert('로그인 후 이용해주세요');
			return;
		}
		
		$.ajax({
			  url	: "${pageContext.request.contextPath}/project/likePro", // 요청이 전송될 URL 주소
			  type	: "POST", // http 요청 방식 (default: ‘GET’)
			  data  : {'PJ_IDX' : pjIdx,
				  	   'USER_ID' : '${sessionScope.id}'}, // TODO session 아이디로 바까라 좋은말 할때...
			  //processData : true, // 데이터를 컨텐트 타입에 맞게 변환 여부
			  success : function(data) {
				  alert("성공");
				  var src = $('#likeBtn_' + pjIdx).attr('src');
				  src = src.substring(0, src.lastIndexOf('/') + 1) + data;
				  $('#likeBtn_' + pjIdx).attr('src', src);
			  }
			})
	}
	
	</script>
</body>
</html>