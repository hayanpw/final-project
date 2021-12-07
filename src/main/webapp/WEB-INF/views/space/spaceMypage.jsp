<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link href="resources/spaceCss/space_default.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
		<div class="container">
			<div class="rental-info">
				<p>${sessionScope.m.memberId }님의 대관 신청 정보입니다.</p>
				<c:forEach items="${rList }" var="r">
					<table class="table">
						<tr>
							<c:forEach items="${fvList }" var="f">
								<c:if test="${r.spaceNo eq f.spaceNo }">
									<td>꺄</td>
								</c:if>
							</c:forEach>
						</tr>
						<tr>
							<td>예약 날짜</td>
							<td>${r.rentalDate }</td>
						</tr>
					</table>
				</c:forEach>
			</div>
		</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>