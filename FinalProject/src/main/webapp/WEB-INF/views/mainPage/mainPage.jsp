<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        <section>
            <div class="feature-posts">
                <a href="single-post.html" class="feature-post-item">                       
                    <span>Featured Posts</span>
                </a>
                <a href="single-post.html" class="feature-post-item">
                    <img src="${pageContext.request.contextPath }/resources/assets/imgs/img-1.jpg" class="w-100" alt="">
                    <div class="feature-post-caption">Incidunt Quaerat</div>
                </a>
                <a href="single-post.html" class="feature-post-item">
                    <img src="${pageContext.request.contextPath }/resources/assets/imgs/img-2.jpg" class="w-100" alt="">
                    <div class="feature-post-caption">Culpa Ducimus</div>
                </a>
                <a href="single-post.html" class="feature-post-item">
                    <img src="${pageContext.request.contextPath }/resources/assets/imgs/img-3.jpg" class="w-100" alt="">
                    <div class="feature-post-caption">Temporibus Simile</div>
                </a>
                <a href="single-post.html" class="feature-post-item">
                    <img src="${pageContext.request.contextPath }/resources/assets/imgs/img-4.jpg" class="w-100" alt="">
                    <div class="feature-post-caption">Adipisicing</div>
                </a>
            </div>
        </section>
        <hr>
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
							 	<img src="https://tumblbug-assets.s3.ap-northeast-1.amazonaws.com/heroes/main_pc.jpg?q=80&width=768&height=280&fit=crop" alt="Los Angeles">
							 </div>
							<div class="carousel-item">
						    	<img src="https://tumblbug-assets.s3.ap-northeast-1.amazonaws.com/heroes/early_bird_feb.jpg?q=80&width=768&height=280&fit=crop" alt="Chicago">
						  	</div>
							<div class="carousel-item">
								<img src="https://tumblbug-assets.s3.ap-northeast-1.amazonaws.com/heroes/thegrapefruit.jpg?q=80&width=768&height=280&fit=crop" alt="New York">
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
                <hr>
                <!-- 주목할 만한 프로젝트 4줄 정렬-->
                <div class="row">                       
                    <div class="col-lg-3">
                        <div class="card text-center mb-5">
                            <div class="card-header p-0">                                   
                                <div class="blog-media">
                                    <img src="${pageContext.request.contextPath }/resources/assets/imgs/blog-2.jpg" alt="" class="w-100">
                                    <a href="#" class="badge badge-primary">#Placeat</a>        
                                </div>  
                            </div>
                            <div class="card-body px-0">
                                <h5 class="card-title mb-2">테스트1</h5>    
                                <small class="small text-muted">January 20 2019 
                                    <span class="px-2">-</span>
                                    <a href="#" class="text-muted">34 Comments</a>
                                </small>
                                <p class="my-2">테스트내용1</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="card text-center mb-5">
                            <div class="card-header p-0">                                   
                                <div class="blog-media">
                                    <img src="${pageContext.request.contextPath }/resources/assets/imgs/blog-3.jpg" alt="" class="w-100">
                                    <a href="#" class="badge badge-primary">#dolores</a>        
                                </div>  
                            </div>
                            <div class="card-body px-0">
                                <h5 class="card-title mb-2">테스트2</h5> 
                                <small class="small text-muted">January 19 2019 
                                    <span class="px-2">-</span>
                                    <a href="#" class="text-muted">64 Comments</a>
                                </small>
                                <p class="my-2">테스트내용2</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="card text-center mb-5">
                            <div class="card-header p-0">                                   
                                <div class="blog-media">
                                    <img src="${pageContext.request.contextPath }/resources/assets/imgs/blog-4.jpg" alt="" class="w-100">
                                    <a href="#" class="badge badge-primary">#amet</a>       
                                </div>  
                            </div>
                            <div class="card-body px-0">
                                <h5 class="card-title mb-2">테스트3</h5>   
                                <small class="small text-muted">January 17 2019 
                                    <span class="px-2">-</span>
                                    <a href="#" class="text-muted">93 Comments</a>
                                </small>
                                <p class="my-2">테스트내용3</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="card text-center mb-5">
                            <div class="card-header p-0">                                   
                                <div class="blog-media">
                                    <img src="${pageContext.request.contextPath }/resources/assets/imgs/blog-5.jpg" alt="" class="w-100">
                                    <a href="#" class="badge badge-primary">#lorem</a>      
                                </div>  
                            </div>
                            <div class="card-body px-0">
                                <h5 class="card-title mb-2">테스트4</h5>  
                                <small class="small text-muted">January 15 2019 
                                    <span class="px-2">-</span>
                                    <a href="#" class="text-muted">112 Comments</a>
                                </small>
                                <p class="my-2">테스트내용4</p>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- 주목할 만한 프로젝트 4줄 정렬 끝-->
            </div>

            <!-- Sidebar -->
            <div class="page-sidebar text-left">
            	<!-- 인기 프로젝트 -->
                <h6 class="sidebar-title section-title mb-4">인기프로젝트</h6>
	                <div class="media text-left mb-4">
	                    <a href="#" class="overlay-link"></a>
	                    <img class="mr-3" src="${pageContext.request.contextPath }/resources/assets/imgs/blog-1.jpg" width="100px" alt="Generic placeholder image">
	                    <div class="media-body">
	                        <h6 class="mt-0">굿즈-키보드</h6>
	                        <p class="mb-2">더보기</p>
	                        <p class="text-danger small">999% 달성</p>
	                    </div>
	                </div>
	                <div class="media text-left mb-4">
	                    <a href="#" class="overlay-link"></a>
	                    <img class="mr-3" src="${pageContext.request.contextPath }/resources/assets/imgs/blog-2.jpg" width="100px" alt="Generic placeholder image">
	                    <div class="media-body">
	                        <h6 class="mt-0">한권으로 끝내는 인쇄</h6>
	                        <p class="mb-2">더보기</p>                            
	                        <p class="text-danger small">120% 달성</p>
	                    </div>
	                </div>
	                <div class="media text-left mb-4">
	                    <a href="#" class="overlay-link"></a>
	                    <img class="mr-3" src="${pageContext.request.contextPath }/resources/assets/imgs/blog-3.jpg" width="100px" alt="Generic placeholder image">
	                    <div class="media-body">
	                        <h6 class="mt-0">오디오북-세계역사</h6>
	                        <p class="mb-2">더보기</p>                        
	                        <p class="text-danger small">1024% 달성</p>
	                    </div>
	                </div>
	                <div class="text-center">
						<a href="#" class="btn btn-outline-dark btn-sm">전체보기</a>
					</div>  
                <!-- 인기 프로젝트 끝 -->  

            </div>
        </div>
    </div>

    <!-- Page Footer -->
    <jsp:include page="../inc/footer.jsp"></jsp:include>

	<!-- core  -->
    <script src="${pageContext.request.contextPath }/resources/assets/vendors/jquery/jquery-3.4.1.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/vendors/bootstrap/bootstrap.bundle.js"></script>

    <!-- JoeBLog js -->
    <script src="${pageContext.request.contextPath }/resources/assets/js/joeblog.js"></script>

</body>
</html>