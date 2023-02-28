<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후원제품선택페이지</title>
</head>
<body>

<form action="${pageContext.request.contextPath}/payment/content" method="get">
아이디 : <input type="text" name="id"><br>
비밀번호 : <input type="password" name="pass"><br>

<input type="submit" value="로그인">
<!-- 접속하면 서버에 세션값저장됨 -->
</form>



</body>
</html>