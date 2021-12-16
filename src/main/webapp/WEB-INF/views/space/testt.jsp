<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="now" class="java.util.Date" />
	<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
	<table class="table table-bordered">
		<tr>
			<th>No.</th>
			<th>예약 공간</th>
			<th>예약 시간</th>
			<th>예약 날짜</th>
			<th>용도</th>
			<th>인원</th>
			<th>가격</th>
			<th>상태</th>
			<th>리뷰</th>
			<th>체크리스트 작성 여부 <img id="q-img"
				src="resources/spaceImage/ask.png" style="width: 20px;"></th>
		</tr>
		<c:forEach items="${list }" var="l" varStatus="i">
			<tr>
				<td>${i.count }</td>
				<td>${l.spaceName }</td>
				<td>${l.startTime }~${l.endTime }</td>
				<td>${l.rentalDate }</td>
				<td>${l.spacePurpose }</td>
				<td>${l.rentalPeople }/${l.maxPeople }명</td>
				<td>${l.price }원</td>
				<c:if test="${l.rentalStatus eq 1 }">
					<td>심사중</td>
				</c:if>
				<c:if test="${l.rentalStatus eq 2 }">
					<td>확정</td>
				</c:if>
				<td><c:choose>
						<c:when test="${l.srNo eq 0 || l.delYn eq 'Y' }">
							<button class="writeBtn" type="button"
								class="btn btn-info btn-lg" data-toggle="modal"
								data-target="#myModal">리뷰 작성</button>
							<input type="hidden" id="rentalNo" value="${l.rentalNo }">

						</c:when>
						<c:otherwise>
							<button class="updateBtn" type="button"
								class="btn btn-info btn-lg" data-toggle="modal"
								data-target="#rModal">리뷰 수정</button>
							<input type="hidden" id="rentalNo" value="${l.rentalNo }">
							<div class="d-review">
								<img src="resources/spaceImage/x.png"
									style="width: 20px; opacity: 0.8;">
							</div>
						</c:otherwise>
					</c:choose></td>
				<td><c:choose>
						<c:when test="${l.usedBoard eq 1 }">
									작성완료
								</c:when>
						<c:when test="${l.usedBoard eq 0 && l.rentalDate>today }">
									-
								</c:when>
						<c:when test="${l.usedBoard eq 0 && l.rentalDate<today}">
							<a id="ckList" href="/selectSpaceBoardList.do?reqPage=1">☞작성하러가기</a>
						</c:when>
					</c:choose></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>