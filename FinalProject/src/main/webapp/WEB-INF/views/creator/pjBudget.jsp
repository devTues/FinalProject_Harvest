<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style type="text/css">
.mceContentBody {
	overflow-y: hidden !important;
}
</style>
<title>Document</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.tiny.cloud/1/6d0eescgzo66t0hqfeu0aeu5fyxbu2c0415q0gzufzi1uyaa/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>
<body id="editor">
	<p>설정하신 목표 금액을 어디에 사용 예정이신지 구체적인 지출 항목으로 적어 주세요.</p>
	<ul>
		<li>예산은 ‘제작비’가 아닌 구체적인 ‘항목’으로 적어 주세요.</li>
		<li>이번 프로젝트의 실행에 필요한 비용으로만 작성해 주세요.</li>
		<li>기부, 다음 프로젝트에 사용하기 등은 이번 프로젝트의 예산으로 볼 수 없어요.</li>
		<li>만일 전체 제작 비용 중 일부만 모금하시는 경우라면, 나머지 제작 비용은 어떻게 마련 예정인지 추가로 작성해 주세요.</li>
	</ul>




	<p>(예시)</p>

	<p>목표 금액은 아래의 지출 항목으로 사용할 예정입니다.</p>
	<ul>
		<li>인건비</li>
		<li>배송비</li>
		<li>발주비</li>
		<li>디자인</li>
		<li>의뢰비</li>
		<li>수수료</li>
	</ul>
</body>
<script>
	$(function() {
		var plugins = [ "advlist", "autolink", "lists", "link", "image",
				"charmap", "print", "preview", "anchor", "searchreplace",
				"visualblocks", "code", "fullscreen", "insertdatetime",
				"media", "table", "paste", "code", "help", "wordcount", "save" ];
		var edit_toolbar = 'formatselect fontselect fontsizeselect |'
				+ ' forecolor backcolor |'
				+ ' bold italic underline strikethrough |'
				+ ' alignjustify alignleft aligncenter alignright |'
				+ ' bullist numlist |' + ' table tabledelete |' + ' link image';

		tinymce
				.init({
					language : "ko_KR", //한글판으로 변경
					selector : '#editor',
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
</html>