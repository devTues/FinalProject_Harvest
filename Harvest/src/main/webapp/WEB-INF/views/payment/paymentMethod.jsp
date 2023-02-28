<%@page import="org.springframework.context.annotation.Import"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카드정보 등록</title>
</head>
<body>

<!-- <form action="{빌링키 발급 요청을 받을 서비스 URL}", method="post"> -->
<%-- <form action="${pageContext.request.contextPath }/payment/restApi" method="post"> --%>
  <!--예: https://www.myservice.com/subscription/issue-billing-->
<!--     <div> -->
<!--         <label for="card_number">카드 번호</label> -->
<!--         <input id="card_number" type="pass" name="card_number" placeholder="XXXX-XXXX-XXXX-XXXX"> -->
<!--     </div> -->
<!--     <div> -->
<!--         <label for="expiry">카드 유효기간</label> -->
<!--         <input id="expiry" type="text" name="expiry" placeholder="YYYY-MM"> -->
<!--     </div> -->
<!--     <div> -->
<!--         <label for="birth">생년월일</label> -->
<!--         <input id="birth" type="text" name="birth" placeholder="YYMMDD"> -->
<!--     </div> -->
<!--     <div> -->
<!--         <label for="pwd_2digit">카드 비밀번호 앞 두자리 </label> -->
<!--         <input id="pwd_2digit" type="text" name="pwd_2digit" placeholder="XX"> -->
<!--     </div> -->

	<!-- 비인증결제 customer_uid 값 히든으로 넘거야함
	PG사가 발급한 빌링키와 1:1로 맵핑되는 가맹점이 지정한 고유값입니다. customer_uid 는 카드번호 단위로구분되서 저장되어야 합니다.
	예) 홍길동 고객이 A카드 빌링키를 요청하는 경우 customer_uid는 회원별 카드번호 단위로 고유하게 발급되어야 합니다.
	  --> 
<%--     <input type="hidden" value="${dto.name}" name="customer_uid"> --%>
    
<!--     <input type="submit" value="결제방법 저장"> -->
    
<!--   </form> -->
  
<!--   <script type="text/javascript"> -->
  
<!--   </script> -->
<form action="${pageContext.request.contextPath }/payment/paymentPro" method="GET">
API KEY:<input type="text" name="api" id="api"><br>
API SECRET KEY: <input type="text" name="apikey" id="apikey">
<input type="submit" value="전송">
</form>
</body>

</html>