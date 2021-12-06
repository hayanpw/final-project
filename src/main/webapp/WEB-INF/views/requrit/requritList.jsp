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
	 <div class="container">
        <h2>강사모집 공고 리스트</h2>
       
        <table class="table table-hover">
            <thead>
              <tr>
                  <th>#번호</th>
                  <th>공고명</th>
                  <th>올린사람</th>
                  <th>모집 기간</th>
              </tr>
          </thead>
          
          <tbody>
          	<c:forEach items="${list }" var="r" varStatus="i">
             	<tr>
				   <td>${start + i.index }</td>
				   <td><a href="/requritView.do?requritNo=${r.requritNo }">${r.requritTitle }</a></td>
				   <td>관리자</td>
				   <c:choose>
				   <c:when test="${r.period ge 0 }">
				   <td>${r.requritStart }~${r.requritEnd }</td>
				   </c:when>
				   <c:when test="${r.period le 0 }">
				   <td>마감된 공고</td>
				   </c:when>
				   <c:when test="${r.period eq 0 }">
				   <td>오늘 마감!</td>
				   </c:when>
				   </c:choose>
			   </tr>
			 </c:forEach>
            </tbody>
          </table>
          <div id="pageNavi">${pageNavi }</div>
        </div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>