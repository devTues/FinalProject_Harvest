<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/resources/css/admin.css"rel="stylesheet" type="text/css" >
<title>userList</title>
</head>
<body>
<jsp:include page="sidebar.jsp"></jsp:include>
<form action="${pageContext.request.contextPath}/admin/updatePro" method="POST">
   <div class="list_bar">
   		<h3 class="page-name">회원전체목록</h3>
        <ul>
            <li>
            	<select id ="select_value">
            		<option value="id">아이디</option>
            		<option value="name">이름</option>
            	</select>
            	
            	<input type="search" name="SEARCH" placeholder="SEARCH"> 
<%--             	<a href="${pageContext.request.contextPath}/admin/listPageSearch"> --%>
            	<a href="${pageContext.request.contextPath}/admin/listPageSearch"><input type="button" value="검색" name="search"></a>
            	
            </li>
        </ul>
   </div>
   <table  class="rwd-table">
   		<tbody>
	        <tr class="color_menu">
	            <th>회원아이디</th>
	            <th>이름</th>
	            <th>가입일</th>
	            <th>회원상태</th>
	            <th>회원상태변경</th>
	        </tr>
<%-- <a href="${pageContext.request.contextPath}/admin/userView?userId=${dto.userId}">${dto.userId}</a --%>
			<c:forEach var="dto" items="${userList}">
				<c:if test="${dto.userId != 'admin'}">
			        <tr class="KOTRA-fontsize-80">
			        	<td><a href="${pageContext.request.contextPath}/admin/userView?userId=${dto.userId}">${dto.userId}</a></td>
			        	<td>${dto.userName}</td>
			        	<td>${dto.userDate}</td>
			        	<td>${dto.UNREGISTDETAIL}</td>
			        	<td>
				        	<input type="hidden" name="userId" value="${dto.userId}">
				        	<input type="button" value="계정상태변경" onClick="location.href='${pageContext.request.contextPath}/admin/updatePro?userId=${dto.userId}'">
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