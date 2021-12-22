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
	width:165px;
	border-top: 7px solid #064663;
	margin-top:70px;
	margin-left:70px;
	font-weight:700;
	font-size: 40px;
	margin-bottom: 50px;
	}
	#table{
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
		width:100px;
		background-color: #064663;
		color: white;
	}
	#table1 td {
	border-top: 1px solid #eee;
	font-weight:100;
	height: 40px;
	font-size:18px;
	color: black;
	line-height: 40px;
	}
	#firtr>td{
	text-align:center;
	border-top:3px solid #064663;
	font-weight: bold;
	height: 40px;
	font-size: 15px;
	line-height: 40px;
	}
	#table1 td>a {
	color: black;
	}
	#table1 td>a:hover {
	text-decoration: none;
	}
	#table1 tr:hover {
	background-color: #eee ;
	}
	#write:hover,#back:hover {
	text-decoration: none;
	color: white;
	font-weight: bold;
    }
    #btitle{
    text-align: left;
    }
    #keyword{
    width: 200px;
    border:0;
    outline: none;
    }
    #submit{
    border: 0;
    background-color: white;
    }
    #type{
    border: none;
    }
    #pageNumAct a{
    background-color: #064663;
    border-color: #064663;
    color: white;
    border: none;
    }
    #pageNum a{
    color: black;
    border: none;
    }
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="container" id="container">
		<div id="title">공지사항</div>
		<div id="table">
			<table id="table1" class="table">
				<tr id="firtr">
					<td>번호</td><td>제목</td><td>작성일</td><td>조회수</td>
				</tr>
				<c:choose>
				 <c:when test="${not empty list }">
					 <c:forEach	items="${list }" var="b" varStatus="i">
					<tr>
						<td>${b.bnum }</td>
						<td id="btitle"><a href="/boardView.do?boardType=1&boardNo=${b.boardNo}">${b.boardTitle }</a></td>
						<td>${b.regDate }</td>
						<td>${b.readCount }</td>
					</tr>
					</c:forEach>
				 </c:when>
				 <c:otherwise>
				 	<tr>
				 		<td colspan="4">일치하는 검색 결과가 없습니다.</td>
				 	</tr>
				 </c:otherwise>
				</c:choose>
				
			</table>
		</div>
		<div id="page">
			<div id="pageNavi">${pageNavi }</div>
		</div>
		<div>
			<a id="back" class="btn" href="/additionBoard.do?boardType=1&reqPage=1">목록</a>
		</div>
	</div>	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>