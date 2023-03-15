<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/resources/harVest_css/payStatus.css"rel="stylesheet" type="text/css" >
<title>userView.jsp</title>
</head>
<body>
<jsp:include page="sidebar.jsp"></jsp:include>
	<div class="list_bar">
   		<h3 class="page-name">프로젝트현황</h3>
   </div>
   
   <div class="tabmenu out-tabmenu" style="width:100vw !important;">
	  <ul>
	    <li id="tab1" class="btnCon"> 
	      <input type="radio" checked name="tabmenu" id="tabmenu1">
	      <label for="tabmenu1">진행중인 펀딩(승인된 상태)</label>
	      <div class="tabCon" >
	      	<table  class="rwd-table">
		   		<tbody>
			        <tr class="color_menu">
			            <th>프로젝트번호</th>
			            <th>프로젝트명</th>
			            <th>창작자ID</th>
			            <th>프로젝트마감일</th>
			            <th>펀딩현황</th>
			        </tr>
					<c:forEach var="proDTO" items="${projectING}">
			        <tr class="KOTRA-fontsize-80">
			        	<td>${proDTO.idx}</td>
			        	<td>${proDTO.title}</td>
			        	<td>${proDTO.id}</td>
			        	<td>${proDTO.end}</td>
			        	<td>${proDTO.codeNm}</td>
				    </tr>
		        	</c:forEach>
		        </tbody>
    		</table>
		   	<div class="paging">
			    <c:if test="${pageDto.startPage > pageDto.pageBlock }">
					<a href="${pageContext.request.contextPath }/admin/projectStatus?pageNum=${pageDto.startPage - pageDto.pageBlock}">[10페이지 이전] </a>
				</c:if>
			
				<c:forEach var="i" begin="${pageDto.startPage }" end="${pageDto.endPage }" step="1">
					<a href="${pageContext.request.contextPath }/admin/projectStatus?pageNum=${i}">${i}</a> 
				</c:forEach>
				
				<c:if test="${pageDto.endPage < pageDto.pageCount}">
					<a href="${pageContext.request.contextPath }/admin/projectStatus?pageNum=${pageDto.startPage + pageDto.pageBlock}">[10페이지 다음] </a>
				</c:if>
			</div>
	      </div>
	    </li>
	    
	    <li id="tab2" class="btnCon"><input type="radio" name="tabmenu" id="tabmenu2">
	      <label for="tabmenu2">완료된 펀딩(펀딩실패/펀딩완료)</label>
	      <div class="tabCon">
	      		      	<table  class="rwd-table">
		   		<tbody>
			        <tr class="color_menu">
			            <th>프로젝트번호</th>
			            <th>프로젝트명</th>
			            <th>창작자ID</th>
			            <th>프로젝트마감일</th>
			            <th>펀딩현황</th>
			        </tr>
					<c:forEach var="proDTO2" items="${projectFinish}">
			        <tr class="KOTRA-fontsize-80">
			        	<td>${proDTO2.idx}</td>
			        	<td>${proDTO2.title}</td>
			        	<td>${proDTO2.id}</td>
			        	<td>${proDTO2.end}</td>
			        	<td>${proDTO2.codeNm}</td>
				    </tr>
		        	</c:forEach>
		        </tbody>
    		</table>
    		<div class="paging">
			    <c:if test="${pageDto2.startPage > pageDto2.pageBlock }">
					<a href="${pageContext.request.contextPath }/admin/projectStatus?pageNum=${pageDto2.startPage - pageDto2.pageBlock}">[10페이지 이전] </a>
				</c:if>
			
				<c:forEach var="i" begin="${pageDto2.startPage }" end="${pageDto2.endPage }" step="1">
					<a href="${pageContext.request.contextPath }/admin/projectStatus?pageNum=${i}">${i}</a> 
				</c:forEach>
				
				<c:if test="${pageDto2.endPage < pageDto2.pageCount}">
					<a href="${pageContext.request.contextPath }/admin/projectStatus?pageNum=${pageDto2.startPage + pageDto2.pageBlock}">[10페이지 다음] </a>
				</c:if>
			</div>
	      </div>
	    </li>    
	    
	  </ul>
	</div>
</body>
</html>