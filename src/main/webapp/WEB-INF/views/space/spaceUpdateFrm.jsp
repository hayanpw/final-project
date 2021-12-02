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
			<div class="space-img">
						<c:if test="${s.spaceNo eq t.spaceNo }">
							<img id="preview-image" style="width: 400px; height: 250px" src="resources/spaceImage/upload/${t.filename }">
						</c:if> 
				<input style="display: block;" type="file" id="input-image"
					name="files" multiple>
			</div>
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
			<div id="insertBtn">
				<button class="btn btn-default" type="submit">수정하기</button>
			</div>
		</form>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<script>
	function readImage(input) {
	    // 인풋 태그에 파일이 있는 경우
	    if(input.files && input.files[0]) {
	        // 이미지 파일인지 검사 (생략)
	        // FileReader 인스턴스 생성
	        const reader = new FileReader()
	        // 이미지가 로드가 된 경우
	        reader.onload = e => {
	            const previewImage = document.getElementById("preview-image")
	            previewImage.src = e.target.result
	        }
	        // reader가 이미지 읽도록 하기
	        reader.readAsDataURL(input.files[0])
	    }
	}
	// input file에 change 이벤트 부여
	const inputImage = document.getElementById("input-image")
	inputImage.addEventListener("change", e => {
	    readImage(e.target)
	})

	</script>
</body>
</html>