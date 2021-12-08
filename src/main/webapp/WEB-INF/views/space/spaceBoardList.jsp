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
	<div class="container">
		<div class="table-box">
			<table>
				<tr>
					<th>No.</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>사용공간</th>
				</tr>
				<c:forEach items="${list }" var ="l" varStatus="i">
					<tr>
						<td>${i.count }</td>
						<td>${l.ubTitle }</td>
						<td>${l.memberId }</td>
						<td>${l.ubDate }</td>
						<td>${l.spaceName }</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div class="page-box">${pageNavi }</div>
	</div>
</body>
</html>