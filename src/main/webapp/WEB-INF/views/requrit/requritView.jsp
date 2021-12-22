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
		
		<c:choose>	
			<c:when test="${r.period ge 0 }">
				<p>마감된 공고입니다</p>
			</c:when>
		<c:when test="${r.period le 0 }">
        <h2 class="title">${r.requritTitle }</h2>
        <div class="sector">
                <span class="first"><span class="line">경력</span></span>
                <span class="second">${r.requritCareer }</span>
				<p class="sectorLine"></p>
        </div>
        <div class="sector">
            <span class="first"><span class="line">성별</span></span>
            <span class="second">${r.requritGender }</span>
			<p class="sectorLine"></p>
        </div>
        <div class="sector">
            <span class="first"><span class="line">직종</span></span>
            <span class="second">${r.requritField }</span>
			<p class="sectorLine"></p>
        </div>
        <div class="sector">
            <span class="first"><span class="line">고용</span>형태</span>
            <span class="second">${r.employeeType }</span>
			<p class="sectorLine"></p>
        </div>
        <div class="sector">
            <span class="first"><span class="line">모집</span>기간</span>
            <span class="second">${r.requritStart } ~ ${r.requritEnd }(남은기간${r.period } 일)</span>
			<p class="sectorLine"></p>
        </div>
        <div class="sector">
            <p><span class="line">상세</span>설명</p>
            	${r.requritDetail }
        </div>
        <c:choose>
        	<c:when test="${sessionScope.m.memberLevel eq 1 || sessionScope.m.memberLevel eq 2 }">
       			 <button type="button" class="btn requritBtn" onclick="goResumeFrm();">지원하기</button>
        	</c:when>
         	<c:when test="${sessionScope.m.memberLevel eq 0 }">
         	<c:if test="${r.requritCancel eq 0 }">
        		<button type="button" class="btn requritBtn" id="deleteRequrit">삭제하기</button>
        		<button type="button" class="btn requritBtn" id="updateRequrit">수정하기</button>
        		<button type="button" class="btn requritBtn" onclick="goResumeList();">지원자보기</button>
        	</c:if>
        	<c:if test="${r.requritCancel eq 1 }">
        		<button type="button" class="btn requritBtn" id="updateRequritAndRevival">수정하고 재공고</button>
        	</c:if>
       	 	</c:when>
        </c:choose>
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
		var requritTitle = $(".title").html();
		location.href="/resumeList.do?requritNo="+requritNo+"&requritTitle="+requritTitle;
	}
	$("#deleteRequrit").click(function(){
		var requritNo = $("#hide").val();
		location.href ="/deleteRequrit2.do?requritNo="+requritNo;
	});
	$("#updateRequrit").click(function(){
		var requritNo = $("#hide").val();
		location.href ="/updateRequritFrm.do?requritNo="+requritNo;
	});
	$("#updateRequritAndRevival").click(function(){
		var requritNo = $("#hide").val();
		location.href ="/revivalRequritFrm.do?requritNo="+requritNo;
	});
	</script>
</body>
</html>