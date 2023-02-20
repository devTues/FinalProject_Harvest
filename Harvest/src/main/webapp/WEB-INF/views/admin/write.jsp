<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>write.jsp</title>
<link href="${pageContext.request.contextPath}/resources/css/admin.css" rel="stylesheet" type="text/css" >
</head>
<body>
<form action="${pageContext.request.contextPath}/admin/writePro" method="Post">
<jsp:include page="sidebar.jsp"></jsp:include>

	<div class="writeForm">
		ID		: <input type="text" name="ID"> 	<br>	
		TITLE	: <input type="text" name="TITLE">	<br>
		CONTENT	: <input type="text" name="CONTENT"><br>
	<input type = "submit" name="write_btn" value="글작성">
	</div>
	
	
</form>
</body>
</html>