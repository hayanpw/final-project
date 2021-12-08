<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/showCss/showAdmin.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
	<jsp:include page="/WEB-INF/views/common/adminpageMenu.jsp"/>
	<div class="container">        
        <div class="mypage-title"><span>공</span>연관리</div>
        <div class="mypage-container">
        	<div class="listNavi">
	    		<div><h4>진행중인 공연</h4></div>
	    		<div><h4>지난 공연</h4></div>
	    	</div>
			<div class="showBox">
	        	<c:forEach items="${list }" var="s">
	        		<div class="showList">
		                <img src="${s.filepath }" class="poster">
		                <div>
			                <h2>공연명 : ${s.showName }</h2>
			                <h4>공연장 : ${s.showHall }</h4>
			                <p>공연기간 : ${s.showStart } ~ ${s.showEnd }</p>	 
			                <a href="/showView.do?showNo=${s.showNo }" class="btn btn-default">상세보기</a>       		
		                </div>
		                <div>
		                	<button onclick="deleteShow('${s.showNo}')" class="btn btn-danger">공연삭제</button>
		                </div>
	        		</div>
	        	</c:forEach>
        	</div>
        	<div class="lastShowBox">
	        	<c:forEach items="${last }" var="s">
	        		<div class="showList">
		                <img src="${s.filepath }" class="poster">
		                <div>
			                <h2>공연명 : ${s.showName }</h2>
			                <h4>공연장 : ${s.showHall }</h4>
			                <p>공연기간 : ${s.showStart } ~ ${s.showEnd }</p>	 
			                <a href="/showView.do?showNo=${s.showNo }" class="btn btn-default">상세보기</a>       		
		                </div>
		                <div>
		                	<button onclick="deleteShow('${s.showNo}')" class="btn btn-danger">공연삭제</button>
		                </div>
	        		</div>
	        	</c:forEach>
        	</div>
        </div>
	</div>
	<script>
		function deleteShow(showNo) {
	    	if(confirm("공연을 삭제하시겠습니까?")){
				location.href="/deleteShow.do?showNo="+showNo;
			}
		}
		$(function() {
			
			$(".listNavi>div").click(function() {
				$(".listNavi>div").children().removeClass("selec");
	            $(this).children().addClass("selec");
	            $(".listNavi").nextAll().hide();
	            if($(this).index() == 0){
	                $(".showBox").show();
	            }else{
	                $(".lastShowBox").show();
	            }
			});
			$(".listNavi>div").first().click();
		});
	</script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>