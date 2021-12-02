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
					<a type="text" class="searchidpw" data-toggle="modal" data-target="#sModal">ID · PASSWORD 찾기</a>
				</fieldset>
		</form>
		<hr>
		<a href="/joinFrm.do">회원가입[임시]</a>
		</div>
		<div class="modal" id="sModal">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h3 class="modal-title">ID · PASSWORD 찾기</h3>
                    </div>
                    <div class="modal-body">
                       	<form action="/searchidpw" method="post">
							<fieldset>
									<label for="memberId">Email </label><input type="text" name="memberEmail"><br><br>
									<label for="memberId">Number </label><input type="text" name="authentication">
														<a type="text" class="sendemail">전송</a>
                             		<button type="submit" class="btn btn-block intputBtn">찾기</button>
								</fieldset>
						</form>
                    </div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>