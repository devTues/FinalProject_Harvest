<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
   <link rel="icon" href="data:;base64,iVBORw0KGgo=">
   <style>
    /* Make the image fully responsive */
    .carousel-inner img {width: 100%; height: 100%;}
   </style>
   
   
   
</head>
<body data-spy="scroll" data-target=".navbar" data-offset="40" id="home">
<c:if test="${empty sessionScope.id}">
   <c:redirect url="/user/login"></c:redirect>
</c:if>
   <!-- page-header -->
     <jsp:include page="../inc/header.jsp"></jsp:include>
    
    <!-- 본문 내용 -->
    
   <!-- 프로필 시작 -->
   <div class="container text-left">
       <section>
         <div class="media mb-5">
            <h2 class="mt-0" id="mt-0">설정</h2>
            </div>
              <!-- 프로필 메뉴영역 -->
               <ul class="nav nav-tabs">
           <li class="nav-item">
             <a class="nav-link" href="${pageContext.request.contextPath }/myPage/mySettingPage">계정</a>
           </li>
           <li class="nav-item">
             <a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath }/myPage/myAddress">배송지</a>
           </li>
           <li class="nav-item">
             <a class="nav-link" href="${pageContext.request.contextPath }/myPage/mySupport">후원한 프로젝트</a>
           </li>
           <li class="nav-item">
             <a class="nav-link" href="${pageContext.request.contextPath }/myPage/myCreate">내가 만든 프로젝트</a>
           </li>
           <li class="nav-item">
             <a class="nav-link" href="${pageContext.request.contextPath }/myPage/myFavorite">찜한 프로젝트</a>
           </li>
           <li class="nav-item">
             <a class="nav-link" href="${pageContext.request.contextPath }/myPage/myAlarm">알림</a>
           </li>
         </ul>
         <!-- 프로필 메뉴영역 끝 -->
       </section>
   </div>
   

   <div class="container">
        <div class="page-container">
            <div class="page-content">
                <div class="card">
               <div class="container">
                        <!-- TODO 히든으로 숨기기 -->
                	 <div class="media">
                     <h5 class="components-section-title col-10 pl-0">배송지 등록</h5>
<!--                      <label class="btn-ch btn btn-outline-dark btn-sm rounded" id="addAddress" >추가</label> 버튼처럼 이용할 레이블 -->
                     <label class="btn-ch btn btn-outline-dark btn-sm rounded" id="addAddress" for="ch1">추가</label>
                	 </div>
                     
                     <input type="checkbox" class="chck" name="address" id="ch1"> <!-- 체크 기능만 있고 숨기는 체크박스 -->
                  <div class="box">
                  <form action="${pageContext.request.contextPath}/myPage/insertAddressPro" method="post" id="insertAddress">
                    <input type="hidden" name="id" class="id" id="id" value="${sessionScope.id }"><br>

                  	받는 분 이름 <input type="text" name="name" class="name" id="name" placeholder="받는 분 이름"><br>
                    받는 분 연락처 <input type="text" name="phone" class="phone" id="phone" placeholder="받는 분 연락처"><br>
                    주소지 이름 <input type="text" name="address_nm" class="address_nm" id="address_nm" placeholder="주소지 이름"><br>
					<input type="text" name="zip_code" id="sample6_postcode" placeholder="우편번호">
					<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
					<input type="text" name="address1" id="sample6_address" placeholder="주소"><br>
					<input type="text" name="address2" id="sample6_detailAddress" placeholder="상세주소">
					<input type="text" name="address3" id="sample6_extraAddress" placeholder="참고항목">
<!--                      <button type="button" class="btn btn-dark" name="checkAddress" id="checkAddress">확인</button> -->
                     <button type="submit" class="btn btn-dark save" name="saveAddress" id="saveAddress">저장</button>
                  </form> 
                  </div>
                 
                  <c:forEach var="addressDto" items="${addressList}" varStatus="status">

                  <div class="media">
<%--                    <button type="button" class="btn btn-dark delete" id="deleteAddress_${status.index}" --%>
<%--                   	onclick="location.href='${pageContext.request.contextPath }/myPage/deleteAddressPro'">삭제</button> --%>
                  </div>
                  <form action="${pageContext.request.contextPath }/myPage/deleteAddressPro" method="post">
                     <button type="submit" class="btn btn-dark delete" name="deleteAddress" id="deleteAddress">삭제</button>
                        <input type="text" name="idx" class="idx" id="idx" value="${addressDto.idx}" readonly><br>
                        주소지 이름 <input type="text" name="addressNm" class="addressNm" id="addressNm" value="${addressDto.addressNm}" 
                        readonly><br>
                        받는 분 이름 <input type="text" name="name" class="name" id="name" value="${addressDto.name}" 
                        readonly><br>
                        받는 분 연락처 <input type="text" name="phone" class="phone" id="phone" value="${addressDto.phone}" 
                        readonly><br>
                        주소 
                        <input type="text" name="address1" class="address1" id="address1" value="${addressDto.address1}" 
                        readonly>
                        <input type="text" name="address2" class="address2" id="address2" value="${addressDto.address2}" 
                        readonly>
                        <input type="text" name="address3" class="address3" id="address3" value="${addressDto.address3}" 
                        readonly>
                        우편번호 <input type="text" name="zipCode" class="zipCode" id="zipCode" value="${addressDto.zipCode}" 
                        readonly><br>
                   	</form>   
                   <hr>
                  </c:forEach>
               </div>
            </div>
         </div>
      </div>
   <!-- 프로필 끝 -->
   
    <hr>
            <!-- Sidebar -->
<!--             <div class="page-sidebar text-left"> -->
<!--             <div class="card mb-4"> -->
<!--                     <a href="single-post.html" class="overlay-link"></a> -->
<!--                     <div class="card-body px-0"> -->
<!--                         <h5 class="card-title mb-2">어떤 정보가 프로필에 공개되나요?</h5>    -->
<!--                         <p class="my-2">프로필 사진과, 이름, 회원님과 관련된 프로젝트 등이 프로필 페이지에 공개 됩니다.</p> -->
<!--                     </div>       -->
<!--                 </div> -->
<!--             </div> -->
<!--         </div> -->
<!--       </form> -->
    </div>


    <!-- Page Footer -->
    <jsp:include page="../inc/footer.jsp"></jsp:include>

   <!-- core  -->
    <script src="${pageContext.request.contextPath }/resources/assets/vendors/jquery/jquery-3.4.1.js"></script>
	<script src="${pageContext.request.contextPath }/resources/assets/vendors/bootstrap/bootstrap.bundle.js"></script>

      <!-- JoeBLog js -->
    <script src="${pageContext.request.contextPath }/resources/assets/js/joeblog.js"></script>

   <script type="text/javascript" src="${pageContext.request.contextPath }/resources/harVest_js/jquery.validate.js"></script>
   <script type="text/javascript" src="${pageContext.request.contextPath }/resources/harVest_js/jquery.validate.min.js"></script>
   <script type="text/javascript" src="${pageContext.request.contextPath }/resources/harVest_js/additional-methods.js"></script>
   <script type="text/javascript" src="${pageContext.request.contextPath }/resources/harVest_js/additional-methods.min.js"></script>
   <script type="text/javascript" src="${pageContext.request.contextPath }/resources/harVest_js/messages_ko.min.js"></script>
   
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

   function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
            	
                var addr = ''; 
                var extraAddr = '';

             
                if (data.userSelectedType === 'R') { 
                    addr = data.roadAddress;
                } else {
                    addr = data.jibunAddress;
                }

            
                if(data.userSelectedType === 'R'){
                    
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                   
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                   
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }
               
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
               
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>

<script type="text/javascript">
	$('#insertAddress').submit(function() {
		if(${addressList.size() eq 3}) {
			alert("주소는 3개까지 입력가능합니다.");
			return false;
		}
	});
	
</script>


    </body>
</html>