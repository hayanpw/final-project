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
        	<div><h1>선택 좌석</h1></div>
            <div class="selectSeat"></div>
            <button class="btn btn-danger">예매하기</button>
        </div>
    </div>
    <script>
        var count=0;
        var arr = new Array();
        function choose(obj){
            $(obj).css("background-color", "#563D39");
            $(obj).attr("onclick", "cancel(this);");
            count++;
            arr.push($(obj).children().val());
            var h3 = $("<h3>");
            h3.append($(obj).children().val());
            $(".selectSeat").append(h3);
            $(".selectSeat").scrollTop(innerHeight);
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
    </script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>