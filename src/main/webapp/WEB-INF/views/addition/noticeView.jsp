<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#title{
		padding-top:30px;
		padding-left:30px;
		font-weight:700;
		font-size: 40px;
		padding-bottom: 30px;
		}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="container" id="container">
		<p id="title">공지사항</p>
		<table class="table">
			<tr>
				<td colspan="2">${b.boardTitle }(제목칸)</td>
			</tr>
			<tr>
				<td>등록일</td>
				<td>${b.regDate }</td>
			</tr>
			<tr>
				<td colspan="2">${b.boardContent }(내용칸)</td>
			</tr>
		</table>
		<a class="btn" href="/boardDelete.do?boardNo=${b.boardNo }">글삭제</a>
		<a class="btn" href="/boardUpdate.do?boardNo=${b.boardNo }">글수정</a>
		<a class="btn" href="/additionNotice.do?boardType=1&reqPage=1">목록</a>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>