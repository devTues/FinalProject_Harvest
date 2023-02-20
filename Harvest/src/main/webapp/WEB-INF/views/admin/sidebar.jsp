<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/resources/css/admin.css" rel="stylesheet" type="text/css" >
<title>sidebar.jsp</title>
	<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.3.min.js"></script>
	<script>
			    $(function () {
			        $(".left_sub_menu").hide();
			        $(".has_sub").click(function () {
			            $(".left_sub_menu").fadeToggle(300);
			        });
			        // 왼쪽메뉴 드롭다운
			        $(".sub_menu ul.small_menu").hide();
			        $(".sub_menu ul.big_menu").click(function () {
			            $("ul", this).slideToggle(300);
			        });
			        // 외부 클릭 시 좌측 사이드 메뉴 숨기기
			        $('.overlay').on('click', function () {
			            $('.left_sub_menu').fadeOut();
			            $('.hide_sidemenu').fadeIn();
			        });
			    });
	</script>
</head>
<body>
	<div id="wrapper">
        <div class="topbar" style="position: absolute; top:0;">
            <!-- 왼쪽 메뉴 -->
            <div class="left side-menu">
                <div class="sidebar-inner">
                    <div id="sidebar-menu">
                        <ul>
                            <li class="has_sub"><a href="javascript:void(0);" class="waves-effect">
                                <i class="fas fa-bars"></i>
                            </a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- 왼쪽 서브 메뉴 -->
            <div class="left_sub_menu">
                <div class="sub_menu">
<!--                     <input type="search" name="SEARCH" placeholder="SEARCH"> -->
                    <h2>관리자페이지</h2>
                    <ul class="big_menu">
                        <li>회원관리 <i class="arrow fas fa-angle-right"></i></li>
                        <ul class="small_menu">
                            <li><a href="${pageContext.request.contextPath}/admin/userList">전체회원목록</a></li>
                        </ul>
                    </ul>
                    
                    <ul class="big_menu">
                        <li>프로젝트관리 <i class="arrow fas fa-angle-right"></i></li>
                        <ul class="small_menu">
                            <li><a href="${pageContext.request.contextPath}/admin/projectJudge">프로젝트심사</a></li>
                            <li><a href="${pageContext.request.contextPath}/admin/projectStatus">프로젝트현황</a></li>
                            <li><a href="${pageContext.request.contextPath}/admin/category">카테고리관리</a></li>
                        </ul>
                    </ul>
                    
                   	<ul class="big_menu">
                   		<li>결제관리<i class="arrow fas fa-angle-right"></i></li>
                   		 <ul class="small_menu">
                            <li><a href="${pageContext.request.contextPath}/admin/payStatus">결제관리</a></li>
                        </ul>
                  	</ul>
                    
                    <ul class="big_menu">
                        <li>커뮤니티관리</li>
                         <ul class="small_menu">
                            <li><a href="${pageContext.request.contextPath}/admin/notice">공지사항</a></li>
                        	<li><a href="${pageContext.request.contextPath}/admin/notice">1:1문의</a></li>
                        </ul>
                    </ul>
                </div>
            </div>
            <div class="overlay"></div>
        </div>
   </div>
</body>
</html>