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
	#noRegulation{
	color: black;
	}
	#regulation{
    color: #A79078;
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
			<table id="table1" class="table">
				<tr id="firtr">
					<td>번호</td><td>제목</td><td>작성자</td><td>작성일</td><td>조회수</td>
				</tr>
				<c:choose>
					<c:when test="${not empty list }">
						<c:forEach	items="${list }" var="b" varStatus="i">
							<tr>
								<td>${b.bnum }</td>
								<c:choose>
									<c:when test="${b.boardLevel==2 }">
									<td id="btitle"><a href="/boardView.do?boardType=3&boardNo=${b.boardNo}" id="regulation" class="chk">관리자에 의해 규제된 글입니다.</a></td>
									<input type="hidden" class="memberId" value="${sessionScope.m.memberId }">
									<input type="hidden" class="memberLevel" value="${sessionScope.m.memberLevel }">
									</c:when>
									<c:otherwise>
									<td id="btitle"><a href="/boardView.do?boardType=3&boardNo=${b.boardNo}" id="noRegulation">${b.boardTitle }&nbsp;[${b.commentCount }]</a></td>
									</c:otherwise>
								</c:choose>
								<td>${b.boardWriter }</td>
								<td>${b.regDate }</td>
								<td>${b.readCount }</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="5">일치하는 검색 결과가 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
				
			</table>
		</div>
		<div id="page">
			<div id="pageNavi">${pageNavi }</div>
		</div>
		<div>
			<a class="btn" href="/additionBoard.do?boardType=3&reqPage=1">목록</a>
		</div>
	</div>
	<script type="text/javascript">
	$(document).on("click",".chk",function(){
		var idx=$(".chk").index(this);
		var memberLevel = $(".memberLevel").eq(idx).val();
		var memberId = $(".memberId").eq(idx).val();
		if(!memberId=="" && memberLevel==0){
			return true;
		}
		return false;
    });
	</script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>