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
				<c:forEach var="getExpectList" items="${getExpectList }">
					<div class="col-md-3 col-sm-6">
						<div class="card text-left">
							<c:if test="${getExpectList.STATUS == 'PJT01'}">
							<div class="card-header p-0">
								<!-- 찜버튼 -->
								<div class="blog-media">
								<a href="${pageContext.request.contextPath }/project/projectOpen?idx=${getExpectList.IDX }">
									<img src="${pageContext.request.contextPath }/resources/upload/${fn:split(getExpectList.IMG1,'&')[0]}" alt="" class="w-100">
								</a>
								</div>
							</div>
							<div class="card-body px-0 new">
								<input type="hidden" id="pjIdx_${getExpectList.IDX }" value="${getExpectList.IDX }">
								<input type="hidden" id="title" value="${getExpectList.TITLE }">
								<input type="hidden" id="start" value="${getExpectList.START }">
								<input type="hidden" value="${sessionScope.id }">
								
								<p class="my-2">${getExpectList.CATEGORY } | ${getExpectList.CRE_NM }</p>
								<a href="${pageContext.request.contextPath }/project/projectOpen?idx=${getExpectList.IDX }">
									<h5 class="card-title mb-2">${getExpectList.TITLE }</h5>
								</a>	
								<span class="text-muted">${getExpectList.START } 공개예정입니다.</span><br>
								<span class="text-danger">${getExpectList.COUNT }명 알림신청 중</span>
								<p>
								<button id="btn_${getExpectList.IDX }" class="alram" style="background-color:transparent; border:1px solid transparent; border-color: #adb5bd; width:100%;">
									알림신청
									<c:if test="${empty sesssionScope.id}">
										<img width="16" height="16" id="alramBtn_${getExpectList.IDX }" src="${pageContext.request.contextPath}/resources/harVest_img/${getExpectList.ALRAM}">
										</c:if>
								</button>
								</p>
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
		$(".alram").click(alram)
	})
	
	function alram() {
		let pjIdx = this.id.split('_')[1];
		if(${empty sessionScope.id}){
			alert('로그인 후 이용해주세요');
			return;
		}
		  
		$.ajax({
			  url	: "${pageContext.request.contextPath}/project/alramPro", 
			  type	: "POST",
			   data  : {'PJ_IDX' : pjIdx,
				       'USER_ID' : '${sessionScope.id}'},
			  success : function(data) {
				  location.reload(true);
				  var src = $('#alramBtn_' + pjIdx).attr('src');

				  src = src.substring(0, src.lastIndexOf('/') + 1) + data;
				  $('#alramBtn_' + pjIdx).attr('src', src);
// 				  $('#new').load(location.href+' #new');
			  }
			});
	}
	
	</script>

</body>
</html>