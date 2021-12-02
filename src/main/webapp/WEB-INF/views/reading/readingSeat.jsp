<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>좌석 선택</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
		<div class="container">
		
		<c:forEach var="j" begin="5" end="85" step="10">
		</c:forEach>
			<c:forEach var="i" begin="1" end="90">
				<c:choose>
					<c:when test="${i/5 eq 1.0}">
						<span>
							${i }5
						</span>
					</c:when>
					<c:when test="${i%10 eq 0}">
						<span id="seat${i}">
							${i } 
						</span>
						<br>
					</c:when>
					<c:otherwise>
						<span id="seat${i}">
							${i } 
						</span>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		
		
		
			<div class="container-right">
				<form action="" method="post">
					<input type="text" name="readingNum">
					<input type="text" name="readingDay" value="${re.readingDay }">
					<input type="text" name="memberId" value="${sessionScope.m.memberId }">
					<input type="hidden" name="sub"class="btn btn-success btn-lg" value="좌석 선택하기" style="background-color: #563D39; border-color: #563D39">
				</form>
			</div>
			<script>
			
			</script>
		</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>