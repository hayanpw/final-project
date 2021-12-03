<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>좌석 선택</title>
<link href="resources/showCss/show_default.css" rel="stylesheet">
<link href="resources/showCss/show_seat.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="container">
		<div class="title">
			<h1><strong>좌석 선택</strong></h1>
			<h2>${s.showName } / </h2>
			<h2>${s.showHall } / </h2>
			<h2>${sr.showDate }</h2>
		</div>
		<div class="floorWrapper">
	        <div class="floor">
	            <div class="firstCol">
	            	<c:forEach begin="1" end="15" varStatus="i">
	            		<div class="row">
	            			<c:choose>
	            				<c:when test="${i.index < 5 }">
	            					<c:forEach begin="1" end="${i.index+3 }" varStatus="j">
			            				<div class="seats">
											<div id="seat" onclick="choose(this);">
			                        			${j.index }
			                        			<input type="hidden" value="A-${i.index }-${j.index}">
			                        		</div>
			                        		
			                    		</div>
			            			</c:forEach>
	            				</c:when>
	            				<c:when test="${i.index < 7 }">
	            					<c:forEach begin="1" end="7" varStatus="j">
			            				<div class="seats">
			                        		<div id="seat" onclick="choose(this);">
			                        			${j.index }
			                        			<input type="hidden" value="A-${i.index }-${j.index}">
			                        		</div>
			                    		</div>
			            			</c:forEach>
	            				</c:when>
	            				<c:when test="${i.index < 9 }">
	            					<c:forEach begin="1" end="8" varStatus="j">
			            				<div class="seats">
			                        		<div id="seat" onclick="choose(this);">
			                        			${j.index }
			                        			<input type="hidden" value="A-${i.index }-${j.index}">
			                        		</div>
			                    		</div>
			            			</c:forEach>
	            				</c:when>
	            				<c:when test="${i.index < 11 }">
	            					<c:forEach begin="1" end="9" varStatus="j">
			            				<div class="seats">
			                        		<div id="seat" onclick="choose(this);">
			                        			${j.index }
			                        			<input type="hidden" value="A-${i.index }-${j.index}">
			                        		</div>
			                    		</div>
			            			</c:forEach>
	            				</c:when>
	            				<c:otherwise>
	            					<c:forEach begin="1" end="10" varStatus="j">
			            				<div class="seats">
			                        		<div id="seat" onclick="choose(this);">
			                        			${j.index }
			                        			<input type="hidden" value="A-${i.index }-${j.index}">
			                        		</div>
			                    		</div>
			            			</c:forEach>
	            				</c:otherwise>
	            			</c:choose>
	            		</div>
	            	</c:forEach>
	            </div>
	            <div class="secondCol">
	                <c:forEach begin="1" end="15" varStatus="i">
	            		<div class="row">
	            			<c:choose>
	            				<c:when test="${i.index % 2 ==1 }">
			            			<c:forEach begin="1" end="12" varStatus="j">
			            				<div class="seats">
			                        		<div id="seat" onclick="choose(this);">
			                        			${j.index }
			                        			<input type="hidden" value="B-${i.index }-${j.index}">
			                        		</div>
			                    		</div>
			            			</c:forEach>
	            				</c:when>
	            				<c:otherwise>
	            					<c:forEach begin="1" end="11" varStatus="j">
	            						<div class="seats">
			                        		<div id="seat" onclick="choose(this);">
			                        			${j.index }
			                        			<input type="hidden" value="B-${i.index }-${j.index}">
			                        		</div>
			                    		</div>
			            			</c:forEach>
	            				</c:otherwise>
	            			</c:choose>
	            		</div>
	            	</c:forEach>
	            </div>
	            <div class="thirdCol">
	                <c:forEach begin="1" end="15" varStatus="i">
	            		<div class="row">
	            			<c:choose>
	            				<c:when test="${i.index < 5 }">
	            					<c:forEach begin="1" end="${i.index+3 }" varStatus="j">
			            				<div class="seats">
			                        		<div id="seat" onclick="choose(this);">
			                        			${j.index }
			                        			<input type="hidden" value="C-${i.index }-${j.index}">
			                        		</div>
			                    		</div>
			            			</c:forEach>
	            				</c:when>
	            				<c:when test="${i.index < 7 }">
	            					<c:forEach begin="1" end="7" varStatus="j">
			            				<div class="seats">
			                        		<div id="seat" onclick="choose(this);">
			                        			${j.index }
			                        			<input type="hidden" value="C-${i.index }-${j.index}">
			                        		</div>
			                    		</div>
			            			</c:forEach>
	            				</c:when>
	            				<c:when test="${i.index < 9 }">
	            					<c:forEach begin="1" end="8" varStatus="j">
			            				<div class="seats">
			                        		<div id="seat" onclick="choose(this);">
			                        			${j.index }
			                        			<input type="hidden" value="C-${i.index }-${j.index}">
			                        		</div>
			                    		</div>
			            			</c:forEach>
	            				</c:when>
	            				<c:when test="${i.index < 11 }">
	            					<c:forEach begin="1" end="9" varStatus="j">
			            				<div class="seats">
			                        		<div id="seat" onclick="choose(this);">
			                        			${j.index }
			                        			<input type="hidden" value="C-${i.index }-${j.index}">
			                        		</div>
			                    		</div>
			            			</c:forEach>
	            				</c:when>
	            				<c:otherwise>
	            					<c:forEach begin="1" end="10" varStatus="j">
			            				<div class="seats">
			                        		<div id="seat" onclick="choose(this);">
			                        			${j.index }
			                        			<input type="hidden" value="C-${i.index }-${j.index}">
			                        		</div>
			                    		</div>
			            			</c:forEach>
	            				</c:otherwise>
	            			</c:choose>
	            		</div>
	            	</c:forEach>
	            </div>
	        </div>
	        <div class="reservInfo">
	        	<div><h1><strong>선택 좌석</strong></h1></div>
	            <div class="selectSeat"></div>
	            <button class="btn btn-danger" onclick="reservation();">예매하기</button>
	        </div>
		
		</div>
    </div>
    <script>

    
        var count=0;
        var arr = new Array();
        function choose(obj){
        	if(arr.length == 5){
        		alert("한 아이디에 최대 5좌석만 구매가능합니다.");
        	}else{
	            $(obj).css("background-color", "#563D39");
	            $(obj).attr("onclick", "cancel(this);");
	            count++;
	            arr.push($(obj).children().val());
	            var h3 = $("<h3>");
	            h3.append($(obj).children().val());
	            $(".selectSeat").append(h3);
	            $(".selectSeat").scrollTop(innerHeight);
        	}
        }
        function cancel(obj){
            $(obj).css("background-color", "#BDB19A");
            $(obj).attr("onclick", "choose(this);");
            count--;
            $(".selectSeat").empty();
            for(var i=0; i<arr.length; i++){
                if(arr[i] == $(obj).children().val()){
                    arr.splice(i,1);
                }
                var h3 = $("<h3>");
                h3.append(arr[i]);
                $(".selectSeat").append(h3);
            }
        }
        
		function reservation(){
			if(arr[0] == null){
				alert("좌석을 선택하세요");
			}else{
				var memberId = "${sessionScope.m.memberId}";
				var showDate = "${sr.showDate}"
				var form = $("<form action='/reservation.do' method='post'></form>");
				//공연 번호 설정
				form.append($("<input type='text' name='showNo' value='"+${s.showNo}+"'>"));
				//예매자 아이디 설정
				form.append($("<input type='text' name='memberId' value='"+memberId+"'>"));
				//좌석 가격 설정
				form.append($("<input type='text' name='seatPrice' value='"+${s.showPrice}+"'>"));
				//예약 날짜 설정
				form.append($("<input type='text' name='showDate' value='"+showDate+"'>"));
				// 선택한 좌석 번호들 설정
				for(var i=0; i<arr.length; i++){
					form.append($("<input type='text' name='seatList' value='"+arr[i]+"'>"));
				}
				//전송할 form태그를 현재 페이지에 추가
				$("body").append(form);
				//form태그 전송
				form.submit();
			}
		}
    </script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>