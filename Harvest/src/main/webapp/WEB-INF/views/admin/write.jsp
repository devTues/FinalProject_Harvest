<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="${pageContext.request.contextPath}/resources/harVest_css/noticeDetail.css" rel="stylesheet" type="text/css" >
    <style>
        td {
            text-align: left !important;
        }
    </style>
</head>
<body>
<jsp:include page="sidebar.jsp"></jsp:include>
    <div id="wrap">
	<form action="${pageContext.request.contextPath}/admin/writePro" method="Post">
        	<input type="hidden" value="board_write" name="command">
            <table>
                <tr>
                    <th>제목 *</th>
                    <td><input type="text" name="TITLE"></td>
                </tr>
                <tr>
                    <th>아이디 *</th>
                    <td><input type="text" name="ID" value="admin" readonly></td>
                </tr>
                <tr>
                    <th>카테고리 *</th>
                    <td>
                    	<select name="CATEGORY">
							<option value="공지사항"> 공지사항 </option>
				        	<option value="이벤트ㆍ알람"> 이벤트ㆍ알람 </option>
					  	</select>
					</td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td><textarea cols="100" rows="30" name="CONTENT"></textarea></td>
                </tr>
            </table>
            <input class="btn" type="submit" value="등록">
            <input class="btn" type="reset" value="다시작성하기">
            <input class="btn" type="button" value="취소" onclick="javascript:history.back()">
        </form>
    </div>
</body>
</html>