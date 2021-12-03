<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<div>
			<h3>신청 현황</h3>
		</div>
		<!-- 캘린더 코드 -->
		<div id="datepicker"></div>
		<div class="time-table">
			<table class="table table-hover">
				<tr>
					<td>10:00~12:00</td>
				</tr>
				<tr>
					<td>13:00~15:00</td>
				</tr>
				<tr>
					<td>16:00~18:00</td>
				</tr>
				<tr>
					<td>19:00~21:00</td>
				</tr>
			</table>
		</div>
	</div>
		<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    <script>
   	$(function() {
		$(".time-table").hide();
		var select = $(".ui-state-default");
		select.click(function () {
			$(".time-table").show();	
		});
   	});
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
	            beforeShowDay: noMondays //월요일은 휴무일
	        });
	    });
	   	//월요일 휴무 코드
	    function noMondays(date) {
	    	return [date.getDay() != 1, ''];
	    }
	
    </script>
</body>
</html>