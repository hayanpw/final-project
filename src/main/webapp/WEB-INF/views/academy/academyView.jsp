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
            <h2>전시 타이틀</h2>
            <div class="star"></div>
        </div>
        <div class="middleSide">
            <div class="academyPhoto">
                <img class="photo" src="/resources/academyImage/upload/career.png">
            </div>
            <div class="academySummary">
                <table class="summaryTable" >
                    <tr>
                        <td>John</td>
                        <td>Doe</td>
                    </tr>
                    <tr>
                        <td>Mary</td>
                        <td>Moe</td>
                    </tr>
                    <tr>
                        <td>July</td>
                        <td>Moe</td>
                    </tr>
                    <tr>
                        <td>July</td>
                        <td>Moe</td>
                    </tr>
                    <tr>
                        <td>July</td>
                        <td>Moe</td>
                    </tr>
                    <tr>
                        <td>July</td>
                        <td>Moe</td>
                    </tr>
                    <tr>
                        <td>July</td>
                        <td>Moe</td>
                    </tr>
                </table>
            </div>
        </div>
        <div class="bottomSide">
            <ul class="nav nav-tabs">
                <li class="active"><a href="#">Home</a></li>
                <li><a href="#">Menu 1</a></li>
                <li><a href="#">Menu 2</a></li>
                <li><a href="#">Menu 3</a></li>
              </ul>
        </div>
    </div>
    <div class="fixed">
    	 <div id="datepicker"></div>
    	 <button class="btn">결제하기</button>
    </div>
   
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
 <script>
	    $(function() {
	        var start = "2021-11-25";
	        var end = "2021-12-10";
	    	
	        var today = new Date();
	        var endDate = "2021-12-15";
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
	        

	        
	        $("#datepicker").datepicker("setDate", today);
	        
			//$(".ui-datepicker-calendar>tbody>tr>td>a").css("background-color", "black").css("color", "#fff");
	        
	    });
    </script>
</html>