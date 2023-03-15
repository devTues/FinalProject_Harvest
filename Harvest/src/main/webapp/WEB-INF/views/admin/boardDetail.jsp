<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/resources/harVest_css/admin.css"rel="stylesheet" type="text/css" >
<title>userMain</title>
</head>
<body>
<jsp:include page="sidebar.jsp"></jsp:include>
  <table  class="rwd-table">
	  <tbody>
	  
      <tr class="color_menu">
          <th>작성자</th>
          <th>제목</th>
          <th>내용</th>
          <th>작성날짜</th>
      </tr>
      
      <tr class="KOTRA-fontsize-80">
      	<td>${noticeDTO.ID}</td>
      	<td>${noticeDTO.TITLE}</td>
      	<td>${noticeDTO.CONTENT}</td>
      	<td>${noticeDTO.DATE}</td>
      </tr>
      
     </tbody>
 	</table>

</body>
</html>