<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notice.jsp</title>
</head>
<body>
<jsp:include page="sidebar.jsp"></jsp:include>
<form action="${pageContext.request.contextPath}/admin/write">
   
   <div class="list_bar">
   		<h3 class="page-name">공지사항</h3>
   </div>
   
   <div class="notice_btn">
   		<input type="submit" value="글쓰기">
   </div>
   
    
   <table  class="rwd-table">
	  <tbody>
	  
      <tr class="color_menu">
          <th>글번호</th>
          <th>제목</th>
          <th>작성날짜</th>
          <th>작성자</th>
      </tr>
      
      <c:forEach var="noticeDTO" items="${noticeList}">
      <tr class="KOTRA-fontsize-80">
      	<td>${noticeDTO.IDX}</td>
      	<td><a href="${pageContext.request.contextPath}/admin/boardDetail?IDX=${noticeDTO.IDX}">${noticeDTO.TITLE}</a></td>
      	<td>${noticeDTO.DATE}</td>
      	<td>${noticeDTO.ID}</td>
      </tr>
      </c:forEach>
      
     </tbody>
 	</table>
 	<div class="paging">
	 	<c:if test="${pageDto.startPage > pageDto.pageBlock }">
			<a href="${pageContext.request.contextPath }/admin/notice?pageNum=${pageDto.startPage - pageDto.pageBlock}">◀</a>
		</c:if>
		
		<c:forEach var = "i" begin = "${pageDto.startPage }" end = "${pageDto.endPage }" step = "1">  <!-- i가 startPage부터 endPage까지 1씩 증가-->
			<a href="${pageContext.request.contextPath }/admin/notice?pageNum=${i}">${i }</a>
		</c:forEach>
		
		<c:if test="${pageDto.endPage < pageDto.pageCount }">
			<a href="${pageContext.request.contextPath }/admin/notice?pageNum=${pageDto.startPage +  pageDto.pageBlock}">▶</a>
		</c:if>
	</div>


</form>    
</body>
</html>