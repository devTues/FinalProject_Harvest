<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
	<!-- page-header -->
    <!-- page First Navigation -->
    <nav class="navbar navbar-light bg-white">
        <div class="container">
            <a class="navbar-brand" href="${pageContext.request.contextPath }/projectList/main">
                <img src="${pageContext.request.contextPath }/resources/harVest_img/harvest_logo.png">
            </a>
            <div class="socials">
            <c:if test="${empty sessionScope.id}">
                <a href="${pageContext.request.contextPath }/user/login">로그인</a>
            </c:if>
            <c:if test="${! empty sessionScope.id}">
           		<a href="${pageContext.request.contextPath }/creator/start">프로젝트 올리기</a>
                <a href="${pageContext.request.contextPath }/user/logout">로그아웃</a>
                <a href="${pageContext.request.contextPath }/myPage/mySettingPage">
                	<img src="${pageContext.request.contextPath }/resources/upload/${sessionScope.profile}" style="width:40px; height:40px;" class="thumb-sm img-thumbnail rounded-circle" alt="...">
                </a>
            </c:if>
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
                      	  <a class="dropdown-item" href="${pageContext.request.contextPath }/projectList/search?search="><img src="${pageContext.request.contextPath }/resources/assets/imgs/border-all.svg"/> 전체</a>
                          <a class="dropdown-item" href="${pageContext.request.contextPath }/projectList/category?category=book"><img src="${pageContext.request.contextPath }/resources/assets/imgs/book.svg"/> 출판</a>
                          <a class="dropdown-item" href="${pageContext.request.contextPath }/projectList/category?category=game"><img src="${pageContext.request.contextPath }/resources/assets/imgs/nintendo-switch.svg"/> 게임</a>
                          <a class="dropdown-item" href="${pageContext.request.contextPath }/projectList/category?category=media"><img src="${pageContext.request.contextPath }/resources/assets/imgs/music-note-list.svg"/> 음악</a>
                          <a class="dropdown-item" href="${pageContext.request.contextPath }/projectList/category?category=design"><img src="${pageContext.request.contextPath }/resources/assets/imgs/easel2.svg"/> 디자인</a>
                          <a class="dropdown-item" href="${pageContext.request.contextPath }/projectList/category?category=acc"><img src="${pageContext.request.contextPath }/resources/assets/imgs/handbag.svg"/> 잡화</a>
                          <a class="dropdown-item" href="${pageContext.request.contextPath }/projectList/category?category=sports"><img src="${pageContext.request.contextPath }/resources/assets/imgs/bicycle.svg"/> 스포츠</a>
                      </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-dark" href="${pageContext.request.contextPath }/projectList/main">홈</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-dark" href="${pageContext.request.contextPath }/projectList/popular">인기</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-dark" href="${pageContext.request.contextPath }/projectList/newly">신규</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-dark" href="${pageContext.request.contextPath }/projectList/deadline">마감임박</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-dark" href="${pageContext.request.contextPath }/projectList/expect">공개예정</a>
                    </li>
                </ul>
                <div class="navbar-nav ml-auto">
                	<form action="${pageContext.request.contextPath }/projectList/search" method="get">
                	<div class="input-group">
						<input type="text" class="form-control form-control-sm" name="search" placeholder="프로젝트 검색하기" aria-label="Recipient's username" aria-describedby="basic-addon2">
						<div class="input-group-append">
							<button class="btn btn-outline-secondary btn-sm" type="submit" id="button-addon2"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
							<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
							</svg>
							</button>
						</div>
					</div>
					</form>
                </div>
            </div>
        </div>
    </nav>
    <!-- End Of Page Second Navigation -->
    <!-- end of page header -->