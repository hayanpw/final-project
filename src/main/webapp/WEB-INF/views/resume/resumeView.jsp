<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/hansolCss/hansol_default.css" rel="stylesheet">
<link href="resources/hansolCss/hansol_requritView.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	 <div class="container">
        <h2 class="title">${r.memberName }님의 이력서</h2>
        <div class="sector">
                <span class="first"><span class="line">지원</span>이름</span>
                <span class="second">${r.memberName }</span>
				<p class="sectorLine"></p>
        </div>
        <div class="sector">
            <span class="first"><span class="line">성별</span></span>
            <span class="second">${r.resumeGender }</span>
			<p class="sectorLine"></p>
        </div>
        <div class="sector">
            <span class="first"><span class="line">연락</span>처</span>
            <span class="second">${r.resumePhone }</span>
			<p class="sectorLine"></p>
        </div>
        <c:if test="${not empty r.rtList  }">
        <div class="sector">
            <span class="first"><span class="line">이력</span>서</span><br>
            <c:forEach items="${r.rtList }" var="file">
            <span class="second">${file.filename }</span><button onclick="download(${file.fileNo });" class="btn">다운받기</button>
            </c:forEach>
			<p class="sectorLine"></p>
        </div>
        </c:if>
        <div class="sector">
           <p><span class="line">간단</span>소개</p>
            ${r.resumeDetail }
        </div>
        <c:choose>
        	<c:when test="${empty sessionScope }">
       			 <button type="button" class="btn requritBtn" onclick="goResumeFrm();">지원하기</button>
       			 <button type="button" class="btn requritBtn" onclick="goResumeList();">지원자보기</button>
        	</c:when>
         	<c:when test="${sessionScope.member.MemberLevel eq 0 }">
        		<button type="button" class="btn requritBtn">삭제하기</button>
        		<button type="button" class="btn requritBtn">수정하기</button>
        		
       	 	</c:when>
        </c:choose>
        <input type="hidden" id ="hide" value="${r.requritNo }">
    </div>
  	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<script>
	function goResumeFrm(){
		var requritTitle = $(".title").html();
		var requritNo = $("#hide").val();
		if(confirm(requritTitle+"에지원 하시겠습니까")){
			location.href="/resumeFrm.do?requritNo="+requritNo+"&requritTitle="+requritTitle;
		}
	}
	function goResumeList(){
		var requritNo = $("#hide").val();
		location.href="/resumeList.do?requritNo="+requritNo;
	}
	function download(fileNo){
		location.href="/resumeFileDown.do?fileNo="+fileNo;
	}
	</script>
</body>
</html>