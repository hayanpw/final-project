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
  		 <h2>수업 등록하기</h2>
    <form action="/academyInsert.do" method="post" enctype="multipart/form-data">
      <div class="form-group">
        <h3><span class="line">수</span>업명</h3>
        <input type="text" class="form-control" id="academyTitle" placeholder="수업명을 입력해주세요" name="academyTitle">
      </div>
       <div class="form-group">
        <h3><span class="line">수</span>업 대표사진</h3>
        <input type="file"  id="academyfile"  name="upfile">
      </div>
      <h3><span class="line">수</span>업 기간</h3>
      <div class="form-group col-sm-6">
        <h4>시작일</h4>
        <input type="date" class="form-control" id="academyStart" name="academyStart">
      </div>
      <div class="form-group col-sm-6">
        <h4>종료일</h4>
        <input type="date" class="form-control" id="academyEnd" name="academyEnd">
      </div>
      <div class="form-group">
        <h3><span class="line">카</span>테고리</h3>
        <select class="form-control" id="category" name="academyCategory">
          <option>음악</option>
          <option>미술</option>
          <option>독서</option>
        </select>
      </div>
      <h3><span class="line">장</span>소</h3>
       <div class="radio">
                <label class="radio-inline"><input type="radio" name="academyPlace" >A</label>
                <label class="radio-inline"><input type="radio" name="academyPlace" >B</label>
                <label class="radio-inline"><input type="radio" name="academyPlace" >C</label>
                <label class="radio-inline"><input type="radio" name="academyPlace" >D</label>
          </div>
         <div class="form-group">
          <h3><span class="line">담</span>당 강사</h3>
          <input type="text" class="form-control" id="academyTeacher" placeholder="담당 강사이름을 입력해주세요" name="academyTeacher">
        </div>
      <div class="form-group">
        <h3><span class="line">수</span>업 내용</h3>
        <input type="text" class="form-control" id="academyContent" placeholder="수업내용을 입력해주세요" name="academyContent">
      </div>
      <div class="form-group">
        <h3><span class="line">수</span>업료</h3>
        <input type="text" class="form-control" id="academyPrice" placeholder="수업료를 입력해주세요" name="academyPrice">
      </div>
      <div class="form-group">
        <h3><span class="line">상</span>세 설명</h3>
         <textarea id="summernote" class="form-control" name="academyDetail"></textarea>
      </div>
      <input type="submit" class="btn btn-info" style="float:right" value="수업 등록하기">
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