<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/hansolCss/hansol_academyAdmin.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/jquery-ui/jquery-ui.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<script type="text/javascript" src="/resources/jquery-ui/jquery-ui.min.js"></script>
	<jsp:include page="/WEB-INF/views/common/adminpageMenu.jsp"/>
	<div class="container">        
        <div class="mypage-title"><span>수업</span>관리</div>
        <div class="mypage-container">
        	<div class="listNavi">
	    		<div><h4>진행중인 수업</h4></div>
	    		<div><h4>지난 수업</h4></div>
	    	</div>
			<div class="academyBox">
	        	<c:forEach items="${list }" var="ac">
	        		<div class="academyList">
		                <img src="${ac.academyPhoto }" class="poster">
		                <div>
			                <h2>수업명 : ${ac.academyTitle }</h2>
			                <h4>담당 선생님 : ${ac.academyTeacher }</h4>
			                <p>전시기간 : ${ac.academyStart } ~ ${ac.academyEnd }</p>	 
			                <a href="/academyView.do?academyNo=${ac.academyNo }" class="btn btn-default">상세보기</a>
		                </div>
		                <div class="reservList">
		                		<button class="btn btn-danger countStudent" style="margin-left: 5px" academyNo="${ac.academyNo }">학생수 조회</button>
		                	<div class="academy">
		                	</div>
		                </div>
		                <div>
		                	<button onclick="deleteAcademy('${ac.academyNo}')" class="btn btn-danger">전시삭제</button>
		         
		                </div>
	        		</div>
	        	</c:forEach>
        	</div>
        	<div class="lastAcademyBox">
	        	<c:forEach items="${last }" var="acl">
	        		<div class="academyList">
		                <img src="${acl.academyPhoto }" class="poster">
		                <div>
			                <h2>전시명 : ${acl.academyTitle }</h2>
			                <h4>장소 : 무지다 미술관</h4>
			                <p>전시기간 : ${acl.academyStart } ~ ${acl.academyEnd }</p>	 
			                <a href="/academyView.do?academyNo=${acl.academyNo }" class="btn btn-default">상세보기</a>
		                </div>
		                 <div class="reservList">
		                		<button class="btn btn-danger countStudent" style="margin-left: 5px" academyNo="${acl.academyNo }">학생수 조회</button>
		                	<div class="academy">
		                	</div>
		                </div>
		                <div>
		                	<button onclick="deleteAcademy('${acl.academyNo}')" class="btn btn-danger">전시삭제</button>
		                	
		                </div>
	        		</div>
	        	</c:forEach>
        	</div>
        </div>
	</div>
	<script>

		function deleteAcademy(academyNo) {
	    	if(confirm("수업을 삭제하시겠습니까?")){
				location.href="/deleteAcademy.do?academyNo="+academyNo;
			}
		}
		$(".countStudent").click(function(){
			var academyNo = $(this).attr("academyNo");
			var message = "";
			var idx = $(".countStudent").index(this);
			$(".academy").eq(idx).empty();
			console.log(idx);
			$.ajax({
				url : "/countingStar.do",
				data : {academyNo:academyNo},
				success : function(data){
					if(data == "0"){
						$(".academy").eq(idx).append("<h4>수강중인 학생이 없습니다.</h4>");
					}else{
						$(".academy").eq(idx).append("<h4>수강중인 학생:"+data+"명</h4>");
					}
					
				}
			});
		});
		$(function() {
			$(".listNavi>div").click(function() {
				$(".listNavi>div").children().removeClass("selec");
	            $(this).children().addClass("selec");
	            $(".listNavi").nextAll().hide();
	            if($(this).index() == 0){
	                $(".academyBox").show();
	            }else{
	                $(".lastAcademyBox").show();
	            }
			});
			$(".listNavi>div").first().click();
		});
	</script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>