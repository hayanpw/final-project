<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/showCss/show_default.css" rel="stylesheet">
<link href="resources/showCss/show_seat.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="container">
        <a href="showList.html">리스트로</a>
        <div class="showSeat">
            <div class="firstCol seatCol">
                <ul>
                    <li class="seatList"><a href="javascript:void(0)" class="seat" onclick="choose(this);">1</a></li>
                    <li class="seatList"><a href="javascript:void(0)" class="seat" onclick="choose(this);">2</a></li>
                    <li class="seatList"><a href="javascript:void(0)" class="seat" onclick="choose(this);">3</a></li>
                    <li class="seatList"><a href="javascript:void(0)" class="seat" onclick="choose(this);">4</a></li>
                </ul>
            </div>
            <div class="secondCol seatCol">
                <ul>
                    <li class="seatList"><a href="javascript:void(0)" class="seat" onclick="choose(this);">5</a></li>
                    <li class="seatList"><a href="javascript:void(0)" class="seat" onclick="choose(this);">6</a></li>
                    <li class="seatList"><a href="javascript:void(0)" class="seat" onclick="choose(this);">7</a></li>
                    <li class="seatList"><a href="javascript:void(0)" class="seat" onclick="choose(this);">8</a></li>
                </ul>
            </div>
            <div class="thirdCol seatCol">
                <ul>
                    <li class="seatList"><a href="javascript:void(0)" class="seat" onclick="choose(this);">9</a></li>
                    <li class="seatList"><a href="javascript:void(0)" class="seat" onclick="choose(this);">10</a></li>
                    <li class="seatList"><a href="javascript:void(0)" class="seat" onclick="choose(this);">11</a></li>
                    <li class="seatList"><a href="javascript:void(0)" class="seat" onclick="choose(this);">12</a></li>
                </ul>
            </div>
        </div>
    </div>
	<script>
        var count=0;
        var arr = new Array();
        function choose(obj){
            $(obj).parent().css("background-color", "#563D39");
            $(obj).attr("onclick", "cancel(this);");
            count++;
            console.log(count);
            arr.push($(obj).html());
            console.log(arr);
        }
        function cancel(obj){
            $(obj).parent().css("background-color", "#BDB19A");
            $(obj).attr("onclick", "choose(this);");
            count--;
            console.log(count);
            for(var i=0; i<arr.length; i++){
                if(arr[i] == $(obj).html()){
                    arr.splice(i,1);
                }
            }
            console.log(arr);
        }
    </script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>