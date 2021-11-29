<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="container">
		<h1>소통게시판</h1>
		<table border="1">
			<tr>
				<th>번호</th><th>제목</th><th>작성자</th><th>작성일</th><th>조회수</th>
			</tr>
			<c:forEach	items="${list }" var="b" varStatus="i">
			<tr>
				<td>${i.count }</td>
				<td><a href="/boardView.do?boardNo=${b.boardNo}">${b.boardTitle }</a></td>
				<td>${b.boardWriter }</td>
				<td>${b.regDate }</td>
				<td>${b.readCount }</td>
			</tr>
			</c:forEach>
		</table>
		<button><a href="/boardWriter.do">글작성</a></button>
		<button><a href="/myFree.do">내글보기</a></button>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>