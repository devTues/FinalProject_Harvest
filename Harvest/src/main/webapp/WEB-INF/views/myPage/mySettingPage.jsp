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
    
    img.profile_img {
    width: 100px;
    height: 100px;
    border-radius: 50%;
    overflow: hidden;
    }
    
    input[type=text] {border:0 solid black;} 
    
     /* input 태그에 클래스가 error 인 요소 */
    input.error {
        border: 1px solid red;
    }

    /* label 태그에 클래스가 error 인 요소 */
    label.error {
       padding: 10px;
        color: red;
    }

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
             <a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath }/myPage/mySettingPage">계정</a>
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
             <a class="nav-link" href="${pageContext.request.contextPath }/myPage/myAlarm">알림 </a>
           </li>
         </ul>
         <!-- 프로필 메뉴영역 끝 -->
       </section>
   </div>
   

   <div class="container">
<form action="${pageContext.request.contextPath }/myPage/updatePro" method="post" name="updateUser" id="updateUser">
        <div class="page-container text-left col-10 pl-0">
            <div class="page-content text-left">
                <div class="card">
               <div class="container">
                        <!-- TODO 히든으로 숨기기 -->
                        <input type="hidden" name="idx" class="idx" id="idx" value="${userDto.idx}" readonly>
                  <div class="media test">
                     <h5 class="components-section-title col-10 pl-0">프로필 사진</h5>
                     <label class="btn-ch btn btn-outline-dark btn-sm rounded" id="modifyProfile" for="ch1">수정</label> <!-- 버튼처럼 이용할 레이블-->
                  </div>
                     <img alt="" src="${pageContext.request.contextPath }/resources/upload/${userDto.profile}" class="profile_img" width="300" height="300">
                  
                  <input type="checkbox" class="chck" name="profile" id="ch1"> <!-- 체크 기능만 있고 숨기는 체크박스 -->
                  <div class="box pt-3">
                        <input type="hidden" name="hidden_profile" class="hidden_profile" id="hidden_profile" value="${userDto.profile}">
                        <input type="file" id="file" name="prFile" style="display:none;" >
                        <label for="file">파일첨부</label>
                        <input type="text" name="profile" class="profile" id="profile" value="${userDto.profile}" readonly>
                        <button type="button" class="btn btn-dark save" name="saveProfile" id="saveProfile">저장</button>
                  </div>
                  <hr>
                  
                     <div class="media">
                     <h5 class="components-section-title col-10 pl-0">이메일</h5>
                  </div>
                        <input type="text" name="id" class="id" id="id" value="${userDto.id}"
                           required="required" readonly>
                  <input type="checkbox" class="chck" name="id" id="ch3"> <!-- 체크 기능만 있고 숨기는 체크박스 -->
                  <hr>
                  
                  <div class="media">
                     <h5 class="components-section-title col-10 pl-0">이름</h5><br>
                     <label class="btn-ch btn btn-outline-dark btn-sm rounded" id="modifyName" for="ch2">수정</label> <!-- 버튼처럼 이용할 레이블--> 
                  </div>
                        <input type="hidden" name="hidden_name" class="hidden_name" id="hidden_name" value="${userDto.name}">
                        <input type="text" name="name" class="name" id="name" value="${userDto.name}" placeholder="이름을 입력해주세요." readonly>
                  <input type="checkbox" class="chck" name="name" id="ch2"> <!-- 체크 기능만 있고 숨기는 체크박스 -->
                  <div class="box">
                        <button type="button" class="btn btn-dark save" name="saveName" id="saveName">저장</button>
                  </div>
                  <hr>
                  
                  <div class="media">
                     <h5 class="components-section-title col-10 pl-0">비밀번호</h5>
                     <label class="btn-ch btn btn-outline-dark btn-sm rounded" id="modifyPass" for="ch4">수정</label> <!-- 버튼처럼 이용할 레이블-->
                  </div>
                        <input type="hidden" name="hidden_pass" class="hidden_pass" id="hidden_pass" value="${userDto.pass}">
                  <input type="checkbox" class="chck" name="pass" id="ch4"> <!-- 체크 기능만 있고 숨기는 체크박스 -->
                  <div class="box">
                        현재 비밀번호<br> 
                        <input type="password" name="pass3" class="pass3" id="pass3" placeholder="현재 비밀번호"><br>
                        <br>
                        변경할 비밀번호<br>
                        <input type="password" name="pass2" class="pass2" id="pass2" placeholder="변경할 비밀번호"><br>
                        <input type="password" name="pass" class="pass" id="pass" placeholder="변경할 비밀번호 확인"><br>
                        <button type="button" class="btn btn-dark save" name="savePass" id="savePass">저장</button>
                  </div>
                  <hr>
                  
                  <div class="media">
                     <h5 class="components-section-title col-10 pl-0">연락처</h5>
                     <label class="btn-ch btn btn-outline-dark btn-sm rounded" id="modifyPhone" for="ch5">수정</label> <!-- 버튼처럼 이용할 레이블-->
                  </div>
                        <input type="hidden" name="hidden_phone" class="hidden_phone" id="hidden_phone" value="${userDto.phone}">
                        <input type="text" name="phone" class="phone" id="phone" value="${userDto.phone}" placeholder="휴대폰 번호를 입력해주세요." readonly>
                  <input type="checkbox" class="chck" name="phone" id="ch5"> <!-- 체크 기능만 있고 숨기는 체크박스 -->
                  <div class="box">
                        <button type="button" class="btn btn-dark save" name="savePhone" id="savePhone">저장</button>
                  </div>
                  <hr>
                  
               
                  <div class="media">
                     <h5 class="components-section-title col-10 pl-0">회원탈퇴</h5>
                     <label class="btn-ch btn btn-outline-dark btn-sm rounded" for="ch7">탈퇴</label> <!-- 버튼처럼 이용할 레이블-->
                  </div>
                  <input type="checkbox" class="chck" id="ch7">
                  <div class="box">
                     <input type="text" value="회원탈퇴 페이지로 이동합니다">
                     <button type="submit" class="btn btn-dark">확인</button>
                  </div>
                <input type="hidden" name="unregist" class="unregist" id="unregist" value="${userDto.unregist}">
                 <input type="hidden" name="unregDate" class="unregDate" id="unregDate" value="${userDto.unregDate}">
                 <input type="hidden" name="eventAlr" class="eventAlr" id="eventAlr" value="${userDto.eventAlr}">
                 <hr>
               </div>
            </div>
         </div>
            <!-- Sidebar -->
            <div class="page-sidebar">
               <div class="card lb-4">
                    <a href="single-post.html" class="overlay-link"></a>
                    <div class="card-body lb-4 pl-0">
                        <h5 class="card-title mb-2">어떤 정보가 프로필에 공개되나요?</h5>   
                        <p class="my-2">프로필 사진과, 이름, 회원님과 관련된 프로젝트 등이 프로필 페이지에 공개 됩니다.</p>
                    </div>      
                </div>
            </div>
         </div>
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
    
   <script type="text/javascript" src="${pageContext.request.contextPath }/resources/harVest_js/jquery.validate.js"></script>
   <script type="text/javascript" src="${pageContext.request.contextPath }/resources/harVest_js/jquery.validate.min.js"></script>
   <script type="text/javascript" src="${pageContext.request.contextPath }/resources/harVest_js/additional-methods.js"></script>
   <script type="text/javascript" src="${pageContext.request.contextPath }/resources/harVest_js/additional-methods.min.js"></script>
   <script type="text/javascript" src="${pageContext.request.contextPath }/resources/harVest_js/messages_ko.min.js"></script>

    <script type="text/javascript">
   
   $(document).ready(function() {

       $.validator.addMethod(
           'mobilephone', function (value, element, params) {
               return (value.substring(0, 1) == 0) ? true : false;
           }, '0으로 시작하여야 합니다.'
       );

       $.validator.addMethod(
          'passRegx', function(value, element, params) {
             return (this.optional(element) ||  /^.*(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/.test(value)) ? true : false;
           },'8~16자 이내 영문, 숫자, 특수문자를 반드시 포함해야 합니다.'
       );


      // form validate 함수 호출
      $("#updateUser").validate({
         
         rules : {
                  name : {
                        required: true,
                        rangelength: [ 2, 10 ]
                        },
                  
                  pass3: {
                        required: true,
                          equalTo: '#hidden_pass',
                          passRegx: true
                        },
                    
                  pass2: {
                        required: function (element) {
                                return $('#ch4').is(':checked');
                               },
                          rangelength: [ 8, 16 ],
                          passRegx: true
                        },   

                  pass: {
                          required: true,
                          equalTo: '#pass2'
                        },
                    
                  phone : {
                          rangelength: [ 11 , 11 ],

                          required: function (element) {
                                return $('#ch5').is(':checked');
                            },
                           
                            mobilephone: true,
                            digits: true
                          },
               },
               
         messages : {
                  name : {
                        required : "비워두시면 안됩니다.",
                        rangelength : "2자 이상 입력해주세요."
                        },
                  
                  pass3: {
                         required:"비워두시면 안됩니다.",
                          equalTo: "현재 비밀번호와 다릅니다."
                        },
                      
                  pass2: {
                         required: "비워두시면 안됩니다."
                         },
                         
                  pass: {
                         required:"비워두시면 안됩니다.",
                          equalTo: "비밀번호가 일치하지 않습니다."
                        },
                    
                  phone: {
                        rangelength: $.validator.format("'-'제외 최소 {0} 글자 이상 입력해주세요."),
                     
                        required: "비워두시면 안됩니다.",
                        digits: "숫자만 입력해주세요." 
                           },
                  },
                  
         submitHandler : function(form) {
            form.submit();
            
         }
      });   // end validate

      
      $('input').on('focus focusout keyup', function () {
           $(this).valid();
      });

   if (typeof jQuery === 'undefined') {
       console.log('jQuery library is not found!');
   } else {
       console.log('jQuery library is loaded successfully!');
   }

   if (typeof jQuery.validator === 'undefined') {
       console.log('jQuery Validate plugin is not found!');
   } else {
       console.log('jQuery Validate plugin is loaded successfully!');
   }
   
   
  });   // end ready
   
  $(document).ready(function() {
        
        let btnId;
      let ckId;
      let ckName;
      
      // 수정버튼(체크박스) checked 여부
      $(".chck").change(function(){
         ckId = this.id;
         ckName = this.name;
         
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
           
           if ($("#updateUser").valid()) { 
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
                      $("#" + ckId).prop("checked", false); 
                  $('#' + btnId).prop('readonly', true);
                   },
                   error: function(xhr, status, error) {
                   }
               }); // end ajax()
           }
       }); // end save() 
   }); // end ready

   
$(document).ready(function() {
   $("#saveProfile").click(function(){
      var formData = new FormData();
      var inputFile = $('input[name="prFile"]');
      
      var file = inputFile[0].files[0];
      formData.append('prFile', file);
      
      
      $.ajax({
            url: '${pageContext.request.contextPath}/myPage/updateFile',
            type: "POST",
            data: formData,
            enctype: 'multipart/form-data',
            processData: false,
            contentType: false,
            cache: false,
            success: function() {
//                alert("수정에 성공하였습니다.")
            },
            error :  function(request,status,error){
//                 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                }
        }); // end ajax()
        
        
      
   });
});   
   
   
   $("#file").on('change',function(e){
        var files = e.target.files;
        
      //해당자리에 val값 바꾸기
        $(".profile").val(files[0].name);
   });
   
   window.onload = function(){
      const fileDOM = document.querySelector('#file');
      const preview = document.querySelector('.profile_img');
      
      fileDOM.addEventListener('change', () => {
          const reader = new FileReader();
           reader.onload = ({ target }) => {
          preview.src = target.result;
           };
           reader.readAsDataURL(fileDOM.files[0]);
      });
      
   };
   
   
   </script>
</html>