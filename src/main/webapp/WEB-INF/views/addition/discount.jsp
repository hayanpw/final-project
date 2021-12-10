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
	#menu>div{
		float: left;
	}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="container">
		<p id="title">할인 및 이벤트</p>
		<div id="menu">
		<div><img src="/resources/additionImage/카페.png" width="100px" height="100px"><div>ㅎㅎ</div></div>
		<div><img src="/resources/additionImage/박물관.png" width="100px" height="100px"><div>ㅎㅎ</div></div>
		<div><img src="/resources/additionImage/베카랜드.png" width="100px" height="100px"><div>ㅎㅎ</div></div>
		<div></div>
		</div>
		
	</div>	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>