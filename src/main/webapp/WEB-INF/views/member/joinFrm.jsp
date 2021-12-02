<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/memberCss/join.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="container">

		<div class="contents">
			<h1 style="text-align: center; margin-top:100px;">일단 두자 ,,</h1>
			<hr>
			<br>
			<br>
			<div class="wrap">
	
	
				<div class="content">
				<form action="/sjoin" method="post" class="contentDetail"
						id="contentDetail-field" name="joinFrm">
						<legend class="contentDetail-legend">14세 이상 회원 가입 입력양식</legend>
						<div class="contentDetail">
						<h3 class="title">이용약관 확인 및 동의</h3>
						<br><br>
						<input type="checkbox" id="allAgreement" onclick="allCheck(this);">
						<label for="allAgreement">이용약관 전체체크</label> <br>
						<br><br>
						<div class='agreebox'>
							<input type="checkbox" id="privacyAgreement" class="agreeCheck">
							<label for="privacyAgreement">개인정보 수집 및 이용에 동의 <span
								class="fcBlue">(필수)</span></label>
							<div class="agreeContent">
								<ul>
									<li>수집항목 : 이름, 휴대전화번호, 생년월일, 비밀번호</li>
									<li>수집·이용목적 : 회원제 서비스 제공</li>
									<li>보유 및 이용기간 : 회원탈퇴 시 까지</li>
								</ul>
							</div>
						</div>
	
						<div class='agreebox'>
							<input type="checkbox" id="optionalAgreement" class="agreeCheck">
							<label for="optionalAgreement">개인정보 수집 및 이용에 동의 <span
								class="fcBlue">(선택)</span></label>
							<div class="agreeContent">
								<ul>
									<li>수집항목 : 이름, 휴대전화번호, 생년월일, 비밀번호</li>
									<li>수집·이용목적 : 회원제 서비스 제공</li>
									<li>보유 및 이용기간 : 회원탈퇴 시 까지</li>
								</ul>
							</div>
						</div>
						</div>
					<hr>
					<hr>
					<h1>페이지 쪼개고 가운데 , 밑줄 ajax 추가 , 이메일은 바로인증 , 이메일인증 빈칸일때 확인 하기 , </h1>
					<hr>
						<h3 class="title">필수정보입력</h3>
						<div class="contentDetail border">
							<br>
							<table class="inputTbl">
								<tr>
									<td>아이디</td>
									<td><input type="text" class="input" name="memberId" id="memberId"> <span id="ajaxCheck"></span><input type="hidden" id="idchk"></td>
									
									
									
								</tr>
								<tr>
									<td>비밀번호</td>
									<td><input type="password" class="input" name="memberPw"
										id="memberPw"> <span id="pw-detail"> 8~12자 이내 
											영문,숫자,특수문자(“”-+/\:; 제외)</span> <span id="pwChkRule"></span></td> 
								</tr>
								<tr>
									<td>비밀번호 확인</td>
									<td><input type="password" class="input" name="pw_re"
										id="chkpw" onfocusout="chkPw(this);"> <span id="pwChk"></span></td>
								</tr>
								<tr>
									<td>닉네임</td>
									<td><input type="text" class="input short3" id="memberNickname" name="memberNickname"><span id="ajaxNicknameCheck"></span><input type="hidden" id="nicknamechk"></td>
								</tr>
								<tr>
									<td>이름</td>
									<td><input type="text" class="input short3" id="memberName" name="memberName"></td>
								</tr>
								<tr>
									<td>성별</td>
									<td><select class="input short1 text-align" name="memberGender">
											<option value="1">남성</option>
											<option value="2">여성</option>
									</select></td>
								</tr>
								<tr>
									<td>휴대전화번호</td>
									<td>
									<select class="input short1 memberphone" style="margin-left:0px;" name="memberPhone1">
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="016">016</option>
									
									</select> -
									<input type="text" class="input short2 memberphone" id="memberPhone2" name="memberPhone2" >  -
									<input type="text" class="input short2 memberphone" id="memberPhone3" name="memberPhone3" >
									
										<div class="agreebox adcheck">
											<input type="checkbox" id="smsAgreement-check" value="1" name="memberReceivesms"
												class="agreeCheck"> 광고성 SMS 수신 동의 <span class="fcBlue">(선택)</span>
											<input type="hidden"   id="smsAgreement_hidden" value="0" name="memberReceivesms">	
										</div></td>
								</tr>
								<tr>
	                                
	
	                                <td>생년월일</td>
	                               
	                                <td>
	                                    <input type="date" id="birth" class="input short3" name="birth" maxlength="4" placeholder="출생년도(ex.1994)">
	                                 
	                                </td>
	                            </tr>
								<tr>
									<td>주소입력</td>
									<td><input type="text" id="postCode1" class="input short3" name="postCode1"
										readonly>
										<button onclick="addrSearch();" type="button" class="nextBtn">주소검색</button></td>
								</tr>
								<tr>
									<td></td>
									<td style="padding-top: 5px;"><input type="text" id="addressRoad1" class="input long" name="addressRoad1" readonly>
										<input type="text" id="addressDetail1" class="input long" name="addressDetail1" placeholder="상세주소">
									</td>
								</tr>
								<tr>
									<td>이메일</td>
									   
	                                <td><input type="text" class="input" id="email1" name="email1"> @ <input type="text" class="input" id="email2" name="email2"> <select name="emailSelect" id="emailSelect" onchange="mailSelect(this);">
											<option value="">직접입력</option>
											<option value="naver.com">naver.com</option>
											<option value="nate.com">nate.com</option>
											<option value="gmail.com">gmail.com</option>
											<option value="hanmail.net">hanmail.net</option>
									</select> <button type="button" onclick="checkEmail();" id="btnOpen1">중복체크</button><span id="ajaxEmailcheck"></span> 
	                                   <div class="agreebox adcheck"><span id="authMsg"></span><input type="hidden" id="emailchk">
	                                    <div class="input_wrap">
						                    <div id="search_input">
						                        <input type='text' id="authCode" class="search_input" placeholder="인증코드입력" /><span id="timeZone"></span> 
						                    </div>
						                    <div><span></span></div>
						                </div>
	                                        <input type="checkbox" id="emailAgreement-check" value="1" name="memberReceiveemail" class="agreeCheck">광고성 E-MAIL 수신 동의 <span class="fcBlue">(선택)</span>
	                                        <input type="hidden" id="emailAgreement_hidden" value="0" name="memberReceiveemail">
	
	                                    </div>
	                                </td>
								</tr>
							</table>
							<br>
							<br>
						</div>
						<div class="btnBox">
							<button onclick="return join();" class="nextBtn">회원가입</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>