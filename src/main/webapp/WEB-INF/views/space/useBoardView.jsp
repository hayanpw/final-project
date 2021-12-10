<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/spaceCss/space_default.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="container">
		<table class="table table-border" border="1">
			<tr>
				<th colspan=2">제목</th>
				<td colspan="6">${u.ubTitle }</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${u.memberId }</td>
				<th>작성날짜</th>
				<td>${u.ubDate }</td>
				<th>첨부파일</th>
				<td><a href="/spaceFileDown.do?ubNo=${u.ubNo }">${u.filename }</a></td>
			</tr>
			<tr>
				<td colspan="8">내용</td>
			</tr>
			<tr>
				<td colspan="8">${u.ubContent }</textarea></td>
			</tr>
		</table>
		<c:if test="${sessionScope.m.memberId eq u.memberId }">
			<button onclick="location.href='/deleteUseBoard.do?ubNo=${u.ubNo}'">삭제</button>
			<button onclick="location.href='/updateUseBoardFrm.do?ubNo=${u.ubNo}'">수정</button>
		</c:if>
		<c:if test="${sessionScope.m.memberLever eq 0 }">
			<button onclick="location.href='/deleteUseBoard.do?ubNo=${u.ubNo}'">삭제</button>
		</c:if>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>