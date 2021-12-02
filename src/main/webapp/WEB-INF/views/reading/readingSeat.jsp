<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>좌석 선택</title>
    <link href="resources/readingCss/reading_seat.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
		<div class="container">
			<div class="container-left">
			
				<c:forEach begin="1" end="100" varStatus="i" >
					<c:choose>
						<c:when test="${i.index%20 eq 0}">
							<div id="seat${i.index}" onclick="chocie(this);">${i.index }</div>
							<br><br><br><br>
						</c:when>
						<c:when test="${i.index%10 eq 0}">
							<div id="seat${i.index}" onclick="chocie(this);">${i.index }</div>
							<br>
						</c:when>
						<c:when test="${i.count%5 eq 0 }" >
							<div id="seat${i.index}" onclick="chocie(this);">${i.index }</div>
							<div id="emptyseat">
								빈
							</div>
						</c:when>
						<c:otherwise>
							<div id="seat${i.index}" onclick="chocie(this);">${i.index }</div>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</div>
			<div class="container-right">
				<h2>선택 내역</h2>
				<form action="" method="post">
					<input type="hidden" name="readingNum">
					<input type="hidden" name="readingDay" value="${re.readingDay }">
					<input type="hidden" name="memberId" value="${sessionScope.m.memberId }">
					<input type="hidden" name="sub"class="btn btn-success btn-lg" value="좌석 선택하기" style="background-color: #563D39; border-color: #563D39">
				</form>
				<div class="readingInfo">
					<h3 name="showdate"></h3>
					<h3 name="showseat"></h3>
				</div>
			</div>
			<script>
			function chocie(obj){
	            $(obj).css("background-color", "#563D39");
	            $(obj).attr("onclick", "cancel(this);");
	            $("input[name=readingNum]").val($(obj).html());
	            var selectDate = $("input[name=readingDay]").val();
	            console.log(selectDate);
				var month = selectDate.substring(5,7); //몇월
				var day = selectDate.substring(8,10);  //몇일
				$("h3[name=showdate]").html(month+"월 "+day+"일");
				$("h3[name=showseat]").html($(obj).html()+"번 좌석");
	        }
			function cancel(obj){
	            $(obj).css("background-color", "#A79078");
	            $(obj).attr("onclick", "chocie(this);");
	            $("input[name=readingNum]").val("");
	            $("h3[name=showdate]").html("");
	            $("h3[name=showseat]").html("");
	        }
			</script>
		</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>