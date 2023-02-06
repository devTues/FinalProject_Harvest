<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>	
	<!-- page-header -->
    <!-- page First Navigation -->
    <nav class="navbar navbar-light bg-white">
        <div class="container">
            <a class="navbar-brand" href="#">
                <img src="${pageContext.request.contextPath }/resources/harVest_img/harvest_logo.png">
            </a>
            <div class="socials">
                <a href="javascript:void(0)">프로젝트 올리기</a>
                <a href="../views/loginPage.jsp">로그인</a>
            </div>
        </div>
    </nav>
    <!-- End Of First Navigation -->

    <!-- Page Second Navigation -->
    <nav class="navbar custom-navbar navbar-expand-md navbar-light bg-white sticky-top shadow">
        <div class="container">
            <button class="navbar-toggler ml-auto" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav">
                <li class="nav-item dropdown">
                      <a class="nav-link text-dark dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                       카테고리
                      </a>
                      <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                          <a class="dropdown-item" href="#">1</a>
                          <a class="dropdown-item" href="#">2</a>
                          <a class="dropdown-item" href="#">3</a>
                      </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-dark" href="./views/mainPage.jsp">홈</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-dark" href="../views/popularPage.jsp">인기</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-dark" href="#">신규</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-dark" href="#">마감임박</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-dark" href="#">공개예정</a>
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
    <!-- end of page header -->