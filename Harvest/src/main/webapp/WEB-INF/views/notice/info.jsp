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
  	
  	
    <section></section>
    <!-- 본문 내용 -->
	<div class="container">
		<div class="page-container">
			<div class="page-content">
			<!-- 게시판 -->
			<article>
			
			<h1>하비스트 수수료 요금제</h1>
			<p>창작자님의 프로젝트 목표 달성에 도움을 줄 기능 및 서비스를 확인하고 요금제를 선택하세요.
		수수료는 펀딩이 성공했을 때만 부과되니 걱정마세요.</p>
			<table class="table">
			<thead>
			<tr><th class="idx">No.</th>
			    <th class="title">Notice</th>
			    <th class="id">Writer</th>
			    <th class="date">Date</th>
		    </tr>
         	</thead>
	         <tbody>
	            <tr>
	               <th scope="row">1</th>
	               <td>Mark</td>
	               <td>Otto</td>
	               <td>@mdo</td>
	            </tr>
	            <tr>
	               <th scope="row">2</th>
	               <td>Jacob</td>
	               <td>Thornton</td>
	               <td>@fat</td>
	            </tr>
	            <tr>
	               <th scope="row">3</th>
	               <td>Larry</td>
	               <td>the Bird</td>
	               <td>@twitter</td>
	            </tr>
	         </tbody>
			<c:forEach var="dto" items="${boardList }">
			<tr onclick="location.href='${pageContext.request.contextPath }/board/content?num=${dto.idx}'">
			    <td>${dto.idx}</td>
			    <td class="left">${dto.title}</td>
			    <td>${dto.id}</td>
			    <td><fmt:formatDate value="${dto.date}" pattern="yyy.MM.dd"/></td>
			</tr> 
			</c:forEach>
			
			</table>
			<div id="table_search">
			<input type="button" value="글쓰기" class="btn" 
			onclick="location.href='${pageContext.request.contextPath }/board/write'">
			</div>	
			
			<div id="page_control">
			<c:if test="${pageDto.startPage > pageDto.pageBlock}">
				<a href="${pageContext.request.contextPath }/board/list?pageNum=${pageDto.startPage - pageDto.pageBlock }">[10페이지이전]</a>
			</c:if>	
			
				<a href="${pageContext.request.contextPath }/board/list?pageNum=${pageDto.currentPage - 1 }">[이전]</a>
				
			<c:forEach var="i" begin="${pageDto.startPage }" end="${pageDto.endPage }" step="1">
				<a href="${pageContext.request.contextPath }/board/list?pageNum=${i}">${i }</a>
			</c:forEach>
			
				<a href="${pageContext.request.contextPath }/board/list?pageNum=${pageDto.currentPage + 1 }">[다음]</a>
				
			<c:if test="${pageDto.endPage < pageDto.pageCount}">
				<a href="${pageContext.request.contextPath }/board/list?pageNum=${pageDto.startPage + pageDto.pageBlock }">[10페이지다음]</a>
			</c:if>	
			</div>
			</article>
			<!-- 게시판 -->
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