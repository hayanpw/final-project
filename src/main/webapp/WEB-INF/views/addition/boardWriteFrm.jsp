<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<div class="container">
		<h1>글쓰기 폼</h1>
		<hr>
		<form action="/boardWrite.do" method="post" enctype="multipart/form-data">
				<input type="hidden" name="boardType" value="${boardType }">
			제목 : <input type="text" name="boardTitle"><br>
			작성자 : <input type="text" name="boardWriter" value="hy01" readonly><br>
			첨부파일 : <input type="file" name="files" multiple><br>
			내용 : <textarea id="summernote" rows="3" cols="10" name="boardContent"></textarea><br>
			<input type="submit" value="게시글작성">
		</form>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<script type="text/javascript">
	 $('#summernote').summernote({
		  height: 300,                 // set editor height
		  minHeight: null,             // set minimum height of editor
		  maxHeight: null,             // set maximum height of editor
		  focus: true                  // set focus to editable area after initializing summernote
		});
     $(document).ready(function() {
    	  $('#summernote').summernote();
    	});
	</script>
</body>
</html>