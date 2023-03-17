<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/resources/harVest_css/admin.css"rel="stylesheet" type="text/css" >
<title>userView.jsp</title>
</head>
<body>
<jsp:include page="sidebar.jsp"></jsp:include>
   <div class="list_bar">
   		<h3 class="page-name">회원상세정보</h3>
   </div>
   <div class=value>
	   <h5>회원상세정보</h5>
	   <a href="${pageContext.request.contextPath}/admin/userList"><input id="ulist" type="button" class="btn-dark" value="목록"></a>
   </div>>
   <table  class="rwd-table">
   		<tbody>
	        <tr class="color_menu">
	            <th>회원아이디</th>
	            <th>이름</th>
	            <th>회원번호</th>
	            <th>회원상태</th>
	        </tr>
	        <tr class="KOTRA-fontsize-80">
	        	<td>${userDTO.id}</td>
	        	<td>${userDTO.name}</td>
	        	<td>${userDTO.idx}</td>
	        	<td>${userDTO.codeNm}</td>
	        </tr>
	        <tr class="color_menu">
	            <th>비밀번호</th>
	            <th>연락처</th>
	            <th>취향</th>
	            <th>이벤트알람여부</th>
	        </tr>
	        
	        <tr class="KOTRA-fontsize-80">
	        	<td>${userDTO.pass}</td>
	        	<td>${userDTO.phone}</td>
	        	<td>${userDTO.prefer}</td>
	        	<td>${userDTO.eventAlr}</td>
	        </tr>
        </tbody>
    </table>
   <hr>
   <h5>진행한 프로젝트 목록</h5>
   <table  class="rwd-table">
   		<tbody>
	        <tr class="color_menu">
	            <th>프로젝트 번호</th>
	            <th>창작자 ID</th>
	            <th>프로젝트 제목</th>
	            <th>목표금액</th>
	            <th>프로젝트 시작일</th>
	            <th>프로젝트 마감일</th>
	            <th>프로젝트 검토상태</th>
	        </tr>
		    
			<c:forEach var="proDTO" items="${proList}">
		        <tr class="KOTRA-fontsize-80">
		        	<td><a href="${pageContext.request.contextPath}/admin/userDetail">${proDTO.idx}</a></td>
		        	<td>${proDTO.id}</td>
		        	<td>${proDTO.title}</td>
		        	<td>${proDTO.targetAmt}</td>
		        	<td>${proDTO.start}</td>
		        	<td>${proDTO.end}</td>
		        	<td>${proDTO.codeNm}</td>
		        </tr>
		    </c:forEach>
		    
        </tbody>
    </table>
    
    <hr>
    <h5>후원한 프로젝트 목록</h5>
    <table  class="rwd-table">
   		<tbody>
	        <tr class="color_menu">
	            <th>프로젝트번호</th>
	            <th>결제 상태</th>
	            <th>결제 금액</th>
	            <th>후원 날짜</th>
	        </tr>
			<c:forEach var="PaymentDTO" items="${payList}">
		        <tr class="KOTRA-fontsize-80">
		        	<td>${PaymentDTO.pjIdx}</td>
		        	<td>${PaymentDTO.codeNm}</td>
		        	<td>${PaymentDTO.amount}</td>
		        	<td>${PaymentDTO.date}</td>
		        </tr>
		    </c:forEach>
        </tbody>
    </table>
</body>
</html>