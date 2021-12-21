<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/spaceCss/space_admin.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />

	<jsp:include page="/WEB-INF/views/common/adminpageMenu.jsp" />
	<div class="container">
		<div class="mypage-title">
			<span>대</span>관관리
		</div>
		<div class="mypage-container">
			<div class="rental-mgr">
				<div class="table-box">
					<table class="table table-bordered">
						<tr>
							<th>No.</th>
							<th>이미지</th>
							<th>공간 이름</th>
							<th>아이디</th>
							<th>예약 시간</th>
							<th>예약 날짜</th>
							<th>예약 명수</th>
							<th>상태</th>
						</tr>
						<c:forEach items="${list }" var="l" varStatus="i">
							<tr>
								<td>${i.count }</td>
								<td><img class="info-img"
									src="resources/spaceImage/upload/${l.filename }"></td>
								<td>${l.spaceName }</td>
								<td>${l.memberId }</td>
								<td>${l.startTime }~${l.endTime }</td>
								<td>${l.rentalDate }</td>
								<td>${l.rentalPeople }명</td>
								<c:if test="${l.rentalStatus eq 1 }">
									<td>심사중<br>
										<button class="mBtn"
											onclick="location.href='/mailSend.do?rentalNo=${l.rentalNo}& memberId=${l.memberId }'">확정하기</button>
									</td>
								</c:if>
								<c:if test="${l.rentalStatus eq 2 }">
									<td>확정</td>
								</c:if>
							</tr>
						</c:forEach>
					</table>
				</div>
				<div class="page-box">${pageNavi }</div>
			</div>
			<div class="space-box">
				<div class="choice">
					<span id="sL">공간 리스트</span><span id ="dL">삭제 된 공간</span>
				</div>
				<c:forEach items="${space }" var="s">
					<div class="noDel-space">
						<p>공간 이름: ${s.spaceName }</p>
						<p>용도 : ${s.spacePurpose }</p>
						<p>수용인원 :${s.maxPeople }</p>
						<p>가격 : ${s.price }</p>
						<button id="del-btn" class="btn btn-default"
							onclick="location.href='/spaceDelete.do?spaceNo=${s.spaceNo}'">삭제하기</button>
						<button id="update-btn" class="btn btn-default"
							onclick="location.href='/spaceUpdate.do?spaceNo=${s.spaceNo}'">수정하기</button>
					</div>
				</c:forEach>
				<c:forEach items="${delSpace }" var="d">
					<div class="del-space">
						<p>공간 이름 : ${d.spaceName }</p>
						<p>용도 : ${d.spacePurpose }</p>
						<p>수용인원 :${d.maxPeople }</p>
						<p>가격 : ${d.price }</p>
					</div>
				</c:forEach>
			</div>
			<div class="del-black">
				블랙리스트 모음
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	<script>
		$(".del-space").hide();
	</script>
</body>
</html>
