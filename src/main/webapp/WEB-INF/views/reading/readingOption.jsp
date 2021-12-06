<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선택사항</title>
    <link href="resources/readingCss/reading_option.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
		<div class="container">
			<div class="container-left">
				
			</div>
			<div class="container-right">
				<h2>선택 내역</h2>
				<div class="readingInfo">
					<h3 name="showdate"></h3>
					<h3 name="showseat"></h3>
				</div>
				<button name="rollback" class="btn btn-success btn-lg" onclick="history.go(-1);" style="background-color: #563D39; border-color: #563D39">이전단계</button>
				<form action="/readingOption.do" method="post">
					<input type="hidden" name="readingNum" value="${re.readingNum }">
					<input type="hidden" name="readingDay" value="${re.readingDay }">
					<input type="hidden" name="readingId" value="${sessionScope.m.memberId }">
					<input type="hidden" name="sub" class="btn btn-success btn-lg" value="좌석 선택하기" style="background-color: #563D39; border-color: #563D39">
				</form>
			</div>
		</div>
	<script>
		$(function(){
			var selectDate = $("input[name=readingDay]").val();
			var selectNum = $("input[name=readingNum]").val();
			var month = selectDate.substring(5,7); //몇월
			var day = selectDate.substring(8,10);  //몇일
			$("h3[name=showdate]").html(month+"월 "+day+"일");
			$("h3[name=showseat]").html(selectNum+"번 좌석");
		});
	
		var count = 0;
		
		function chocie(obj){
	    	if(count == 1){
	    		alert("좌석은 한개만 선택할 수 있습니다.");
	    	}else{
				$(obj).css("background-color", "#563D39");
				$(obj).attr("onclick", "cancel(this);");
				$("input[name=sub]").attr("type","submit");
				count++;
				$("button[name=rollback]").attr("class","hidden");
	    	}
		}
		function cancel(obj){
			$(obj).css("background-color", "#A79078");
			$(obj).attr("onclick", "chocie(this);");
			$("input[name=readingNum]").val("");
			$("h3[name=showseat]").html("");
			$("input[name=sub]").attr("type","hidden");
			count--;
			$("button[name=rollback]").attr("class","btn btn-success btn-lg");
		}
	</script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>