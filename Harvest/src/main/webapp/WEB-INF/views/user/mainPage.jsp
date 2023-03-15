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
    <link rel="stylesheet" href="resources/assets/vendors/themify-icons/css/themify-icons.css">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
    <!-- Bootstrap + JoeBLog main styles -->
	<link rel="stylesheet" href="resources/assets/css/joeblog.css">
	<link rel="stylesheet" href="resources/harVest_css/mainPage.css">
	<style>
  /* Make the image fully responsive */
  .carousel-inner img {
    width: 100%;
    height: 100%;
  }
  </style>
</head>
<body data-spy="scroll" data-target=".navbar" data-offset="40" id="home">
    
    <!-- page First Navigation -->
    <nav class="navbar navbar-light bg-white">
        <div class="container">
            <a class="navbar-brand" href="#">
                <img src="resources/harVest_img/harvest_logo.png">
            </a>
            <div class="socials">
                <a href="javascript:void(0)">프로젝트 올리기</a>
                <a href="javascript:void(0)">로그인</a>
            </div>
        </div>
    </nav>
    <!-- End Of First Navigation -->

    <!-- Page Second Navigation -->
    <nav class="navbar custom-navbar navbar-expand-md navbar-light bg-white sticky-top">
        <div class="container">
            <button class="navbar-toggler ml-auto" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav">
                <li class="nav-item dropdown">
                      <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                       카테고리
                      </a>
                      <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                          <a class="dropdown-item" href="#">1</a>
                          <a class="dropdown-item" href="#">2</a>
                          <a class="dropdown-item" href="#">3</a>
                          <a class="dropdown-item" href="#">4</a>
                          <a class="dropdown-item" href="#">5</a>
                          <a class="dropdown-item" href="#">6</a>
                          <a class="dropdown-item" href="#">7</a>
                          <a class="dropdown-item" href="#">8</a>
                          <a class="dropdown-item" href="#">9</a>
                          <a class="dropdown-item" href="#">10	</a>
                      </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="index.html">홈</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="no-sidebar.html">인기</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="single-post.html">신규</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="single-post.html">마감임박</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link disabled" href="#">공개예정</a>
                    </li>
                </ul>
                <div class="navbar-nav ml-auto">
                	<div class="input-group">
						<input type="text" class="form-control form-control-sm" placeholder="Search" aria-label="Recipient's username" aria-describedby="button-addon2">
						<button class="btn btn-outline-secondary btn-sm" type="button" id="button-addon2"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
						<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
					</svg></button>
					</div>
					
                </div>
            </div>
        </div>
    </nav>
    <!-- End Of Page Second Navigation -->
    
    <!-- page-header -->
<!--     <header class="page-header"></header> -->
    <!-- end of page header -->

    <div class="container">
        <section>
            <div class="feature-posts">
                <a href="single-post.html" class="feature-post-item">                       
                    <span>Featured Posts</span>
                </a>
                <a href="single-post.html" class="feature-post-item">
                    <img src="resources/assets/imgs/img-1.jpg" class="w-100" alt="">
                    <div class="feature-post-caption">Incidunt Quaerat</div>
                </a>
                <a href="single-post.html" class="feature-post-item">
                    <img src="resources/assets/imgs/img-2.jpg" class="w-100" alt="">
                    <div class="feature-post-caption">Culpa Ducimus</div>
                </a>
                <a href="single-post.html" class="feature-post-item">
                    <img src="resources/assets/imgs/img-3.jpg" class="w-100" alt="">
                    <div class="feature-post-caption">Temporibus Simile</div>
                </a>
                <a href="single-post.html" class="feature-post-item">
                    <img src="resources/assets/imgs/img-4.jpg" class="w-100" alt="">
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
                                    <a href="${pageContext.request.contextPath}/project/projectInfo">
                                    	<img src="resources/assets/imgs/blog-2.jpg" alt="" class="w-100">
                                    	<label class="like_btn">
                                    		<input type="checkbox" class="like_input" id="likeBtn">
                                    		<span class="heart">
                                    			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-suit-heart" viewBox="0 0 16 16">
                                    				<path d="m8 6.236-.894-1.789c-.222-.443-.607-1.08-1.152-1.595C5.418 2.345 4.776 2 4 2 2.324 2 1 3.326 1 4.92c0 1.211.554 2.066 1.868 3.37.337.334.721.695 1.146 1.093C5.122 10.423 6.5 11.717 8 13.447c1.5-1.73 2.878-3.024 3.986-4.064.425-.398.81-.76 1.146-1.093C14.446 6.986 15 6.131 15 4.92 15 3.326 13.676 2 12 2c-.777 0-1.418.345-1.954.852-.545.515-.93 1.152-1.152 1.595L8 6.236zm.392 8.292a.513.513 0 0 1-.784 0c-1.601-1.902-3.05-3.262-4.243-4.381C1.3 8.208 0 6.989 0 4.92 0 2.755 1.79 1 4 1c1.6 0 2.719 1.05 3.404 2.008.26.365.458.716.596.992a7.55 7.55 0 0 1 .596-.992C9.281 2.049 10.4 1 12 1c2.21 0 4 1.755 4 3.92 0 2.069-1.3 3.288-3.365 5.227-1.193 1.12-2.642 2.48-4.243 4.38z"/>
                                    			</svg>
                                    		</span>
                                    		<span class="heart_fill">
	                                    		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-suit-heart-fill" viewBox="0 0 16 16">
	                                    			<path d="M4 1c2.21 0 4 1.755 4 3.92C8 2.755 9.79 1 12 1s4 1.755 4 3.92c0 3.263-3.234 4.414-7.608 9.608a.513.513 0 0 1-.784 0C3.234 9.334 0 8.183 0 4.92 0 2.755 1.79 1 4 1z"/>
	                                    		</svg>
                                    		</span>
                                    	</label>
                                    </a>
<%--                                     <a href="${pageContext.request.contextPath}/product/content" class="badge badge-primary">#Placeat</a>         --%>
<%--                                     <a href="${pageContext.request.contextPath}/product/content" class="badge badge-primary">#Placeat</a>         --%>
                                </div>  
                            </div>
                            <div class="card-body px-0">
                                <a href="${pageContext.request.contextPath}/project/projectInfo"><h5 class="card-title mb-2">테스트1</h5></a>  
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
                                    <img src="resources/assets/imgs/blog-3.jpg" alt="" class="w-100">
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
                                    <img src="resources/assets/imgs/blog-4.jpg" alt="" class="w-100">
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
                                    <img src="resources/assets/imgs/blog-5.jpg" alt="" class="w-100">
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
	                    <img class="mr-3" src="resources/assets/imgs/blog-1.jpg" width="100px" alt="Generic placeholder image">
	                    <div class="media-body">
	                        <h6 class="mt-0">굿즈-키보드</h6>
	                        <p class="mb-2">더보기</p>
	                        <p class="text-danger small">999% 달성</p>
	                    </div>
	                </div>
	                <div class="media text-left mb-4">
	                    <a href="#" class="overlay-link"></a>
	                    <img class="mr-3" src="resources/assets/imgs/blog-2.jpg" width="100px" alt="Generic placeholder image">
	                    <div class="media-body">
	                        <h6 class="mt-0">한권으로 끝내는 인쇄</h6>
	                        <p class="mb-2">더보기</p>                            
	                        <p class="text-danger small">120% 달성</p>
	                    </div>
	                </div>
	                <div class="media text-left mb-4">
	                    <a href="#" class="overlay-link"></a>
	                    <img class="mr-3" src="resources/assets/imgs/blog-3.jpg" width="100px" alt="Generic placeholder image">
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


                <h6 class="sidebar-title mt-5 mb-4">Instagram</h6>
                <div class="row px-3">
                    <div class="col-4 p-1 figure">
                        <a href="#" class="figure-img">
                            <img src="resources/assets/imgs/insta-1.jpg" alt="">
                        </a>
                    </div>
                    <div class="col-4 p-1 figure">
                        <a href="#" class="figure-img">
                            <img src="resources/assets/imgs/insta-2.jpg" alt="" class="w-100 m-0">
                        </a>
                    </div>  
                    <div class="col-4 p-1 figure">
                        <a href="#" class="figure-img">
                            <img src="resources/assets/imgs/insta-3.jpg" alt="" class="w-100">
                        </a>
                    </div>
                    <div class="col-4 p-1 figure">
                        <a href="#" class="figure-img">
                            <img src="resources/assets/imgs/insta-4.jpg" alt="" class="w-100 m-0">
                        </a>
                    </div>  
                    <div class="col-4 p-1 figure">
                        <a href="#" class="figure-img">
                            <img src="resources/assets/imgs/insta-5.jpg" alt="" class="w-100">
                        </a>
                    </div>
                    <div class="col-4 p-1 figure">
                        <a href="#" class="figure-img">
                            <img src="resources/assets/imgs/insta-6.jpg" alt="" class="w-100 m-0">
                        </a>
                    </div>                          
                </div>  

                <figure class="figure mt-5">
                    <a href="single-post.html" class="figure-img">
                        <img src="resources/assets/imgs/img-4.jpg" alt="" class="w-100">
                        <figcaption class="figcaption">Laboriosam</figcaption>
                    </a>
                </figure>

                <h6 class="sidebar-title mt-5 mb-4">Popular Posts</h6>
                <div class="card mb-4">
                    <a href="single-post.html" class="overlay-link"></a>
                    <div class="card-header p-0">                                   
                        <div class="blog-media">
                            <img src="resources/assets/imgs/blog-6.jpg" alt="" class="w-100">
                            <a href="#" class="badge badge-primary">#Lorem</a>      
                        </div>  
                    </div>
                    <div class="card-body px-0">
                        <h5 class="card-title mb-2">Corporis Placeat</h5>   
                        <small class="small text-muted"><i class="ti-calendar pr-1"></i> January 24 2019
                        </small>
                        <p class="my-2">consectetur adipisicing Cum veritatis minus iustorpo cupiditate voluptas ...</p>
                    </div>      
                </div>
            </div>
        </div>
    </div>

    <!-- Page Footer -->
    <footer class="page-footer">
        <div class="container">
            <div class="row align-items-center justify-content-between border-top">
                <div class="col-md-7 text-center text-md-left">
                <p class="mb-0 mt-4 small">
                회사명 텀블벅(주) 주소 서울 서초구 서초대로 398, 19층 (서초동, BNK디지털)
                사업자등록번호 123-45-67890
                통신판매업 신고번호 대표번호 02-0000-0000 Tumblbug Inc.</p>
                </div>
                <div class="col-md-5 text-center text-md-right">
                    <div class="socials">
                        <a href="javascript:void(0)" class="font-weight-bold text-muted mr-4"><i class="ti-facebook pr-1"></i></a>
                        <a href="javascript:void(0)" class="font-weight-bold text-muted mr-4"><i class="ti-twitter pr-1"></i></a>
                        <a href="javascript:void(0)" class="font-weight-bold text-muted mr-4"><i class="ti-pinterest-alt pr-1"></i></a>
                        <a href="javascript:void(0)" class="font-weight-bold text-muted mr-4"><i class="ti-instagram pr-1"></i></a>
                        <a href="javascript:void(0)" class="font-weight-bold text-muted mr-4"><i class="ti-youtube pr-1"></i></a>
                    </div>
                </div>  
            </div>
        </div>      
    </footer>
    <!-- End of Page Footer -->

	<!-- core  -->
    <script src="resources/assets/vendors/jquery/jquery-3.4.1.js"></script>
    <script src="resources/assets/vendors/bootstrap/bootstrap.bundle.js"></script>

    <!-- JoeBLog js -->
    <script src="resources/assets/js/joeblog.js"></script>

</body>
</html>