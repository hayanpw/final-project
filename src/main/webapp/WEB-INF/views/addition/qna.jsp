<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/4054b6ceaa.js" crossorigin="anonymous"></script>
<style type="text/css">
	#title{
	width:85px;
	border-top: 7px solid #064663;
	margin-top:70px;
	margin-left:70px;
	font-weight:700;
	font-size: 40px;
	margin-bottom: 50px;
	}
	#title2{
	width:220px;
	border-top: 7px solid #064663;
	margin-top:70px;
	margin-left:70px;
	font-weight:700;
	font-size: 40px;
	margin-bottom: 50px;
	}
	#table{
	text-align: center;
	}
	#table>div:first-child{
	margin: 30px;
	}
	#search{
		padding-right:20px;
		padding-bottom:20px;
		float: right;
	}
	#write{
		float: left;
	}
	#my{
		float: right;
	}
	#page{
	text-align: center;
	}
	
	#firtr>td:nth-child(1){
	width: 80px;
	}
	#firtr>td:nth-child(3){
	width: 100px;
	}
	#firtr>td:nth-child(4){
	width: 150px;
	}
	#firtr>td:nth-child(5){
	width: 100px;
	}
	.btn{
		width:100px;
		background-color: #064663;
		color: white;
	}
	#table1 td {
	border-top: 1px solid #eee;
	font-weight:100;
	height: 40px;
	font-size:18px;
	line-height: 40px;
	}
	#firtr>td{
	text-align:center;
	border-top:3px solid #064663;
	font-weight: bold;
	height: 40px;
	font-size: 15px;
	line-height: 40px;
	}
	
	#table1 td>a {
	color: black;
	}
	#table1 td>a:hover {
	text-decoration: none;
	}
	#table1 tr:hover {
	background-color: #eee ;
	}
	#write:hover,#my:hover {
	text-decoration: none;
	color: white;
	font-weight: bold;
    }
    #btitle{
    text-align: left;
    }
    #keyword{
    width: 200px;
    border:0;
    outline: none;
    }
    #submit{
    border: 0;
    background-color: white;
    }
    #type{
    border: none;
    }
    #pageNumAct a{
    background-color: #064663;
    border-color: #064663;
    color: white;
    border: none;
    }
    #pageNum a{
    color: black;
    border: none;
    }
    #answerAfter{
    color: #064663;
    }
    #answerBefore{
    color: black;
    }
    i{
    color: #064663;
    }
   /*faq*/
   
   .accordion {
	  background-color: #fff;
	  color: #444;
	  cursor: pointer;
	  padding: 18px;
	  width: 100%;
	  text-align: left;
	  border: 1px solid black;
	  outline: none;
	  transition: 0.4s;
	}
	
	/* Add a background color to the button if it is clicked on (add the .active class with JS), and when you move the mouse over it (hover) */
	.active, .accordion:hover {
	  background-color: #fff;
	}
	
	/* Style the accordion panel. Note: hidden by default */

	.panel {
	  padding: 0 18px;
	  background-color: white;
	  max-height: 0;
	  overflow: hidden;
	  transition: max-height 0.2s ease-out;
	}
	#panel{
	 border-radius: 0;
	 margin-bottom: 0px;
	 border: none;
	}
	#titlemenu>li>a{
	border-radius: 0;
	border-top:1px solid black;
	border-left:1px solid black;
	color: black;
	}
	#titlemenu>li:last-child>a{
	border-right:1px solid black;
	}
	#titlemenu>li.active>a {
	 background-color: black;
	 color: white;
	}
	 #pagination>li:first-child>a{
    border-top-left-radius: 0px;
    border-bottom-left-radius: 0px;
    }
    #pagination>li:last-child>a{
    border-top-right-radius: 0px;
    border-bottom-right-radius: 0px;
    }
</style>
</head>
<body>


	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="container" id="container">
		<div id="title">FAQ</div>
		<ul id="titlemenu" class="nav nav-pills nav-justified">
			<li class="active"><a data-toggle="pill" href="#home">공연</a></li>
			<li><a data-toggle="pill" href="#show">전시</a></li>
			<li><a data-toggle="pill" href="#reading">관람</a></li>
			<li><a data-toggle="pill" href="#space">회원</a></li>
		</ul>
		<div class="tab-content">
		  <div id="home" class="tab-pane fade in active" >
			<button class="accordion">[&nbsp;공연&nbsp;]&nbsp;최근 공연, 전시정보를 알고 싶습니다.</button>
			<div id="panel" class="panel">
			  <p>홈페이지, 서비스플라자, 콜센터(02-399-1000, 오전 10시부터 오후 8시까지 연중무휴)를 통해 공연, 전시정보를 접하실 수 있습니다</p>
			</div>
			
			<button class="accordion">공연 영상자료(VIDEO, DVD)를 구할 수 있나요?</button>
			<div id="panel" class="panel">
			  <p>공연별 주최측에 문의하시기 바랍니다.주최측 문의 전화번호는 각 공연정보를 참고하시기 바랍니다. </p>
			  <p>(각 공연정보는 공연명을 아실 경우 홈페이지 상단의 검색창을 통해 검색하시거나,</p>
			  <p>공연 날짜를 아실 경우 공연/전시 메뉴에서 캘린더를 통해 검색하시면 됩니다.)</p>
			</div>
			
			<button class="accordion">공연팜플렛을 구입할 수 있을까요?</button>
			<div id="panel" class="panel">
			  <p>공연당일은 공연장 로비에서 팜플렛을 구입하실 수 있습니다.</p>
			  <p>공연일이 지난 경우에는 공연주최측에 문의하시기 바랍니다.</p>
			  <p>주최측 문의전화는 각 공연정보를 참고하시기 바랍니다.</p>
			  <p>(각 공연정보는 공연명을 아실 경우 홈페이지 상단의 검색창을 통해 검색하시거나,</p>
			  <p> 공연 날짜를 아실 경우 공연/전시 메뉴에서 캘린더를 통해 검색하시면 됩니다.)</p>
			 </div>
		  </div>
		  
		  <div id="show" class="tab-pane fade">
		    <button class="accordion">잔여석 정보에 대해서 알고 싶어요.</button>
			<div id="panel" class="panel">
			  <p>각 공연 상세페이지의 예매버튼 하단에 잔여석정보를 보실 수 있는 버튼이 있으며,</p>
			<p>해당 버튼을 클릭하시면 공연일자별, 회차별 잔여석 수를 확인하실 수 있습니다.</p>
			<p>단, 예매상황에 따라 잔여석 수가 변동될 수 있으니 정확한 잔여석정보는 예매창에서 확인해 주시기 바랍니다.</p>
			</div>
			
			<button class="accordion">제가 예매한 혹은 예매할 자리가 궁금합니다.</button>
			<div id="panel" class="panel">
			  <p>예매한 좌석을 다시 확인하실 경우는 마이페이지에서 예매확인/취소를 클릭하시면 고객분께서 예매하신 내역을 보실 수 있습니다.</p>
			  <p>이때 예매번호 하단의 상세내역을 클릭하시면 좌석번호를 확인하실 수 있습니다.</p>
			  <p>또한 홈페이지 좌석배치도를 참고하시면 됩니다. 예매할 자리는 인터넷예매를 하실 경우 직접 좌석을 선택하실 수 있는 장점이 있습니다.</p>
			</div>
			
			<button class="accordion">Section 3</button>
			<div id="panel" class="panel">
			  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
			</div>
		  </div>
		  <div id="reading" class="tab-pane fade">
			<button class="accordion">공연중 음식물반입이 가능한가요?</button>
			<div id="panel" class="panel">
			  <p>모든 일체의 음식물은 공연장 안으로 가져갈 수 없습니다.
				<p>자신의 조그만 부주의가 공연자는 물론 객석의 관람자에게도 큰 피해를 주어 공연장 분위기를 망칠 수 있는 것을 양해해 주시고,
				<p>음식물은 꼭 드신 후 입장해 주시기 바랍니다.</p>
			</div>
			
			<button class="accordion">공연 촬영, 녹음, 녹화가 가능한가요?</button>
			<div id="panel" class="panel">
			  	<p>사진촬영, 녹음, 녹화는 절대 금물입니다.</p>
				<p>종합구성물의 무대장치나 공연장면, 유명연주자들의 모습은 모두 저작권에 해당하는 것으로, 무단촬영 배포가 금지되어 있습니다.</p>
				<p>세종문화회관에서도 사전에 공연단체에게 허락을 받고 상업적인 사용을 하지 않는다는 약속을 한 후에 공연기록용 사진을 촬영하며,</p>
				<p>프로그램이나 소식지에 사진을 사용하는 데에도 별도의 승인을 받고 있습니다.</p>
				<p>공연 중의 사진 촬영이나 녹음, 녹화 등은 공연물의 초상권과 저작권을 침해하는 행위이며,</p>
				<p>공연장은 공공장소라는 점을 감안하시어 공연관람의 기본적인 에티켓을 지켜 주시기 바랍니다.</p>
			</div>
			
			<button class="accordion">공연보러 갈때 몇시정도에 도착해야 하나요?</button>
			<div id="panel" class="panel">
			  <p>공연장 도착은 최소한 20분전까지는 완료하시고, </p>
			  <p>10분전에는 자신의 좌석에 앉아 편안한 마음으로 공연을 관람할 준비를 해 주시기 바랍니다. </p>
			  <p>원칙적으로 공연장 입장은 공연시작 이후엔 출입금지입니다. </p>
			  <p>늦게 도착하신 경우 대기석에서 기다린 후 휴식시간(intermission)에 고객님 자리로 이동하실 수 있습니다.</p>
			</div>
		  </div>
		  <div id="space" class="tab-pane fade">
		   <button class="accordion">Section 1</button>
			<div id="panel" class="panel">
			  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
			</div>
			
			<button class="accordion">Section 2</button>
			<div id="panel" class="panel">
			  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
			</div>
			
			<button class="accordion">Section 3</button>
			<div id="panel" class="panel">
			  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
			</div>
		 </div>
		</div>
		
		
		
		
		
		<div id="title2">질문과 답변</div>
		<div id="table">
			<div>
				<form action="/searchKeyword.do?boardType=2&reqPage=1" method="post">
				 	<select name="type" id="type">
				 		<option value="tac">제목+내용</option>
				 		<option value="writer">작성자</option>
				 	</select>
				 	<input type="text" id="keyword" name="keyword" placeholder="검색어를 입력하세요.">
				 	<button id="submit"><i class="fas fa-search"></i></button>
				</form>
			</div>
			<table id="table1" class="table">
				<tr id="firtr">
					<td>번호</td><td>제목</td><td>작성자</td><td>작성일</td><td>답변상태</td>
				</tr>
				<c:forEach	items="${list }" var="b" varStatus="i">
				<c:if test="${b.bnum != 0 }">
				<tr>
					<td>${b.bnum }</td>
					<c:choose>
						<c:when test="${b.boardLevel eq 1}">
							<td id="btitle"><a href="/boardView.do?boardType=2&boardNo=${b.boardNo}" class="chk"><i class="fas fa-lock"></i>&nbsp;&nbsp;${b.boardTitle }</a></td>
							<input type="hidden" class="boardLevel" value="${b.boardLevel }">
							<input type="hidden" class="memberId" value="${sessionScope.m.memberId }">
							<input type="hidden" class="memberLevel" value="${sessionScope.m.memberLevel }">
							<input type="hidden" class="boardWriter" value="${b.boardWriter }">
						</c:when>
						<c:otherwise>
							<td id="btitle"><a href="/boardView.do?boardType=2&boardNo=${b.boardNo}">${b.boardTitle }</a></td>
						</c:otherwise>
					</c:choose>
					<td>${b.boardWriter }</td>
					<td>${b.regDate }</td>
					<c:choose>
						<c:when test="${b.commentCount ne 0}">
						<td id="answerAfter">답변완료</td>
						</c:when>
						<c:otherwise>
						<td id="answerBefore">미답변</td>
						</c:otherwise>
					</c:choose>
				</tr>
				</c:if>
				</c:forEach>
			</table>
		</div>
		<div id="page">
			<div id="pageNavi">${pageNavi }</div>
		</div>
		<c:if test="${not empty sessionScope.m }">
			<div id="table">
				<a class="btn" id="write" href="/boardWriteFrm.do?boardType=2">글작성</a>
				<a class="btn" id="my" href="/myFree.do?memberId=${sessionScope.m.memberId }">내글 보기</a>
			</div>	
		</c:if>
	</div>
	<script type="text/javascript">
	$(document).on("click",".chk",function(){
		var idx=$(".chk").index(this);
		var boardWriter = $(".boardWriter").eq(idx).val();
		var boardLevel = $(".boardLevel").eq(idx).val();
		var memberId = $(".memberId").eq(idx).val();
		var memberLevel = $(".memberLevel").eq(idx).val();
		if(memberId ==""){
			alert("읽기 권한이 없습니다.");
			return false;
		}
		if(boardLevel==1){
			if(memberLevel == 0){
				return true;
			}else if(boardWriter == memberId){
				return true;
			}else{
				alert("읽기 권한이 없습니다.");
				return false;
			}
		}
    });
	
	$("#submit").click(function(){
		var keyword = $("#keyword").val();
		if(keyword == ""){
			alert("검색어를 입력하세요.");
			return false;
		}
	});
	
	/*faq*/
	var acc = document.getElementsByClassName("accordion");
	var i;
	
	for (i = 0; i < acc.length; i++) {
	  acc[i].addEventListener("click", function() {
	    this.classList.toggle("active");
	    var panel = this.nextElementSibling;
	    if (panel.style.maxHeight) {
	      panel.style.maxHeight = null;
	    } else {
	      panel.style.maxHeight = panel.scrollHeight + "px";
	    }
	  });
	}
	</script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>