<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/resources/harVest_css/admin.css" rel="stylesheet" type="text/css" >
<link href="${pageContext.request.contextPath}/resources/harVest_css/category.css" rel="stylesheet" type="text/css" >
<title>category.jsp</title>
</head>
<body>
<jsp:include page="sidebar.jsp"></jsp:include>
<form action="${pageContext.request.contextPath}/admin/categoryRegister">
   <div class="list_bar">
   		<h3 class="page-name">카테고리 등록</h3>
   </div>
	<input class="register btn btn-dark" type="submit" name="cate_register"  value="등록">
	<table class="rwd-table">
		<tbody>
			<tr class="color_menu">
	            <th>카테고리 IDX</th>
	            <th>카테고리 코드</th>
	            <th>카테고리 명</th>
	            <th>수정/삭제</th>
			</tr>
			<c:forEach var="catedto" items="${categoryList}">
			<tr class="KOTRA-fontsize-80">
	        	<td>${catedto.idx}</td> 
	        	<td>${catedto.categoryCd}</td>
	        	<td>${catedto.categoryNm}</td>
	        	<td>
	        		<a href="${pageContext.request.contextPath}/admin/categoryUpdate?IDX=${catedto.idx}"><input type="button" class="btn btn-dark" value="수정"></a>
					<a href="${pageContext.request.contextPath}/admin/categoryDelete?IDX=${catedto.idx}"><input type="button" class="btn btn-dark"  value="삭제"></a>
	        	</td>
			</tr>
	    	</c:forEach>
		</tbody>
	</table>
	
</form>
</body>
</html>