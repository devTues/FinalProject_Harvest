<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
	<div class="container mt-5 mb-4"><b style="color: red; white-space: nowrap;">${getCount }</b>개의 프로젝트가 있습니다.
	</div>
	
	<!-- !!! 카테고리 메뉴항목 배열로 4줄씩 가져오기 -->
	<div class="container">
		<div class="page-container">
			<div class="page-content">
				<!-- 주목할 만한 프로젝트 4줄 정렬-->
				<div class="row">
				<c:forEach var="getPopList" items="${getPopList }">
					<div class="col-md-3 col-sm-6">
						<div class="card text-left">
							<c:if test="${getPopList.STATUS == 'PJT01'}">
							<div class="card-header p-0">
								<!-- 찜버튼 -->
								<div class="blog-media">
									<a href="${pageContext.request.contextPath }/project/projectInfo?idx=${getPopList.IDX }">
										<img src="${pageContext.request.contextPath }/resources/upload/${fn:split(getPopList.IMG1,'&')[0]}" alt="" class="w-100">
									</a>
                                   		<c:if test="${empty sesssionScope.id}">
										<img style="position:absolute; top:5px;right:5px;z-index:10;cursor:pointer;" width="20" height="20" id="likeBtn_${getPopList.IDX }" class="heart" src="${pageContext.request.contextPath}/resources/harVest_img/${getPopList.HEART}">
										</c:if>
								</div>
							</div>
							
							<div class="card-body px-0">
								<p class="my-2">${getPopList.CATEGORY } | ${getPopList.CRE_NM }</p>
								<input type="hidden" id="pjIdx_${getPopList.IDX }" value="${getPopList.IDX }">
								<a href="${pageContext.request.contextPath }/project/projectInfo?idx=${getPopList.IDX }">
									<h5 class="card-title mb-2">${getPopList.TITLE }</h5>
								</a>	
								<span class="text-danger">${getPopList.PERCENT}%</span> <small><fmt:formatNumber value="${getPopList.TOTAL_AMT}" pattern="#,###"/>원</small>
								<div class="progress mt-2 mb-3">
									<div class="progress-bar bg-danger" role="progressbar" style="width: ${getPopList.PERCENT}%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">
										<jsp:useBean id="javaDate" class="java.util.Date" />
										<fmt:formatDate var="nowDate" value="${javaDate}" pattern="yyyy-MM-dd"/>
										<fmt:parseNumber value="${javaDate.time / (1000*60*60*24)}" integerOnly="true" var="START"></fmt:parseNumber>
										<fmt:parseDate value="${getPopList.END }" var="endDate" pattern="yyyy-MM-dd"/>
										<fmt:parseNumber value="${getPopList.END.time / (1000*60*60*24)}" integerOnly="true" var="END"></fmt:parseNumber>
										<c:if test="${END - START < 1}">
										<span>오늘 마감</span>
										</c:if>
										<c:if test="${END - START > 0}">
										<span>${END - START }일 남음</span>
										</c:if>
									</div>
								</div>
							</div>
							</c:if>
							
							<c:if test="${getPopList.STATUS == 'FD00'}">
							<div class="card-header p-0">
								<!-- 찜버튼 -->
								<div class="blog-media">
									<a href="${pageContext.request.contextPath }/project/projectInfo?idx=${getPopList.IDX }">
										<img style="filter:grayscale(1);" src="${pageContext.request.contextPath }/resources/upload/${fn:split(getPopList.IMG1,'&')[0]}" alt="" class="w-100">
									</a>
                                   		<c:if test="${empty sesssionScope.id}">
										<img style="position:absolute; top:5px;right:5px;z-index:10;cursor:pointer;" width="20" height="20" id="likeBtn_${getPopList.IDX }" class="heart" src="${pageContext.request.contextPath}/resources/harVest_img/${getPopList.HEART}">
										</c:if>
								</div>
							</div>
							
							<div class="card-body px-0">
								<p class="my-2">${getPopList.CATEGORY } | ${getPopList.CRE_NM }</p>
								<input type="hidden" id="pjIdx_${getPopList.IDX }" value="${getPopList.IDX }">
								<a href="${pageContext.request.contextPath }/project/projectInfo?idx=${getPopList.IDX }">
									<h5 class="card-title mb-2">${getPopList.TITLE }</h5>
								</a>	
								<span class="text-secondary">${getPopList.PERCENT}%</span> <small><fmt:formatNumber value="${getPopList.TOTAL_AMT}" pattern="#,###"/>원</small>
								<div class="progress mt-2 mb-3">
									<div class="progress-bar bg-dark" role="progressbar" style="width: ${getPopList.PERCENT}%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">
										<span>펀딩 실패</span>
									</div>
								</div>
							</div>
							</c:if>
							
							<c:if test="${getPopList.STATUS == 'FD01'}">
							<div class="card-header p-0">
								<!-- 찜버튼 -->
								<div class="blog-media">
									<a href="${pageContext.request.contextPath }/project/projectInfo?idx=${getPopList.IDX }">
										<img style="filter:grayscale(1);" src="${pageContext.request.contextPath }/resources/upload/${fn:split(getPopList.IMG1,'&')[0]}" alt="" class="w-100">
									</a>
                                   		<c:if test="${empty sesssionScope.id}">
										<img style="position:absolute; top:5px;right:5px;z-index:10;cursor:pointer;" width="20" height="20" id="likeBtn_${getPopList.IDX }" class="heart" src="${pageContext.request.contextPath}/resources/harVest_img/${getPopList.HEART}">
										</c:if>
								</div>
							</div>
							
							<div class="card-body px-0">
								<p class="my-2">${getPopList.CATEGORY } | ${getPopList.CRE_NM }</p>
								<input type="hidden" id="pjIdx_${getPopList.IDX }" value="${getPopList.IDX }">
								<a href="${pageContext.request.contextPath }/project/projectInfo?idx=${getPopList.IDX }">
									<h5 class="card-title mb-2">${getPopList.TITLE }</h5>
								</a>	
								<span class="text-secondary">${getPopList.PERCENT}%</span> <small><fmt:formatNumber value="${getPopList.TOTAL_AMT}" pattern="#,###"/>원</small>
								<div class="progress mt-2 mb-3">
									<div class="progress-bar bg-dark" role="progressbar" style="width: ${getPopList.PERCENT}%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">
										<span>펀딩 성공</span>
									</div>
								</div>
							</div>
							</c:if>
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
	
	function like() { // 비로그인시 로그인 알람
		let pjIdx = this.id.split('_')[1];
		if(${empty sessionScope.id}){
			alert('로그인 후 이용해주세요');
			return;
		}
		
		$.ajax({
			  url	: "${pageContext.request.contextPath}/project/likePro", // 요청이 전송될 URL 주소
			  type	: "POST", // http 요청 방식 (default: ‘GET’)
			  data  : {'PJ_IDX' : pjIdx,
				  	   'USER_ID' : '${sessionScope.id}'}, // user_id 별로 저장
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