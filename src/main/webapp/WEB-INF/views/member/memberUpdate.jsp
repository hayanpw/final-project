<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
				 <div class="form-group">
					<fieldset>
						<label class="control-label" for="memberId">아이디</label>
						<input type="text" id="memberId" name="memberId" class="mypagecontrol"
						value="${sessionScope.m.memberId}" readonly> <!-- redonly 고정 -->
					</fieldset>
				</div>	
				<div class="form-group">
					<fieldset>
						<label class="control-label" for="memberPw">비밀번호</label>
						<input type="password" id="memberPassword" name="memberPassword" class="mypagecontrol"
						value="${sessionScope.m.memberPassword}">
						</fieldset>
				</div>	
				<div class="form-group">
					<fieldset>
					 <label class="control-label" for="memberName">이름</label>
					 <input type="text" id="memberName" name="memberName" class="mypagecontrol"
					 value="${sessionScope.m.memberName}">	
					</fieldset>
				</div>
				<div class="form-group">
					<fieldset>
					 <label class="control-label" for="memberBirthday">생년월일</label>
					 <input type="text" id="memberName" name="memberBirthday" class="mypagecontrol" value="${m.memberBirthday}">	
					</fieldset>
				</div>				
				<div class="form-group">
						<fieldset>
							<label class="control-label" for="memberPhone">전화번호</label>
							<input type="text" id="memberPhone" name="memberPhone" class="mypagecontrol" value="${sessionScope.m.memberPhone}">
						</fieldset>
				</div>
						<div class="form-group">
						<fieldset>
							<label class="control-label" for="memberEmail">이메일</label>
							<input type="text" id="memberEmail" name="memberEmail" class="mypagecontrol" value="${sessionScope.m.memberEmail}">
						</fieldset>
				</div>
				<div class="form-group">
						<fieldset>
							<label class="control-label" for="memberAddress">주소</label>
							<input type="text" id="postcode" name="postcode" class="mypagecontrol2" value="${sessionScope.m.postcode}">
							<button type="button" onclick="addrSearch();" class="btnAdd">주소검색</button> 
							<input type="text" id="roadAddr" name="roadAddr" class="mypagecontrol" value="${sessionScope.m.addressRoad}">
							<input type="text" id="detailAddr" name="detailAddr" class="mypagecontrol" value="${sessionScope.m.addressDetail}">
						</fieldset>
				</div>		
				<div class="form-group">
						<fieldset>
							<button type="submit" class="btnAdd">정보수정</button> 
							<a href="/memberDelete?memberNo=${sessionScope.m.memberNo}" class="btnAdd2">회원탈퇴</a>
						</fieldset>
				</div>
			</form>
	</div>
</div>
	<script>
	function addrSearch1(){
		 new daum.Postcode({
		        oncomplete: function(data) {
		            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
		            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
		            $("#postcode").val(data.zonecode); //우편번호
		            $("#roadAddr").val(data.roadAddress); //도로명주소
		            $("#detailAddr").focus(); //상세주소
		        }
		 }).open();
	}
	</script>
        </div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>