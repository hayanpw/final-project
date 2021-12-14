<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/spaceCss/space_mypage.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
	<jsp:include page="/WEB-INF/views/common/mypageMenu.jsp" />
	<div class="container">        
        <div class="mypage-title"><span>대</span>관신청내역</div>
        <div class="mypage-container" >
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
<c:set var="sevenDayAfter" value="<%=new Date(new Date().getTime() + 60*60*24*1000*7)%>"/>
<fmt:formatDate value="${sevenDayAfter}" pattern="yyyy-MM-dd" var="sevenDayAfterStr"/>
		<div class="table-box">
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
					<th>체크리스트 작성 여부</th>
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
						<td>
							<c:if test="${l.rentalDate < today && l.rentalStatus eq 2 }">		
								<c:forEach items="${rList }" var="r">
									<c:if test="${l.rentalNo eq r.rentalNo }">
											<p>이미 리뷰를 작성했슴</p>
									</c:if>		
									<c:if test="${l.rentalNo ne r.rentalNo }">
										<button class="writeBtn" type="button"
											class="btn btn-info btn-lg" data-toggle="modal"
											data-target="#myModal">리뷰 작성</button>
									</c:if>		
								</c:forEach>		
							</c:if>
							<c:if test="${l.rentalDate > today }">
								사용 전 입니다.
							</c:if>			
						</td>
						<td>
							<c:choose>
								<c:when test="${l.usedBoard eq 1 }">
									작성완료
								</c:when>
								<c:when test="${l.usedBoard eq 0 && l.rentalDate>today }">
									-
								</c:when>
								<c:when test="${l.usedBoard eq 0 && l.rentalDate<today}">
									<a href="/selectSpaceBoardList.do?reqPage=1">작성하러가기</a>
								</c:when>
								<c:when test="${l.usedBoard eq 0 && l.rentalDate < sevenDayAfterStr}">
									작성안함
								</c:when>
							</c:choose>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
        </div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
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
