<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/memberCss/allMember.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
	<jsp:include page="/WEB-INF/views/common/adminpageMenu.jsp"/>
	<div class="container">        
        <div class="mypage-title"><span>회</span>원관리</div>
        <div class="mypage-container">
	    	<div class="group-member">
		    	<input type="checkbox" id="c1" name="cc" value=0 />
	   			<label for="c1"><span></span>관리자</label>
	   			<input type="checkbox" id="c2" name="cc" value=1 />
	   			<label for="c2"><span></span>일반</label>
	   			<input type="checkbox" id="c3" name="cc" value=2/>
	   			<label for="c3"><span></span>강사</label>
	   			<input type="checkbox" id="c4" name="cc" value=3/>
	   			<label for="c4"><span></span>블랙</label>
	   		</div>
	   	<form class="navbar-form navbar-right" action="/searchMember.do">
	      <div class="input-group ">
	        <input type="text" class="form-control" placeholder="검색" name="search" value="${search }">
	        <div class="input-group-btn">
	          <button class="btn btn-default" type="submit">
	            <i class="glyphicon glyphicon-search"></i>
	          </button>
	        </div>
	      </div>
	    </form>
		<table class="admin-table">
			<tr>
				<th>번호</th>
				<th>아이디</th>
				<th>이름</th>
				<th>전화번호</th>
				<th>생년월일</th>
				<th>가입일</th>
				<th>회원레벨</th>
			</tr>
			<c:forEach items="${list }" var="m" varStatus="i">
					<tr>
			            <td>${m.memberNo }</td>
						<td>${m.memberId }</td>
						<td>${m.memberName }</td>
						<td>${m.memberPhone }</td>
						<td>${m.memberBirthday }</td>
						<td>${m.enrollDate }</td>
						<td>
							<select name="memberLevelSelect">
							<c:choose>
					            <c:when test="${m.memberLevel == 0}">
									<option value="0" selected>관리</option>
									<option value="1">일반</option>
									<option value="2">강사</option>
									<option value="3">블랙</option>
								</c:when>
					            <c:when test="${m.memberLevel == 1}">
					            	<option value="0">관리</option>
									<option value="1" selected>일반</option>
									<option value="2">강사</option>
									<option value="3">블랙</option>
					            </c:when>
								<c:when test="${m.memberLevel == 2}">
									<option value="0">관리</option>
									<option value="1">일반</option>
									<option value="2" selected>강사</option>
									<option value="3">블랙</option>
								</c:when>
								<c:when test="${m.memberLevel == 3}">
									<option value="0">관리</option>
									<option value="1" selected>일반</option>
									<option value="2">강사</option>
									<option value="3" selected>블랙</option>
								</c:when>
							</c:choose>
							</select>
						</td>
			             <td>
			                <c:choose>
					            <c:when test="${newMemberLevel == 0}">관리</c:when>
					            <c:when test="${newMemberLevel == 1}">일반</c:when>
								<c:when test="${newMemberLevel == 2}">강사</c:when>
								<c:when test="${newMemberLevel == 3}">블랙</c:when>
							</c:choose>
			          	</td>
				</tr>
			</c:forEach>
		</table>
			<script>
			$("[name=memberLevelSelect]").change(function(){
				var memberNo = $(this).parent().parent().children().first().html();
				var memberLevel = $(this).val();
				console.log(memberNo);
				console.log(memberLevel);
	        	$.ajax({
					url : "/updateMemberlist.do",
					type : "post",
					data : {memberNo:memberNo,memberLevel:memberLevel},
					type : "post",
					success : function(data){
						if(data == 0){
							alert("업데이트 실패. 에러 발생");
						}else{
							alert("업데이트 성공");
						}
					}
				});
	        })
		   </script>
	</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>