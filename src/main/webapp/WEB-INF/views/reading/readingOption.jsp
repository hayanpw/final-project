<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선택사항</title>
    <link href="resources/readingCss/reading_option.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
		<div class="container">
			<div class="info">
				<h1>예약 내역</h1>
				<h3>예약일 : ${re.readingTime}</h3>
				<h3>예약일자 : ${re.readingDay}</h3>
				<h3>좌석번호 : ${re.readingNum}</h3>
				<h3>예약이름 : ${re.readingName}</h3>
				<c:choose>
					<c:when test="${re.readingTy eq 0}">
						<h3>이용시간 : 종일 09:00 ~ 19:00</h3>
					</c:when>
					<c:when test="${re.readingTy eq 1}">
						<h3>이용시간 : 오전 09:00 ~ 14:00 (점심시간 전원퇴실)</h3>
					</c:when>
					<c:when test="${re.readingTy eq 2}">
						<h3>이용시간 : 오후 14:00 ~ 19:00</h3>
					</c:when>
				</c:choose>
			</div>
			<br>
			<form action="" method="post">
				<input type="hidden" name="readingNo" value="${re.readingNo }">
				<input type="hidden" name="readingDay" value="${re.readingDay }">
				<input type="hidden" name="readingNum" value="${re.readingNum }">
				<input type="hidden" name="readingId" value="${sessionScope.m.memberId }">
				<input type="hidden" name="readingName" value="${re.readingName }">
				<input type="submit" name="sub" class="btn btn-success btn-lg" value="비품대여" style="background-color: #BDB19A; border-color: #BDB19A">
<%-- 		<a href="/readingOption1.do" class="btn btn-success btn-lg">수정하기-미구현(다 구현후 좌석선택을 오전/오후/종일로 나누고 이용시간 수정만 확장예정)</a>--%>
			<a href="/readingOption1.do" class="btn btn-danger btn-lg" style="margin-left: 10px;">예약취소</a>
			<a href="/readingNotice.do" class="btn btn-default btn-lg" style="margin-left: 10px;">처음으로</a>
			</form>
			<br>
			<h3 style="color : red">※ 가족 및 타인의 계정으로 신청한 좌석이거나,</h3>
			<h3 style="color : red">신청 외의 좌석 이용적발시</h3>
			<h3 style="color : red">즉시 퇴실 + 1주일 열람실 이용 제한</h3>
		</div>
	<script>
		$(function(){
			var selectDate = $("input[name=readingDay]").val();
			var selectNum = $("input[name=readingNum]").val();
			var month = selectDate.substring(5,7); //몇월
			var day = selectDate.substring(8,10);  //몇일
			$("h3[name=showdate]").html(month+"월 "+day+"일");
			$("h3[name=showseat]").html(selectNum+"번 좌석");
		});
	
		var count = 0;
		
		function chocie(obj){
	    	if(count == 1){
	    		alert("좌석은 한개만 선택할 수 있습니다.");
	    	}else{
				$(obj).css("background-color", "#563D39");
				$(obj).attr("onclick", "cancel(this);");
				$("input[name=sub]").attr("type","submit");
				count++;
				$("button[name=rollback]").attr("class","hidden");
	    	}
		}
		function cancel(obj){
			$(obj).css("background-color", "#A79078");
			$(obj).attr("onclick", "chocie(this);");
			$("input[name=readingNum]").val("");
			$("h3[name=showseat]").html("");
			$("input[name=sub]").attr("type","hidden");
			count--;
			$("button[name=rollback]").attr("class","btn btn-success btn-lg");
		}
	</script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>