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
		<!-- 로그인  -->
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
		<hr>
		
		<!-- 아이디 비밀번호 찾기 modal -->
		<div class="login-box" style="width:600px">
		</div>
		</div>
		<div class="modal" id="sModal">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h3 class="modal-title">ID · PASSWORD 찾기</h3>
                    </div>
                    <!-- 이메일인증 modal -->
                    <div class="modal-body">
                       	<div>
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
											<span id="authMsg"></span>										
										</div>
										<div>
											<span></span>
										</div>
							<button type="button" onclick="checkMailCode();" class="btn btn-block intputBtn">찾기</button> 
							</div>
							</fieldset>
						</div>
						<div>
						 <!-- 아이디 찾기 -->
							<div> <label id="resultId" class="reg"> ID : </label><span id="resultId"></span></div><br><br>
							
							<button id="moveLogin">로그인하러가기</button>

							<button id="changePwFrm">비밀번호변경하기</button>
						</div>
						<div>
						<!-- 비밀번호 변경 -->
							<form action="/searchidpw.do" method="post">
								<fieldset>
										<label for ="memberId" class="reg">ID</label><input type="text" name="memberId" value="${memberId}"><br><br>
										<label for="memberPassword" class="reg"> PW </label>
										<input type="password" class="input" name="memberPassword" id="memberPassword"> <span id="pw-detail"> 8~12자 이내 영문,숫자,특수문자(“”-+/\:; 제외)</span> <span id="pwChkRule"></span><br><br>
										<label for="pw_re" class="reg"> 확인 </label>
										<input type="password" class="input" name="pw_re" id="chkpw"> <span id="pwChk"></span>
										<input type="submit" value="변경">
										
									</fieldset>
							</form>
						</div>
						
					</div>
                  </div>
				</div>
			</div>
		</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	
	
	<script>
 	//$(".modal").modal("hide");
	$("#moveLogin").click(function(){
		$("[name=memberId]").val($('#resultId').html());
		
		$(".close").click();
	});
	$("#changePwFrm").click(function(){
		$(".modal-body>div").eq(1).hide();
		$(".modal-body>div").eq(2).show();
	});
	var mailCode = '';
	function checkMailCode(){
		
		//입력값, ajax로 받은 메일코드가 일치하는지 확인
		//입려값 id="authCode" 받은메일코드 mailCode		
		var authCode = $('#authCode').val();

		if (authCode == "") {
			alert("값없음");
		} else if (mailCode == authCode) {
			//ajax로 email을 통해서 회원 아이디 조회
			
			$(".modal-body>div").eq(0).hide();
			$(".modal-body>div").eq(1).show();
			
			(function(){
				var memberEmail = $('#memberEmail').val();
				$.ajax({
					url : "/searchId.do",
					data : {memberEmail : memberEmail},
					type : "post",
					success : function(data) {
						if(data!=""){
							var resultId = $('#resultId').html(data);
							
							console.log(data+"성공");
						}else{
							console.log(data+"실패");
						}
					}
				});
	        })();
		
			
		} else {
			alert("틀리자");
		}
	}
	
	function checkEmail() {
		var memberEmail = $('#memberEmail').val();
		$.ajax({
					url : "/ajaxEmailCheck.do",
					data : {memberEmail : memberEmail},
					type : "post",
					success : function(data) {
						if (data == 1) {
							$("#ajaxEmailcheck").html("전송되었습니다.");
							$("#emailchk").val('1');

							var email = $('#memberEmail').val();
							
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
							$("#btn btn-block intputBtn").click(function checkMailCode() {

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
	
	
	
	//비밀번호 여부
	function chkPw(obj) {
		var pwChk = document.getElementById("pwChk");
		var pw = document.getElementsByName("memberPassword")[0].value;
		var pwRe = obj.value;
	
		
			
		if (pwRe == "") {
			pwChk.innerHTML = "";
			pwCheck = false;
		} else if (pw != pwRe) {
			pwChk.innerHTML = "패스워드가 일치하지 않습니다.";
			pwChk.style.color = "red";
			obj.style.border = "1px solid red";
			pwCheck = false;
		} else {
			pwChk.innerHTML = "패스워드가 일치합니다.";
			pwChk.style.color = "#1f4787";
			obj.style.border = "1px solid #1f4787";
			pwCheck = true;
		}
	}
	var memberPwchk = true;
	$("[name=memberPassword]").eq(0).keyup(function() {
		var memberPassword = $(this).val();
		// (알파벳 하나)(숫자 하나)(특수문자 하나)(문자열)
		 var regExpPw = /(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,12}/; 
		/*  var regExpPw = /^[a-zA-Z0-9]{8,12}$/; */
		 
		if (regExpPw.test(memberPassword)){
			$('#pwChkRule').html("사용가능한 비밀번호입니다.");
			$('#pwChkRule').css('color' ,"#1f4787");
			memberPwchk = true;
			
		}else{
			$('#pwChkRule').html("비밀번호는  8~12자 이내 영문,숫자,특수문자로 입력해주세요.");
			$('#pwChkRule').css('color' ,"red");
			memberPwchk = false;
		}
	});
	</script>
</body>
</html>