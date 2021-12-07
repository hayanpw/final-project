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
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
	<jsp:include page="/WEB-INF/views/common/adminpageMenu.jsp"/>
	<div class="container">        
        <div class="mypage-title"><span>회</span>원관리</div>
        <div class="mypage-container">
		<div class="admin-button-top">
		                       <button type="button" class="admin-button admin-button-choice" onclick="admin_button_choice(1);">관리</button>
		                       <button type="button" class="admin-button admin-button-choice" onclick="admin_button_choice(2);">일반</button>
		                       <button type="button" class="admin-button admin-button-choice" onclick="admin_button_choice(3);">선생</button>
		                       <button type="button" class="admin-button admin-button-choice" onclick="admin_button_choice(4);">블랙</button>
		                       <button type="button" class="admin-button admin-button-dbupdate" onclick="dbupdate();" title="">회원등급 변경</button>
		    </div>
		<table class="admin-table">
			<tr>
				<th>번호</th>
				<th>아이디</th>
				<th>이름</th>
				<th>전화번호</th>
				<th>생년월일</th>
				<th>가입일</th>
				<th>레벨</th>
				<th>회원</th>
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
						<select name="memberLevelSelect" id="memberLevelSelect" onchange="memberLevel(this);">
								<option value="0">관리</option>
								<option value="1">일반</option>
								<option value="2">강사</option>
								<option value="3">블랙</option>
						</select>
		          		<c:choose>
				            <c:when test="${m.memberLevel == 0}">관리</c:when>
				            <c:when test="${m.memberLevel == 1}">일반</c:when>
							<c:when test="${m.memberLevel == 2}">강사</c:when>
							<c:when test="${m.memberLevel == 3}">블랙</c:when>
						</c:choose>
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
			var choiceNo;
		       $(function(){
		           var choice_button = $(".admin-button-choice").eq(0);
		           choice_button.css("background-color","#5F755A").css("color","#ffffff").css("font-weight","bold");
		           $(".admin-table").eq(0).css("display","table");
		           $(".admin-table").eq(1).css("display","none");
		           $(".admin-table").eq(2).css("display","none");
		           $(".admin-table").eq(3).css("display","none");
		           $(".admin-navi").eq(0).css("display","block");
		           $(".admin-navi").eq(1).css("display","none");
		           $(".admin-navi").eq(2).css("display","none");
		           $(".admin-navi").eq(3).css("display","none");
		           $(".admin-button-dbupdate").attr("title","변경 대상 회원의 등급이 일반회원으로 변경됩니다.");
		           choiceNo = 1;
		
		       });
		
		       function admin_button_choice(choice) {
		           for(var i=0; i<$(".admin-button-choice").length; i++){
		               $(".admin-button-choice").eq(i).css("background-color","#e0e0e0").css("color","#000000").css("font-weight","normal");
		               $(".admin-table").eq(i).css("display","none");
		               $(".admin-navi").eq(i).css("display","none");
		           }
		           var choice_button = $(".admin-button-choice").eq(choice-1);
		           choice_button.css("background-color","#5F755A").css("color","#ffffff").css("font-weight","bold");
		           $(".admin-table").eq(choice-1).css("display","table");
		           $(".admin-navi").eq(choice-1).css("display","block");
		           var titleGrade = choice_button.html();
		           var newTitle = "변경 대상 회원의 등급이 "+titleGrade+"로 변경됩니다.";
		           $(".admin-button-dbupdate").attr("title",newTitle);
		           choiceNo = choice;
		       }
		       
		       function dbupdate(){
		       	var memberNoArr1 = []; var memberNoArr2 = []; var memberNoArr3 = []; var memberNoArr4 = [];
				var selectArr = [];
				if(choiceNo == 1){
					selectArr = memberNoArr1;
				}else if(choiceNo == 2){
					selectArr = memberNoArr2;
				}else if(choiceNo == 3){
					selectArr = memberNoArr3;
				}else if(choiceNo == 4){
					selectArr = memberNoArr4;
				}
				var selectStr = selectArr.toString();
		       	$.ajax({
					url : "/updateMemberlist.do",
					type : "post",
					data : {choiceNo:choiceNo,selectArr:selectStr},
					success : function(data){
						if(data>0){
							alert("업데이트 성공");
						}else{
							alert("업데이트 실패. 에러 발생");
						}
					}
				});
		       }
		       
		   </script>
        </div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>