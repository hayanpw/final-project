<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 	<link href="resources/showCss/show_default.css" rel="stylesheet">
    <link href="resources/showCss/show_list.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="container">
		<ul class="mainList">
			<li class="goods">
				<a href="#">
				<div class="academyImg">
					<img src="resources/academyImage/upload/careeer.png">
				</div>
				<div class='projectInfo'>
					<p class='projectCategory'>f.fundingCategory</p>
				 	<p class='projectTitle'>f.projectTitle</p>
				 </div>
				<div class='projectLine'>
				 	<span class='projectPrice'>.totalPrice원 펀딩</span>
					<span class='projectPeriod'>f.period</span>
					<spna class='projectPercent'>f.percent</span>
				</div>
				</a>
			</li>
		</ul>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>