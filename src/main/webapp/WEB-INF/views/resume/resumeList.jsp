<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/hansolCss/hansol_default.css" rel="stylesheet">
<link href="resources/hansolCss/hansol_requritList.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	 <div class="container">
        <h2><span class="line">지원</span>자 리스트(${requritTitle })</h2>
       
        <table id="tableee" class="table table-hover table-bordered">
              <tr id="firstTr">
                  <th>#번호</th>
                  <th>이름 </th>
                  <th>성별</th>
                  <th>연락처</th>
              </tr>
          	<c:forEach items="${list }" var="rs" varStatus="i">
             	<tr id="secTr">
				   <td>${i.index +1 }</td>
				   <td><a href="/resumeView.do?resumeNo=${rs.resumeNo }">${rs.memberName }</a></td>
				   <td>${rs.resumeGender }</td>
				   <td>${rs.resumePhone }</td>
			   </tr>
			 </c:forEach>
          </table>
        </div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>