<%@page import="show.vo.Show"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%
    	Show s = (Show)request.getAttribute("s");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${s.showName }</title>
<link href="resources/showCss/show_default.css" rel="stylesheet">
<link href="resources/showCss/show_view.css" rel="stylesheet">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">	
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
	<script type="text/javascript" src="/resources/jquery-ui/jquery-ui.min.js"></script>
	<link rel="stylesheet" href="/resources/jquery-ui/jquery-ui-big.css">
    <div class="container">
        <div class="summary">
            <div class="summaryTop">
                <h1>${s.showName }</h1>
                <%for(int i=0; i<Math.round(s.getShowStar()); i++){ %>
                <span><img src="resources/showImage/star-on.png"></span>
                <%} %>
                <%for(int i=0; i<5-Math.round(s.getShowStar()); i++){ %>
                <span><img src="resources/showImage/star-off.png"></span>
                <%} %>
                <span id="reviewAvg">${s.showStar }</span>
            </div>
            <div class="summaryBottom">
                <div class="poster">
                    <img src="${s.filepath}" class="poster">
                </div>
                <div class="info">
                    <table>
                        <tr>
                            <td>장소</td>
                            <td>${s.showHall }</td>
                        </tr>
                        <tr>
                            <td>공연기간</td>
                            <td>${s.showStart } ~ ${s.showEnd }</td>
                        </tr>
                        <tr>
                            <td>공연시간</td>
                            <td>${s.showTime }</td>
                        </tr>
                        <tr>
                            <td>관람연령</td>
                            <c:choose>
                            	<c:when test="${s.showAge > 0 }">
                            		<td>${s.showAge }세 이상 관람가</td>
                            	</c:when>
                            	<c:otherwise>
                            		<td>전체 관람가</td>
                            	</c:otherwise>
                            </c:choose>
                        </tr>
                        <tr>
                            <td>가격</td>
                            <td>${s.showPrice } 원</td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
        <div class="controllBox">
        	<%-- <c:if test="${sessionScope.m.memberLevel == 0 }"> --%>
	            <a href="/updateShowFrm.do?showNo=${s.showNo}" class="btn btn-primary">수정</a>
	            <a href="/deleteShow.do?showNo=${s.showNo}" class="btn btn-primary">삭제</a>
        	<%-- </c:if> --%>
        </div>
        <div class="infoWrapper">
            <div class="showInfo">
                <div class="showNavi">
                    <div><h2>공연정보</h2></div>
                    <div><h2>부가정보</h2></div>
                    <div><h2>관람평</h2></div>
                </div>
                <div class="showContent hideContent">
					${s.showContent }
                </div>
                <div class="sideInfo hideContent">
                   	 부가정보정보임
                </div>
                <div class="reviewBox hideContent">
                   	 관람평 공간
                </div>
            </div>
            <div class="reserv">
                <div id="datepicker"></div>
                <form action="/reservation.do" method="post">
	                <input type="hidden" name="date">
	                <input type="hidden" name="memberId" value="${sessionScope.m.memberId }">
	                <h3>티켓 정보</h3>
	                <div class="ticketPrice">
	                	<c:choose>
	                		<c:when test="${s.showSeat == 0 }">
	                			<h4>전좌석 ${s.showPrice } 원</h4>
	                		</c:when>
	                		<c:otherwise>
	                			<!-- 수정 필요 -->
	                			<h4>전좌석 ${s.showPrice } 원</h4>
	                		</c:otherwise>
	                	</c:choose>
	                </div>
	                <input type="submit" class="btn btn-danger btn-lg reservBtn" value="예매하기">
                </form>
            </div>
        </div>
    </div>
    <script>
	    $(function() {
	        $(".showNavi>div").click(function() {
	            $(".showNavi>div").removeClass("selec");
	            $(this).addClass("selec");
	            $(".showNavi").nextAll().addClass("hideContent");
	            if($(this).index() == 0){
	                $(".showContent").removeClass("hideContent");
	            }else if($(this).index() == 1){
	                $(".sideInfo").removeClass("hideContent");
	            }else if($(this).index() == 2){
	                $(".reviewBox").removeClass("hideContent");
	            }
	        });
	        $(".showNavi>div").first().click();
	        
	        var today = new Date();
	        var endDate = "${s.showEnd}";
	        $("#datepicker").datepicker({
	            dateFormat: "yy-mm-dd",
	            monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월','9월', '10월', '11월', '12월' ],
	            monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월','9월', '10월', '11월', '12월' ],
	            dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
	            dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
	            dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
	            yearSuffix : '년',
	            minDate: today,
	            maxDate: endDate
	        });
	
	        $("#datepicker").change(function() {
				selectDate = $(this).val();
				$(".slide").fadeOut();
				$("input[name=date]").val(selectDate);
	        });
	    });
    </script>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>