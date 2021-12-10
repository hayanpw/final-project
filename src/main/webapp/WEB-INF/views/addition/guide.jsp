<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#title{
	width:165px;
	border-top: 7px solid #563D39;
	margin-top:70px;
	margin-left:70px;
	font-weight:700;
	font-size: 40px;
	margin-bottom: 50px;
	}
	#title2{
	width:255px;
	border-top: 7px solid #563D39;
	margin-top:70px;
	margin-left:70px;
	font-weight:700;
	font-size: 40px;
	margin-bottom: 50px;
	}
	#back{
		background-image: url("/resources/additionImage/시설.jpg");
		width: 100%;
		height: 300px;
	}
	#titlemenu li{
		width: 285px;
		text-align: center;
	}
	.nav-tabs>li>a{
	background-image: url("");
	}
	.tab-content{
	padding: 50px 20px 50px;
	}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
			<div id="back"></div>
			<div class="container">
			<div id="title">시설안내</div>
				<ul id="titlemenu" class="nav nav-tabs">
				  <li class="active"><a data-toggle="tab" href="#home">공연장</a></li>
				  <li><a data-toggle="tab" href="#menu1">전시실</a></li>
				  <li><a data-toggle="tab" href="#menu2">열람실</a></li>
				  <li><a data-toggle="tab" href="#menu3">기타공간</a></li>
				</ul>
				
				<div class="tab-content">
				  <div id="home" class="tab-pane fade in active" >
				  	<img src="/resources/additionImage/show2.jpg" width="100%" height="300px">
				    <p>Musée d'art 공연장은 첨단 시설을 갖춘  공연장으로 413석의 객석을 갖추고 있으며 극장전면 LCD 모니터를 통해 공연자막과 동영상 서비스를 제공하고 있습니다. 특히 최신 음향 장치를 설치하여 객석 구석구석까지 소리가 잘 전달되는 탁월한 음향 수준을 구현했습니다. 또한 무대 전환을 도와주는 배튼이 총 102개로 전환 속도가 빨라 역동적인 무대를 만들어 낼 수 있습니다. 클래식뿐만 아니라 다양한 장르를 소화해 낼 수 있는 다목적공연장입니다.</p>
				  </div>
				  <div id="menu1" class="tab-pane fade">
				    <img src="/resources/additionImage/전시실.jpg" width="100%" height="300px">
				    <p>Some content in menu 1.</p>
				  </div>
				  <div id="menu2" class="tab-pane fade">
					<img src="/resources/additionImage/열람실1.jpg" width="100%" height="300px">				    
				    <p>Some content in menu 2.</p>
				  </div>
				  <div id="menu3" class="tab-pane fade">
				    <img src="/resources/additionImage/연습실.png" width="100%" height="300px">	
				    <p>Some content in menu 3.</p>
				 </div>
				</div>
				
				<p id="title2">찾아오시는 길</p>
			</div>
		
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>