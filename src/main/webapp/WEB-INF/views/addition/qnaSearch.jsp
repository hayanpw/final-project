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
	text-align: center;
	}
	#table>div:first-child{
	margin: 30px;
	}
	#search{
		padding-right:20px;
		padding-bottom:20px;
		float: right;
	}
	#write{
		float: left;
	}
	#my{
		float: right;
	}
	#page{
	text-align: center;
	}
	
	#firtr>td:nth-child(1){
	width: 80px;
	}
	#firtr>td:nth-child(3){
	width: 100px;
	}
	#firtr>td:nth-child(4){
	width: 150px;
	}
	#firtr>td:nth-child(5){
	width: 80px;
	}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="container" id="container">
		<p id="title">FAQ</p>
		<div>챗봇자리</div>
		<p id="title">질문과 답변</p>
		<div id="table">
			<table class="table">
				<tr id="firtr">
					<td>번호</td><td>제목</td><td>작성자</td><td>작성일</td><td>답변상태</td>
				</tr>
				<c:choose>
					<c:when test="${not empty list }">
						<c:forEach	items="${list }" var="b" varStatus="i">
						<tr>
							<td>${b.bnum }</td>
							<td><a href="/boardView.do?boardType=2&boardNo=${b.boardNo}">${b.boardTitle }</a></td>
							<td>${b.boardWriter }</td>
							<td>${b.regDate }</td>
							<c:choose>
								<c:when test="${b.commentCount ne 0}">
								<td>답변완료</td>
								</c:when>
								<c:otherwise>
								<td>미답변</td>
								</c:otherwise>
							</c:choose>
						</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="5">일치하는 검색 결과가 없습니다.</td>
						<tr>
					</c:otherwise>
				</c:choose>
				
				
			</table>
		</div>
		<div id="page">
			<div id="pageNavi">${pageNavi }</div>
		</div>
		<div>
			<a class="btn" href="/additionBoard.do?boardType=2&reqPage=1">목록</a>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>