<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/resources/harVest_css/admin.css"rel="stylesheet" type="text/css" >
<title>userList</title>
</head>
<body>
<jsp:include page="sidebar.jsp"></jsp:include>
<form action="${pageContext.request.contextPath}/admin/updatePro" method="POST">
   <div class="list_bar">
   		<h3 class="page-name">회원전체목록</h3>
   </div>
   <table  class="rwd-table">
   		<tbody>
	        <tr class="color_menu">
	        	<th>회원번호</th>
	            <th>회원아이디</th>
	            <th>이름</th>
	            <th>회원상태</th>
	            <th>회원상태변경</th>
	        </tr>
<%-- <a href="${pageContext.request.contextPath}/admin/userView?userId=${dto.userId}">${dto.userId}</a --%>
			<c:forEach var="dto" items="${userList}">
				<c:if test="${dto.id != 'admin@harvest.com'}">
			        <tr class="KOTRA-fontsize-80">
			        	<td>${dto.idx}</td> 
			        	<td><a href="${pageContext.request.contextPath}/admin/userView?ID=${dto.id}">${dto.id}</a></td>
			        	<td>${dto.name}</td>
			        	<td>${dto.codeNm}</td>
			        	<td>
				        	<input type="hidden" name="ID" value="${dto.id}">
				        	<input type="button" class="btn btn-dark" value="계정상태변경" onClick="location.href='${pageContext.request.contextPath}/admin/updatePro?ID=${dto.id}'">
		        		</td>
			        </tr>
		    	</c:if>
	        </c:forEach>
        </tbody>
    </table>
    
    <div class="paging">
	    <c:if test="${pageDto.startPage > pageDto.pageBlock }">
			<a href="${pageContext.request.contextPath }/admin/userList?pageNum=${pageDto.startPage - pageDto.pageBlock}">[10페이지 이전] </a>
		</c:if>

	
		<c:forEach var="i" begin="${pageDto.startPage }" end="${pageDto.endPage }" step="1">
			<a href="${pageContext.request.contextPath }/admin/userList?pageNum=${i}">${i}</a> 
		</c:forEach>
		
		<c:if test="${pageDto.endPage < pageDto.pageCount}">
			<a href="${pageContext.request.contextPath }/admin/userList?pageNum=${pageDto.startPage + pageDto.pageBlock}">[10페이지 다음] </a>
		</c:if>
	</div>
	
</form>
</body>
</html>