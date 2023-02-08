<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html id="AllContent">
<head>
<meta charset="UTF-8">
<link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<link href="${pageContext.request.contextPath }/resources/harVest_css/projectUpload.css" rel="stylesheet">

<title>projectUpload.jsp</title>

</head>
<body>
<c:if test="${empty sessionScope.id}">
	<c:redirect url="${pageContext.request.contextPath }/mainpage/main"></c:redirect>
</c:if>
	<form action="${pageContext.request.contextPath }/creator/createPro" method="post">
	<div id="projectContent">
		<div class="proj_top">
			<div class="top_content1">
				<button class="top_back">
					<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-arrow-left" viewBox="0 0 16 16">
						<path fill-rule="evenodd" d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z"/>
					</svg>
				</button>
				<h1>프로젝트 기획</h1>
				<div class="top_save_box">
<!-- 					<input type="submit" value="임시저장" class="top_save"> -->
					<input type="submit" value="업로드" class="top_upload">
				</div>
			</div>
		<div class="top_content2">
				<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
					<li class="nav-item" role="presentation">
						<button class="nav-link active" id="pills-home-tab" data-bs-toggle="pill" data-bs-target="#pills-home" 
						type="button" role="tab" aria-controls="pills-home" aria-selected="true">프로젝트 계획</button>
					</li>
					<li class="nav-item" role="presentation">
						<button class="nav-link" id="pills-profile-tab" data-bs-toggle="pill" data-bs-target="#pills-profile" 
						type="button" role="tab" aria-controls="pills-profile" aria-selected="false" onclick="MovePage()">
						펀딩 계획</button>
					</li>
				</ul>
			</div>
		</div>
<div class="proj_cont">
			<div class="tab-content" id="pills-tabContent">
				<div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab" tabindex="0">
					<div class="article_proj">
						<div class="arti_tit">창작자 이름</div>
						<div class="arti_cont">
							<input type="text" name="creNm">
						</div>
					</div>
					<div class="article_proj">
						<div class="arti_tit">프로필 이미지</div>
						<div class="proj_cont">
							<div class="box" style="background: #BDBDBD;">
								<img class="image-box" src="${pageContext.request.contextPath }/resources/harVest_img/mypage.png">
							</div>
							<div class="right">
								<input type="file" id="file" accept=".png, .jpeg, .jpg" name="crePro">
							</div>
						</div>
					</div>
					<div class="article_proj">
						<div class="arti_tit">창작자 소개</div>
						<div class="arti_cont">
							<textarea cols="25" name="creIntro"></textarea>
						</div>
					</div>

					<div class="article_proj">
						<div class="arti_tit">프로젝트 카테고리</div>
						<div class="arti_cont">
							<select name="category">
							</select>
						</div>
					</div>
					<div class="article_proj">
						<div class="arti_tit">프로젝트 제목</div>
						<div class="arti_cont">
							<input type="text" name="title">
						</div>
					</div>
					<div class="article_proj">
						<div class="arti_tit">상품 이름</div>
						<div class="arti_cont6">
							<input type="text" name="productMn">
						</div>
					</div>
					<div class="article_proj">
						<div class="arti_tit">프로젝트 이미지</div>
						<div class="arti_cont">
							<div class="filebox clearfix">
   								<div class="inputFile">
        							<label for="AddImgs" class="addImgBtn">+</label>
       								<input type="file" id="AddImgs" name="Img1" class="upload-hidden" accept=".jpeg, .jpg, .png, .gif" multiple>
    							</div>
    							<ul id="Preview" class="sortable"></ul>
							</div>
						</div>
					</div>
					<div class="article_proj">
						<div class="arti_tit">프로젝트 소개</div>
						<div class="arti_cont">
							<h3>프로젝트 소개</h3>
							<iframe name="intro" id="intro" src="${pageContext.request.contextPath }/creator/intro" width="550px" height="550px"> </iframe>
						</div>
					</div>
					<div class="article_proj">
						<div class="arti_tit">프로젝트 예산</div>
						<div class="arti_cont">
							<h3>프로젝트 예산</h3>
							<iframe name="budget" src="${pageContext.request.contextPath }/creator/budget" width="550px" height="550px"> </iframe>
						</div>
					</div>
					<div class="article_proj">
						<div class="arti_tit">프로젝트 일정</div>
						<div class="arti_cont">
							<h3>프로젝트 일정</h3>
							<iframe name="schedule" src="${pageContext.request.contextPath }/creator/schedule" width="550px" height="550px"> </iframe>
						</div>
					</div>
				</div>
				<div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab" tabindex="0">...</div>
			</div>	
		</div>
	</div>
</form>


<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js" ></script>
<script type="text/javascript">
window.onload = function(){
	
	// 프로필 사진 미리보기
	const fileDOM = document.querySelector('#file');
	const preview = document.querySelector('.image-box');
    
	fileDOM.addEventListener('change', (e) => {
	  const reader = new FileReader();
	  reader.onload = ({ target }) => {
	    preview.src = target.result;
	  };
	  reader.readAsDataURL(fileDOM.files[0]);
	});
	
	$(function(){
		//드래그 앤 드롭
		$(".sortable").sortable();
	  
		//이미지 등록
		$("#AddImgs").change(function(e){
	    	//div 내용 비워주기
	    	$('#Preview').empty();

		    var files = e.target.files;
		    var arr = Array.prototype.slice.call(files);

			//업로드 가능 파일인지 체크
		    for(var i=0; i<files.length; i++){
	    	    if(!checkExtension(files[i].name,files[i].size)){
	        	    return false;
	        	}
	    	}
        	preview(arr);

	        function checkExtension(fileName,fileSize){
				var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
	    	    var maxSize = 20971520;  //20MB

		        if(fileSize >= maxSize){
		            alert('이미지 크기가 초과되었습니다.');
	    	        $("#AddImgs").val("");  //파일 초기화
	        	    return false;
	        	}

		        if(regex.test(fileName)){
		            alert('확장자명을 확인해주세요.');
	    	        $("#AddImgs").val("");  //파일 초기화
	        	    return false;
	       		}
	        	return true;
	  		}

      		function preview(arr){
	        	arr.forEach(function(f){
	            	//파일명이 길면 파일명...으로 처리
	              	/*
	              	var fileName = f.name;
	              	if(fileName.length > 10){
	                	  fileName = fileName.substring(0,7)+"...";
	              	}
	              	*/

					//div에 이미지 추가
	            	var str = '<li class="ui-state-default">';
	              	//str += '<span>'+fileName+'</span><br>';

	                //이미지 파일 미리보기
	                if(f.type.match('image.*')){
	                	//파일을 읽기 위한 FileReader객체 생성
	                  	var reader = new FileReader(); 
	                  	reader.onload = function (e) { 
	                    	//파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
	                     	str += '<img src="'+e.target.result+'" title="'+f.name+'" width=80 height=80>';
	                      	str += '<span class="delBtn" onclick="delImg(this)">x</span>';
	                      	str += '</li>';
	                      	$(str).appendTo('#Preview');
	                  	} 
	                  	reader.readAsDataURL(f);
	              	}else{
	                  	//이미지 파일 아닐 경우 대체 이미지
	                  	/*
	                 	str += '<img src="/resources/img/fileImg.png" title="'+f.name+'" width=60 height=60 />';
	                 	$(str).appendTo('#Preview');
	                 	*/
	              	}
	        	})
	    	}
		})

		//이미지 삭제
// 		function delImg(_this){
// 			$(_this).parent('li').remove()
// 		}
	})
	
	
// 	// 다중 파일(프로젝트 이미지) 미리보기
// 	var selFiles = [];				// 이미지 정보 담는 배열
// 	var index = 0;
// 	$(document).ready(function(){
// 		$("#files").on("change", handleImgFileSelect);

		
// 		// 다중 파일 미리보기
// 		function handleImgFileSelect(e) {
// 			var files = e.target.files;
// 			var filesArr = Array.prototype.slice.call(files);
				 
// 			filesArr.forEach(function(f) {
// 				index++;
// 				if(!f.type.match("image.*")) {
// 					alert("이미지 확장자만 가능합니다.")
// 				 	return;
// 			 	}
					 
// 				selFiles.push(f);
// 				var reader = new FileReader();
// 				reader.onlaod = function(e) {
// 					document.querySelector('.noImage' + index).src = reader.result	
					
// 				}
// 		 		reader.readAsDataURL(f);
// 			});
// 		}
		
// 		// 이미지 삭제
// 		function deleteImageAction(index) {
// 			console.log("idex : " + index);
// 			selectedfiles.splice(index, 1);
			
// 			var img_id = "#img_id_" + index;
// 			$(img_id).remove();
			
// 			console.log(selectedfiles);
		
// 		}
// 	});
}

// function MovePage(){
// 	$.ajax({
//         url:'${pageContext.request.contextPath }/creator/funding',
//         type:'GET',
//         data: {
// 				intro : $("#intro").value ,
//         dataType : 'json',
//         async: true,
//         success:function(data){
//             optionlist = data;
//             console.log(" 옵션 가져오기 성공!!");

//         },
//         error:function(jqXHR, textStatus, errorThrown){
//             alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
//         }
// 		}
// 	});
// }

</script>

</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
	crossorigin="anonymous"></script>
</html>