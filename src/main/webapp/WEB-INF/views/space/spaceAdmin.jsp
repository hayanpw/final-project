<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link href="resources/spaceCss/space_default.css" rel="stylesheet">
    <link href="resources/spaceCss/space_admin.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
		<div class="container">
			<div class="title">
				<h3>대관신청 관리</h3>
			</div>
			<div class="table-box">
				<table class="table table-bordered" >
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
						<td><img  class="info-img" src="resources/spaceImage/upload/${l.filename }"></td>
						<td>${l.spaceName }</td>
						<td>${l.memberId }</td>
						<td>${l.startTime }~${l.endTime }</td>
						<td>${l.rentalDate }</td>
						<td>${l.rentalPeople }명</td>
						<c:if test="${l.rentalStatus eq 1 }">
							<td>심사중<br>
								<button class="mBtn" onclick="location.href='/mailSend.do?rentalNo=${l.rentalNo}& memberId=${l.memberId }'">확정하기</button>
							</td>
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