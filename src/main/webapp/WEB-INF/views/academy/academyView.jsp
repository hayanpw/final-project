<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/hansolCss/hansol_academyView.css" rel="stylesheet">
<link rel="stylesheet" href="/resources/jquery-ui/jquery-ui.css">
</head>
<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<script type="text/javascript" src="/resources/jquery-ui/jquery-ui.min.js"></script>
	<div class="container">
		<div class="rightSide">
        <div class="topSide">
            <h2>${a.academyTitle }</h2>

        </div>
        <div class="middleSide">
            <div class="academyPhoto">
                <img class="photo" src="${a.academyPhoto }">
            </div>
            <div class="academySummary">
                <table class="summaryTable" >
                    <tr>
                        <td>수업 기간</td>
                        <td>${a.academyStart } ~ ${a.academyEnd }</td>
                    </tr>
                    <tr>
                        <td>장소</td>
                        <td>${a.academyPlace }</td>
                    </tr>
                    <tr>
                        <td>수업 시간</td>
                        <td>19:00 ~ 20:30</td>
                    </tr>
                    <tr>
                        <td>담당 선생님</td>
                        <td>${a.academyTeacher }</td>
                    </tr>
                    <tr>
                        <td>수업료</td>
                        <td>${a.academyPrice }</td>
                    </tr>
                </table>
            </div>
        </div>
        <div class="bottomSide">
            <ul class="nav nav-tabs">
                <li class="active"><a data-toggle="tab" href="#home">전시정보</a></li>
                <li><a data-toggle="tab" href="#menu1">예매및취소</a></li>
                <li><a data-toggle="tab" href="#menu2">관람평</a></li>
              </ul>
              <div class="tab-content">
              		<div id="home" class="tab-pane fate in active" >
              			<h3>수업 정보</h3>
              			<div class="detail">${a.academyDetail }</div>
             	 	</div>
              		<div id="menu1" class="tab-pane fate in" style="width:850px">
              			<h3>취소 환불 규정</h3>
		    			<p>Some content in menu 1.</p>
              		</div>
              		<div id="menu2" class="tab-pane fate in" >
              			<h3>관람평이</h3>
		    			<p>Some content in menu 2.</p>
              		</div>
              </div>
        </div>
    </div>
    <div class="leftSide">
    <div class="fixed">
    	 <div id="datepicker"></div>
    	 <button onclick="payment();" class="btn">결제하기</button>
    	 <input type="hidden" id="startDay" value="${a.academyStart }">
    	 <input type="hidden" id="endDay" value="${a.academyEnd }">
    	 <input type="hidden" id="paymentPrice" value="${a.academyPrice }">
    	 <input type="hidden" id="academyTitle" value="${a.academyTitle }">
    	 <input type="hidden" id="academyPhoto" value="${a.academyPhoto }">
    	 <input type="hidden" id="academyNo" value="${a.academyNo }">
    	 <input type="hidden" id="academyTeacher" value="${a.academyTeacher }">
    </div>
   </div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
 <script>
 		function payment(){
			var academyStart = $("#startDay").val();
			var academyEnd = $("#endDay").val();
			var paymentPrice = Number($("#paymentPrice").val()); 
			var academyNo = Number($("#academyNo").val());
			var academyTitle = $("#academyTitle").val();
			var academyPhoto = $("#academyPhoto").val();
			var academyTeacher = $("#academyTeacher").val();
			var paymentSelect = 2; // 전시결제는 1 , 강좌결제는 2
			var form = $("<form action='/academyPaymentFrm.do' method='post'></form>");
			form.append($("<input type='text' name='academyStart' value='"+academyStart+"'>"));
			form.append($("<input type='text' name='academyEnd' value='"+academyEnd+"'>"));
			form.append($("<input type='text' name='paymentPrice' value='"+paymentPrice+"'>"));
			form.append($("<input type='text' name='academyNo' value='"+academyNo+"'>"));
			form.append($("<input type='text' name='academyTitle' value='"+academyTitle+"'>"));
			form.append($("<input type='text' name='academyPhoto' value='"+academyPhoto+"'>"));
			form.append($("<input type='text' name='paymentSelect' value='"+paymentSelect+"'>"));
			form.append($("<input type='text' name='academyTeacher' value='"+academyTeacher+"'>"));
			$("body").append(form);
			form.submit();
	}
	    $(function() {
	    	var start = $("#startDay").val();
	        var end = $("#endDay").val();
	    	
	        var today = new Date();;
	        var endDate = end;
	        $("#datepicker").datepicker({
	            dateFormat: "yy-mm-dd",
	            monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월','9월', '10월', '11월', '12월' ], 
	            monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월','9월', '10월', '11월', '12월' ],
	            dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
	            dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
	            dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
	            yearSuffix : '년',
 	            minDate: start,
	            maxDate: endDate
	        });
	
	        $("#datepicker").change(function() {
				selectDate = $(this).val();
				$(".slide").fadeOut();
				$("input[name=date]").val(selectDate);
	        });
	      //월요일 휴무 코드
			 function noMondays(date) {
	    		return [date.getDay() != 1, ''];
	 		}

	        
	        $("#datepicker").datepicker("setDate", today);
	        
			//$(".ui-datepicker-calendar>tbody>tr>td>a").css("background-color", "black").css("color", "#fff");
	        
	    });
    </script>
</html>