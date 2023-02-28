<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배송지</title>
<link href="${pageContext.request.contextPath }/resources/payment/address.css" rel="stylesheet">
</head>
<body>

<div>
  <label>주소</label>
<!--   <input type="button" value="주소추가" id="addAddress"> -->
</div>

<form action="${pageContext.request.contextPath}/payment/addressPro" method="get">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/script/jquery-3.6.3.js"></script> 
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<%-- <c:if test="${! empty dto.address}"> --%>
<!--    <input type="radio" name="address" checked> -->
<%--    이름  : <input type="text" name="name" value="${dto.name}"><br> --%>
<%--    주소 : <input type="text" name="addressNm1" readonly  value="${dto.address} "><br> --%>
<!--    상세주소 :  <input type="text" name="detail1" id="detail1" ><br>  -->
<%--    전화번호 : <input type="text" name="phone" value="${dto.phone}"><br> --%>
<%-- </c:if> --%>


<!-- <script> -->
<!-- $(document).ready(function(){ -->
<!-- let addrCnt = 0; -->
<!-- window.onload = function address(){ -->
<!-- 	document.getElementById("addAddress").addEventListener("click", function(){ //주소추가 버튼을 누르면 실행되는 함수  -->
		
<!-- 		if(addrCnt > 2){ //최대 주소 3개까지 추가 가능 -->
<!-- 			alert('주소는 3개 까지만 가능'); -->
<!-- 			return; -->
<!-- 		} -->
<!-- 		new daum.Postcode( -->
<!-- 				{ //주소 선택하면 담기는 상자 나오고 값 채워짐 -->
<!-- 					oncomplete : function(data) { -->
<!-- 						addrCnt++; -->
<!-- 						// input 생성 -->
<!-- 		                var addr = ''; // 주소 변수 -->
<!--              		    var extraAddr = ''; // 참고항목 변수 -->
<!-- 						var input = '<div class="">'; -->
<!-- 						input += '<input type="radio" name="address" value="' + addrCnt + '" checked id="radd' + addrCnt + '"> '; -->
<!-- 						input += '이름 : <input type="text" name="name"><br>'; -->
<!-- 						input += '주소'+ addrCnt	+ ' : <input type="text" id="address' + addrCnt + '" name="addressNm' + addrCnt + '" readonly="" value="' + data.address + '"><br> '; -->
<!-- 						input += '상세주소 : <input type="text" id="detail' + addrCnt + '" name="detail"><br> '; -->
<!-- 						input += '전화번호 : <input type="text" name="phone"><br>'; -->
<!-- 						input += '</div></br> '; -->
<!-- 						$('#addr').append(input); -->
<!-- 					} -->
<!-- 				}).open(); -->
<!-- 			}); -->
<!-- 		} -->

<!-- 		$('input[type^=radio]').click(function() { -->
<!-- 			alert("동작"); -->

<!-- 		}); -->
<!-- }); -->
<!-- </script> -->
<!-- <div id="addr"> -->
<!-- </div> -->


<input type="text" id="name" placeholder="이름"><br>
<input type="text" id="zipcode" placeholder="우편번호">
<input type="button" id="addAddress" value="우편번호 찾기"><br>
<input type="text" id="address" placeholder="주소"><br>
<input type="text" id="detailAddress" placeholder="상세주소">
<input type="text" id="extraAddress" placeholder="참고항목">

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
$(document).ready(function(){
	let addrCnt = 0;
	window.onload = function address(){
		document.getElementById("addAddress").addEventListener("click", function(){ //주소추가 버튼을 누르면 실행되는 함수 
			
			if(addrCnt > 2){ //최대 주소 3개까지 추가 가능
				alert('주소는 3개 까지만 가능');
				return;
			}
		
        new daum.Postcode({
            oncomplete: function(data) {
            	
            	alert(data);
               // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

               // 각 주소의 노출 규칙에 따라 주소를 조합한다.
               // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수
                
                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }
               // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("extraAddress").value = '';
                }
               
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById("zipcode").value = data.zonecode;
                document.getElementById("address").value = addr;
                
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddress").focus();
                
                var input = '<div class="">';
				input += '<input type="radio" name="address" value="' + addrCnt + '" checked id="radd' + addrCnt + '"> ';
				input += '이름 : <input type="text" name="name"><br>';
				input += '우편번호 : <input type="text" name="zipcode" id="zipcode" ><br>';
				input += '주소 : <input type="text" id="address' + addrCnt + '" name="addressNm' + addrCnt + '" readonly="" value="' + data.address + '"><br> ';
				input += '상세주소 : <input type="text" id="detailAddress' + addrCnt + '" name="detailAddress"><br> ';
				input += '참고항목 : <input type="text" id="extraAddress' + addrCnt + '" name="extraAddress"><br> ';
				input += '전화번호 : <input type="text" name="phone"><br>';
				input += '</div></br> ';
				$('#addr').append(input);
                
            }
        }).open();
	  })
    }
});
</script>
<div id="addr">
</div>

<input type="submit" value="저장">
<input type="hidden" name="id" value="${sessionScope.id}">
</form>
</body>
</html>