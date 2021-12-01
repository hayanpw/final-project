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
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="container">
		<form action="/spaceInsert.do" method="post" enctype="multipart/form-data">
			<h3>공간 등록</h3>
			<div class="space-img">
				<img style="width: 400px; height: 250px">
				<input style="display: block;" type="file" id="input-image"
					name="files" multiple>
			</div>
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
			<div id="insertBtn">
				<button class="btn btn-default" type="submit">등록하기</button>
			</div>
		</form>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>