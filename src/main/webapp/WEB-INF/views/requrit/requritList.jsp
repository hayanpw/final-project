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
        <h2 style="margin-top: 100px; margin-bottom: 50px;"><span class="line">강사</span>모집 공고</h2>
        
        <table id="tableee" class="table table-hover" >
              <tr id="firstTr">
                  <th>#번호</th>
                  <th>공고명</th>
                  <th>올린사람</th>
                  <th>모집 기간</th>
              </tr>
          	<c:forEach items="${list }" var="r" varStatus="i">
          	<c:if test="${r.requritCancel eq 0 }">
             	<tr id ="secTr">
				   <td>${start + i.index }</td>
				   <td><a href="/requritView.do?requritNo=${r.requritNo }" style="text-decoration: none;">${r.requritTitle }</a></td>
				   <td>관리자</td>
				   <c:choose>
				   <c:when test="${r.period ge 1 }">
				   <td>${r.requritStart }~${r.requritEnd }</td>
				   </c:when>
				   <c:when test="${r.period le -1 }">
				   <td>마감된 공고</td>
				   </c:when>
				   <c:when test="${r.period eq 0 }">
				   <td>오늘 마감!</td>
				   </c:when>
				   </c:choose>
			   </tr>
			  </c:if>
			 </c:forEach>
          </table>
          <div id="pageNavi">${pageNavi }</div>
        <div class="btnArea" style="float: right; margin-right: 50px;">
        <c:choose>
        <c:when test="${sessionScope.m.memberLevel eq 0}">
        	<button class="btn" id ="deleteRequritList">삭제된 공고 보기</button>
        	<button class="btn" id ="insertRequrit">공고 등록하기</button>
        </c:when>
        <c:otherwise>
        	<button id="myRequritList" memberNo="${sessionScope.m.memberNo }">내가 지원한 공고 보기</button>
        </c:otherwise>
       </c:choose>
       </div>
        </div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<script>
		$("#deleteRequritList").click(function(){
			location.href ="/deleteRequritList.do?reqPage=1";
		});
		$("#myRequritList").click(function(){
			var memberNo = $(this).attr("memberNo");
			location.href ="/myResumeList.do?memberNo="+memberNo;
		});
		$("#insertRequrit").click(function(){
			location.href ="/requritFrm.do";
		});
	</script>
</body>
</html>