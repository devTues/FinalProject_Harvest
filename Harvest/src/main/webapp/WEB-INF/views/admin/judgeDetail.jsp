<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/resources/harVest_css/admin.css" rel="stylesheet" type="text/css" >
<link href="${pageContext.request.contextPath}/resources/harVest_css/judgeDetail.css" rel="stylesheet">
<title>judgeDetail.jsp</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
</head>
<body>

<form action="${pageContext.request.contextPath}/admin/projectUpdate?PJ_IDX=${PJ_IDX}" method="POST">
<jsp:include page="sidebar.jsp"></jsp:include>
	<div id="projWrapper">
		<iframe src="${pageContext.request.contextPath }/project/projectInfo?idx=${PJ_IDX }"  width="1000px" height="600px"></iframe>
		
		<div class="project_submit">
			<div>
				<input type="submit"  value="승인" name="judge">
				<input type="submit"  value="반려" name="judge">
			</div>
		</div>
	</div>
</form>
</body>
</html>