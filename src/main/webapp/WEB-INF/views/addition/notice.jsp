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
	#table{
	margin-top:80px;
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
		font-size:16px;
		font-weight:bold;
		color:black ;
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
    background-color: #064663;
    border-color: #064663;
    color: white;
    border: none;
    }
    #pageNum a{
    color: black;
    border: none;
    }
    #fix{
    color: #e79b36;
    }
    #pagination>li:first-child>a{
    border-top-left-radius: 0px;
    border-bottom-left-radius: 0px;
    }
    #pagination>li:last-child>a{
    border-top-right-radius: 0px;
    border-bottom-right-radius: 0px;
    }
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="container" id="container">
		<div id="table">
			<div id="new">새글수 : ${nCount }/${totalCount } </div>
			<div id="search">
			<form action="/searchKeyword.do?boardType=1&reqPage=1" method="post">
				<select name="type" id="type">
			 		<option value="tac">제목+내용</option>
			 	</select>
				 	<input type="text" id="keyword" name="keyword" placeholder="검색어를 입력하세요.">
				 	<button id="submit"><i class="fas fa-search"></i></button>
			</form>
			</div>
			<table id="table1" class="table">
				<tr id="firtr">
					<td>번호</td><td>제목</td><td>작성일</d><td>조회수</td>
				</tr>
				<c:forEach	items="${list }" var="b" varStatus="i">
				<c:choose>
					<c:when test="${b.boardFix ==1 and b.bnum==0 }">
						<tr>
							<td><i id="fix" class="fas fa-exclamation-circle"></i></td>
							<td id="btitle"><a href="/boardView.do?boardType=1&boardNo=${b.boardNo}">${b.boardTitle }</a></td>
							<td>${b.regDate }</td>
							<td>${b.readCount }</td>
						</tr>
					</c:when>
					<c:otherwise>
						<tr>
							<td>${b.bnum }</td>
							<td id="btitle"><a href="/boardView.do?boardType=1&boardNo=${b.boardNo}">${b.boardTitle }</a></td>
							<td>${b.regDate }</td>
							<td>${b.readCount }</td>
						</tr>
					</c:otherwise>
				</c:choose>
				</c:forEach> 
				
			</table>
		</div>
		<div id="page">
			<div id="pageNavi">${pageNavi }</div>
		</div>
		<c:if test="${not empty sessionScope.m && sessionScope.m.memberLevel eq 0 }">
			<div id="table">	
				<a class="btn" id="write" href="/boardWriteFrm.do?boardType=1">글작성</a>
			</div>
		</c:if>
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