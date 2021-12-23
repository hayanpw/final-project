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
	width: 220px;
	border-top: 7px solid #064663;
	margin-top: 70px;
	margin-left: 70px;
	font-weight: 700;
	font-size: 30px;
	margin-bottom: 50px;
}
.boardName{
	margin-top: 70px;
	margin-left: 30px;
	margin-bottom:20px;
	font-weight: 700;
	font-size: 30px;
	color: #064663;
}

.display {
	text-align: center;
}

#table, #nav, .table{
	margin-bottom: 50px;
}

#date {
	width: 100px;
}

.display td>a:hover {
	text-decoration: none;
}

.display tr:hover {
	background-color: #f3efe6;
}

.display td {
	border-top: 1px solid #f3efe6;
	font-weight: 100;
	height: 40px;
	font-size: 18px;
	line-height: 40px;
}

#firtr>td {
	text-align: center;
	border-top: 3px solid #064663;
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
#firtr>td:first-child {
	width: 50px;
}
#btnColor{
	background-color: #064663;
	border: none;
	float: right;
}

</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.css">
	<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.js"></script>
	<div class="container" id="container">
		<div id="title">내가 쓴 글/댓글</div>
			<c:if test="${sessionScope.m.memberLevel eq 0 }">
			<div class="boardName">공지게시판</div>
			<div class="table">
				<table id="noticeb" class="display" style="width:100%">
					<thead>
						<tr id="firtr">
							<td>선택</td>
							<td>번호</td>
							<td>제목</td>
							<td>작성일</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${noticeList }" var="b" varStatus="i">
							<tr>
								<td><input type="checkbox"  class="chkn"></td>
								<td><input type="hidden" value="${b.boardNo }">${i.count }</td>
								<td id="btitle"><a
									href="/boardView.do?boardType=1&boardNo=${b.boardNo}">${b.boardTitle }&nbsp;</a></td>
								<td>${b.regDate }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<button id="btnColor" class="btn btn-danger chkDeleteNotice">공지글삭제</button>
			</div>	
			</c:if>	
			<div class="boardName">소통게시판</div>
			<div class="table">
				<table id="freeb" class="display table" style="width:100%">
					<thead>
						<tr id="firtr">
							<td>선택</td>
							<td>번호</td>
							<td>제목</td>
							<td>작성일</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${freeList }" var="b" varStatus="i">
							<tr>
								<td><input type="checkbox" class="chkf"></td>
								<td><input type="hidden" value="${b.boardNo }">${i.count }</td>
								<td id="btitle"><a
									href="/boardView.do?boardType=3&boardNo=${b.boardNo}">${b.boardTitle }&nbsp;[${b.commentCount }]</a></td>
								<td>${b.regDate }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<button id="btnColor" class="btn btn-danger chkDeleteFree">소통글삭제</button>
				</div>
				<div class="boardName">문의게시판</div>
				<div class="table">
				<table id="qnab" class="display table" style="width:100%">
						<thead>
							<tr id="firtr">
							 	<td>선택</td>
								<td>번호</td>
								<td>제목</td>
								<td>답변상태</td>
								<td>작성일</td>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${qnaList }" var="b" varStatus="i">
								<tr>
									<td><input type="checkbox" class="chkq"></td>
									<td><input type="hidden" value="${b.boardNo }">${i.count }</td>
									<td id="btitle"><a
										href="/boardView.do?boardType=2&boardNo=${b.boardNo}">${b.boardTitle }&nbsp;</a></td>
									<c:choose>
										<c:when test="${b.commentCount ne 0}">
										<td id="answerAfter">답변완료</td>
										</c:when>
										<c:otherwise>
										<td id="answerBefore">미답변</td>
										</c:otherwise>
									</c:choose>
									<td>${b.regDate }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<button id="btnColor" class="btn btn-danger chkDeleteQna">문의글삭제</button>
					</div>
					<div class="boardName">댓글</div>
					<div class="table">
					<table id="commentb" class="display table" style="width:100%">
						<thead>
							<tr id="firtr">
								<td>선택</td>
								<td>번호</td>
								<td>댓글</td>
								<td>글제목</td>
								<td>작성일</td>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${commentList }" var="b" varStatus="i">
								<tr>
									<td><input type="checkbox"></td>
									<td>${i.count }</td>
									<td>${b.bcContent }</td>
									<td id="btitle"><a href="/boardView.do?boardType=${b.boardType }&boardNo=${b.boardRef }">${b.boardTitle }</a></td>
									<td>${b.regDate }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<button id="btnColor" class="btn btn-danger">댓글삭제</button>
					</div>
		</div>
	<script type="text/javascript">
	 $(document).ready(function() {
	        $("#noticeb").DataTable({
	        	 "language": { //메뉴한글화
		        		"decimal" : "",
		                "emptyTable" : "쓴 공지글이 없습니다.",
		                "info" : "총 _TOTAL_개   _START_에서 _END_까지 표시",
		                "infoEmpty" : "총 0개",
		                "infoFiltered" : "(전체 _MAX_  중 검색결과)",
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
		                },
		                "aria" : {
		                    "sortAscending" : " :  오름차순 정렬",
		                    "sortDescending" : " :  내림차순 정렬"
		                }
		            }
	 	});
	        $("#freeb").DataTable({
	        	columnDefs:[
	        		{targets:[0],width:"30px"},
	        		{targets:[1],width:"30px"},
	        		{targets:[2],width:"70%"}
	        	],
	        	 "language": { //메뉴한글화
		        		"decimal" : "",
		                "emptyTable" : "쓴 소통게시글이 없습니다.",
		                "info" : "총 _TOTAL_개   _START_에서 _END_까지 표시",
		                "infoEmpty" : "총 0개",
		                "infoFiltered" : "(전체 _MAX_  중 검색결과)",
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
		                },
		                "aria" : {
		                    "sortAscending" : " :  오름차순 정렬",
		                    "sortDescending" : " :  내림차순 정렬"
		                }
		            }
	 	});
	        $("#qnab").DataTable({
	        	columnDefs:[
	        		{targets:[0],width:"35px"},
	        		{targets:[1],width:"35px"},
	        		{targets:[2],width:"600px"}
	        	],
	        	 "language": { //메뉴한글화
		        		"decimal" : "",
		                "emptyTable" : "문의내역이 없습니다.",
		                "info" : "총 _TOTAL_개   _START_에서 _END_까지 표시",
		                "infoEmpty" : "총 0개",
		                "infoFiltered" : "(전체 _MAX_  중 검색결과)",
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
		                },
		                "aria" : {
		                    "sortAscending" : " :  오름차순 정렬",
		                    "sortDescending" : " :  내림차순 정렬"
		                }
		            }
	 	});
	        $("#commentb").DataTable({
	        	columnDefs:[
	        		{targets:[0],width:"35px"},
	        		{targets:[1],width:"35px"},
	        		{targets:[4],width:"100px"}
	        	],
	        	 "language": { //메뉴한글화
		        		"decimal" : "",
		                "emptyTable" : "쓴 댓글이 없습니다.",
		                "info" : "총 _TOTAL_개   _START_에서 _END_까지 표시",
		                "infoEmpty" : "총 0개",
		                "infoFiltered" : "(전체 _MAX_  중 검색결과)",
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
		                },
		                "aria" : {
		                    "sortAscending" : " :  오름차순 정렬",
		                    "sortDescending" : " :  내림차순 정렬"
		                }
		            }
	 	});
	 });
	   
	 $(".chkDeleteNotice").click(function(){
			var inputs=$(".chkn:checked");
			var num = new Array(); 
			inputs.each(function(idx,item){
				var boardNo = $(item).parent().next().children().val();
				num.push(boardNo);
			});
			if(!inputs.length){
				alert("삭제할 글을 선택해 주세요");
			}else{
			location.href="/boardDelete.do?boardNo=0&boardType=4&num="+num.join("/");
			}
		});
	 $(".chkDeleteFree").click(function(){
			var inputs=$(".chkf:checked");
			var num = new Array(); 
			inputs.each(function(idx,item){
				var boardNo = $(item).parent().next().children().val();
				num.push(boardNo);
			});
			if(!inputs.length){
				alert("삭제할 글을 선택해 주세요");
			}else{
			location.href="/boardDelete.do?boardNo=0&boardType=4&num="+num.join("/");
			}
		});
	 $(".chkDeleteQna").click(function(){
			var inputs=$(".chkq:checked");
			var num = new Array(); 
			inputs.each(function(idx,item){
				var boardNo = $(item).parent().next().children().val();
				num.push(boardNo);
			});
			if(!inputs.length){
				alert("삭제할 글을 선택해 주세요");
			}else{
			location.href="/boardDelete.do?boardNo=0&boardType=4&num="+num.join("/");
			}
		});
	</script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>