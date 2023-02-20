<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/resources/css/admin.css" rel="stylesheet" type="text/css" >
<link href="${pageContext.request.contextPath}/resources/css/judgeDetail.css" rel="stylesheet">
<title>judgeDetail.jsp</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script>

$(document).ready(function(){

    $(".project_info").load("${pageContext.request.contextPath}/admin/example");

});

</script>
</head>
<body>

<form action="${pageContext.request.contextPath}/admin/projectUpdate?proIDX=${proIDX}" method="POST">
<jsp:include page="sidebar.jsp"></jsp:include>
	<div id="projWrapper">
		<div class="project_info">
			여긴 창작자가 작성한 프로젝트 글을 불러올 영역임. <br>
			관리자는 그 글을 보고 심사를 한 뒤 승인 / 반려 버튼을 누름. <br>
		</div>
		
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