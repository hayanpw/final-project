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
	border-top: 7px solid #064663;
	margin-top:70px;
	font-weight:700;
	font-size: 40px;
	margin-bottom: 50px;
	}
	#title2{
	width:255px;
	border-top: 7px solid #064663;
	margin-top:70px;
	margin-left:70px;
	font-weight:700;
	font-size: 40px;
	margin-bottom: 50px;
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
	#titlemenu a{
	color: black;
	}
	#titlemenu>li.active>a {
	background-color: black ;
	color: white;
	font-weight: bold;
	font-size: 18px;
	}
	#titlemenu>li>a{
	padding:0;
	line-height:60px;
	height: 60px;
	font-size: 17px;
	font-weight: 600;
	border-radius: 0px;
	}
	.content-text{
	padding: 20px;
	font-size: 20px;
	}
	.content-text span{
	font-size: 30px;
	}
	#line{
	color: #064663;
	font-weight: bold; 
	}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=igxqlbwr6x"></script>
			<div class="container">
			<div id="title">시설안내</div>
				<ul id="titlemenu" class="nav nav-pills nav-justified">
					<li class="active"><a data-toggle="pill" href="#home">공연장</a></li>
					<li><a data-toggle="pill" href="#show">전시실</a></li>
					<li><a data-toggle="pill" href="#reading">열람실</a></li>
					<li><a data-toggle="pill" href="#space">기타공간</a></li>
				</ul>
				
				<div class="tab-content">
				  <div id="home" class="tab-pane fade in active" >
				  	<img src="/resources/additionImage/show2.jpg" width="100%" height="300px">
				  	<div class="content-text">
				    <span>Musée d'art <span id="line">공연장</span>은</span><br>
				       첨단 시설을 갖춘  공연장으로 413석의 객석을 갖추고 있으며 극장전면 LCD 모니터를 통해 공연자막과 동영상 서비스를 제공하고 있습니다. 특히 최신 음향 장치를 설치하여 객석 구석구석까지 소리가 잘 전달되는 탁월한 음향 수준을 구현했습니다. 또한 무대 전환을 도와주는 배튼이 총 102개로 전환 속도가 빨라 역동적인 무대를 만들어 낼 수 있습니다. 클래식뿐만 아니라 다양한 장르를 소화해 낼 수 있는 다목적공연장입니다.
				    </div>
				  </div>
				  <div id="show" class="tab-pane fade">
				    <img src="/resources/additionImage/전시실.jpg" width="100%" height="300px">
				    <div class="content-text">
				    <span>Musée d'art <span id="line">전시실</span>은</span><br>
				     총 370의 면적이며, 전문가들의 전시와 함께 지역주민들의 작품전시 등 전문가와 지역주민들이 참여하고 함께 구성해 가는 문화공간입니다.
				    </div>
				  </div>
				  <div id="reading" class="tab-pane fade">
					<img src="/resources/additionImage/열람실1.jpg" width="100%" height="300px">				    
				    <div class="content-text">
				    <span>Musée d'art <span id="line">열람실</span>은</span><br>
				   <p>100석의 열람실이 있으며 홈페이지를 통해 좌석현황 및 배정 절차를 받아 이용할 수 있고,</p> 
				   <p>비품 대여 서비스를 제공하고 있습니다.</p>
				    </div>
				  </div>
				  <div id="space" class="tab-pane fade">
				    <img src="/resources/additionImage/연습실.png" width="100%" height="300px">	
				    <div class="content-text">
				  <span>Musée d'art <span id="line">기타공간</span>은</span><br> 
				  <p>무지다 문화센터에는 연습실, 다목적실, 강의실, 세미나실 총 4개의 공간이있습니다. </p>
				  <p>비영리 모임, 생활문화동아리와 문화인, 그리고 지역의 예술가들을 위해 제공합니다.</p>
				    </div>
				 </div>
				</div>
				
				<p id="title2">찾아오시는 길</p> <!--서버주소등록 새로해야함  -->
				<div id="map" style="width:100%;height:500px;"></div>
			</div>
	<script type="text/javascript">
	window.onload=function(){
		var map = new naver.maps.Map("map",{
			center : new naver.maps.LatLng(37.8932925,127.6908453), //시작위치
			zoom : 17, //배율
			zoomControl : true
		});
		var marker = new naver.maps.Marker({ //위치마커
			position : new naver.maps.LatLng(37.8932925,127.6908453),
			map : map //어느 지도에 추가할지
		});
		var contentString = [
			"<div class='iw_inner'>",
			" 	<h3>Musée d'art</h3>",
			" 	<p>강원도 춘천시 서면 박사로 854</p>",
			"</div>"
		].join("");
		var infoWindow = new naver.maps.InfoWindow();
		naver.maps.Event.addListener(marker,"click",function(e){
			if(infoWindow.getMap()){ //infoWindow가 지도에 존재하면
				infoWindow.close(); //infoWindow닫기
			}else{ //infoWindow가 지도에 존재하지 않으면 
				//미리 만들어둔 주소로 infoWindow를 생성
				infoWindow = new naver.maps.InfoWindow({
					content : contentString
				});
				//생성된 infoWindow를 map의 marker의 위치에 생성
				infoWindow.open(map,marker);
			}
		});
	}
	</script>	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>