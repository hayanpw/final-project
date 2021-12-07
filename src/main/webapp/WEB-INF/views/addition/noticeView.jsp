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
				<td colspan="4">${b.boardTitle }(제목칸)</td>
			</tr>
			<tr>
				<td>등록일</td>
				<td>${b.regDate }</td>
				<td>첨부파일</td>
				<td>
				<c:forEach items="${b.list }" var="f">
				<a href="/fileDown.do?filename=${f.filename }&filepath=${f.filepath }">${f.filename }</a>
				</c:forEach>
				</td>
			</tr>
			<tr>
				<td colspan="4">
				${b.boardContent }(내용칸)
				</td>
			</tr>
		</table>
		<c:if test="${sessionScope.m.memberLevel eq 0 }">
		<a class="btn" href="/boardDelete.do?boardType=1&boardNo=${b.boardNo }">글삭제</a>
		<a class="btn" href="/boardUpdateFrm.do?boardNo=${b.boardNo }">글수정</a>
		</c:if>
		<a class="btn" onclick="history.go(-1);">이전</a>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>