<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
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
</head>
<body data-spy="scroll" data-target=".navbar" data-offset="40" id="home">

	<!-- page-header -->
  	<jsp:include page="../inc/header.jsp"></jsp:include>
    
    <!-- 본문 내용 -->
	<div class="container">
		<!-- 게시판 -->
		<h2 class="pt-5">공지사항</h2>
		<hr>
			<c:forEach var="dto" items="${boardList }">
			<div class="media text-left">
			    <li class="py-3" style="list-style: none; width: 100%; border-bottom:1px solid rgb(230, 230, 230);">
			        <a href="${pageContext.request.contextPath }/board/content?idx=${dto.idx}">
			        <span class="title-box">
			            <h5>${dto.title}</h5>
			            <span class="text-muted"><fmt:formatDate value="${dto.date}" pattern="yyy.MM.dd"/></span>
			        </span>
			        </a>
			    </li>
		    </div>
		    </c:forEach>
		<br>
		<!-- search -->
		<form action="${pageContext.request.contextPath }/board/search" method="get">
           	<div class="input-group col-sm-12 col-md-3 ">
				<input type="text" class="form-control" name="search" placeholder="검색하기" aria-label="Recipient's username" aria-describedby="basic-addon2">
				<div class="input-group-append">
					<button class="btn btn-outline-secondary btn-sm" type="submit" id="button-addon2"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
					<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
					</svg>
					</button>
				</div>
			</div>
		</form>
		
		<br>
		<nav aria-label="Page navigation example">
			<ul class="pagination justify-content-center">
		    	<li class="page-item">
			      <a class="page-link" href="${pageContext.request.contextPath }/board/list?pageNum=${pageDto.currentPage - 1 }" aria-label="Previous">
			        <span aria-hidden="true">&laquo;</span>
			      </a>
			    </li>
				
			<c:forEach var="i" begin="${pageDto.startPage }" end="${pageDto.endPage }" step="1">
				<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath }/board/list?pageNum=${i}">${i }</a></li>
			</c:forEach>
			
				<li class="page-item">
			      <a class="page-link" href="${pageContext.request.contextPath }/board/list?pageNum=${pageDto.currentPage + 1 }" aria-label="Next">
			        <span aria-hidden="true">&raquo;</span>
			      </a>
			    </li>
			</ul>	
		</nav>
		<!-- 게시판 -->
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