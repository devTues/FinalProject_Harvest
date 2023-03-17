<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 시스템 시간 -->
<jsp:useBean id="now" class="java.util.Date" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>productPage.jsp</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/harVest_js/jquery-3.6.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/harVest_js/projectInfoPage.js"></script>
<link href="${pageContext.request.contextPath}/resources/harVest_css/projectInfoPage.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/harVest_css/app.d69b58d686469c0a1bc8.css" rel="stylesheet">
<script src="https://cdn.tiny.cloud/1/6d0eescgzo66t0hqfeu0aeu5fyxbu2c0415q0gzufzi1uyaa/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>
<link href="${pageContext.request.contextPath}/resources/harVest_css/productUpdate.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/assets/css/joeblog.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">

<style>
nav {position: relative !important;}
</style>
<script type="text/javascript">
$(document).ready(function(){
	// 찜하기 버튼
	$("#likeBtn").click(like)
	// 공유하기 열기
	$("#shareBtn").click(shareDisplay)
	// 공유하기 닫기
	$("#shareX").click(offDisplay)
	// 후원하기 열기
	$(".funding_btn").click(showFunding)
	// 후원하기 닫기
	$(".info_x").click(hideFunding)
	// 후원금액 미입력 시 입력창
// 	$('#donaBtn').click(donationPay)
	// 후원금액 미입력 시 이동불가
	$('#donaBtn').click(changeBtn)
	$('#userDona').keydown(keyDown)
	// 최소금액 선택
	$('#minPayment').click(minPayment)
	// 금액 직접 입력
	$('#userPayment').click(userPayment)
	$('div[id^="secBtn"]').click(btnColor)
	$('#secBtn1').click(pageScroll1)
	$('#secBtn2').click(pageScroll2)
	$('#secBtn3').click(pageScroll3)
	
	// 숙인
	$('.cmt_btn').on('click', commSubmit );		// 클릭하면 commSubmit 실행
	$('#onDisplay').on('click', updateDisplay );	// 클릭하면 업데이트탭의 글쓰기폼 보여주기
	$('#goback').on('click', gobackUpdate );
	$('#contact-tab').on('click', function () {
		$('#commList1').trigger('click'); // contact-tab클릭하면 commList1을 클릭하게 됨
	});
	$('.list li').on('click', commShowList); // 커뮤니티탭 클릭시 응원탭에 list보이게 하기
	$('.update_write_btn').on('click', updateUpdate);
})


function btnColor() {
	if($(this).click){
		$('div[class^="section"]').css('background','white')
		$(this).css('background', '#a4bb73')
	}
}
function pageScroll1() {
	var offset = $('#secCont1').offset();
	$('html').animate({scrollTop : offset.top}, 100);
}
function pageScroll2() {
	var offset = $('#secCont2').offset();
	$('html').animate({scrollTop : offset.top}, 100);
}
function pageScroll3() {
	var offset = $('#secCont3').offset();
	$('html').animate({scrollTop : offset.top}, 100);
}


function changeBtn() {
// 	$('#donaBtn').attr('type', 'button');
	if (!$('#userDona').val() && $('#userPayment').is(':checked') == true){ // 후원금액 미입력 시 
		Swal.fire({
			title: '후원금액을 입력해주세요.',
			icon: 'warning',
			confirmButtonColor: '#3085d6',
			cancelButtonColor: '#d33',
			confirmButtonText: '닫기'
		}).then((result) => {
			if(result.value)	return false;
		})
	} else if($('#userDona').val() <= ${projectDTO.minDona} && $('#userPayment').is(':checked') == true) { // 최소 후원금 이하일 경우 
		Swal.fire({
			title: '최소금액보다 큰 금액을 입력해주세요.',
			icon: 'warning',
			confirmButtonColor: '#3085d6',
			cancelButtonColor: '#d33',
			confirmButtonText: '닫기'
		}).then((result) => {
			if(result.value) return false;
		})
	} else {
// 		document.getElementById('fundingForm').submit();
		$('#fundingForm').submit();
	}
}

function keyDown(e) {
    if(e.key == 'Enter'||e.keyCode == 13){
    	changeBtn();
    	return false;
    }
}

// 좋아요 버튼
function like() {
	if(${empty sessionScope.id}) {
		Swal.fire({
			title: '로그인 후 사용할 수 있습니다.',
			icon: 'warning',
			confirmButtonColor: '#3085d6',
			cancelButtonColor: '#d33',
			confirmButtonText: '로그인',
		}).then((result) => {
			if (result.value) {
				window.location = '${pageContext.request.contextPath}/user/login';
			}
		})
	}
	$.ajax({
		  url	: "${pageContext.request.contextPath}/project/likePro", // 요청이 전송될 URL 주소
		  type	: "POST", // http 요청 방식 (default: ‘GET’)
		  data  : {'PJ_IDX' : $('#pjIdx').val(),
			  	   'USER_ID' : '${sessionScope.id}'}, // TODO session 아이디로 바까라 좋은말 할때...
		  //processData : true, // 데이터를 컨텐트 타입에 맞게 변환 여부
		  success : function(data) {
			  var src = $('#likeBtn').attr('src');
			  src = src.substring(0, src.lastIndexOf('/') + 1) + data;
			  if(${!empty sessionScope.id}) {
				  $('#likeBtn').attr('src', src);
			  }
		  }
		})
}

// 공유하기 열기
function shareDisplay() {
	if($("#shareCont").css("display") == "none") {
		$("#shareCont").show();
		return false;
	}
}
// 공유하기 닫기
function offDisplay() {
	debugger;
	if($("#shareCont").css("display") != "none") {
		$("#shareCont").hide();
		return false;
	}
}
// 공유하기 - 트위터
function shareTwitter() {
    var sendText = "${projectDTO.title}"; // 전달할 텍스트
    var sendUrl = "http://localhost:8080/main/project/projectInfo?idx=${projectDTO.idx}"; // 전달할 URL
    window.open("https://twitter.com/intent/tweet?text=" + sendText + "&url=" + sendUrl);
}
//공유하기 - 페이스북
function shareFacebook() {
    var sendUrl = "http://localhost:8080/main/project/projectInfo?idx=${projectDTO.idx}"; // 전달할 URL
    window.open("http://www.facebook.com/sharer/sharer.php?u=" + sendUrl);
}
//공유하기 - 카카오톡 
function shareKakao() {
  // 사용할 앱의 JavaScript 키 설정
  Kakao.init('c6695526da12e98bb7f09606bb9a0d92');

  // 카카오링크 버튼 생성
  Kakao.Link.createDefaultButton({
    container: '#btnKakao', // 카카오공유버튼ID
    objectType: 'feed',
    content: {
      title: "harVest", // 보여질 제목
      description: "펀딩사이트, harVest", // 보여질 설명
      imageUrl: "http://localhost:8080/${pageContext.request.contextPath}/project/projectInfo?idx=${projectDTO.idx}", // 콘텐츠 URL
      link: {
         mobileWebUrl: "http://localhost:8080/${pageContext.request.contextPath}/project/projectInfo?idx=${projectDTO.idx}",
         webUrl: "http://localhost:8080/${pageContext.request.contextPath}/project/projectInfo?idx=${projectDTO.idx}"
      }
    }
  });
}

// 후원금액 자릿수
function handleInputLength(el, max) {
	if(el.value.length > max) {
	  el.value = el.value.substr(0, max);
	}
}

// 후원하기 나타내기
function showFunding() {
	if(${empty sessionScope.id}) {
		Swal.fire({
			title: '로그인 후 사용할 수 있습니다.',
			icon: 'warning',
			confirmButtonColor: '#3085d6',
			cancelButtonColor: '#d33',
			confirmButtonText: '로그인',
		}).then((result) => {
			if (result.value) {
				window.location = '${pageContext.request.contextPath}/user/login';
			}
		})
	}
	
	if(${!empty sessionScope.id}) {
		if($(".project_info_box").css("display") == "none") {
			$(".project_info_box, .info_bg").show();
		}
	}
	// 
	
	// 후원 입력 안 보이게
	if($("#minPayment").is(":checked") == true) {
		$(".user_donation").hide();
	}
	$("#minPayment").click(function(){
		$(".user_donation").hide();
	})
	$("#userPayment").click(function(){
		$('#userDona').val('');
		$(".user_donation").show();
	})
}
// 후원하기 닫기
function hideFunding() {
	if($(".project_info_box").css("display") != "none") {
		$(".project_info_box, .info_bg").hide();
// 		return false;
	}
}

// 후원하기 값 선택
function minPayment() {
	if($(this).is(':checked')== true) {
		$('#userDona').val($('#minPayment').val());	// 최소금액
		$('#userDona').attr('readonly',true);
	}
}
function userPayment() {
	if($(this).is(':checked')== true) {
		$('#userDona').attr('readonly',false);
	}
}

// 숙인
// 창작자 공지 페이지 수정
function updateUpdate(){
	$('#U_write').show();
	$('#U_list').hide();
	$('#updateWriteForm')[0].reset();
	
	var index = this.id.split('_')[1]; // 수정버튼 id값 다 다름.  'content_1'.... split로 '_' 뒤에 숫자만 가져오기 
	var content = $('#content_' + index).html(); // 글 내용 들어가는 div에 id도 다 다름. id에 맞는 내용 다 들고오기
	tinymce.activeEditor.setContent(content);

	$('#text').val(index);  // id값을 index에 넣어서 controller로 넘기기
	
	return;
}

// 창작자공지 글쓰기창 들어와서 '<- 창작자 공지로 돌아가기' 버튼 눌렀을 때
function gobackUpdate(){
	$('#U_list').show();
	$('#U_write').hide();
	$('#updateWriteForm')[0].reset();
}

// 창작자 공지 글쓰기창 보여주기/숨기기
function updateDisplay(){
	if($("#U_write").css("display") == "none"){
		$('#U_write').show();
		$('#U_list').hide();
		
	}  else if(("U_write").css("display") != "none"){
			$('#U_list').show();
			$('#U_write').hide();
			$('#updateWriteForm')[0].reset();
			$('#text').val(0);
	}
}

// 커뮤니티탭 응원/문의/리뷰 댓글달고 리스트 바로 띄우기
function commSubmit(){
	debugger;
    var form = $('#review_file')[0];
    var formData = new FormData();
    formData.append("attachedImg", form.files[0]);
    
	var data = { 
							'pjIdx' : ${productUpdateDTO.pjIdx},
				             'id' : '${sessionScope.id}', // String은 '  ' 안에 넣어줌
			    	 	  	 'content' : $('#content_' + this.id).val(),  // 아... $()안에 든게 id=""였군....
							 'contentLabel' : this.id,
							 }
	
	var content = $('#content_' + this.id);
	var index = this.id.replace("COM", ""); // id COM1, COM2, COM3에 COM빼고 숫자 1, 2, 3만 index에 담기

	// '작성하기'버튼 눌렀을 때 커뮤니티 글쓰기
	$.ajax ({
		  // URL은 필수 요소이므로 반드시 구현해야 하는 Property입니다.
		  url	: "${pageContext.request.contextPath }/project/CommunityWriteAjax", // 요청이 전송될 URL 주소
		  type	: "POST", // http 요청 방식 (default: ‘GET’)
		  data  :  {data,
		  				formData},// 요청 시 포함될 데이터. contentLabel이라는 키(변수명같은거)에 id 값을 넣기 
// 		  content_Type : "application/json", // 요청 컨텐트 타입 
		  content_Type : false, // false 로 선언 시 content-type 헤더가 multipart/form-data로 전송
		  processData : false, // false로 선언 시 formData를 string으로 변환하지 않음
		  enctype : 'multipart/form-data',// 요청 컨텐트 타입 . file은 JSON에 포함될 수 없다. 그래서 FormData 안에 file과 JSON (= data)를 append 시킨다.
// 		  dataType    : "json", // 응답 데이터 형식 (명시하지 않을 경우 자동으로 추측)
		  success : function(data) { // function(data)가 성공하면 콘솔에 data찍어줘 
// 			console.log('성공')	  //  콘솔에 data찍어줘. 컨트롤러에서 return값 돌려 받음
				$('#commList' + index).click(); // 댓글 쓰자마자 commList1, 2, 3(탭id)이 클릭되게 하기
		  },
		  error : function(data){
			  alert(data.file);
		  }
	});
	
	$('#content_' + this.id).val('');
	
}

//커뮤니티탭 댓글 list 보이게 하기
function commShowList(){
	
	 commList = $('.tab_active').attr('id');
	 
	 var index = this.id.replace("commList","COM"); // 수정버튼 id값 다 다름.  'content_1'.... split로 '_' 뒤에 숫자만 가져오기 
	
	$.ajax ({
		
		 url	: "${pageContext.request.contextPath }/project/CommunityListAjax", // 요청이 전송될 URL 주소
	 	 type	: "GET", // http 요청 방식 (default: ‘GET’)
	  	 data  :  { 'contentLabel' : index,
		       		     'pjIdx' : ${productUpdateDTO.pjIdx},
	  					'id' : '${sessionScope.id}' },  // 요청 시 포함될 데이터
	  	 content_Type : "application/json", //false, // "application/json", // 요청 컨텐트 타입 
//	     processData : false,
//	     enctype : 'multipart/form-data',// 요청 컨텐트 타입 . file은 JSON에 포함될 수 없다. 그래서 FormData 안에 file과 JSON (= data)를 append 시킨다.
	     dataType    : "JSON", // 응답 데이터 형식 (명시하지 않을 경우 자동으로 추측)
	     success : function(list) { // function(data)가 성공하면 콘솔에 data찍어줘 
// 		 console.log(list);	  //  콘솔에 data찍어줘. 컨트롤러에서 return값 돌려 받음
		
	  	var showList = ""; 
		
		$.each(list,function(index,item){
			var idx = item.idx;
			var dt=new Date(item.date);
	        var d=dt.getFullYear()+"-"+(dt.getMonth()+1)+"-"+dt.getDate()+" "+dt.getHours()+":"+dt.getMinutes()+":"+dt.getSeconds();
// 			showList += '<div class="cmt_list"> '
// 			showList += 	'<table id="table_COM1"> '
			showList += 		'<div class="cmt_profile_box"> '
			showList += 			'<div class="cmt_profile_img"> '
			showList += 				'<a href="#"><img src="${pageContext.request.contextPath }/resources/upload/' + item.profile + '"></a> '
			showList += 			'</div> '
			showList += 			'<div class="cmt_profile_info"> '
			showList += 				'<div class="cmt_info"> '
			showList += 					'<span>' + item.name + '</span> '
			showList += 					'<span>' + item.contentLabel + '</span> '
			showList += 					'<p class="cmt_time">' + d + '</p> '
			showList += 				'</div> '
			showList += 			'</div> '
			showList += 		'</div> '
			showList += 		'<div class="cmt_content" id="cmt_content_' + idx + '"> '
			showList += 			'<span>' + item.content + '</span> '
			showList += 			'<div class="cmt_cont_btn"> '
			showList += 				'<button id="reply_btn_' + idx + '"class="cmt_reply_btn" onclick="reCmtOpenClose(' + idx + ')" >댓글쓰기</button> '
			
				if('${sessionScope.id}' != "" && item.id == '${sessionScope.id}'){
					showList += 				'<button class="cmt_delete_btn" id = "commDelete" onclick="deleteComm(' + idx + ')">삭제</button> '
				}
			
			showList += 			'</div> '
			showList += 			'<div id="reply_cmt_' + idx + '"class="re_cmt"> '
			showList += 				'<textarea id="replyCmt_' + idx + '">응원의 한마디!</textarea> '
			
				if('${sessionScope.id}' != "" && item.spon == 'Y'){
					showList +=					'<button id="reply_write" class="re_cmt_btn" onclick="submitReply(' + idx + ')">작성하기</button> '
				}
			
			showList +=					'<div class="reply" id="reply_' + idx + '"></div> '
			showList += 			'</div> '
			showList += 		'</div> '
// 			showList += 	'</table> '
// 			showList += '</div>'
		  });
		
		$('#table_' + commList).empty();
		$('#table_' + commList).append(showList);
		
	  }
	});
}

// 커뮤니티 댓글의 댓글쓰기
function submitReply(idx){
	var commTab = $('.tab_active').attr('id').replace("commList", "COM"); // class="tab_active"의 id가지고 와서 commList를 COM으로 바꾸기
	var data = {  pjIdx : ${productUpdateDTO.pjIdx}, // 프로젝트 번호
						      id : '${sessionScope.id}', // 아이디
							  content : $('#replyCmt_' + idx).val(), // 댓글 내용
							  contentLabel : commTab, 
							  commIdx : idx  }
	
	$.ajax ({
		  url	: "${pageContext.request.contextPath }/project/CommunityReplyAjax", // 요청이 전송될 URL 주소
		  type	: "POST", // http 요청 방식 (default: ‘GET’)
		  data  :  data,  // 요청 시 포함될 데이터. contentLabel이라는 키(변수명같은거)에 id 값을 넣기 
		  content_Type : "application/json", //false, // "application/json", // 요청 컨텐트 타입 
		  success : function(data) { // function(data)가 성공하면 콘솔에 data찍어줘 
				
			  var showReply = "";
		  	  
			  $.each(data,function(index,item){
				  
				  showReply +=				'<div><span class="nickname">' + item.name + '</span></div> '
				  showReply +=				'<span class="re_comment">' + item.content + '</span> '

			  });
		  
				$('#reply_' + idx).empty();
				$('#reply_' + idx).append(showReply);
			  
		  }
	});

	$('#replyCmt_' + idx).val('');
}

//커뮤니티 댓글의 댓글 List 함수
function submitReplyList(idx){
	
	var commTab = $('.tab_active').attr('id').replace("commList", "COM"); // class="tab_active"의 id가지고 와서 commList를 COM으로 바꾸기
	var data = {  pjIdx : ${productUpdateDTO.pjIdx}, // 프로젝트 번호
							  contentLabel : commTab, 
							  commIdx : idx  }
	
	$.ajax ({
		  url	: "${pageContext.request.contextPath }/project/CommunityReplyAjax", // 요청이 전송될 URL 주소
		  type	: "POST", // http 요청 방식 (default: ‘GET’)
		  data  :  data,  // 요청 시 포함될 데이터. contentLabel이라는 키(변수명같은거)에 id 값을 넣기 
		  content_Type : "application/json", //false, // "application/json", // 요청 컨텐트 타입 
		  success : function(data) { // function(data)가 성공하면 콘솔에 data찍어줘 
				
			  var showReply = "";
		  	  
			  $.each(data,function(index,item){
				  
				  showReply += '<div class="reply_under"> '
				  showReply +=				'<div><span class="nickname">' + item.name + '</span></div> '
				  showReply +=				'<div><span class="re_comment">' + item.content + '</span></div> '
				  showReply += '</div>'
			  });
		  
				$('#reply_' + idx).empty();
				$('#reply_' + idx).append(showReply);
			  
		  }
	});
}

// 커뮤니티탭 댓글쓰기 클릭하면 대댓글창 여닫기 
function reCmtOpenClose(idx){
	
	var writeBtn = $('#reply_cmt_' + idx)

	if(writeBtn.css('display') == 'block'){
		$(writeBtn).hide();
		
	} else {
		$(writeBtn).show();
		submitReplyList(idx);

	}
}

// 커뮤니티탭 댓글 삭제하기
function deleteComm(idx){
// 	var del = this.id.replace("Delete", "");
	$.ajax ({
		  url	: "${pageContext.request.contextPath }/project/deleteAjax", // 요청이 전송될 URL 주소
		  type	: "GET", // http 요청 방식 (default: ‘GET’ POST PUT DELETE)
		  data  :  { 'idx' : idx },  // 요청 시 포함될 데이터
		  dataType    : "text", // 응답 데이터 형식 (명시하지 않을 경우 자동으로 추측)
		  success : function(result) { // function(data)가 성공하면 콘솔에 data찍어줘 
			console.log(result);	  //  콘솔에 data찍어줘. 컨트롤러에서 return값 돌려 받음
			alert('댓글이 삭제되었습니다.');	  //  콘솔에 data찍어줘. 컨트롤러에서 return값 돌려 받음
// 			commShowList();
			location.reload();
		  }
	});
	
}

// 업데이트 글쓰기창에 텍스트 에디터
$(function() {
         var plugins = [ "advlist", "autolink", "lists", "link", "image",
               "charmap", "print", "preview", "anchor", "searchreplace",
               "visualblocks", "code", "fullscreen", "insertdatetime",
               "media", "table", "paste", "code", "help", "wordcount",
               "save" ];
         var edit_toolbar = 'formatselect fontselect fontsizeselect |'
               + ' forecolor backcolor |'
               + ' bold italic underline strikethrough |'
               + ' alignjustify alignleft aligncenter alignright |'
               + ' bullist numlist |' + ' table tabledelete |'
               + ' link image';

         tinyMCE.init({
//         	 	 selector: "content", 
                  forced_root_block : false,
                  force_br_newlines : true,
                  force_p_newlines : false,
                  language : "ko_KR", //한글판으로 변경
                  mode : "specific_textareas",
                  editor_selector : 'mceEditor',
                  height : 500,
                  menubar : false,
                  plugins : plugins,
                  toolbar : edit_toolbar,

                  /*** image upload ***/
                  image_title : true,
                  
                  /* enable automatic uploads of images represented by blob or data URIs*/
                  automatic_uploads : true,
                  /*
                      URL of our upload handler (for more details check: https://www.tiny.cloud/docs/configure/file-image-upload/#images_upload_url)
                      images_upload_url: 'postAcceptor.php',
                      here we add custom filepicker only to Image dialog
                   */
                  file_picker_types : 'image',
                  
                  /* and here's our custom image picker*/
                  file_picker_callback : function(cb, value, meta) {
                     var input = document.createElement('input');
                     input.setAttribute('type', 'file');
                     input.setAttribute('accept', 'image/*');

                     /*
                     Note: In modern browsers input[type="file"] is functional without
                     even adding it to the DOM, but that might not be the case in some older
                     or quirky browsers like IE, so you might want to add it to the DOM
                     just in case, and visually hide it. And do not forget do remove it
                     once you do not need it anymore.
                      */
                     input.onchange = function() {
                        var file = this.files[0];

                        var reader = new FileReader();
                        reader.onload = function() {
                           /*
                           Note: Now we need to register the blob in TinyMCEs image blob
                           registry. In the next release this part hopefully won't be
                           necessary, as we are looking to handle it internally.
                            */
                           var id = 'blobid' + (new Date()).getTime();
                           var blobCache = tinymce.activeEditor.editorUpload.blobCache;
                           var base64 = reader.result.split(',')[1];
                           var blobInfo = blobCache.create(id, file,
                                 base64);
                           blobCache.add(blobInfo);

                           /* call the callback and populate the Title field with the file name */
                           cb(blobInfo.blobUri(), {
                              title : file.name
                           });
                        };
                        reader.readAsDataURL(file);
                     };
                     input.click();
                  },
                  /*** image upload ***/

                  content_style : 'body { font-family:Helvetica,Arial,sans-serif; font-size:14px }'
               });
      });
      
</script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

</head>
<body>
<jsp:include page="../inc/header.jsp"></jsp:include>
	<!-- 상품 이미지 및 간략 정보 -->
	
		<div class="prod_title">
			<button>${projectDTO.category}</button>
			<h1>${projectDTO.title}</h1>
			<input type="hidden" id="pjIdx" value="${projectDTO.idx}">
		</div>
		<div class="prod_cont">
			<div> <!-- 이미지 캐러셀 -->
				<div id="carouselExampleIndicators" class="carousel slide">
				  <div class="carousel-indicators">
				    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
				    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
				    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
				  </div>
				  <div class="carousel-inner">
				    <c:set var="img" value="${projectDTO.img1}"/>
	                  <c:if test="${not empty img}">
	                     <div class="carousel-item active">
	                        <img src="${pageContext.request.contextPath}/resources/upload/${fn:split(img,'&')[0]}" class="d-block w-100" alt="...">
	                     </div>
	                     <c:if test="${not empty fn:split(img,'&')[1]}">
	                        <div class="carousel-item">
	                           <img src="${pageContext.request.contextPath}/resources/upload/${fn:split(img,'&')[1]}" class="d-block w-100" alt="...">
	                        </div>
	                     </c:if>
	                     <c:if test="${not empty fn:split(img,'&')[2]}">
	                        <div class="carousel-item">
	                           <img src="${pageContext.request.contextPath}/resources/upload/${fn:split(img,'&')[2]}" class="d-block w-100" alt="...">
	                        </div>
	                     </c:if>
	                  </c:if>
				  </div>
				  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
				    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
				    <span class="visually-hidden">Previous</span>
				  </button>
				  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
				    <span class="carousel-control-next-icon" aria-hidden="true"></span>
				    <span class="visually-hidden">Next</span>
				  </button>
				</div>
			</div>
			<div> <!-- 상품 정보 -->
				<div class="project_info">
					<div class="info_price">
						<span class="info_tit">모인 금액</span>
						<span style="font-size: 1em !important;"><span class="point_font">${Math.round(projectDTO.sumMoney / projectDTO.targetAmt * 100)}%</span></span>
						<h2>
							<fmt:formatNumber value="${projectDTO.sumMoney}" />원
						</h2>
					</div>
					<div class="info_time">
						<span class="info_tit">남은 시간</span>
						<h2>
							<fmt:parseNumber value="${now.time / (1000*60*60*24)}" integerOnly="true" var="nowDtParse" scope="request"/>
							<fmt:parseNumber value="${projectDTO.end.time/ (1000*60*60*24)}" integerOnly="true" var="dbDtParse" scope="request"/>
							<c:if test="${(dbDtParse - nowDtParse) + 1 > 0}">
								<span class="days">${(dbDtParse - nowDtParse) + 1}일</span>
							</c:if>
							<c:if test="${(dbDtParse - nowDtParse) + 1 == 0}">
								<span class="deadline">오늘 마감</span>
							</c:if>
							<c:if test="${(dbDtParse - nowDtParse) + 1 < 0}">
								<span class="deadline">펀딩 종료</span>
							</c:if>
						</h2>
					</div>
					<div class="info_support">
						<span class="info_tit">후원자</span>
						<h2><fmt:formatNumber value="${projectDTO.sumUser}" />명</h2>
					</div>
				</div>
				<div class="project_summary">
					<div>
						<div>목표 금액</div>
						<div><fmt:formatNumber value="${projectDTO.sumMoney}"/>원</div>
						<div><span class="point_font">${Math.round(projectDTO.sumMoney / projectDTO.targetAmt * 100)}%</span></div>
					</div>
					<div>
						<div>펀딩 기간</div>
						<div>${projectDTO.start}~${projectDTO.end}</div>
						<div>
							<c:if test="${(dbDtParse - nowDtParse) + 1 > 0}">
							<span class="deadline_box">${(dbDtParse - nowDtParse) + 1}일 남음</span>
							</c:if>
							<c:if test="${(dbDtParse - nowDtParse) + 1 == 0}">
							<span class="deadline_box">${(dbDtParse - nowDtParse) + 1}일 남음</span>
							</c:if>
							<c:if test="${(dbDtParse - nowDtParse) + 1 < 0}">
							<span class="deadline_box">펀딩 종료</span>
							</c:if>
						</div>
					</div>
					<div>
						<div>결제 일시</div>
						<div>목표금액 달성시 <span class="point_font">${payDate }</span>에 결제 진행</div>
						<c:if test="${(dbDtParse - nowDtParse) + 1 < 0}">
							<c:if test="${projectDTO.sumMoney >= projectDTO.targetAmt}">
							<div>목표 달성</div>
							</c:if>
							<c:if test="${projectDTO.sumMoney < projectDTO.targetAmt}">
							<div>달성 실패</div>
							</c:if>
						</c:if>
						<c:if test="${(dbDtParse - nowDtParse) + 1 >= 0}">
<%-- 							<c:if test="${projectDTO.sumMoney < projectDTO.targetAmt}"> --%>
							<div>진행 중</div>
<%-- 							</c:if> --%>
						</c:if>
					</div>
				</div>
				<div class="project_btn">
					<img id="likeBtn" src="${pageContext.request.contextPath}/resources/harVest_img/${projectDTO.heart}">
					<div id="shareBtn" class="share_btn">
						<span>
							<img id=shareBtn" src="${pageContext.request.contextPath}/resources/harVest_img/share.svg">
						</span>
						<div id="shareCont" class="share_cont">
							<span id="shareX" class="share_x">
								<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-x-circle" viewBox="0 0 20 20">
									<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
									<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
								</svg>
							</span>
							<div>
								<a id="btnTwitter" class="link_icon twitter" href="javascript:shareTwitter();"></a>
								<a id="btnFacebook" class="link_icon facebook" href="javascript:shareFacebook();"></a>    
								<a id="btnKakao" class="link_icon kakao" href="javascript:shareKakao();"></a>
							</div>
						</div>
					</div>
					<span class="funding_btn" id="fundingBtn">후원하기</span>
				</div>
			</div>
		</div>
<!-- 	</div> -->
	<!-- 탭 메뉴 -->
	<div id="productInfoMore">
		<ul class="nav nav-tabs" id="myTab" role="tablist">
			<li class="nav-item" role="presentation">
				<button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home-tab-pane" type="button" role="tab" aria-controls="home-tab-pane" aria-selected="true">프로젝트 계획</button>
			</li>
			<li class="nav-item" role="presentation">
				<button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile-tab-pane" type="button" role="tab" aria-controls="profile-tab-pane" aria-selected="false">진행사항</button>
		  	</li>
			<li class="nav-item" role="presentation">
				<button class="nav-link" id="contact-tab" data-bs-toggle="tab" data-bs-target="#contact-tab-pane" type="button" role="tab" aria-controls="contact-tab-pane" aria-selected="false">커뮤니티</button>
			</li>
		</ul>
		<div class="fundingInfo">
			<div class="tab-content" id="myTabContent">
				<div class="tab-pane fade show active" id="home-tab-pane" role="tabpanel" aria-labelledby="home-tab" tabindex="0">
					<div id="secCont1" class="section target">
						<div class="scroll_btn">
							<div id="secBtn1" class="section1">프로젝트 소개</div>
							<div id="secBtn2" class="section2">예산</div>
							<div id="secBtn3" class="section3">일정</div>
						</div>
						${projectDTO.intro}
					</div>
					<div id="secCont2" class="section target">
					<hr>
					${projectDTO.budget}
					</div>
					<div id="secCont3" class="section target">
					<hr>
					${projectDTO.schedule}
					</div>
				</div>
				<!-- 숙인 -->
				<div class="tab-pane fade" id="profile-tab-pane" role="tabpanel" aria-labelledby="profile-tab" tabindex="0">
					<!-- if문으로 공지 있을 때, 없을 때 구분해주기 -->
					<div class="notice_wrapper" id="U_list">
						<c:forEach var="dto" items="${productUpdateList }">
							<div class="creator_box">
								<div class="profile_creator">
									<div>
										<a href="#" class="profile_img">
											<!-- 프로필 이미지 넣기 -->
											<img src="${pageContext.request.contextPath }/resources/upload/${dto.crePro}">
										</a>
									</div>
								</div>
								<div class="profile_info">
									<div class="info_name"><a href="#">${dto.creNm}</a></div><!-- 창작자 넣기 -->
									<div class="info_creator">
										<span class="point creator">♥ 창작자</span>
										<span class="write_date"> | ${dto.date} </span><!-- 날짜값 넣기 -->
									</div>
								</div>
								<!-- 창작자 로그인 시 버튼 보이게 해주기 -->
								<c:if test="${creatorWrite.id eq sessionScope.id}">
									<div class="write_btn_wrapper">
										<button type="button" id="uBtn_${dto.idx}" class="update_write_btn" >수정</button>
										<button type="submit" class="delete_write_btn" onclick="location.href='${pageContext.request.contextPath }/project/delete?idx=${productUpdateDTO.pjIdx}&num=${dto.idx}'">삭제</button>
									</div>
								</c:if>
							</div>
							<div id="content_${dto.idx}" class="creator_cont">
								${dto.content}
							</div>
								<input type="hidden" name="pjIdx" value="${productUpdateDTO.pjIdx }">
								<input type="hidden" name="idx" value="${dto.idx }">
						</c:forEach>
						
						<!-- 창작자 로그인 시 보이게 해주기 -->
							<c:if test="${creatorWrite.id eq sessionScope.id}">
								<div class="creator_btn" id="onDisplay">
									<button>글쓰기</button>
								</div>
							</c:if>
					</div>
					
					<!-- 창작자 공지 글쓰기창 -->
					<div class="updateWrite" id="U_write"  style="display: none;">
						<form action="${pageContext.request.contextPath}/project/productUpdateWritePro" id="updateWriteForm" method="post" enctype="multipart/form-data">
						<div class="style__ProjectContentsBackground-ky14bp-8 caYfnf">
							<div class="Container-gci8y7-0 cXaiVs">
								<div class="style__ProjectContents-ky14bp-9 fbVSPF">
									<div class="style__ProjectContentsMainColumn-ky14bp-10 jXBJgk">
										<div class="style__MainColumnInner-ky14bp-12 jBRpgz">
											<div class="EditorLayout__Wrap-sc-9ka57a-0 cMjFYj">
												<div class="EditorLayout__Header-sc-9ka57a-1 ibiUSB">
													<div class="EditHeader__Wrap-zond9x-0 eVdPsY">
														<button type="button" id="goback" class="SolidButton__Button-sc-1gsinzz-0 icXYZs EditHeader__BackButton-zond9x-1 OAsKY fnt-p1" color="white">
															<span><div name="arrow3-left" class="Icon__SVGICON-sc-1xkf9cp-0 ccxeYs"><svg viewBox="0 0 48 48"><path fill-rule="evenodd" clip-rule="evenodd" d="M43.7014 21.7189L10.1221 21.7189L25.2128 7.06878C26.1112 6.15946 26.2122 4.64393 25.3127 3.73461C24.4133 2.82529 22.9142 2.72425 22.0148 3.63357L2.72663 22.4262C1.82719 23.3355 1.72725 24.75 2.62669 25.7604H2.72663L22.0148 44.4519C22.9142 45.2602 24.4133 45.1592 25.2128 44.2499C26.0123 43.3405 26.0123 41.926 25.1119 41.0167L10.0221 26.4676L43.7014 26.4676C45.0006 26.4676 46 25.4572 46 24.1438C46 22.8303 45.0006 21.7189 43.7014 21.7189Z"></path></svg>
																</div>  창작자 공지로 돌아가기</span>
														</button>
													</div>
												</div>
												<div class="EditorLayout__Body-sc-9ka57a-2 etJmpB">
													<div class="EditorLayout__LeftSide-sc-9ka57a-3 bKAMOw">
														<div class="InputWithGuideAndLengthCheck__Wrapper-sc-9nmfrw-0 eCSxwJ">
															<div>
																<div id="editor">
 																	<textarea id="content" class="mceEditor" name="content" class="Textarea__StyledTextArea-sc-1mj6ym2-1 cjoUaQ">프로젝트 공지사항을 적어주세요</textarea>
																</div>
															</div>
														</div>
													</div>
												</div>
													<div class="EditorLayout__RightSide-sc-9ka57a-4 fOriWQ">
															<input type="hidden" name="id" value="${sessionScope.id }" readonly>
															<input type="hidden" name="pjIdx" value="${productUpdateDTO.pjIdx}">
														<div class="BackerEditRightText__NoteText-sc-114yeue-0 fEHuJA">후원하신 프로젝트 창작자에게 응원의 한마디를 남겨주세요. 창작자에게 후원금만큼 큰 힘이 됩니다.</div>
														<div class="ImportantNotes__ImportantWrap-ssm7kj-0 hzTSWV">
															<div class="ImportantNotes__Title-ssm7kj-1 jBpBce">
																<div name="cation" class="Icon__SVGICON-sc-1xkf9cp-0 ccxeYs ImportantNotes__TitleIcon-ssm7kj-2 iEKYpO">
																	<svg viewBox="0 0 18 18" fill="none" xmlns="http://www.w3.org/2000/svg">
																		<path d="M8.10937 8.0025C8.10937 7.98282 8.12532 7.96687 8.145 7.96687H9.855C9.87467 7.96687 9.89062 7.98282 9.89062 8.0025V12.9187C9.89062 12.9384 9.87467 12.9544 9.855 12.9544H8.145C8.12532 12.9544 8.10937 12.9384 8.10937 12.9187V8.0025Z"
																			fill="#3D3D3D"></path>
																		<path d="M7.93125 6.15C7.93125 5.55975 8.40975 5.08125 9 5.08125C9.59025 5.08125 10.0687 5.55975 10.0687 6.15C10.0687 6.74025 9.59025 7.21875 9 7.21875C8.40975 7.21875 7.93125 6.74025 7.93125 6.15Z"
																			fill="#3D3D3D"></path>
																		<path fill-rule="evenodd" clip-rule="evenodd" d="M9 14.7C12.148 14.7 14.7 12.148 14.7 9C14.7 5.85198 12.148 3.3 9 3.3C5.85198 3.3 3.3 5.85198 3.3 9C3.3 12.148 5.85198 14.7 9 14.7ZM9 16.125C12.935 16.125 16.125 12.935 16.125 9C16.125 5.06497 12.935 1.875 9 1.875C5.06497 1.875 1.875 5.06497 1.875 9C1.875 12.935 5.06497 16.125 9 16.125Z"
																			fill="#3D3D3D"></path></svg>
																</div>
																유의사항
															</div>
															<ul class="ImportantNotes__ContenetLists-ssm7kj-3 gcBHsl">
																<li class="ImportantNotes__ContentItem-ssm7kj-4 kzewdj">창작자에게 궁금하신 점이 있다면 ‘창작자에게 문의'로 질문해주세요.</li>
																<li class="ImportantNotes__ContentItem-ssm7kj-4 kzewdj">프로젝트와 무관한 내용이나 광고, 도배, 욕설, 혐오 조장, 외설, 사칭 등은 예고 없이 삭제될 수 있습니다.</li>
																<li class="ImportantNotes__ContentItem-ssm7kj-4 kzewdj">운영원칙 위반 누적시 텀블벅 이용이 제한될 수 있으며, 타인에 대한 모욕이나 명예훼손 등의 경우 법적 책임이 발생할 수도 있습니다.</li>
															</ul>
														</div>
													</div>
												</div>
												<button type="submit" class="SolidButton__Button-sc-1gsinzz-0 hgsFUp EditHeader__SubmitButton-zond9x-2 fZQwzk fnt-p1" onclick = "return UpdateSubmit_btn()"><span>등록</span></button>
												<input type="hidden" id="text" value="0" name="text"> <!-- idx값 갖고 수정 -->
											</div>
										</div>
									</div>
								</div>
							</div>
						</form>
						</div>
					<!-- 창작자 공지 글쓰기창 끝-->
					<!-- if문으로 공지 있을 때, 없을 때 구분해주기 끝 -->
				</div>
				<div class="tab-pane fade" id="contact-tab-pane" role="tabpanel" aria-labelledby="contact-tab" tabindex="0">
					<!-- 커뮤니티 탭/탭 내용 -->
					<div class="container">
				      <ul class="list">
				        <li class="tab_button tab_active" id="commList1">응원</li>
				        <li class="tab_button" id="commList2">문의</li>
				        <li class="tab_button" id="commList3">후기</li>
				      </ul>
				      <div class="tab_content tab_show">
				      	<!-- 댓글창 -->
				      	<div class="comment_wrapper">
				      	<!-- 로그인 안됐을때 댓글쓰기창 누르면 로그인 하는 곳으로 보내기 -->
				      		<c:if test="${empty sessionScope.id }">
					      		<div class="cmt_write">
					      			<a href="${pageContext.request.contextPath }/user/login"><textarea id="content_COM1" name="content" placeholder="로그인을 해주세요"  readonly></textarea></a>
						      	</div>
					      	</c:if>
					    <!-- 로그인하고 후원자만 댓글쓰기-->
				      		<c:if test="${!empty sessionScope.id and projectDTO.spon =='Y'}">
					      		<div class="cmt_write">
					      			<textarea id="content_COM1" name="content" placeholder="후원자만 글을 쓸 수 있어요."></textarea>
					      			<div>
					      				<button type="button" id="COM1" class="cmt_btn">작성하기</button>
					      			</div>
					      		</div>
					      	</c:if>
					      	
				      		<!-- if문으로 댓글 돌리기 -->
				      		<div class="cmt_list" id="table_commList1">
				      		</div>
				      	</div>
				      	<!-- if문으로 댓글 돌리기 끝 -->
				      	<!-- 댓글창 -->
				      </div>
				      <div class="tab_content">
				        <!-- 댓글창 -->
				      	<div class="comment_wrapper">
				      		<!-- 로그인 안됐을때 댓글쓰기창 누르면 로그인 하는 곳으로 보내기 -->
				      		<c:if test="${empty sessionScope.id }">
					      		<div class="cmt_write">
					      			<a href="${pageContext.request.contextPath }/user/login"><textarea id="content_COM2" name="content" placeholder="로그인을 해주세요"  readonly></textarea></a>
						      	</div>
					      	</c:if>
					      	<!-- 로그인하고 후원자만 댓글쓰기-->
				      		<c:if test="${!empty sessionScope.id and projectDTO.spon =='Y'}">
					      		<div class="cmt_write">
					      			<textarea id="content_COM2" name="content" placeholder="후원자만 글을 쓸 수 있어요." ></textarea>
					      			<div>
					      				<button type="button" id="COM2" class="cmt_btn">작성하기</button>
					      			</div>
					      		</div>
					      	</c:if>
				      		<!-- if문으로 댓글 돌리기 -->
				      		<div class="cmt_list" id="table_commList2">
				      		</div>
				      	</div>
				      	<!-- if문으로 댓글 돌리기 끝 -->
				      	<!-- 댓글창 -->
				      </div>
				      <div class="tab_content">
				        <!-- 댓글창 -->
				      	<div class="comment_wrapper">
				      	<!-- 로그인 안됐을때 댓글쓰기창 누르면 로그인 하는 곳으로 보내기 -->
				      		<c:if test="${empty sessionScope.id }">
					      		<div class="cmt_write">
					      			<a href="${pageContext.request.contextPath }/user/login"><textarea id="content_COM3" name="content" placeholder="로그인을 해주세요"  readonly></textarea></a>
						      	</div>
					      	</c:if>
					      	<!-- 로그인하고 후원자만 댓글쓰기-->
				      		<c:if test="${!empty sessionScope.id and projectDTO.spon =='Y'}">
					      		<div class="cmt_write">
					      			<input type="hidden" name="id" value="${sessionScope.id}">
					      			<textarea id="content_COM3" name="content" placeholder="후원자만 글을 쓸 수 있어요." ></textarea>
					      			<input type="file" id="review_file">
					      			<div>
					      				<button type="button" id="COM3" class="cmt_btn">작성하기</button>
					      			</div>
					      		</div>
					      	</c:if>
				      		<!-- if문으로 댓글 돌리기 -->
				      		<div class="cmt_list" id="table_commList3">
				      		</div>
				      	</div>
				      	<!-- if문으로 댓글 돌리기 끝 -->
				      	<!-- 댓글창 -->
				      </div>
				    </div>
				</div>
			</div>
			<div class="project_info_box" id="fundingDo">
				<span class="info_x">
<!-- 					<svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-x-circle" viewBox="0 0 16 16"> -->
<!-- 						<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/> -->
<!-- 						<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/> -->
<!-- 					</svg> -->
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="white" class="bi bi-x-lg" viewBox="0 0 16 16">
						<path d="M2.146 2.854a.5.5 0 1 1 .708-.708L8 7.293l5.146-5.147a.5.5 0 0 1 .708.708L8.707 8l5.147 5.146a.5.5 0 0 1-.708.708L8 8.707l-5.146 5.147a.5.5 0 0 1-.708-.708L7.293 8 2.146 2.854Z"/>
					</svg>
				</span>
				<div>원하는 후원 방법을 선택해주세요.</div>
				<div class="funding_wrap">
					<form action="${pageContext.request.contextPath}/payment/payment?idx=${projectDTO.idx}" id="fundingForm" method="post">
						<div>
							<input type="hidden" name="idx" value="${projectDTO.idx}">
							<label>
								<!-- value랑 최소금액 값 받아오기 -->
								<input type="radio" name="funding_name" value="${projectDTO.sumMoney}" id="minPayment" checked>
								<span class="min_check"></span><span class="min_title">최소금액 | ${projectDTO.sumMoney}원</span>
							</label>
							<label>
								<input type="radio" name="funding_name" value="0" id="userPayment">
								<span class="user_check"></span><span class="user_title">후원금액 직접 입력</span>
							</label>
							<span class="user_donation">
								<input type="text" name="userDona" id="userDona" maxlength="7" oninput="handleInputLength(this, 7)" onkeyup="javascript:inputNumberFormat(this)" onkeydown="cf_getNumberOnly"><span>원</span>
								<!--  onkeyup="javascript:inputNumberFormat(this)" onkeydown="cf_getNumberOnly" -->
							</span>
						</div>
						<button type="button" id="donaBtn">후원하기</button>
					</form>
				</div>
			</div>
			<div class="info_bg"></div>
		</div>
	</div>
	<!-- 상세 페이지 및 창작자 소개, 금액 -->
	<div class=""></div>
	
	
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
</body>
</html>