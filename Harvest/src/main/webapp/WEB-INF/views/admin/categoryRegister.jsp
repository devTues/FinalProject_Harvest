<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/resources/harVest_css/category.css" rel="stylesheet" type="text/css" >
<title>categoryRegister</title>
</head>
<body>
<jsp:include page="sidebar.jsp"></jsp:include>
<form action="${pageContext.request.contextPath}/admin/categoryRegisterPRO" method="Post">
	<div class="catewriteForm">
		CATEGORY_CODE: <input type="text" name="CODE"><br>
		CATEGORY_Nm	: <input type="text" name="CATEGORY_Nm"><br>
	<input type = "submit" name="write_btn" value="등록">
	</div>
</form>
</body>
</html>