<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/spaceCss/space_default.css" rel="stylesheet">
<link href="resources/spaceCss/space_mypage.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<jsp:include page="/WEB-INF/views/common/mypageMenu.jsp" />
	<div class="container">
		<p>${sessionScope.m.memberId }님의대관 신청 정보입니다.</p>
		<div class="table-box">
			<table class="table table-bordered">
				<tr>
					<th>No.</th>
					<th>공간 이름</th>
					<th>예약 시간</th>
					<th>예약 날짜</th>
					<th>용도</th>
					<th>주요 시설</th>
					<th>주요 물품</th>
					<th>인원</th>
					<th>가격</th>
					<th>상태</th>
					<th>리뷰</th>
				</tr>
				<c:forEach items="${list }" var="l" varStatus="i">
					<tr>
						<td>${i.count }</td>
						<td>${l.spaceName }</td>
						<td>${l.startTime }~${l.endTime }</td>
						<td>${l.rentalDate }</td>
						<td>${l.spacePurpose }</td>
						<td>${l.mainFacility }</td>
						<td>${l.mainProduct }</td>
						<td>${l.rentalPeople }/${l.maxPeople }명</td>
						<td>${l.price }원</td>
						<c:if test="${l.rentalStatus eq 1 }">
							<td>심사중</td>
						</c:if>
						<c:if test="${l.rentalStatus eq 2 }">
							<td>확정</td>
						</c:if>
						<td>
							
							<button class="writeBtn" type="button"
								class="btn btn-info btn-lg" data-toggle="modal"
								data-target="#myModal">리뷰 작성</button>
								<input type="text" id="rentalNo" value="${l.rentalNo }">
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
	<!-- Modal -->
		<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">리뷰를 작성하세요.</h4>
						</div>
						<div class="modal-body">
							<form action="/insertSpaceReview.do" method="post">
								<input type="hidden" name="memberId" value="${sessionScope.m.memberId }">
								<input type="text" value="꺠끗하고 좋았습니다~." name="srContent">
								<div class="modal-b"></div>
								<button type="submit">등록</button>
							</form>
						</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	<script >
	$(".writeBtn").click(
			function() {
				$.ajax({
					url : "/selectRentalInfo.do",
					data : {rentalNo : $(this).next().val()},
					type : "post",
					success : function(data) {
						$(".modal-b").empty();
						$(".modal-b").append("<input type = 'text' name='rentalNo' value='"+data.rentalNo +"'>");
					}
				});
			});</script>
</body>
</html>