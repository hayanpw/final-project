<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공연 목록</title>
    <link href="resources/showCss/show_default.css" rel="stylesheet">
    <link href="resources/showCss/show_list.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <div class="container">
        <h1>musée d'art<br>공연 일정</h1>
        <div class="showSearchBox">
	        <c:if test="${sessionScope.m.memberLevel == 0 }">
	            <a href="/insertShowFrm.do" class="btn btn-danger">공연 추가</a>
	        </c:if>
        </div>
        <div class="showList">
        	<c:forEach items="${list }" var="s">
	            <a href="/showView.do?showNo=${s.showNo }" class="showInfo">
	                <img src="${s.filepath }" class="poster">
	                <h2>${s.showName }</h2>
	                <br>
	                <h4>${s.showHall }</h4>
	                <p>${s.showStart } ~ ${s.showEnd }</p>
	            </a>        	
        	</c:forEach>
        </div>
    </div>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>