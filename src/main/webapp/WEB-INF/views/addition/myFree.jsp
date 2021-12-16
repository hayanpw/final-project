<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#title {
	width: 190px;
	border-top: 7px solid #563D39;
	margin-top: 70px;
	margin-left: 70px;
	font-weight: 700;
	font-size: 40px;
	margin-bottom: 50px;
}

#table_id {
	text-align: center;
}

#table, #nav {
	margin-left: 50px;
	margin-right: 50px;
	margin-bottom: 50px;
}

#date {
	width: 100px;
}

#table_id td>a:hover {
	text-decoration: none;
}

#table_id tr:hover {
	background-color: #f3efe6;
}

#table_id td {
	border-top: 1px solid #f3efe6;
	font-weight: 100;
	height: 40px;
	font-size: 18px;
	line-height: 40px;
}

#firtr>td {
	text-align: center;
	border-top: 3px solid #BDB19A;
	font-weight: bold;
	height: 40px;
	font-size: 15px;
	line-height: 40px;
}

#btitle a {
	color: black;
}
#mymenu>li>a{
	color: black;
}

#mymenu>li.active>a {
	background-color: #563D39;
	color: white;
}


</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.css">
	<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.js"></script>
	<div class="container" id="container">
		<div id="title">내가 쓴 글</div>
		<div id="nav">
			<ul id="mymenu" class="nav nav-pills nav-justified">
				<c:choose>
					<c:when test="${sessionScope.m.memberLevel eq 0 }">
					<li class="active"><a data-toggle="pill" href="#notice">공지사항</a></li>
					<li><a data-toggle="pill" href="#free">소통게시판</a></li>
					</c:when>
					<c:otherwise>
					<li class="active"><a data-toggle="pill" href="#free">소통게시판</a></li>
					</c:otherwise>
				</c:choose>
					<li><a data-toggle="pill" href="#qna">1대1문의</a></li>
					<li><a data-toggle="pill" href="#comment">댓글</a></li>
			</ul>
		</div>
		<div class="tab-content">
			<c:choose>
			<c:when test="${sessionScope.m.memberLevel eq 0 }">
				<div id="notice" class="tab-pane fade in active">
					<table id="noticeb" class="display" style="width:100%">
						<thead>
							<tr id="firtr">
								<td>번호</td>
								<td>제목</td>
								<td id="date">작성일</td>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list }" var="b" varStatus="i">
								<tr>
									<td>${i.count }</td>
									<td id="btitle"><a
										href="/boardView.do?boardType=3&boardNo=${b.boardNo}">${b.boardTitle }&nbsp;</a></td>
									<td>${b.regDate }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div id="free" class="tab-pane fade">
					<table id="freeb" class="display" style="width:100%">
						<thead>
							<tr id="firtr">
								<td class="bnum">번호</td>
								<td>제목</td>
								<td id="date">작성일</td>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list }" var="b" varStatus="i">
								<tr>
									<td>${i.count }왜이래</td>
									<td id="btitle"><a
										href="/boardView.do?boardType=3&boardNo=${b.boardNo}">왜이러냐고ㅗㅗㅗㅗㅗㅗㅗㅗㅗㅗㅗㅗ${b.boardTitle }&nbsp;</a></td>
									<td>${b.regDate }아아아ㅏ아아아아ㅏ아아</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</c:when>
			<c:otherwise>
			<div id="free" class="tab-pane fade in active">
				<table id="freeb" class="display" style="width:100%">
					<thead>
						<tr id="firtr">
							<td class="bnum">번호</td>
							<td>제목</td>
							<td id="date">작성일</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list }" var="b" varStatus="i">
							<tr>
								<td>${i.count }</td>
								<td id="btitle"><a
									href="/boardView.do?boardType=3&boardNo=${b.boardNo}">${b.boardTitle }&nbsp;</a></td>
								<td>${b.regDate }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			</c:otherwise>
			</c:choose>
			<div id="qna" class="tab-pane fade">
				<table id="qnab" class="display" style="width:100%">
						<thead>
							<tr id="firtr">
								<td class="bnum">번호</td>
								<td>제목</td>
								<td id="date">작성일</td>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list }" var="b" varStatus="i">
								<tr>
									<td>${i.count }</td>
									<td id="btitle"><a
										href="/boardView.do?boardType=3&boardNo=${b.boardNo}">${b.boardTitle }&nbsp;</a></td>
									<td>${b.regDate }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
			</div>
			<div id="comment" class="tab-pane fade">
				<table id="commentb" class="display" style="width:100%">
						<thead>
							<tr id="firtr">
								<td class="bnum">번호</td>
								<td>제목</td>
								<td id="date">작성일</td>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list }" var="b" varStatus="i">
								<tr>
									<td>${i.count }</td>
									<td id="btitle"><a
										href="/boardView.do?boardType=3&boardNo=${b.boardNo}">${b.boardTitle }&nbsp;</a></td>
									<td>${b.regDate }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
			</div>
		</div>

	<div id="">
		
	</div>
	</div>

	<script type="text/javascript">
		$(document).ready(function() {
			 $("#noticeb").DataTable({
	        	 "language": { //메뉴한글화
		        		"decimal" : "",
		                "emptyTable" : "데이터가 없습니다.",
		                "info" : "총 _TOTAL_  _START_에서 _END_까지 표시",
		                "infoEmpty" : "0명",
		                "infoFiltered" : "(전체 _MAX_ 개 중 검색결과)",
		                "infoPostFix" : "",
		                "thousands" : ",",
		                "lengthMenu" : "_MENU_ 개씩 보기",
		                "loadingRecords" : "로딩중...",
		                "processing" : "처리중...",
		                "search" : "검색 : ",
		                "zeroRecords" : "검색된 데이터가 없습니다.",
		                "paginate" : {
		                    "first" : "첫 페이지",
		                    "last" : "마지막 페이지",
		                    "next" : "다음",
		                    "previous" : "이전"
		                }
		            }
	       	 });
			 
			 $("#freeb").DataTable({
	        	 "language": { //메뉴한글화
		        		"decimal" : "",
		                "emptyTable" : "데이터가 없습니다.",
		                "info" : "총 _TOTAL_  _START_에서 _END_까지 표시",
		                "infoEmpty" : "0명",
		                "infoFiltered" : "(전체 _MAX_ 개 중 검색결과)",
		                "infoPostFix" : "",
		                "thousands" : ",",
		                "lengthMenu" : "_MENU_ 개씩 보기",
		                "loadingRecords" : "로딩중...",
		                "processing" : "처리중...",
		                "search" : "검색 : ",
		                "zeroRecords" : "검색된 데이터가 없습니다.",
		                "paginate" : {
		                    "first" : "첫 페이지",
		                    "last" : "마지막 페이지",
		                    "next" : "다음",
		                    "previous" : "이전"
		                }
		            }
	       	 });
			 $("#qnab").DataTable({
	        	 "language": { //메뉴한글화
		        		"decimal" : "",
		                "emptyTable" : "데이터가 없습니다.",
		                "info" : "총 _TOTAL_  _START_에서 _END_까지 표시",
		                "infoEmpty" : "0명",
		                "infoFiltered" : "(전체 _MAX_ 개 중 검색결과)",
		                "infoPostFix" : "",
		                "thousands" : ",",
		                "lengthMenu" : "_MENU_ 개씩 보기",
		                "loadingRecords" : "로딩중...",
		                "processing" : "처리중...",
		                "search" : "검색 : ",
		                "zeroRecords" : "검색된 데이터가 없습니다.",
		                "paginate" : {
		                    "first" : "첫 페이지",
		                    "last" : "마지막 페이지",
		                    "next" : "다음",
		                    "previous" : "이전"
		                }
		            }
	       	 });
			 $("#commentb").DataTable({
	        	 "language": { //메뉴한글화
		        		"decimal" : "",
		                "emptyTable" : "데이터가 없습니다.",
		                "info" : "총 _TOTAL_   _START_에서 _END_까지 표시",
		                "infoEmpty" : "0명",
		                "infoFiltered" : "(전체 _MAX_ 개 중 검색결과)",
		                "infoPostFix" : "",
		                "thousands" : ",",
		                "lengthMenu" : "_MENU_ 개씩 보기",
		                "loadingRecords" : "로딩중...",
		                "processing" : "처리중...",
		                "search" : "검색 : ",
		                "zeroRecords" : "검색된 데이터가 없습니다.",
		                "paginate" : {
		                    "first" : "첫 페이지",
		                    "last" : "마지막 페이지",
		                    "next" : "다음",
		                    "previous" : "이전"
		                }
		            }
	       	 });
		});
	</script>
</body>
</html>