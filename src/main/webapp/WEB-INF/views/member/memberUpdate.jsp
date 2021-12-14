<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/memberCss/join.css">
<script	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript"	src="http://code.jquery.com/jquery-3.3.1.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
	<jsp:include page="/WEB-INF/views/common/mypageMenu.jsp"/>
	
	<div class="container">        
        <div class="mypage-title"><span>개</span>인정보관리</div>
        <div class="mypage-container">
				<form action="/memberUpdate.do" method="post" style="padding-left: 200px; padding-top:50px">
						<table class="inputTbl">
							<tr>
								<td>아이디</td>
								<td><input type="text" class="input" name="memberId"
								value="${sessionScope.m.memberId}" readonly></td>
							</tr>
							<tr>
								<td>이름</td>
								<td><input type="text" class="input short3" name="memberName" 
								value="${sessionScope.m.memberName}" readonly></td>
							</tr>
							<tr>
								<td>휴대전화번호</td>
								<td><input type="text" name="memberPhone" value="${sessionScope.m.memberPhone}" readonly>
								</td>
							</tr>
							<tr>
								<td>생년월일</td>
								<td><input type="text" id="memberBirthday" name="memberBirthday" class="mypagecontrol" value="${m.memberBirthday}" readonly></td>
							</tr>
							<tr>
								<td>주소입력</td>
								<td><input type="text" id="postcode" class="input short3" name="postcode" readonly>
									<button onclick="addrSearch();" type="button" class="nextBtn">주소검색</button></td>
							</tr>
							<tr>
								<td></td>
								<td style="padding-top: 5px;"><input type="text"
									id="addressRoad" class="input long" name="addressRoad" readonly>
									<input type="text" id="addressDetail" class="input long"
									name="addressDetail" placeholder="상세주소"></td>
							</tr>
							<tr>
								<td>이메일</td>
								<td><input type="text" class="input" id="email1" name="email1"> @ <input type="text" class="input" id="email2" name="email2"> 
								<select name="emailSelect" id="emailSelect" onchange="mailSelect(this);">
										<option value="">직접입력</option>
										<option value="naver.com">naver.com</option>
										<option value="nate.com">nate.com</option>
										<option value="gmail.com">gmail.com</option>
										<option value="hanmail.net">hanmail.net</option>
								</select>
								<button type="button" onclick="checkEmail();" id="btnOpen1" class="nextBtn">중복체크</button>
									<span id="ajaxEmailcheck"></span>
									<div class="agreebox adcheck">
										<span id="authMsg"></span><input type="hidden" id="emailchk">
										<div></div>
									</div>
								</td>
							</tr>
						</table>
					</div>
					<div class="btnBox">
						<button  type="submit" class="nextBtn">정보수정</button>
					</div>		
				</form>
				<form action="" id="modal1">
				<div id='content' class="modal_window">
					<div class="modal_window_text" id="auth">
						<div>
							<input type='button' value='X' class="close" id='btnClose1' />
						</div>
						<div>
							<!-- 인증 받으면 넘어가는 hidden-->
							<input type="hidden" id="emailcheck">
						</div>
						<div class="input_wrap">
							<div></div>
							<div id="search_input">
								<input type='text' id="authCode" class="search_input"
									placeholder="인증코드입력" /><span id="timeZone"></span>
							</div>
							<div>
								<span></span>
							</div>
						</div>
					</div>
					<div class="modal_window_btn">
						<div>
							<input type='button' value='조회' id='btnCheck1' class="nextBtn" />
						</div>
					</div>
				</div>
			</form>
			</div>
	<script>
	function addrSearch() {
		new daum.Postcode({
			oncomplete : function(data) {
				$("#postcode").val(data.zonecode);
				$("#addressRoad").val(data.roadAddress);
				$("#addressDetail").focus();
			}
		}).open();
	}
	
	function checkEmail() {
		var memberEmail = $('#email1').val() + '@' + $('#email2').val();
		$.ajax({
					url : "/ajaxEmailCheck.do",
					data : {memberEmail : memberEmail},
					type : "post",
					success : function(data) {
						if (data == 0) {
							$("#ajaxEmailcheck").html("");
							$("#emailchk").val('1');
							console.log(memberEmail);
							//아이디 사용가능시 MODAL창 인증버튼시 팝업
							var btnOpen1 = document
									.getElementById('btnOpen1');
							var btnCheck1 = document
									.getElementById('btnCheck1');
							var btnClose1 = document
									.getElementById('btnClose1');

							// email check modal 창을 감춤
							var closeRtn1 = function() {
								var modal1 = document
										.getElementById('modal1');
								modal1.style.display = 'none';

							}
							// email check modal 창을 보여줌

							var modal1 = document.getElementById('modal1');
							var email = $('#email1').val() + '@'
									+ $('#email2').val();
							
							modal1.style.display = 'block';
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

							btnCheck1.onclick = closeRtn1;
							btnClose1.onclick = closeRtn1;
							
							

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
							$("#btnCheck1").click(function() {

								if (mailCode == null) {
									$("#authMsg").html("인증 실패");
									$("#authMsg").css("color", "#BDB19A");
									$("#emailchk").val('2');
								} else {
									if ($("#authCode").val() == mailCode) {
										$("#authMsg").html("인증성공");
										$("#authMsg").css("color", "#BDB19A"); //여기다가 인증추가를 해야함
										$("#emailchk").val('1');
										clearInterval(intervalId);
										$("#timeZone").empty();
										$("#emailcheck").val('1');

									} else {
										$("#authMsg").html("인증코드를 확인하세요");
										$("#authMsg").css("color", "#BDB19A");
										$("#emailchk").val('2');
									}
								}

							})

						} else if (data == 1) {
							$("#ajaxEmailcheck").html("이미 사용중인 이메일 입니다.");
							$("#ajaxEmailcheck").css("color", "#BDB19A");
						}

					}
				});
	};
	</script>
        </div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>