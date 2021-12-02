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
	#table{
	margin-left: 50px;
	margin-right: 50px;
	text-align: left;
	}
	#buttons{
	text-align: right;
	}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="container" id="container">
		<p id="title">질문과 답변</p>
		<div id="table">
			<table class="table">
				<tr>
					<td colspan="6">${b.boardTitle }(제목칸)</td>
				</tr>
				<tr>
					<td>작성자</td>
					<td>${b.boardWriter }</td>
					<td>작성일</td>
					<td>${b.regDate }</td>
					<td>조회수</td>
					<td>${b.readCount }</td>
				</tr>
				<tr>
					<td colspan="6">${b.boardContent }(내용칸)</td>
				</tr>
			</table>
			<div id="buttons">
				<a class="btn" href="/boardDelete.do?boardNo=${b.boardNo }">글삭제</a>
				<a class="btn" href="/boardUpdate.do?boardNo=${b.boardNo }">글수정</a>
				<a class="btn" href="/additionQNA.do?boardType=2&reqPage=1">목록</a>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>