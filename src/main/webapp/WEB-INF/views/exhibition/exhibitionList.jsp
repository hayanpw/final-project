<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 	<link href="resources/hansolCss/hansol_default.css" rel="stylesheet">
    <link href="resources/hansolCss/hansol_exhibition.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	 <div class="container">
		<ul class="mainmenu">
		<c:forEach items="${list  }" var="ex" >
			<li class="exhibition">
				<div class="exhibitionImg">
					<a href="/exhibitionView.do?exhibitionNo=${ex.exhibitionNo }"> 
					<img src="${ex.exhibitionPhoto }">
					</a>
				</div>
 				<div class="info">
					<p>${ex.exhibitionTitle }</p>
					<p>전시 기간: ${ex.exhibitionStart } ~ ${ex.exhibitionEnd }</p>
					<p>전시 시간 : ${ex.exhibitionTimeStart } ~ ${ex.exhibitionTimeEnd }</p>
					<p>장소 : 무지다 미술관 </p>
					<p>수업료 : ${ex.exhibitionPrice }</p>
					<div class="infoButton">
						<button class="btn1">상세보기</button><button class="btn1">수정하기</button><button class="btn1">삭제하기</button>
					</div>
				</div>	
			</li>
		</c:forEach>
		</ul>
		<c:if test="${count < totalCount}">
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
				url : "/moreExhibition.do",
				data : {start:start},
				success : function(data){
					var moreLi = "";
					for(var i=0;i<data.length;i++){
						moreLi += "<li class='exhibition'>";
						moreLi += "<div class='exhibitionImg'>"
						moreLi += "<a href='/exhibitionView.do?exhibitionNo="+data[i].exhibitionNo+"'>";
						moreLi += "<img src='"+data[i].exhibitionPhoto+"'></a></div>";
						moreLi += "<div class='info'>";
						moreLi += "<p>"+data[i].exhibitionTitle+"</p>";
						moreLi += "<p>전시 기간: "+data[i].exhibitionStart+"~"+data[i].exhibitionEnd+"</p>";
						moreLi += "<p>전시 시간: "+data[i].exhibitionTimeStart+"~"+data[i].exhibitionTimeEnd+"</p>";
						moreLi += "<p>장소: 무지다 미술관</p>";
						moreLi += "<p>금액: "+data[i].exhibitionPrice+"</p>";
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