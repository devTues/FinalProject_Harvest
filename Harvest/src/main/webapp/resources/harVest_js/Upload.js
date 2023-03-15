
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
          
          if(files.length > 3) {
          	alert("프로젝트 이미지는 최대 3장만 업로드 가능합니다.");
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

              //div에 이미지 추가
              var str = '<li class="ui-state-default">';
              //str += '<span>'+fileName+'</span><br>';

              //이미지 파일 미리보기
              if(f.type.match('image.*')){
                  //파일을 읽기 위한 FileReader객체 생성
                  var reader = new FileReader(); 
                  reader.onload = function (e) { 
                      //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
                      str += '<img src="'+e.target.result+'" title="'+f.name+'" width=150 height=110>';
					  str += '</li>';
					  $(str).appendTo('#Preview');
                  } 
                  reader.readAsDataURL(f);
              }
          })
      }
  })


});
	


$(document).ready(function() {
	
	// 프로필 미리보기
	const fileDOM = document.querySelector('#file');
	const preview = document.querySelector('.image-box');
	
	
	fileDOM.addEventListener('change', () => {
 		const reader = new FileReader();
  		reader.onload = ({ target }) => {
    	preview.src = target.result;
  		};
  		reader.readAsDataURL(fileDOM.files[0]);
	});
	
	// 상단탭 고정
	$(window).scroll(function() {
			var window = $(this).scrollTop();
			if (window) {
				$('#header').addClass('fixed', 1000);
				return;
			}
			$('#header').removeClass('fixed', 1000);
	});
	
	// 필수 항목 제어
	$('.text_').on("propertychange change keyup keydown paste input", function(){
		var value = $(this).val();
		const amount = parseFloat(value.replace(',', ''));
		var id = $(this).attr('id');
		if(value == "") {
			$('#p_' + id).html('필수 항목입니다.');
			$('#p_' + id).css({"color": "red"});
			$('.' + id + 'Length').css({"color": "red"});
			$(this).closest('div').css({"border": "1px solid red"});
	 		return;
		}
		
		$('#p_' + id).html('');
		return;
	});
	
	$('.text_').trigger('change');
	
	// 글자수 제어
	$('.creNm').keydown(function() {
		const inputLength = $(this).val().length;
		$('.creNmLength').html(inputLength + '/20');
		if(inputLength > 20) {
			$('.creNmLength').css({"color": "red"});
			$('.creNmWrap').css({"border": "1px solid red"});
			$('.saveBtn').prop('disabled', true);
			return;
		}
		$('.creNmLength').css({"color": "rgb(13, 13, 13)"});
		$('.creNmWrap').css({"border": "1px solid"});
		$('.saveBtn').prop('disabled', false);
		return;
		
	});
	
	$('.creIntro').keydown(function() {
		const inputLength = $(this).val().length;
		$('.creIntroLength').html(inputLength + '/300');
		if(inputLength > 300) {
			$('.creIntroLength').css({"color": "red"});
			$('.taWrap').css({"border": "1px solid red"});
			$('.saveBtn').prop('disabled', true);
			return;
		}
		$('.creIntroLength').css({"color": "rgb(13, 13, 13)"});
		$('.taWrap').css({"border": "1px solid"});
		return;
	});

	$('.title').keydown(function() {
		const inputLength = $(this).val().length;
		$('.titleLength').html(inputLength + '/50');
		if(inputLength > 50) {
			$('.titleLength').css({"color": "red"});
			$('.titleWrap').css({"border": "1px solid red"});
			$('.saveBtn').prop('disabled', true);
			return;
		}
		$('.titleLength').css({"color": "rgb(13, 13, 13)"});
		$('.titleWrap').css({"border": "1px solid"});
		$('.saveBtn').prop('disabled', false);
		return;
	});

	$('.productNm').keydown(function() {
		const inputLength = $(this).val().length;
		$('.productNmLength').html(inputLength + '/10');
		if(inputLength > 10) {
			$('.productNmLength').css({"color": "red"});
			$('.productNmWrap').css({"border": "1px solid red"});
			$('.saveBtn').prop('disabled', true);
			return;
		}
		$('.productNmLength').css({"color": "rgb(13, 13, 13)"});
		$('.productNmWrap').css({"border": "1px solid"});
		$('.saveBtn').prop('disabled', false);
		return;
		
	});
	
	// 금액 제어
	$('#targetAmt').on("propertychange change keyup keydown paste input", function(){
			// debugger;
			const value = $(this).val();
			const amount = parseFloat(value.replace(/,/gi, ''));
			if(amount < 500000) {
				$('#p_targetAmt').html('50만원 이상의 금액을 입력해주세요.');
	 			$('#p_targetAmt').css({"color": "red"});
				$('.targetAmtWrap').css({"border": "1px solid red"});
				$('.saveBtn').prop('disabled', true);
				return;
			}
			
			if(amount >= 500000 && amount <= 9999999999) {
				$('#p_targetAmt').html('');
				$('.targetAmtWrap').css({"border": "1px solid"});
				$('.saveBtn').prop('disabled', false);
				return;
			}
			
			if(amount > 9999999999) {
	 			$('#p_targetAmt').html('9,999,999,999원 이하인 금액을 입력해주세요.');
	 			$('#p_targetAmt').css({"color": "red"});
				$('.targetAmtWrap').css({"border": "1px solid red"});
				$('.saveBtn').prop('disabled', true);
				return;
			}
		
	});
	$('#minDona').on("propertychange change keyup keydown paste input", function(){
		const value = $(this).val();
		const amount = parseFloat(value.replace(/,/gi, ''));
		if(amount < 1000) {
			$('#p_minDona').html('천원 이상의 금액을 입력해주세요.');
 			$('#p_minDona').css({"color": "red"});
			$('.minDonaWrap').css({"border": "1px solid red"});
			$('.saveBtn').prop('disabled', true);
			return;
		}
		if(amount >= 1000 && amount <= 9999999999) {
			$('#p_minDona').html('');
			$('.minDonaWrap').css({"border": "1px solid"});
			$('.saveBtn').prop('disabled', false);
			return;
		}
		if(amount > 9999999999) {
			$('#p_minDona').html('9,999,999,999원 이하인 금액을 입력해주세요.');
			$('#p_minDona').css({"color": "red"});
			$('.minDonaWrap').css({"border": "1px solid red"});
			$('.saveBtn').prop('disabled', true);
			return;
		}
		
	});
	
	// 수수료, 총 금액 계산
	$('#targetAmt').on("input", function() {
		var target = $('#targetAmt').val().replaceAll(/\D/g, '');
		var fee = Math.round(target * 0.05);
		var total = target - fee;
		
		$('input[name=totalAmt]').attr('value', total.toLocaleString('ko-KR').replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,') + '원');
		$('input[name=fee]').attr('value', fee.toLocaleString('ko-KR').replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,') + '원');
	
	}); 
	
});

// 에디터
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