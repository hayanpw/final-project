<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
	<jsp:include page="/WEB-INF/views/common/mypageMenu.jsp"/>
	<div class="container">        
        <div class="mypage-title"><span>회</span>원탈퇴 </div>
        <div class="mypage-container" style="">
		<c:choose>
			<c:when test="${count eq 0 }">
				탈퇴하시겠습니까?
				<a href="/deleteMember.do?memberNo=${m.memberNo}">넹 바로할래요</a>
				<a href="/">아뇨,다시생각해볼래요</a>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list}" var="md" >
					<c:choose>
						<c:when test="${md.selectNo eq 1}">
						<div class="delete_box">
							<div class="l-box">
		 						<a href="#">진행중인 공연 예매가 있습니다.</a>	
		                      	<p>예약번호 : ${md.reserveNo}</p>
								<p>공연제목 : ${md.reserveTitle}</p>
		                        <p>예약날짜 : ${md.reserveDate}</p>              
		                    </div>
		                    <div class="r-box">
		                      	<button onclick="deletemShow(this,'${md.reserveNo}');">취소하기</button>
							</div>
						</div>
						</c:when>
						<c:when test="${md.selectNo eq 2}">
							<div class="delete_box">
							<div class="l-box">
		 						<a href="#">전시리뷰써주세요</a>	
		                      	<p>예약번호 : ${md.reserveNo}</p>
								<p>대관장소 : ${md.reserveTitle}</p>
		                        <p>예약날짜 : ${md.reserveDate}</p>              
		                    </div>
		                    <div class="r-box">
		                        <button onclick="deletemSpace(this,'${md.reserveNo}');">리뷰쓰기</button>
							</div>
							</div>
						</c:when>
						<c:when test="${md.selectNo eq 3}">
						<div class="delete_box">
							<div class="l-box">
		 						<a href="#">예약된 열람실이 있습니다.</a>	
		                      	<p>예약번호 : ${md.reserveNo}</p>
								<p>공연제목 : ${md.reserveTitle}</p>
		                        <p>예약날짜 : ${md.reserveDate}</p>              
		                    </div>
		                    <div class="r-box">
		                        <button onclick="deletemRead(this,'${md.reserveNo}');">취소하기</button>
							</div>
						</div>
						</c:when>
						<c:when test="${md.selectNo eq 4}">
												<div class="delete_box">
							<div class="l-box">
		 						<a href="#">수강중인 수업이 있습니다.</a>	
		                      	<p>예약번호 : ${md.reserveNo}</p>
								<p>공연제목 : ${md.reserveTitle}</p>
		                        <p>예약날짜 : ${md.reserveDate}</p>              
		                    </div>
		                    <div class="r-box">
		                        <button onclick="deletemAcademy(this,'${md.reserveNo}');">취소하기</button>
							</div>
						</div>
						</c:when>
						<c:when test="${md.selectNo eq 5}">
												<div class="delete_box">
							<div class="l-box">
		 						<a href="#">전시예매 내역이 있습니다.</a>	
		                      	<p>예약번호 : ${md.reserveNo}</p>
								<p>공연제목 : ${md.reserveTitle}</p>
		                        <p>예약날짜 : ${md.reserveDate}</p>              
		                    </div>
		                    <div class="r-box">
		                        <button onclick="deletemExhibition(this,'${md.reserveNo}');">취소하기</button>
							</div>
						</div>
						</c:when>
					</c:choose>
				</c:forEach>	
			</c:otherwise>
		</c:choose>
		
        </div>
	</div>
	<script>
	function deletemShow(obj, reserveNo) {
		var md_tbl = '';
		$.ajax({
			url : "/deletemShow.do",
			data : {reserveNo : reserveNo},
			type : "post",
			success : function(data) {
				if(data == 0){
					alert("삭제실패");
				}else{
					alert("삭제성공");
					$(obj).parent().parent().fadeOut(300,function(){
						$(this).remove();
					})
				}
			}
		});
	}
	function deletemSpace(obj, reserveNo) {
		var md_tbl = '';
		$.ajax({
			url : "/deletemSpace.do",
			data : {reserveNo : reserveNo},
			type : "post",
			success : function(data) {
				if(data == 0){
					alert("삭제실패");
				}else{
					alert("삭제성공");
					$(obj).parent().parent().fadeOut(300,function(){
						$(this).remove();
					})
				}
			}
		});
	}
	function deletemRead(obj, reserveNo) {
		var md_tbl = '';
		$.ajax({
			url : "/deletemRead.do",
			data : {reserveNo : reserveNo},
			type : "post",
			success : function(data) {
				if(data == 0){
					alert("삭제실패");
				}else{
					alert("삭제성공");
					$(obj).parent().parent().fadeOut(300,function(){
						$(this).remove();
					})
				}
			}
		});
	}
	function deletemAcademy(obj, reserveNo) {
		var md_tbl = '';
		$.ajax({
			url : "/deletemAcademy.do",
			data : {reserveNo : reserveNo},
			type : "post",
			success : function(data) {
				if(data == 0){
					alert("삭제실패");
				}else{
					alert("삭제성공");
					$(obj).parent().parent().fadeOut(300,function(){
						$(this).remove();
					})
				}
			}
		});
	}
	function deletemExhibition(obj, reserveNo) {
		var md_tbl = '';
		$.ajax({
			url : "/deletemExhibition.do",
			data : {reserveNo : reserveNo},
			type : "post",
			success : function(data) {
				if(data == 0){
					alert("삭제실패");
				}else{
					alert("삭제성공");
					$(obj).parent().parent().fadeOut(300,function(){
						$(this).remove();
					})
				}
			}
		});
	}
	</script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	
</body>
<style>
.delete_box{
	border: 1px solid #BDB19A;
	display : flex;
	justify-content: space-around;
	align-items: center;
	padding-top : 20px;
	padding-bottom : 20px;
	margin-bottom: 3px;
}
.l-box{
 	width:60%;
 	
}
.l-box>p{
	margin-bottom: 0;
}
.l-box>*{
	margin-bottom: 5px;
	margin-top:5px;
}
.r-box{
	width:20%;
	display: flex;
	justify-content: center;
	align-items: center;
}
</style>
</html>