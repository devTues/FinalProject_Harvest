<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/resources/harVest_css/admin.css"rel="stylesheet" type="text/css" >
</head>
<body>
<jsp:include page="sidebar.jsp"></jsp:include>
   <div class="list_bar">
   		<h3 class="page-name">프로젝트심사</h3>
   </div>
   
   <div class="tabmenu out-tabmenu" style="width:100vw !important;">
	  <ul>
	    <li id="tab1" class="btnCon"> 
	      <input type="radio" checked name="tabmenu" id="tabmenu1">
	      <label for="tabmenu1">프로젝트 심사중</label>
	      <div class="tabCon" >
	      	<table  class="rwd-table">
		   		<tbody>
			        <tr class="color_menu">
			            <th>프로젝트번호</th>
			            <th>프로젝트명</th>
			            <th>창작자 ID</th>
			            <th>창작자 이름</th>
			            <th>프로젝트마감일</th>
			            <th>심사현황</th>
			        </tr>
					<c:forEach var="proDTO" items="${judgeList}">
			        <tr class="KOTRA-fontsize-80">
			        	<td><a href="${pageContext.request.contextPath}/admin/judgeDetail?PJ_IDX=${proDTO.idx}">${proDTO.idx}</a></td>
			        	<td>${proDTO.title}</td>
			        	<td>${proDTO.id}</td>
			        	<td>${proDTO.creNm}</td>
			        	<td>${proDTO.end}</td>
			        	<td>${proDTO.codeNm}</td>
				    </tr>
		        	</c:forEach>
		        </tbody>
    		</table>
    		<div class="paging">
			    <c:if test="${pageDto.startPage > pageDto.pageBlock }">
					<a href="${pageContext.request.contextPath }/admin/projectJudge?pageNum=${pageDto.startPage - pageDto.pageBlock}">[10페이지 이전] </a>
				</c:if>
			
				<c:forEach var="i" begin="${pageDto.startPage }" end="${pageDto.endPage }" step="1">
					<a href="${pageContext.request.contextPath }/admin/projectJudge?pageNum=${i}">${i}</a> 
				</c:forEach>
				
				<c:if test="${pageDto.endPage < pageDto.pageCount}">
					<a href="${pageContext.request.contextPath }/admin/projectJudge?pageNum=${pageDto.startPage + pageDto.pageBlock}">[10페이지 다음] </a>
				</c:if>
			</div>
	      </div>
	    </li>

	    
	    <li id="tab2" class="btnCon"><input type="radio" name="tabmenu" id="tabmenu2">
	      <label for="tabmenu2">프로젝트 심사완료</label>
	      <div class="tabCon">
	      	<table  class="rwd-table">
		   		<tbody>
			        <tr class="color_menu">
			            <th>프로젝트번호</th>
			            <th>프로젝트명</th>
			            <th>창작자ID</th>
			            <th>프로젝트마감일</th>
			            <th>심사현황</th>
			        </tr>
					<c:forEach var="proDto2" items="${judgeFinish}">
			        <tr class="KOTRA-fontsize-80">
			        	<td>${proDto2.idx}</td>
			        	<td>${proDto2.title}</td>
			        	<td>${proDto2.id}</td>
			        	<td>${proDto2.end}</td>
			        	<td>${proDto2.codeNm}</td>
				    </tr>
		        	</c:forEach>
		        </tbody>
    		</table>
	   		<div class="paging">
			    <c:if test="${pageDto2.startPage > pageDto2.pageBlock }">
					<a href="${pageContext.request.contextPath }/admin/projectJudge?pageNum=${pageDto.startPage - pageDto.pageBlock}">[10페이지 이전] </a>
				</c:if>
			
				<c:forEach var="i" begin="${pageDto2.startPage }" end="${pageDto2.endPage }" step="1">
					<a href="${pageContext.request.contextPath }/admin/projectJudge?pageNum=${i}">${i}</a> 
				</c:forEach>
				
				<c:if test="${pageDto2.endPage < pageDto2.pageCount}">
					<a href="${pageContext.request.contextPath }/admin/projectJudge?pageNum=${pageDto.startPage + pageDto.pageBlock}">[10페이지 다음] </a>
				</c:if>
			</div>
	      </div>
	    </li>    
	  </ul>
	</div>
</body>
</html>