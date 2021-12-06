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
	#search{
		padding-right:20px;
		padding-bottom:20px;
		float: right;
	}
	#write{
		float: right;
	}
	#new{
		float: left;
	}
	#page{
	text-align: center;
	}
	
	#firtr>td:nth-child(1){
	width: 80px;
	}
	#firtr>td:nth-child(3){
	width: 150px;
	}
	#firtr>td:nth-child(4){
	width: 80px;
	}
	.btn{
		background-color: #A79078;
	}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="container" id="container">
		<p id="title">공지사항</p>
		<div id="table">
			<table class="table">
				<tr id="firtr">
					<td>번호</td><td>제목</td><td>작성일</d><td>조회수</td>
				</tr>
				<c:forEach	items="${list }" var="b" varStatus="i">
				<tr>
					<td>${b.bnum }</td>
					<td><a href="/boardView.do?boardType=1&boardNo=${b.boardNo}">${b.boardTitle }</a></td>
					<td>${b.regDate }</td>
					<td>${b.readCount }</td>
				</tr>
				</c:forEach>
			</table>
		</div>
		<div id="page">
			<div id="pageNavi">${pageNavi }</div>
		</div>
		<div>
			<a class="btn" href="/additionBoard.do?boardType=1&reqPage=1">목록</a>
		</div>
	</div>	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>