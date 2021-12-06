<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 	<link href="resources/hansolCss/hansol_default.css" rel="stylesheet">
    <link href="resources/hansolCss/hansol_academy.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	 <div class="container">
		<ul class="mainmenu">
		<c:forEach items="${list }" var="a" >
			<li class="academy">
				<div class="academyImg">
					<a href="/academyView.do?academtNo=${a.academyNo }"> 
					<img src="${a.academyPhoto }">
					</a>
				</div>
 				<div class="info">
					<p>${a.academyTitle }</p>
					<p>기간: ${a.academyStart } ~ ${a.academyEnd }</p>
					<p>강사 : ${a.academyTeacher }</p>
					<p>수업료 : ${a.academyPrice }</p>
					<p>참여 인원 : 10명 <button>참여인원보기</button></p>
					<div class="infoButton">
						<button class="btn1">상세보기</button><button class="btn1">수정하기</button><button class="btn1">삭제하기</button>
					</div>
				</div>	
			</li>
		</c:forEach>
		</ul>
		<button class="moreBtn">더보기 </button>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>