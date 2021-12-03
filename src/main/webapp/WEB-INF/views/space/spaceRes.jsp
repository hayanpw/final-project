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
	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>	
	<script type="text/javascript" src="/resources/jquery-ui/jquery-ui.min.js"></script>
	<link rel="stylesheet" href="/resources/jquery-ui/jquery-ui-big.css">
    <link href="resources/spaceCss/space_default.css" rel="stylesheet">	
    <link href="resources/spaceCss/space_res.css" rel="stylesheet">	
	<div class="container">
			<h3>신청 현황-${s.spaceName } </h3>
		<form action="/spaceInfo.do" method="post">
			<div class="select-btn">
				<c:forEach items="${list }" var= "l">
					<button type="button" onclick="location.href='/spaceRes.do?spaceNo=${l.spaceNo}'">${l.spaceName }</button>
				</c:forEach>
			</div>
		<!-- 캘린더 코드 -->
		<div id="datepicker"></div>
		<span>선택한 날짜</span><input type="text" id="selectDate" name="rentalDate">
		<div class="time-table">
			<table class="table table-hover">
					<c:forEach items="${st }" var ="st">
						<tr>
							<th>이용시간</th>
							<td><input type="text" value="${st.startTime }" name="startTime"></td>
							<th>~</th>
							<td><input type="text" value="${st.endTime }" name="endTime"></td>
						</tr>
					</c:forEach>
			</table>
		</div>
			<div id="insert-btn">
				<button class="btn btn-default" type="submit">신청하기</button>
			</div>
		</form>
	</div>
		<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    <script>
   		$(function () {
			/* $(".time-table").hide(); */
		})
	    $(function() {
	        var today = new Date(); //오늘부터
	        var endDate = new Date(today);
	        endDate.setDate(endDate.getDate()+30); //+30일까지만 예약받음
	        $("#datepicker").datepicker({
	        	//캘린더 기본베이스
	            dateFormat: "yy-mm-dd",
	            monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월','9월', '10월', '11월', '12월' ],
	            monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월','9월', '10월', '11월', '12월' ],
	            dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
	            dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
	            dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
	            yearSuffix : '년',
	            minDate: today,
	            maxDate: endDate,
	            beforeShowDay: noMondays, //월요일은 휴무일
	            onSelect : function(data){
	            	$("#selectDate").val(data);
	            	$(".time-table").show();
	            }
	        });
	    });
	   	//월요일 휴무 코드
	    function noMondays(date) {
	    	return [date.getDay() != 1, ''];
	    }
    </script>
</body>
</html>