<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/memberCss/login.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="container">
		<div class="login-title"><span>로그</span>인</div>
		<div class="login-box">
		<form action="/login.do" method="post">
			<fieldset>
					<label for="memberId">ID </label><input type="text" name="memberId"><br><br>
					<label for="memberPassword">PW </label><input type="password" name="memberPassword"><br><br>
					<input type="submit" value="login">
					<a href="#" class="searchidpw">ID · PASSWORD 찾기</a>
				</fieldset>
		</form>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>