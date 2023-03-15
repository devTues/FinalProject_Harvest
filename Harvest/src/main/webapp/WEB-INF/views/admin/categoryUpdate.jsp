<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/resources/harVest_css/category.css" rel="stylesheet" type="text/css" >
<title>categoryUpdate</title>
</head>
<body>
<jsp:include page="sidebar.jsp"></jsp:include>
<form action="${pageContext.request.contextPath}/admin/categoryUpdatePro?IDX=${cateDTO.idx}"  method="POST">
	<div class="cateUpdate">
		IDX :	${cateDTO.idx} <br>
		CODE : <input type="text" name="CODE"> <br>
		CATEGORY_Nm :	<input type="text" name="CATEGORY_Nm"> <br>
		<input type="submit" value="수정" class="btn btn-dark">
	</div>
</form>
</body>
</html>