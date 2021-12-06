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
	#new{
		float: left;
		padding-bottom:20px;
		
	}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="container" id="container">
		<p id="title">소통게시판</p>
		<div id="table">
			<div id="new">새글수 : ${nCount }/${totalCount }</div>
			<table class="table">
				<tr id="firtr">
					<td>번호</td><td>제목</td><td>작성자</td><td>작성일</td><td>조회수</td>
				</tr>
				<c:forEach	items="${list }" var="b" varStatus="i">
				<tr>
					<td>${b.bnum }</td>
					<td><a href="/boardView.do?boardType=3&boardNo=${b.boardNo}">${b.boardTitle }[${b.commentCount }]</a></td>
					<td>${b.boardWriter }</td>
					<td>${b.regDate }</td>
					<td>${b.readCount }</td>
				</tr>
				</c:forEach>
			</table>
		</div>
		<div id="table">	
			<a class="btn" id="write" href="/boardWriteFrm.do?boardType=3">글작성</a>
			<a class="btn" id="my" href="/myFree.do">내글보기</a>
		</div>
		<div id="page">
			<div id="pageNavi">${pageNavi }</div>
			<form action="/searchKeyword.do?boardType=3&reqPage=1" method="post">
			 	<select name="type">
			 		<option value="tac">제목+내용</option>
			 		<option value="writer">작성자</option>
			 	</select>
			 	<input type="text" name="keyword">
			 	<input type="submit" value="검색">
			</form>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>