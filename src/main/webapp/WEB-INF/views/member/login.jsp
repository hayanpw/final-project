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
	<h1>미완성 로그인틀..</h1>
	<hr>
	<form action="/login.do" method="post">
		<fieldset>
			<legend>로그인</legend>
			아이디 <input type="text" name="memberId"><br>
			비밀번호 <input type="password" name="memberPassword"><br>
			<input type="submit" value="로그인">
			<a href="#">회원가입</a>
		</fieldset>
	</form>
</body>
</html>