<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	 <div class="container">
        <h2>지원자 현황</h2>
       
        <table class="table table-hover">
            <thead>
              <tr>
                  <th>#번호</th>
                  <th>지원자 이름</th>
                  <th>성별</th>
                  <th>연락처</th>
              </tr>
          </thead>
          <tbody>
              <tr>
                  <td>f</td>
                  <td>o</td>
                  <td>r</td>
                  <td>e</td>
              </tr>
              <tr>
                  <td>c</td>
                  <td>h</td>
                  <td>써</td>
                  <td>서</td>
              </tr>
              <tr>
                  <td>한페이지</td>
                  <td>10</td>
                  <td>개</td>
                  <td>씩</td>
              </tr>
            </tbody>
          </table>
        </div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>