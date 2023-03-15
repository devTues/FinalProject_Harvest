<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/resources/harVest_css/category.css" rel="stylesheet" type="text/css" >
<script src="${pageContext.request.contextPath}/resources/harVest_js/jquery-3.6.3.min.js"></script>
</head>
<body>
<script>
//전체

$(function(){
	
	// 공지사항, 이벤트/알람 탭 누르면 해당 데이터를 가져옴
	$("#category_value1, #category_value2, #category_value3").on('click',function(){
			var search = $(this).val();  //버튼이 클릭 되었을 때 그 버튼의 value를 var serach로 가져와서	
			$.ajax({
				  url : '${pageContext.request.contextPath}/admin/noticeCategory', // 이 주소로 
	              type : 'get', // get 방식으로 보내는데
	              async : false, // success 옵션이 끝나지 않아도 ajax 호출할 수 있게함.
	              data : {search:search}, // search를 search로 명명하여 보내겠다.
	              dataType: 'JSON',
	              success : function(list){ 
// 	                 var tblresult = JSON.parse(data); // parse는 json->객체 
	                 								   // stringfy는 객체->json
	                 var str = "";
// 	                 alert(list);  //데이터 잘넘어왔는지 보기
	                 $.each(list, function(index, item){
	                        var dt = new Date(item.date);
	                        var d = dt.getFullYear()+"-"+(dt.getMonth()+1)+"-"+dt.getDate();
	                        
	                        str += '<tr> '
	                        str += '<td>' + item.category + '</td><td>' + item.idx + '</td><td> <a href="${pageContext.request.contextPath}/admin/noticeDetail?idx='+ item.idx + '">'+ item.title +'</a>' + '</td><td>' + d + '</td><td>' + item.id + '</td><td> <a href="${pageContext.request.contextPath}/admin/noticeUpdate?idx='+ item.idx +'"> <input type="button" id="update_btn_' + item.idx + '" class="update_btn" value="수정"></a> <input type="button" id="delete_btn_'+ item.idx + '" class="delete_btn" value="삭제"></td>'  
	                        str += '</tr> '
	                        
	                 });
	                   
                 	$("#noticeList").empty();
                    $("#noticeList").append(str);
                    	
                    // TODO
                    
                    $(".update_btn").on('click', function(){
                    	var idx = this.id.split('_')[2];
					});
                    
                    $(".delete_btn").on('click', function(){
                    	var idx = this.id.split('_')[2];
                    	debugger;
                     	$.ajax({ 
                    		url  :'${pageContext.request.contextPath}/admin/noticeDelete',
                    		type :'get',
                    		async : false,
                    		data : {idx, idx},
                    		dataType : 'JSON'
//                     		success:
//                    		     alert("삭제되었습니다.");
//                   		     refreshList();
                    	})
                    	   alert("삭제되었습니다.");
                  		   refreshList();
                	});
	                    
	              },
	              error : function(request,status,error){
	              } //error
			})//ajax
	});//click
	
	$("#category_value1").trigger("click");
});//ready

function refreshList() {
	location.reload();
}

$(function() {
	//수정버튼 누를때 ajax 실행
	$(".update_btn").on('click', function(){
		debugger;
	});
	
	//삭제버튼 누를때 ajax 실행
	$(".delete_btn").on('click', function(){
		debugger;
	});
});


</script>

<jsp:include page="sidebar.jsp"></jsp:include>
<form action="${pageContext.request.contextPath}/admin/write">
   <div class="list_bar">
   		<h3 class="page-name">공지사항</h3>
   </div>
   <div class="notice_btn">
   		<input type="submit" value="글쓰기">
   </div>
   <div class="categoty_btn">
    	<input type="button" id="category_value1" value="전체">
    	<input type="button" id="category_value2" value="공지사항">
    	<input type="button" id="category_value3" value="이벤트/알람">
   </div>  


 	<table  class="rwd-table">
 		<thead>
 			<tr class="color_menu">
	      	  <th>글분류</th>
	          <th>글번호</th>
	          <th>제목</th>
	          <th>작성날짜</th>
	          <th>작성자</th>
	          <th>수정/삭제</th>
	    	</tr>
	    </thead>	
 		<tbody id="noticeList">
     	</tbody>
 	</table>
</form>    
</body>
</html>