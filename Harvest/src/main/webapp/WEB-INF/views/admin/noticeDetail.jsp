<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>noticeDetail.jsp</title>
<link href="${pageContext.request.contextPath}/resources/harVest_css/noticeDetail.css" rel="stylesheet" type="text/css" >
<script type="text/javascript">
	function transmit() {
		var url = "";
		var name = "";
		var option = "width=600, height=600, left=100, top=50, location=no";
		window.open(url,name,option)
	};
</script>
</head>
<body>
<jsp:include page="sidebar.jsp"></jsp:include>
    <table class="board_view">
        <tbody>
            <tr>
                <th width="200px" height="40px" >제목</th>
                <td colspan="3" width="200px" height="40px" >${noticeDetail.TITLE}</td>
            </tr>
            <tr>
                <th width="200px" height="40px" >작성자</th>
                <td width="200px" height="40px">${noticeDetail.ID}</td>
                <th width="200px" height="40px">작성시간</th>
                <td width="200px" height="40px">${noticeDetail.DATE}</td>
            </tr>
            <tr>
                <th height="600px">내용</th>
                <td colspan="3">
                   ${noticeDetail.CONTENT}
                </td>
            </tr>
        </tbody>
    </table>
    <br>
    <input class="submin_btn" type="submit" value="보내기" onclick="transmit()">
    <input class="btn" type="button" value="목록" onclick="javascript:history.back()">
    <br>
    <br>
</body>
</html>