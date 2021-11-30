<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
	<jsp:include page="/WEB-INF/views/common/mypageMenu.jsp"/>
	<div class="container">        
        <div class="mypage-title"><span>개</span>인정보관리</div>
        <div class="mypage-container" style="border: 1px solid #BDB19A">
                          마이페이지내용은 여기에 넣어주세요! 
            style border 빼세요 테두리 보여주려 첨부한거에요
            width:970px;
        </div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>