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
                  <th>이름 </th>
                  <th>성별</th>
                  <th>연락처</th>
              </tr>
          </thead>
          
          <tbody>
          	<c:forEach items="${list }" var="rs" varStatus="i">
             	<tr>
				   <td>${i.index +1 }</td>
				   <td><a href="/resumeView.do?resumeNo=${rs.resumeNo }">${rs.memberName }</a></td>
				   <td>${rs.resumeGender }</td>
				   <td>${rs.resumePhone }</td>
			   </tr>
			 </c:forEach>
            </tbody>
          </table>
        </div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>