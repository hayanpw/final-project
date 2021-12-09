<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/4054b6ceaa.js" crossorigin="anonymous"></script>
<style type="text/css">
	#title{
	width:205px;
	border-top: 7px solid #563D39;
	margin-top:70px;
	margin-left:70px;
	font-weight:700;
	font-size: 40px;
	margin-bottom: 50px;
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
		font-size:16px;
		font-weight:bold;
		color:#BDB19A ;
	}
	.btn{
		width:100px;
		background-color: #563D39;
		color: white;
	}
	#table1 td {
	border-top: 1px solid #f3efe6;
	font-weight:100;
	height: 40px;
	font-size:18px;
	color: black;
	line-height: 40px;
	}
	#firtr>td{
	text-align:center;
	border-top:3px solid #BDB19A;
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
	background-color: #f3efe6 ;
	}
	#write:hover {
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
    background-color: #563D39;
    border-color: #563D39;
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
		<div id="title">소통게시판</div>
		<div id="table">
			<div id="new">새글수 : ${nCount }/${totalCount }</div>
			<table id="table1" class="table">
				<tr id="firtr">
					<td>번호</td><td>제목</td><td>작성자</td><td>작성일</td><td>조회수</td>
				</tr>
				<c:forEach	items="${list }" var="b" varStatus="i">
				<tr>
					<td>${b.bnum }</td>
					<td id="btitle"><a href="/boardView.do?boardType=3&boardNo=${b.boardNo}">${b.boardTitle }[${b.commentCount }]</a></td>
					<td>${b.boardWriter }</td>
					<td>${b.regDate }</td>
					<td>${b.readCount }</td>
				</tr>
				</c:forEach>
			</table>
		</div>
		<c:if test="${not empty sessionScope.m }">
			<div id="table">	
				<a class="btn" id="write" href="/boardWriteFrm.do?boardType=3">글작성</a>
				<a class="btn" id="my" href="/myFree.do">내글보기</a>
			</div>
		</c:if>
		<div id="page">
			<div id="pageNavi">${pageNavi }</div>
			<form action="/searchKeyword.do?boardType=3&reqPage=1" method="post">
			 	<select name="type" id="type">
			 		<option value="tac">제목+내용</option>
			 		<option value="writer">작성자</option>
			 	</select>
			 	<input type="text" id="keyword" name="keyword" placeholder="검색어를 입력하세요.">
			 	<button id="submit"><i class="fas fa-search"></i></button>
			</form>
		</div>
	</div>
	<script type="text/javascript">
	$("#submit").click(function(){
		var keyword = $("#keyword").val();
		if(keyword == ""){
			alert("검색어를 입력하세요.");
			return false;
		}
	});
	</script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>