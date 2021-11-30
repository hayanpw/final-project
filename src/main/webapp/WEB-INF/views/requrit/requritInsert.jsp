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
    <h2>공고 등록하기</h2>
    <form action="/action_page.php">
      <div class="form-group">
        <h3><span class="line">공</span>고명</h3>
        <input type="text" class="form-control" id="resumeTitle" placeholder="공고명을 입력해주세요" name="resumeTitle">
      </div>
      <h3><span class="line">공</span>고 기간</h3>
      <div class="form-group col-sm-6">
        <h4>시작일</h4>
        <input type="date" class="form-control" id="startDate" name="startDate">
      </div>
      <div class="form-group col-sm-6">
        <h4>종료일</h4>
        <input type="date" class="form-control" id="endDate" name="endDate">
      </div>
      <div class="form-group">
        <h3><span class="line">경</span>력 사항</h3>
        <input type="text" class="form-control" id="resumecareer" placeholder="경력사항을 입력해주세요" name="resumecareer">
      </div>
      <h3><span class="line">성</span>별</h3>
       <div class="checkbox">
                <label class="radio-inline"><input type="radio" name="gender" checked>남자</label>
                <label class="radio-inline"><input type="radio" name="gender" >여자</label>
          </div>
         <div class="form-group">
          <h3>직종</h3>
          <input type="text" class="form-control" id="academyField" placeholder="직종을 입력해주세요" name="academyField">
        </div>
        <h3><span class="line">고</span>용형태</h3>
       <div class="checkbox">
                <label class="radio-inline"><input type="radio" name="employeeType" checked>정규직</label>
                <label class="radio-inline"><input type="radio" name="employeeType" >계약직</label>
       </div>
      <div>
        <h3><span class="line">상</span>세 설명</h3>
       <textarea id="summernote" class="form-control" name="requritDetail"></textarea>
      </div><br>
      <input type="submit" class="btn btn-info" style="float:right" value="공고 등록하기">
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