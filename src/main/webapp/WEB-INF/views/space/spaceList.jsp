<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link href="resources/spaceCss/space_default.css" rel="stylesheet">
    <link href="resources/spaceCss/space_list.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="container">
			<c:forEach items="${spaceList }" var ="s">
		<div class="space-list">
				<c:forEach items="${fileList }" var="f" >
					<c:if test="${s.spaceNo eq f.spaceNo }">
						<img  class="info-img" src="resources/spaceImage/upload/${f.filename }">
					</c:if> 
				</c:forEach>
				<p>공간 : ${s.spaceName }</p>
				<p>용도 : ${s.spacePurpose }</p>
				<p>수용인원 : ${s.maxPeople }</p>
				<p>가격 : ${s.price }</p>
		</div>
			</c:forEach>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>