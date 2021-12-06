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
					 <label class="control-label" for="memberName">이름</label>
					 <input type="text" id="memberName" name="memberName" class="mypagecontrol"
					 value="${sessionScope.m.memberName}" readonly>	
					</fieldset>
				</div>
				<div class="form-group">
					<fieldset>
					 <label class="control-label" for="memberBirthday">생년월일</label>
					 <input type="text" id="memberName" name="memberBirthday" class="mypagecontrol" value="${m.memberBirthday}" readonly>	
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
							<input type="text" id="postcode" name="postcode" class="mypagecontrol2" value="${sessionScope.m.postcode}" readonly>
							<button onclick="addrSearch();" type="button" class="nextBtn">주소검색</button>
							<input type="text" id="addressRoad" name="addressRoad" class="mypagecontrol" value="${sessionScope.m.addressRoad}" readonly>
							<input type="text" id="addressDetail" name="addressDetail" class="mypagecontrol" value="${sessionScope.m.addressDetail}">
						</fieldset>
				</div>
						
				<div class="form-group">
						<fieldset>
							<button type="submit" class="btnAdd">정보수정</button> 
							<a href="/memberDeleteList?memberNo=${sessionScope.m.memberNo}" class="btnAdd2">회원탈퇴</a>
						</fieldset>
				</div>
			</form>
	</div>
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
	</script>
        </div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>