<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/spaceCss/space_default.css" rel="stylesheet">
<link href="resources/spaceCss/space_boardList.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="container">
		<input type="hidden" id="memberId" value="${sessionScope.m.memberId }">
		<button class="writeBtn" type="button" class="btn btn-info btn-lg"
			data-toggle="modal" data-target="#myModal">글쓰기</button>
		<!-- Modal -->
		<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<c:if test="${empty sessionScope.m  }">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">로그인 후 사용 가능 합니다.</h4>
						</div>
						<div class="modal-body">
							<a href="/loginFrm.do">로그인</a>
						</div>
					</c:if>
					<c:if test="${not empty sessionScope.m  }">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">작성할 대관을 선택하세요.</h4>
						</div>

						<div class="modal-body"></div>
					</c:if>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>


		<div class="table-box">
			<table class="table table-border">
				<tr>
					<th>No.</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>사용공간</th>
				</tr>
				<c:forEach items="${list }" var="l" varStatus="i">
					<tr>
						<td>${i.count }</td>
						<td>${l.ubTitle }</td>
						<td>${l.memberId }</td>
						<td>${l.ubDate }</td>
						<td>${l.spaceName }</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div class="page-box">${pageNavi }</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	<script>
		$(".writeBtn").click(
				function() {
					$.ajax({
						url : "/selectSpaceBoard.do",
						data : {
							memberId : $("#memberId").val()
						},
						type : "get",
						success : function(data) {
							if(data.length > 0){
								for (var i = 0; i < data.length; i++) {
									$(".modal-body").append(
											"<a class='choice' href = '/writeSpaceBoard.do?rentalNo="+data[i].rentalNo + "'>"
													+ data[i].spaceName + "/"
													+ data[i].rentalDate
													+ "</a><br>");
								}
							}else{
								$(".modal-body").append("<p>작성할 대관 내역이 없습니다.</p>")
							}
						}
					});
				});
	</script>
</body>
</html>