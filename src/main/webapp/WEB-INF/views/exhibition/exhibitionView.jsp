<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/hansolCss/hansol_exhibitionView.css" rel="stylesheet">
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/jquery-ui/jquery-ui.css">
</head>
<body>
	
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<script type="text/javascript" src="/resources/jquery-ui/jquery-ui.min.js"></script>
	<div class="container">
		<div class="rightSide">
        <div class="topSide">
            <h2>${exb.exhibitionTitle }</h2>
            <div class="star"></div>
        </div>
        <div class="middleSide">
            <div class="exhibitionPhoto">
                <img class="photo" src=${exb.exhibitionPhoto }>
            </div>
            <div class="exhibitionSummary">
                <table class="summaryTable" >
                    <tr>
                        <td>전시 기간</td>
                        <td>${exb.exhibitionStart } ~ ${exb.exhibitionEnd }</td>
                    </tr>
                    <tr>
                        <td>전시 시간</td>
                        <td>${exb.exhibitionTimeStart } ~ ${exb.exhibitionTimeEnd }</td>
                    </tr>
                    <tr>
                        <td>연령</td>
                        <td>${exb.exhibitionAge }</td>
                    </tr>
                    <tr>
                        <td>티켓 가격</td>
                        <td>${exb.exhibitionPrice }</td>
                    </tr>
                    <tr>
                        <td>수량선택</td>
                        <td>
                        <div class="count">
                 	        <button type="button" class="count_btn1">-</button>
								<span class="amount" id="amount">1</span>
							<button type="button" class="count_btn1">+</button>
						</div>
						</td>
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
              			<div class="detail">${exb.exhibitionDetail }</div>
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
    <div class="fixed">
    	 <div id="datepicker"></div>
    	 <input type="hidden" id="startDay" value="${exb.exhibitionStart }">
    	 <input type="hidden" id="endDay" value="${exb.exhibitionEnd }">
    	 <input type="hidden" class="price" value="${exb.exhibitionPrice }">
    	 <input type="hidden" id="exhibitionNo" value="${exb.exhibitionNo }">
    	 <input type="hidden" id="exhibitionTitle" value="${exb.exhibitionTitle }">
    	 <input type="hidden" id="exhibitionPhoto" value="${exb.exhibitionPhoto }">
    	 <span class="totalPrice" id="totalPrice">${exb.exhibitionPrice }</span>원
    	 <button onclick="payment();"class="btn" id="payment">결제하기</button>
    </div>
   
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
 <script>
 		function payment(){
 			var paymentPrice = Number($("#totalPrice").html()); 
 			var paymentQuantity = Number($("#amount").html()); 
 			var exhibitionNo = Number($("#exhibitionNo").val());
 			var exhibitionTitle = $("#exhibitionNo").val();
 			var exhibitionPhoto = $("#exhibitionPhoto").val();
 			var paymentSelect = 1; // 전시결제는 1 , 강좌결제는 2
 			var form = $("<form action='/exhibitionPaymentFrm.do' method='post'></form>");
 			form.append($("<input type='text' name='paymentQuantity' value='"+paymentQuantity+"'>"));
 			form.append($("<input type='text' name='paymentPrice' value='"+paymentPrice+"'>"));
 			form.append($("<input type='text' name='exhibitionNo' value='"+exhibitionNo+"'>"));
 			form.append($("<input type='text' name='paymentSelect' value='"+paymentSelect+"'>"));
 			form.append($("<input type='text' name='exhibitionTitle' value='"+exhibitionTitle+"'>"));
 			form.append($("<input type='text' name='exhibitionTitle' value='"+exhibitionTitle+"'>"));
 			form.append($(obj).parent().prev());
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
	    $(".count>button").click(function(){
			var currAmount = Number($(".amount").html()); 
			if($(this).html() == "+") { 
				$(".amount").html(++currAmount);
			}else{
				if(currAmount != 1){ 
					$(".amount").html(--currAmount);					
				}
			}
			var price = Number($(".price").val()); 
			$(".totalPrice").html(currAmount*price);
			$("#amount").val(currAmount);
			
		});
    </script>
</html>