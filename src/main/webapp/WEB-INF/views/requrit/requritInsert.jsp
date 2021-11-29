<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="container">
    <h2>공고 등록하기</h2>
    <form action="/action_page.php">
      <div class="form-group">
        <label for="resumeTitle">공고명</label>
        <input type="text" class="form-control" id="resumeTitle" placeholder="공고명을 입력해주세요" name="resumeTitle">
      </div>
      <label>공고 기간</label><br>
      <div class="form-group col-sm-6">
        <label>시작일</label>
        <input type="date" class="form-control" id="startDate" name="startDate">
      </div>
      <div class="form-group col-sm-6">
        <label>종료일</label>
        <input type="date" class="form-control" id="endDate" name="endDate">
      </div>
      <div class="form-group">
        <label for="resumecareer">경력 사항</label>
        <input type="text" class="form-control" id="resumecareer" placeholder="경력사항을 입력해주세요" name="resumecareer">
      </div>
      <label>성별</label>
       <div class="checkbox">
                <label class="radio-inline"><input type="radio" name="gender" checked>남자</label>
                <label class="radio-inline"><input type="radio" name="gender" >여자</label>
          </div>
         <div class="form-group">
          <label for="academyField">직종</label>
          <input type="text" class="form-control" id="academyField" placeholder="직종을 입력해주세요" name="academyField">
        </div>
        <label>고용형태</label>
       <div class="checkbox">
                <label class="radio-inline"><input type="radio" name="employeeType" checked>정규직</label>
                <label class="radio-inline"><input type="radio" name="employeeType" >계약직</label>
       </div>
      <div>
        <label for="adcademyDetail">상세 설명</label>
        <textarea type="text" class="form-control" rows="7" id="adcademyDetail" placeholder="내용을 입력해주세요" name="adcademyDetail"></textarea>
      </div><br>
      <input type="submit" class="btn btn-info" style="float:right" value="공고 등록하기">
    </form>
  </div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>