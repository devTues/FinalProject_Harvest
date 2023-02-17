<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Start your development with JoeBLog landing page.">
    <meta name="author" content="Devcrud">
    <title>harVest</title>
    <!-- font icons -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/vendors/themify-icons/css/themify-icons.css">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
    <!-- Bootstrap + JoeBLog main styles -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/joeblog.css">
</head>
<body data-spy="scroll" data-target=".navbar" data-offset="40" id="home">

	<!-- page-header -->
  	<jsp:include page="../inc/header.jsp"></jsp:include>
    
    <!-- 본문 내용 -->
	<div class="container">
		<div class="btn-group show">
			<ul class="navbar-nav">
				<li class="nav-item dropdown"><a class="btn btn-sm btn-outline-secondary dropdown-toggle text-dark mt-5 mb-2" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">달성률</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#"><small class="text-danger">전체보기</small></a>
						<a class="dropdown-item" href="#"><small>75% 이하</small></a>
						<a class="dropdown-item" href="#"><small>75% ~ 100%</small></a>
						<a class="dropdown-item" href="#"><small>100% 이상</small></a>
					</div>
				</li>
			</ul>
		</div>
	</div>
	<div class="container mt-2 mb-4"><b style="color: red; white-space: nowrap;">${getCount }</b>개의 프로젝트가 있습니다.</div>
	<input type="hidden" value="${sessionScope.id}">
	
	<!-- !!! 카테고리 메뉴항목 배열로 4줄씩 가져오기 -->
	<div class="container">
		<div class="page-container">
			<div class="page-content">
				<!-- 주목할 만한 프로젝트 4줄 정렬-->
				<div class="row">
				<c:forEach var="projectDTO" items="${getNewList }">
					<div class="col-md-3 col-sm-6">
						<div class="card text-left">
							<div class="card-header p-0">
								<!-- 찜버튼 -->
								<div class="blog-media">
									<img src="${pageContext.request.contextPath }/resources/assets/imgs/${projectDTO.img1 }" alt="" class="w-100">
                                   		<c:if test="${empty sesssionScope.id}">
										<img style="position:absolute; top:5px;right:5px;z-index:9999;cursor:pointer;" width="20" height="20" id="likeBtn_${projectDTO.idx }" class="heart" src="${pageContext.request.contextPath}/resources/harVest_img/${projectDTO.heart}">
										</c:if>
								</div>
							</div>
							<div class="card-body px-0">
								<p class="my-2">${projectDTO.category } | ${projectDTO.creNm }</p>
								<input type="hidden" id="pjIdx_${projectDTO.idx }" value="${projectDTO.idx }">
								<h5 class="card-title mb-2">${projectDTO.title }</h5>
								<span class="text-danger">${Math.round(projectDTO.totalAmt / projectDTO.targetAmt * 100)}%</span> <small><fmt:formatNumber value="${projectDTO.totalAmt}" pattern="#,###"/>원</small>
								<div class="progress mt-2 mb-3">
									<div class="progress-bar bg-danger" role="progressbar" style="width: ${Math.round(projectDTO.totalAmt / projectDTO.targetAmt * 100)}%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">
										<jsp:useBean id="javaDate" class="java.util.Date" />
										<fmt:formatDate var="nowDate" value="${javaDate}" pattern="yyyy-MM-dd"/>
										<fmt:parseNumber value="${javaDate.time / (1000*60*60*24)}" integerOnly="true" var="start"></fmt:parseNumber>
										<fmt:parseDate value="${projectDTO.end }" var="endDate" pattern="yyyy-MM-dd"/>
										<fmt:parseNumber value="${projectDTO.end.time / (1000*60*60*24)}" integerOnly="true" var="end"></fmt:parseNumber>
										<c:if test="${end - start < 1}">
										<span>오늘 마감</span>
										</c:if>
										<c:if test="${end - start > 0}">
										<span>${end - start }일 남음</span>
										</c:if>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
				<!-- 주목할 만한 프로젝트 4줄 정렬 끝-->
				</div>
			</div>
		</div>
	</div>

    <!-- Page Footer -->
    <jsp:include page="../inc/footer.jsp"></jsp:include>

	<!-- core  -->
	<script src="${pageContext.request.contextPath }/resources/assets/vendors/jquery/jquery-3.4.1.js"></script>
	<script src="${pageContext.request.contextPath }/resources/assets/vendors/bootstrap/bootstrap.bundle.js"></script>

	<!-- JoeBLog js -->
	<script src="${pageContext.request.contextPath }/resources/assets/js/joeblog.js"></script>
	
	<script type="text/javascript">
	$(document).ready(function(){
		$(".heart").click(like)
	})
	
	function like() {
		let pjIdx = this.id.split('_')[1];
		if(${empty sessionScope.id}){
			alert('로그인 후 이용해주세요');
			return;
		}
		
		$.ajax({
			  url	: "${pageContext.request.contextPath}/project/likePro", // 요청이 전송될 URL 주소
			  type	: "POST", // http 요청 방식 (default: ‘GET’)
			  data  : {'PJ_IDX' : pjIdx,
				  	   'USER_ID' : '${sessionScope.id}'}, // TODO session 아이디로 바까라 좋은말 할때...
			  //processData : true, // 데이터를 컨텐트 타입에 맞게 변환 여부
			  success : function(data) {
				  alert("성공");
				  var src = $('#likeBtn_' + pjIdx).attr('src');
				  src = src.substring(0, src.lastIndexOf('/') + 1) + data;
				  $('#likeBtn_' + pjIdx).attr('src', src);
			  }
			})
	}
	
	</script>

</body>
</html>