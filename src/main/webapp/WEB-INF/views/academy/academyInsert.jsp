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
  		 <h2>수업 등록하기</h2>
    <form action="/action_page.php">
      <div class="form-group">
        <label for="academyTitle">수업명</label>
        <input type="text" class="form-control" id="academyTitle" placeholder="수업명을 입력해주세요" name="academyTitle">
      </div>
      <label>수업 기간</label><br>
      <div class="form-group col-sm-6">
        <label>시작일</label>
        <input type="date" class="form-control" id="startDate" name="startDate">
      </div>
      <div class="form-group col-sm-6">
        <label>종료일</label>
        <input type="date" class="form-control" id="endDate" name="endDate">
      </div>
      <div class="form-group">
        <label for="sel1">카테고리</label>
        <select class="form-control" id="category" name="category">
          <option>음악</option>
          <option>미술</option>
          <option>독서</option>
          <option>dhkdhkhdkhdk</option>
        </select>
      </div>
      <label>장소</label>
       <div class="checkbox">
                <label class="radio-inline"><input type="radio" name="place" checked>A</label>
                <label class="radio-inline"><input type="radio" name="place" >B</label>
                <label class="radio-inline"><input type="radio" name="place" >C</label>
                <label class="radio-inline"><input type="radio" name="place" >D</label>
          </div>
         <div class="form-group">
          <label for="academyTeacher">담당 강사</label>
          <input type="text" class="form-control" id="academyTeacher" placeholder="담당 강사이름을 입력해주세요" name="academyTeacher">
        </div>
      <div class="form-group">
        <label for="academyContent">수업 내용</label>
        <input type="text" class="form-control" id="academyContent" placeholder="수업내용을 입력해주세요" name="academyContent">
      </div>
      <div class="form-group">
        <label for="academyPrice">수업료</label>
        <input type="text" class="form-control" id="academyPrice" placeholder="수업료를 입력해주세요" name="academyPrice">
      </div>
      <div class="form-group">
        <label for="exhibitionTitle">상세 설명</label>
        <textarea type="text" class="form-control" rows="7" id="exhibitionDetail" placeholder="내용을 입력해주세요" name="exhibitionDetail"></textarea>
      </div>
      <input type="submit" class="btn btn-info" style="float:right" value="수업 등록하기">
    </form>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>