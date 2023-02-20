<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/resources/css/admin.css" rel="stylesheet" type="text/css" >
<link href="${pageContext.request.contextPath}/resources/css/category.css" rel="stylesheet" type="text/css" >
<title>category.jsp</title>
</head>
<body>
<jsp:include page="sidebar.jsp"></jsp:include>
<form action="${pageContext.request.contextPath}/admin/categoryUpdate">
   <div class="list_bar">
   		<h3 class="page-name">카테고리 관리</h3>
   </div>

   <section class="content"> 
	   <div class="flexbox">
		   <div class="item" >
		   	<p><img alt="Muffin" class=img src="${pageContext.request.contextPath}/resources/img/Baguette.png"></p>
		   	<div class="btn">
			   	<input  type="submit" value="수정" name="cate_register">
			   	<input  type="submit" value="삭제" name="cate_register">
		   	</div>
		   </div>
		   
		   <div class="item">
		    <p><img alt="Muffin" class=img src="${pageContext.request.contextPath}/resources/img/Banana.png"></p>
		   </div>
		   
		   <div class="item">
		    <p><img alt="Muffin" class=img src="${pageContext.request.contextPath}/resources/img/Coffee.png"></p>
		   </div>
		   
		   <div class="item">
		    <p><img alt="Muffin" class=img src="${pageContext.request.contextPath}/resources/img/Donut.png"></p>
		   </div>
		   
		   <div class="item">
		   	<p><img alt="Muffin" class=img src="${pageContext.request.contextPath}/resources/img/Lollipop.png"></p>
		   </div>
		   
		   <div class="item">
		   	 <p><img alt="Muffin" class=img src="${pageContext.request.contextPath}/resources/img/Baguette.png"></p>
		   </div>
		   
		   <div class="item">
		   	 <p><img alt="Muffin" class=img src="${pageContext.request.contextPath}/resources/img/Mineral Water.png"></p>
		   </div>
		   
		   <div class="item">
		  	 <p><img alt="Muffin" class=img src="${pageContext.request.contextPath}/resources/img/Salad.png"></p>
		   </div>
		   
		   <div class="item">
		   	 <p><img alt="Muffin" class=img src="${pageContext.request.contextPath}/resources/img/Baguette.png"></p>
		   </div>
		   
		   <div class="item">
		   	 <p><img alt="Muffin" class=img src="${pageContext.request.contextPath}/resources/img/Sandwich.png"></p>
		   </div>
		   
		   <div class="item">
		   	<p class="regist"><input type="submit" value="등록" name="cate_register"></p>
		   </div>
		   
		   
		</div>	
	</section>  
</form>
</body>
</html>