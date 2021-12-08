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
					<label for="memberId" class="reg">ID </label><input type="text" name="memberId"><br><br>
					<label for="memberPassword" class="reg"> PW </label><input type="password" name="memberPassword"><br><br>
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
									<label for="memberEmail" class="reg" >Email </label><input type="text" name="memberEmail" id="memberEmail"><br><br>
									<button type="button" onclick="checkEmail();" id="btnOpen1">전송</button>
									<span id="ajaxEmailcheck"></span>
									<div class="agreebox adcheck">
										<span id="authMsg"></span><input type="hidden" id="emailchk">
										<div></div>
									</div>               
									<div class="input_wrap">
										<div></div>
										<div id="search_input">
											<input type='text' id="authCode" class="search_input" placeholder="인증 코드 입력" /><span id="timeZone"></span>
										</div>
										<div>
											<span></span>
										</div>
							<button type="submit" class="btn btn-block intputBtn">찾기</button> 
							</div>
							</fieldset>
						</form>
					</div>
                  </div>
				</div>
			</div>
		</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<script>
	function checkEmail() {
		var memberEmail = $('#memberEmail').val();
		console.log(memberEmail);
		$.ajax({
					url : "/ajaxEmailCheck.do",
					data : {memberEmail : memberEmail},
					type : "post",
					success : function(data) {
						if (data == 1) {
							$("#ajaxEmailcheck").html("사용 가능한 이메일 입니다.");
							$("#emailchk").val('1');

							var email = $('#memberEmail').val();
							var mailCode = '';
							$.ajax({
								url : "/sendMail.do",
								data : {email : email},
								type : "post",
								success : function(data) {
									mailCode = data;
									authTime();
								}
							});
							
							var intervalId;
							
							function authTime() {
								$("#timeZone")
										.html(
												"<span id='min'>3</span> : <span id='sec'>00</span>");
								intervalId = window.setInterval(function() {
									timeCount();
								}, 1000);
							}
							function timeCount() {
								var min = Number($("#min").html());
								var sec = $("#sec").html();
								if (sec == "00") {
									if (min == 0) {
										mailCode = null;
										clearInterval(intervalId);
									} else {
										$("#min").html(--min);
										$("#sec").html(59);

									}
								} else {
									var newSec = Number(sec);
									newSec--;
									if (newSec < 10) {
										$("#sec").html("0" + newSec);
									} else {
										$("#sec").html(newSec);
									}
								}
							}
							$("#btn btn-block intputBtn").click(function() {

								if (mailCode == null) {
									$("#authMsg").html("인증 실패");
									$("#authMsg").css("color", "red");
									$("#emailchk").val('2');
								} else {
									if ($("#authCode").val() == mailCode) {
										$("#authMsg").html("인증성공");
										$("#authMsg").css("color", "blue"); //여기다가 인증추가를 해야함
										$("#emailchk").val('1');
										clearInterval(intervalId);
										$("#timeZone").empty();
										$("#emailcheck").val('1');

									} else {
										$("#authMsg").html("인증코드를 확인하세요");
										$("#authMsg").css("color", "red");
										$("#emailchk").val('2');
									}
								}

							})

						} else if (data == 0) {
							$("#ajaxEmailcheck").html("일치하는 이메일이 없습니다");
							$("#ajaxEmailcheck").css("color", "red");
						}

					}
				});
	};
	</script>
</body>
</html>