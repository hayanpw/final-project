<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="container">
		<p>${a.academyStart }</p>
		<p>${a.academyEnd }</p>
		<p>${a.academyTitle }</p>
		<img src="${a.academyPhoto }">
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>