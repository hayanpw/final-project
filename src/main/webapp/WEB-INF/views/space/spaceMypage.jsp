<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link href="resources/spaceCss/space_default.css" rel="stylesheet">
    <link href="resources/spaceCss/space_mypage.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<jsp:include page="/WEB-INF/views/common/mypageMenu.jsp"/>
		<div class="container">
	 		<p>${sessionScope.m.memberId }님의 대관 신청 정보입니다.</p>
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
							</tr>
						</c:forEach>
					</table>					
			</div>
		</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>