<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#title{
		padding-top:30px;
		padding-left:30px;
		font-weight:700;
		font-size: 40px;
		padding-bottom: 30px;
		}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="container">
		<p id="title">시설안내</p>
		<ul class="nav nav-tabs">
		  <li class="active"><a data-toggle="tab" href="#home">Home</a></li>
		  <li><a data-toggle="tab" href="#menu1">Menu 1</a></li>
		  <li><a data-toggle="tab" href="#menu2">Menu 2</a></li>
		  <li><a data-toggle="tab" href="#menu3">Menu 3</a></li>
		</ul>

		<div class="tab-content">
		  <div id="home" class="tab-pane fade in active">
		    <h3>공연장</h3>
		    <p>Some content.</p>
		  </div>
		  <div id="menu1" class="tab-pane fade">
		    <h3>전시장</h3>
		    <p>Some content in menu 1.</p>
		  </div>
		  <div id="menu2" class="tab-pane fade">
		    <h3>열람실</h3>
		    <p>Some content in menu 2.</p>
		  </div>
		  <div id="menu3" class="tab-pane fade">
		    <h3>공간</h3>
		    <p>Some content in menu 3.</p>
		  </div>
		<p id="title">찾아오시는 길</p>
		</div>
		
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>