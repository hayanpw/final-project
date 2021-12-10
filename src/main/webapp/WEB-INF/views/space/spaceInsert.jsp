<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/spaceCss/space_default.css" rel="stylesheet">
<link href="resources/spaceCss/space_insert.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="container">
		<form action="/spaceInsert.do" method="post" enctype="multipart/form-data">
			<h3>공간 등록</h3>
			<div class="space-info">
				<table class="table-condensed info-table">
					<tr>
						<th>이름</th>
						<td><input type="text" name="spaceName"></td>
					</tr>
					<tr>
						<th>용도</th>
						<td><input type="text" name="spacePurpose"></td>
					</tr>
					<tr>
						<th>주요시설</th>
						<td><input type="text" name="mainFacility"></td>
					</tr>
					<tr>
						<th>주요물품</th>
						<td><input type="text" name="mainProduct"></td>
					</tr>
					<tr>
						<th>수용인원</th>
						<td><input type="text" name="maxPeople"></td>
					</tr>
					<tr>
						<th>대관료</th>
						<td><input type="text" name="price"></td>
					</tr>
				</table>
			</div>
			<div class="space-time">
				<span id="plus">+ 시간등록</span>
				<table class="table-condensed time-table">
				</table>
			</div>
			
			<div class="space-img">
				<input name="files" type="file" id="image" accept="image/*" onchange="setThumbnail(event);" multiple/>
				 <div id="image_container">
				 <br>
				 	<p>※이미지의 최대 개수는 3장입니다.</p>
				 	<p>※이미지 등록 후 꼭 썸네일 사진을 클릭 해주세요.</p>
				 </div>
			</div>	
			<input type="hidden" name="thumbnail">
			<div id="insertBtn">
				<button class="btn btn-default" type="submit">등록하기</button>
			</div>
		</form>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	<script>

	$(function () {
		$("#plus").click(function () {
			if($(".time-table tr").length <4){
			$(".time-table").append("<tr><th>이용시간<th><td><input name = 'startTime'></td><th>~</th><td><input name='endTime'></td></tr>");
			}else{
				alert("시간은 4개까지만 등록 가능합니다.");
				
			}
		});
 		$(document).on("click","#image_container>*",function(){
				$(this).addClass("mainImg");
			if($("#image_container>*").not($(this)).hasClass("mainImg")){
				$("#image_container>*").not($(this)).removeClass("mainImg");
			}
			var idx = $("#image_container>*").index(this); 
			$("[name=thumbnail]").val(idx);
		
	    });		
	});
 	function setThumbnail(event) {
 		var fileInput = document.getElementById("image");
        var files = fileInput.files;
        var file;
		if(files.length > 3){
			alert("사진은 최대 3개까지 업로드 할 수 있습니다.");
			$("#image").val("");

			return;	
		}
 		$("#image_container>img").remove();
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
		} 

	</script>
</body>
</html>