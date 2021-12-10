<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link href="resources/spaceCss/space_default.css" rel="stylesheet">
    <link href="resources/spaceCss/space_update.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="container">
		<form action="/spaceUpadte.do" method="post" enctype="multipart/form-data">
			<h3>공간 수정</h3>
			<div class="space-info">
				<table class="table-condensed info-table">
					<tr>
						<th>이름</th>
						<td><input type="text" name="spaceName" value="${s.spaceName}"></td>
					</tr>
					<tr>
						<th>용도</th>
						<td><input type="text" name="spacePurpose" value="${s.spacePurpose }"></td>
					</tr>
					<tr>
						<th>주요시설</th>
						<td><input type="text" name="mainFacility" value="${s.mainFacility }"></td>
					</tr>
					<tr>
						<th>주요물품</th>
						<td><input type="text" name="mainProduct" value="${s.mainProduct }"></td>
					</tr>
					<tr>
						<th>수용인원</th>
						<td><input type="text" name="maxPeople" value="${s.maxPeople }"></td>
					</tr>
					<tr>
						<th>대관료</th>
						<td><input type="text" name="price" value="${s.price }"></td>
					</tr>
				</table>
			</div>
			<div class="space-time">
				<span id="plus">+ 시간등록</span>
				<table class="table-condensed time-table">
				</table>
			</div>
						
			<div class="space-img">
				<c:if test="${s.spaceNo eq t.spaceNo }">
					<input name="files" type="file" id="image" accept="image/*" onchange="setThumbnail(event);" multiple/>
				</c:if> 
				 <div id="image_container"> </div>
			</div>	
			<div id="updatet-btn">
				<button class="btn btn-default" type="submit">수정하기</button>
			</div>
		</form>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<script>
	$(function () {
		
		$("#plus").click(function () {
			$(".time-table").append("<tr><th>이용시간<th><td><input name = 'startTime'></td><th>~</th><td><input name='endTime'></td></tr>");
		});
	});
	function setThumbnail(event) {
		for (var image of event.target.files) {
			var reader = new FileReader();
			reader.onload = function(event) {
				var img = document.createElement("img");
				img.setAttribute("src", event.target.result);
				document.querySelector("div#image_container").appendChild(img);
				};
				console.log(image);
				reader.readAsDataURL(image);
				}
		$("#image_container").children().addClass("thumbnail");
		
		}
	function thumbnail() {
		$(".thumbnail").click(function () {
			alert("갸");
		});
	}
	</script>
</body>
</html>