<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link href="resources/spaceCss/space_default.css" rel="stylesheet">
    <link href="resources/spaceCss/space_info.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="container">
		<form action="/spaceRental.do" method="post">
			<input type="hidden" value="${s.spaceNo }" name="spaceNo">
			<input type="hidden" value="${st.stNo }" name="stNo">
			<h3>${s.spaceName }예약하기</h3>
			<!--이미지 carousel  -->
				<div class="space-img">
				  <div id="myCarousel" class="carousel slide" data-ride="carousel">
				    <!-- Wrapper for slides -->
				    <div class="carousel-inner">
				      <div class="item active">
							<img class="i-img" src="resources/spaceImage/upload/${fv[0].filename }">
				      </div>
				      <div class="item">
							<img class="i-img" src="resources/spaceImage/upload/${fv[1].filename }">
				      </div>
				      <div class="item">
							<img class="i-img" src="resources/spaceImage/upload/${fv[2].filename }">
				      </div>
				    </div>
				
				    <!-- Left and right controls -->
				    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
				      <span class="glyphicon glyphicon-chevron-left"></span>
				      <span class="sr-only">Previous</span>
				    </a>
				    <a class="right carousel-control" href="#myCarousel" data-slide="next">
				      <span class="glyphicon glyphicon-chevron-right"></span>
				      <span class="sr-only">Next</span>
				    </a>
				  </div>
				</div>	
				<!-- 공간 정보 -->
				<div class="space-info">
					<table class="table table-bordered" >
						<tr>
							<td colspan="2">${s.spaceName }</td>
						</tr>
						<tr>
							<th>용도</th>
							<td>${s.spacePurpose }</td>
						</tr>
						<tr>
							<th>주요시설</th>
							<td>${s.mainFacility }</td>
						</tr>
						<tr>
							<th>주요물품</th>
							<td>${s.mainProduct }</td>
						</tr>
						<tr>
							<th>수용인원</th>
							<td>${s.maxPeople } 명</td>
						</tr>
						<tr>
							<th>가격</th>
							<td>${s.price } / 2시간</td>
						</tr>
					</table>
					<p>  ※ 대관으로 인한 직접적인 수익이 발생하는 경우, 대관이 불가합니다.<br> 규정에 따라 대관이 취소될 수 있습니다.</p>
					<p>  ※ 회원가입 및 로그인 후, 대관신청이 가능합니다.</p>
					<a href="/spaceRes.do?spaceNo=${s.spaceNo }" class="btn3">신청 하러 가기</a>
				</div>
				<div class="btn-box">
					<button type="button" class="open-img">이미지 보기</button>
					<button type="button" class="close-img">이미지 닫기</button>
				</div>
				<!-- 이미지 크게보기  -->
			<div class="big-img">
				<c:forEach items="${fv }" var="fv">
					<img class="info-img" src="resources/spaceImage/upload/${fv.filename }">
				</c:forEach>
			</div>
			<!-- 리뷰 보기  -->
			<div class="review-box">
				<c:if test="${not empty sessionScope.m  }">
					<form action="/insertSpaceReview.do" method="post" >
					
					</form>
				</c:if>
				
			</div>
		</form>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<script>
		$(function () {
			$(".big-img").hide();
			$(".close-img").hide();
			$(".open-img").click(function () {
				$(".close-img").show();
				$(".big-img").show();
				$(".open-img").hide();
			});
			$(".close-img").click(function () {
				$(".big-img").hide();
				$(".open-img").show();
				$(".close-img").hide();
			});
		}); 
	</script>
</body>
</html>