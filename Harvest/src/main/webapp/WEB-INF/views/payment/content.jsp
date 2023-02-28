<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>선물고르기</h1>
<form action="${pageContext.request.contextPath }/payment/payment" method="get">
${dto.name}님이 로그인하셨습니다.<br>
<%-- ${sessionScope.id} --%>
<script type="text/javascript">
function clickCheck(target) {
    document.querySelectorAll(`input[type=checkbox]`)
        .forEach(el => el.checked = false);
    target.checked = true;
}
</script>

<label for="1">1</label>
<input type="checkbox" id="1" name="idx" value="1" onclick="clickCheck(this)">

<label for="2">2</label>
<input type="checkbox" id="2" name="idx" value="2" onclick="clickCheck(this)">

<input type="submit" value="후원하기">
</form>

</body>
</html>