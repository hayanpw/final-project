<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="container">
		  <h2>전시 등록하기</h2>
  <form action="/action_page.php">
    <div class="form-group">
      <label for="exhibitionTitle">전시제목</label>
      <input type="text" class="form-control" id="exhibitionTitle" placeholder="전시 제목을 입력해주세요" name="exhibitionTitle">
    </div>
    <label>전시 기간</label><br>
    <div class="form-group col-sm-6">
      <label>시작일</label>
      <input type="date" class="form-control" id="startDate" name="startDate">
    </div>
    <div class="form-group col-sm-6">
      <label>종료일</label>
      <input type="date" class="form-control" id="endDate" name="endDate">
    </div>
    <label>관람 연령</label>
     <div class="checkbox">
      		<label><input type="radio" name="all"> 전체 관람</label><label><input type="radio" name="children">12세 이상</label><label><input type="radio" name="student">15세 이상</label><label><input type="radio" name="adult">19세 이상</label>
    	</div>
       <label>전시 시간</label><br>
    <div class="form-group col-sm-6">
      <label>시작시간</label>
      <input type="time" class="form-control" id="startTime" name="startTime">
    </div>
    <div class="form-group col-sm-6">
      <label>종료일</label>
      <input type="time" class="form-control" id="endTime" name="endTime">
    </div>
    <div class="form-group">
      <label for="exhibitionTitle">가격</label>
      <input type="text" class="form-control" id="exhibitionPrice" placeholder="가격을 입력해주세요" name="exhibitionPrice">
    </div>
    <div class="form-group">
      <label for="exhibitionTitle">가격</label>
      <textarea type="text" class="form-control" rows="7" id="exhibitionDetail" placeholder="내용을 입력해주세요" name="exhibitionDetail"></textarea>
    </div>
       <input type="submit" class="btn btn-info" style="float:right" value="등록하기">
  </form>
</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>