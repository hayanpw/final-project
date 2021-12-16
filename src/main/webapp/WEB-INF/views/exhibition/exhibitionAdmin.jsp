<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/hansolCss/hansol_exhibitionAdmin.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/jquery-ui/jquery-ui.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<script type="text/javascript" src="/resources/jquery-ui/jquery-ui.min.js"></script>
	<jsp:include page="/WEB-INF/views/common/adminpageMenu.jsp"/>
	<div class="container">        
        <div class="mypage-title"><span>전시</span>관리</div>
        <div class="mypage-container">
        	<div class="listNavi">
	    		<div><h4>진행중인 전시</h4></div>
	    		<div><h4>지난 전시</h4></div>
	    	</div>
			<div class="exhibitionBox">
	        	<c:forEach items="${list }" var="ex">
	        		<div class="exhibitionList">
		                <img src="${ex.exhibitionPhoto }" class="poster">
		                <div>
			                <h2>전시명 : ${ex.exhibitionTitle }</h2>
			                <h4>장소 : 무지다 미술관</h4>
			                <p>전시기간 : ${ex.exhibitionStart } ~ ${ex.exhibitionEnd }</p>	 
			                <a href="/exhibitionView.do?exhibitionNo=${ex.exhibitionNo }" class="btn btn-default">상세보기</a>
		                </div>
		                <div class="reservList">
		                	<input type="text" class="datepicker form-control" placeholder="날짜선택">
		                	<input type="hidden" value="${ex.exhibitionStart }">
		                	<input type="hidden" value="${ex.exhibitionEnd }">
		                	<input type="hidden" value="${ex.exhibitionNo }">
		                	<div class="exhibition"></div>
		                </div>
		                <div>
		                	<button onclick="deleteExhibition('${ex.exhibitionNo}')" class="btn btn-danger">전시삭제</button>
		                </div>
	        		</div>
	        	</c:forEach>
        	</div>
        	<div class="lastExhibitionBox">
	        	<c:forEach items="${last }" var="exl">
	        		<div class="exhibitionList">
		                <img src="${exl.exhibitionPhoto }" class="poster">
		                <div>
			                <h2>전시명 : ${exl.exhibitionTitle }</h2>
			                <h4>장소 : 무지다 미술관</h4>
			                <p>전시기간 : ${exl.exhibitionStart } ~ ${exl.exhibitionEnd }</p>	 
			                <a href="/exhibitionView.do?exhibitionNo=${exl.exhibitionNo }" class="btn btn-default">상세보기</a>
		                </div>
		                <div>
		                	<button onclick="deleteExhibition('${exl.exhibitionNo}')" class="btn btn-danger">전시삭제</button>
		                </div>
	        		</div>
	        	</c:forEach>
        	</div>
        </div>
	</div>
	<script>

		function deleteExhibition(ExhibitionNo) {
	    	if(confirm("전시을 삭제하시겠습니까?")){
				location.href="/deleteExhibition.do?ExhibitionNo="+ExhibitionNo;
			}
		}
		$(function() {
			$(".datepicker").focusin(function() {
				var start = $(this).next().val();
				var end = $(this).next().next().val();
				$(this).datepicker({
		            dateFormat: "yy-mm-dd",
		            monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월','9월', '10월', '11월', '12월' ],
		            monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월','9월', '10월', '11월', '12월' ],
		            dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
		            dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
		            dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
		            yearSuffix : '년',
		            minDate: start,
		            maxDate: end,
		            beforeShowDay: noMondays //월요일은 휴무일
		        });
			    function noMondays(date) {
			    	return [date.getDay() != 1, ''];
			    };
			});
			
			$(".datepicker").change(function() {
				var exhibitionDate = $(this).val();
				var exhibitionNo = $(this).next().next().next().val();
				var idx = $(".datepicker").index(this);
				$(".exhibition").eq(idx).empty();
				$.ajax({
					url: "/checkPaymentExhibition.do",
					data: {exhibitionDate:exhibitionDate, exhibitionNo:exhibitionNo},
					type: "post",
					success: function(data) {
						if(data == "0"){
							$(".exhibition").eq(idx).append("<h4>전시예매정보가 없습니다.</h4>");
						}else{
							var p = $("<p>");
							p.append(" 예매수 : "+data);
							$(".exhibition").eq(idx).append(p);
							$(".exhibition").scrollTop(innerHeight);
						}
						
					}
				});
			});

			$(".listNavi>div").click(function() {
				$(".listNavi>div").children().removeClass("selec");
	            $(this).children().addClass("selec");
	            $(".listNavi").nextAll().hide();
	            if($(this).index() == 0){
	                $(".exhibitionBox").show();
	            }else{
	                $(".lastExhibitionBox").show();
	            }
			});
			$(".listNavi>div").first().click();
		});
	</script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>