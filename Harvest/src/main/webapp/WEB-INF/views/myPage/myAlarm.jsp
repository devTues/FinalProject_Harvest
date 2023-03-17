<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
   <link rel="icon" href="data:;base64,iVBORw0KGgo=">
   <style>
    /* Make the image fully responsive */
    .carousel-inner img {width: 100%; height: 100%;}
    
    input[type=text] {border:0 solid black;} 
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
             <a class="nav-link" href="${pageContext.request.contextPath }/myPage/myAddress">배송지</a>
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
             <a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath }/myPage/myAlarm">알림</a>
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
         <form action="${pageContext.request.contextPath }/myPage/AlarmUpdatePro" method="post" name="AlarmUpdatePro" id="AlarmUpdatePro">
                  
                  <input type="hidden" name="idx" class="idx" id="idx" value="${codeMap.idx1}" readonly>
                  <input type="hidden" name="idx" class="idx" id="idx" value="${codeMap.idx2}" readonly>
                  <input type="hidden" name="idx" class="idx" id="idx" value="${codeMap.idx3}" readonly>
                  
                  <!-- --------------------------------------------- -->
                  <div class="media">
                     <h5 class="components-section-title col-6 pl-0">후원한 프로젝트</h5>
                     <button type="button" class="btn btn-dark save" name="saveSupportingAlarm" id="saveSupportingAlarm">저장</button>
                  </div>
<!--                   <div class="box"> -->
                     <input type="hidden" name="hidden_supportingAlarm" class="hidden_supportingAlarm" id="hidden_supportingAlarm">
                  <input type="checkbox" name="supportingAlarm" class="supportingAlarm" id="supportingAlarm" ${codeMap.ALM1}>
                        후원한 프로젝트 업데이트 알림을 이메일로 수신합니다.
                     
<!--                   </div> -->
                  <hr>
                  <div class="media">
                     <h5 class="components-section-title col-6 pl-0">알림신청 프로젝트</h5>
                     <button type="button" class="btn btn-dark save" name="saveOpeningAlarm" id="saveOpeningAlarm">저장</button>
                  </div>
                     <input type="hidden" name="hidden_openingAlarm" class="hidden_openingAlarm" id="hidden_openingAlarm">
                  <input type="checkbox" name="openingAlarm" class="openingAlarm" id="openingAlarm" ${codeMap.ALM2}>
                        알림신청한 프로젝트가 공개되었다는 알림을 이메일로 수신합니다.
                     
                  <div class="box">
                  </div>
                  <hr>
                  <div class="media">
                     <h5 class="components-section-title col-6 pl-0">마케팅 메일</h5>
                     <button type="button" class="btn btn-dark save" name="saveMarketingAlarm" id="saveMarketingAlarm">저장</button>
                  </div>
                     <input type="hidden" name="hidden_marketingAlarm" class="hidden_marketingAlarm" id="hidden_marketingAlarm">
                  <input type="checkbox" name="marketingAlarm" class="marketingAlarm" id="marketingAlarm" ${codeMap.ALM3}  >
<%--                      <c:if test="${.marketingAlarm eq null}"> --%>
                        신규 콘텐츠 및 프로젝트 추천 알림을 이메일로 수신합니다. 
<%--                      ${fn:replace(fn:replace, '수신합니다.', '수신하지 않습니다.')} --%>
<%--                      </c:if> --%>
                     <!-- 체크 기능만 있고 숨기는 체크박스 -->
                  <div class="box">
                        <!-- TODO 히든 숨기기 -->
                  </div>
               </div>
      </form>
            </div>
         </div>
      </div>
   </div>
   <!-- 프로필 끝 -->
   
    <hr>

      </form>
    </div>


    <!-- Page Footer -->
    <jsp:include page="../inc/footer.jsp"></jsp:include>
</body>

   <!-- core  -->
    <script type="text/javascript" src="${pageContext.request.contextPath }/resources/harVest_js/jquery-3.6.3.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/vendors/bootstrap/bootstrap.bundle.js"></script>
      <!-- JoeBLog js -->
    <script src="${pageContext.request.contextPath }/resources/assets/js/joeblog.js"></script>

    <script type="text/javascript">
   
  $(document).ready(function() {
        
        let btnId;
      let ckId;
      let ckName;
      
      // 수정버튼(체크박스) checked 여부
      $(".chck").change(function(){
         ckId = this.id;
         ckName = this.name;
         alert(ckId);   // ch2
         alert(ckName);   // name
         
           if($('#' + ckId).is(":checked")){
            $('#' + ckName).prop('readonly', false);
           }else{
            $('#' + ckName).prop('readonly', true);
            

         var a = $('#hidden_'.concat(ckName)).val();
            alert(a);
            $('#' + ckName).val(a);
           }
       });   // 체크박스 .change 함수
       
     
       $('.save').click(function() {
           btnId = this.id.replace("save", "").toLowerCase();
           
           if ($("#updateUser").valid()) { // Validate the form before making the AJAX call
               $.ajax({
                   url: '${pageContext.request.contextPath}/myPage/mylistUpdate',
                   type: "GET",
                   contentType: "application/json;charset=UTF-8",
                   dataType: "json",
                   async: false,
                   data: {
                       value: $('#' + btnId).val(),
                       valueNm: btnId
                   },
                   success: function(rdata) {
                       // Handle successful response here
                      $("#" + ckId).prop("checked", false); 
                  $('#' + btnId).prop('readonly', true);
                       
                       
                   },
                   error: function(xhr, status, error) {
                       // Handle error here
                   }
               }); // end ajax()
           }
       }); // end save() 
   }); // end ready
   
   

   </script>
</html>