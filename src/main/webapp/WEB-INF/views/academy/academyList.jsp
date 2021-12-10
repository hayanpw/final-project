<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 	<link href="resources/hansolCss/hansol_default.css" rel="stylesheet">
    <link href="resources/hansolCss/hansol_academy.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	 <div class="container">
		<ul class="mainmenu">
		<c:forEach items="${list  }" var="a" >
			<li class="academy">
				<div class="academyImg">
					<a href="/academyView.do?academyNo=${a.academyNo }"> 
					<img src="${a.academyPhoto }">
					</a>
				</div>
 				<div class="info">
					<p>${a.academyTitle }</p>
					<p>기간: ${a.academyStart } ~ ${a.academyEnd }</p>
					<p>강사 : ${a.academyTeacher }</p>
					<p>수업료 : ${a.academyPrice }</p>
					<p>참여 인원 : 10명  <button id="studentView">참여인원보기</button></p>
					<div class="infoButton">
						<button class="btn1">상세보기</button><button class="btn1">수정하기</button><button class="btn1">삭제하기</button>
					</div>
				</div>	
			</li>
		</c:forEach>
		</ul>
		<c:if test="${count <= totalCount}">
		<button class="moreBtn" id="more" currentCount="4" totalCount="${totalCount }" value="4">더보기 </button>
		</c:if>
		<input type="hidden" id="totalCount" value="${totalCount }">
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<script>
		var totalCount = $("#totalCount");
		
		$("#more").click(function(){
			var start = $(this).val();
			$.ajax({
				url : "/moreAcademy.do",
				data : {start:start},
				success : function(data){
					var moreLi = "";
					for(var i=0;i<data.length;i++){
						moreLi += "<li class='academy'>";
						moreLi += "<div class='academyImg'>"
						moreLi += "<a href='/academyView.do?academyNo="+data[i].academyNo+"'>";
						moreLi += "<img src='"+data[i].academyPhoto+"'></a></div>";
						moreLi += "<div class='info'>";
						moreLi += "<p>"+data[i].academyTitle+"</p>";
						moreLi += "<p>수업 기간: "+data[i].academyStart+"~"+data[i].academyEnd+"</p>";
						moreLi += "<p>강사: "+data[i].academyTeacher+"</p>";
						moreLi += "<p>수업료: "+data[i].academyPrice+"</p>";
						moreLi += "<p>참여인원: 10명  <button id ='studentView'>참여인원보기</button></p>";
						moreLi += "<div class = 'infoButton'>";
						moreLi += "<button class='btn1'>상세보기</button><button class='btn1'>수정하기</button><button class='btn1'>삭제하기</button>";
						moreLi += "</div></div></li>";
						$(".mainmenu").append(moreLi);
					}
					console.log(start);
					$("#more").val(Number(start)+2);
					var curr = Number($("#more").attr("currentCount"));
					$("#more").attr("currentCount",curr + data.length);
					var totalCount = $("#more").attr("totalCount");
					var currCount = $("#more").attr("currentCount");
					console.log(totalCount);
					console.log(currCount);
					if(currCount == totalCount){
						$("#more").css("display","none");
						$("#more").prop("diabled",true);
					}
					
				}
			});
		});
	</script>
</body>
</html>