<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/additionCss/event.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="container">
		<fieldset>
			<c:if test="${not empty sessionScope.m.memberId }">
			<div>
				<a href="/boardWriteFrm.do?boardType=5" class="btn btn-info writeBtn">글쓰기</a>
			</div>
			</c:if>
			<div class="photoWrapper"></div>
			<div id="btnBack">
			<button class="btn btn-outline-info" currentCount="0" 
			totalCount="${totalCount }" value="1" id="more-btn">이벤트 더보기</button>
			</div>
			<!--totalCount : 전체게시물 수
				currentCount : 실제로 가져온 게시물 수 
				value : 요청한 게시물 수(reqPage) -->
		</fieldset>
	</div>
	<script>
		$("#more-btn").click(function(){
			var start=$(this).val();
			$.ajax({
				url : "/eventMore.do",
				data : {start:start},
				type : "post",
				success : function(data){
					for(var i=0;i<data.length;i++){
						console.log(data[0]);
						var p = data[i];
						var html ="";
						if(p.filepath!=null){
						html += "<div class='photo'>";
						html += "<a href='/boardView.do?boardType=5&boardNo="+p.boardNo+"'><img id='eventImg' src='/resources/additionImage/"+p.filepath+"'></a>";
						html += "<p class='caption'><a href='/boardView.do?boardType=5&boardNo="+p.boardNo+"'>"+p.boardTitle+"</a><br>조회수 : "+p.readCount+"</p></div>";
						$(".photoWrapper").append(html);
						}else{
							html += "<div class='photo'>";
							html += "<a href='/boardView.do?boardType=5&boardNo="+p.boardNo+"'><img id='eventImg' src='/resources/additionImage/이벤트.png'></a>";
							html += "<p class='caption'><a href='/boardView.do?boardType=5&boardNo="+p.boardNo+"'>"+p.boardTitle+"</a><br>조회수 : "+p.readCount+"</p></div>";
							$(".photoWrapper").append(html);
						}
					}
					
					//가지고 온 데이터를 화면에 출력한 후 다음 요청을 위한 값 변경
					$("#more-btn").val(Number(start)+3);
					//지금까지 읽오온 게시물의 수를 변경(읽어온 배열의 길이만큼 기존값에 더함)
					var curr=Number($("#more-btn").attr("currentCount"));
					$("#more-btn").attr("currentCount",curr+data.length);
					//전체게시물수 
					var totalCount = $("#more-btn").attr("totalCount");
					var currCount = $("#more-btn").attr("currentCount");
					if(totalCount==currCount){
						$("#more-btn").prop("disabled",true);
					}
				}
			});
		});
		$(function(){
			$("#more-btn").click();
		});
	</script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>