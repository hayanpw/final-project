<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<link href="resources/hansolCss/hansol_default.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
	<div class="container">
		<h2>강사 지원하기</h2>
    <form action="/resumeInsert.do" method="post" enctype="multipart/form-data">
      <div class="form-group">
        <h3><span class="line">지</span>원하시는 공고</h3>
        <input type="hidden" name="requritNo" value="${requritNo }">
        <input type="text" class="form-control" id="resumeTitle"  name="resumeTitle" value="${requritTitle }" readonly>
      </div>
      <h3><span class="line">관</span>람 연령</h3>
      <div class="radio">
          <label class="radio-inline"><input type="radio" name="resumeGender" checked>남자</label>
          <label class="radio-inline"><input type="radio" name="resumegender" >여자</label>
      </div>
      <div class="form-group">
          <h3><span class="line">연</span>락받으실 연락처</h3>
          <input type="text" class="form-control" id="resumePhone"  name="resumePhone">
      </div>
      <div class="form-group">
        <h3><span class="line">이</span>력서 첨부</h3>
        <input type="file"  id="resumefile"  name="upfile">
      </div>
      <div class="form-group">
        <h3><span class="line">간</span>단 자기소개</h3>
        <textarea id="summernote" class="form-control" name="resumeDetail"></textarea>
      </div>
      <input type="submit" class="btn btn-info" style="float:right" value="지원 하기">
    </form>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
<script>
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
</html>