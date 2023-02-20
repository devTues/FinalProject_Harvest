<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/resources/css/admin.css"rel="stylesheet" type="text/css" >
<title>userView.jsp</title>
</head>
<body>
<jsp:include page="sidebar.jsp"></jsp:include>
   <div class="list_bar">
   		<h3 class="page-name">회원상세정보</h3>
   </div>
   <div class=value>
	   <h5>회원상세정보</h5>
	   <a href="${pageContext.request.contextPath}/admin/userList"><input id="ulist" type="button" value="목록"></a>
   </div>>
   <table  class="rwd-table">
   		<tbody>
	        <tr class="color_menu">
	            <th>회원아이디</th>
	            <th>이름</th>
	            <th>가입일</th>
	            <th>회원상태</th>
	        </tr>
			

	        <tr class="KOTRA-fontsize-80">
	        	<td>${userDTO.userId}</td>
	        	<td>${userDTO.userName}</td>
	        	<td>${userDTO.userDate}</td>
	        	<td>${userDTO.UNREGISTDETAIL}</td>
<!-- 	        	<td> -->
<%-- 		        	<input type="hidden" name="userId" value="${userDTO.userId}" > --%>
<!-- 		        	<input type="submit" value="계정상태변경"> -->
<!-- 		        </td> -->
	        </tr>
	        
	        <tr class="color_menu">
	            <th>배송지</th>
	            <th>연락처</th>
	            <th>이메일</th>
	            <th>취향</th>
	        </tr>
	        
	        <tr class="KOTRA-fontsize-80">
	        	<td>${userDTO.userAddress}</td>
	        	<td>${userDTO.userPhone}</td>
	        	<td>${userDTO.userEmail}</td>
	        	<td>${userDTO.userLike}</td>
	        </tr>
        </tbody>
    </table>
    
   <hr>
   
   <h5>진행한 프로젝트 목록</h5>
   <table  class="rwd-table">
   		<tbody>
	        <tr class="color_menu">
	            <th>프로젝트번호</th>
	            <th>프로젝트제목</th>
	            <th>펀딩시작일</th>
	            <th>펀딩마감일</th>
	            <th>펀딩진행상태</th>
	        </tr>
			<c:forEach var="proDTO" items="${proList}">
		        <tr class="KOTRA-fontsize-80">
		        	<td><a href="${pageContext.request.contextPath}/admin/userDetail">${proDTO.IDX}</a></td>
		        	<td>${proDTO.TITLE}</td>
		        	<td>${proDTO.PROSTART}</td>
		        	<td>${proDTO.PROEND}</td>
		        	<td>${proDTO.FUNDSTATUS}</td>
		        </tr>
		    </c:forEach>
        </tbody>
    </table>
    <hr>
    <h5>후원한 프로젝트 목록</h5>
    <table  class="rwd-table">
   		<tbody>
	        <tr class="color_menu">
	            <th>프로젝트제목</th>
	            <th>후원금액</th>
	            <th>펀딩진행상태</th>
	            <th>결제상태</th>
	        </tr>
			<c:forEach var="payDTO" items="${payList}">
		        <tr class="KOTRA-fontsize-80">
		        	<td>${payDTO.PTITLE}</td>
		        	<td>${payDTO.AMOUNT}</td>
		        	<td>${payDTO.FUNDSTATUS}</td>
		        	<td>${payDTO.PSTATUS}</td>
		        </tr>
		    </c:forEach>
        </tbody>
    </table>
</body>
</html>