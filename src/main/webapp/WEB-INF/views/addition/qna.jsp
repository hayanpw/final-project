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
	border-top: 7px solid #563D39;
	margin-top:70px;
	margin-left:70px;
	font-weight:700;
	font-size: 40px;
	margin-bottom: 50px;
	}
	#title2{
	width:220px;
	border-top: 7px solid #563D39;
	margin-top:70px;
	margin-left:70px;
	font-weight:700;
	font-size: 40px;
	margin-bottom: 50px;
	}
	#table{
	margin-left: 50px;
	margin-right: 50px;
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
		background-color: #563D39;
		color: white;
	}
	#table1 td {
	border-top: 1px solid #f3efe6;
	font-weight:100;
	height: 40px;
	font-size:18px;
	line-height: 40px;
	}
	#firtr>td{
	text-align:center;
	border-top:3px solid #BDB19A;
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
	background-color: #f3efe6 ;
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
    background-color: #563D39;
    border-color: #563D39;
    color: white;
    border: none;
    }
    #pageNum a{
    color: black;
    border: none;
    }
    #answerAfter{
    color: #563D39;
    }
    #answerBefore{
    color: #A79078;
    }
    i{
    color: #74655E;
    }
   .collapsible {
	  background-color: #777;
	  color: white;
	  cursor: pointer;
	  padding: 18px;
	  width: 100%;
	  border: none;
	  text-align: left;
	  outline: none;
	  font-size: 15px;
	}
	
	.active, .collapsible:hover {
	  background-color: #555;
	}
	
	.collapsible:after {
	  content: '\002B';
	  color: white;
	  font-weight: bold;
	  float: right;
	  margin-left: 5px;
	}
	
	.active:after {
	  content: "\2212";
	}
	
	.content {
	  padding: 0 18px;
	  max-height: 0;
	  overflow: hidden;
	  transition: max-height 0.2s ease-out;
	  background-color: #f1f1f1;
	}
	/* Dropdown Button */
	.dropbtn {
	  background-color: #3498DB;
	  color: white;
	  padding: 16px;
	  font-size: 16px;
	  border: none;
	  cursor: pointer;
	}
	
	/* Dropdown button on hover & focus */
	.dropbtn:hover, .dropbtn:focus {
	  background-color: #2980B9;
	}
	
	/* The container <div> - needed to position the dropdown content */
	.dropdown {
	  position: relative;
	  display: inline-block;
	}
	
	/* Dropdown Content (Hidden by Default) */
	.dropdown-content {
	  display: none;
	  position: absolute;
	  background-color: #f1f1f1;
	  min-width: 160px;
	  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
	  z-index: 1;
	}
	
	/* Links inside the dropdown */
	.dropdown-content a {
	  color: black;
	  padding: 12px 16px;
	  text-decoration: none;
	  display: block;
	}
	
	/* Change color of dropdown links on hover */
	.dropdown-content a:hover {background-color: #ddd}
	
	/* Show the dropdown menu (use JS to add this class to the .dropdown-content container when the user clicks on the dropdown button) */
	.show {display:block;}
</style>
</head>
<body>

<script>
  (function() {
    var w = window;
    if (w.ChannelIO) {
      return (window.console.error || window.console.log || function(){})('ChannelIO script included twice.');
    }
    var ch = function() {
      ch.c(arguments);
    };
    ch.q = [];
    ch.c = function(args) {
      ch.q.push(args);
    };
    w.ChannelIO = ch;
    function l() {
      if (w.ChannelIOInitialized) {
        return;
      }
      w.ChannelIOInitialized = true;
      var s = document.createElement('script');
      s.type = 'text/javascript';
      s.async = true;
      s.src = 'https://cdn.channel.io/plugin/ch-plugin-web.js';
      s.charset = 'UTF-8';
      var x = document.getElementsByTagName('script')[0];
      x.parentNode.insertBefore(s, x);
    }
    if (document.readyState === 'complete') {
      l();
    } else if (window.attachEvent) {
      window.attachEvent('onload', l);
    } else {
      window.addEventListener('DOMContentLoaded', l, false);
      window.addEventListener('load', l, false);
    }
  })();
  ChannelIO('boot', {
    "pluginKey": "30646173-f05a-4c55-9818-46a0543b5882"
  });
</script>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="container" id="container">
		<div id="title">FAQ</div>
		<div class="dropdown">
		  <button onclick="myFunction()" class="dropbtn">Dropdown</button>
		  <div id="myDropdown" class="dropdown-content">
		    <a href="#home">Link 1</a>
		    <a href="#">Link 2</a>
		    <a href="#">Link 3</a>
		  </div>
		</div>
		
		<div class="tab-content">
		  <div id="home" class="tab-pane fade in active" >
		  	<button class="collapsible">Open Section 1</button>
			<div class="content">
			  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
			</div>
			<button class="collapsible">Open Section 2</button>
			<div class="content">
			  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
			</div>
			<button class="collapsible">Open Section 3</button>
			<div class="content">
			  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
			</div>
		  </div>
		  <div id="show" class="tab-pane fade">
		    <img src="/resources/additionImage/전시실.jpg" width="100%" height="300px">
		    <div class="content-text">
		    <span>Musée d'art <span id="line">전시실</span>은</span><br>
		    첨단 시설을 갖춘  공연장으로 413석의 객석을 갖추고 있으며 극장전면 LCD 모니터를 통해 공연자막과 동영상 서비스를 제공하고 있습니다. 특히 최신 음향 장치를 설치하여 객석 구석구석까지 소리가 잘 전달되는 탁월한 음향 수준을 구현했습니다. 또한 무대 전환을 도와주는 배튼이 총 102개로 전환 속도가 빨라 역동적인 무대를 만들어 낼 수 있습니다. 클래식뿐만 아니라 다양한 장르를 소화해 낼 수 있는 다목적공연장입니다.
		    </div>
		  </div>
		  <div id="reading" class="tab-pane fade">
			<img src="/resources/additionImage/열람실1.jpg" width="100%" height="300px">				    
		    <div class="content-text">
		    <span>Musée d'art <span id="line">열람실</span>은</span><br>
		    첨단 시설을 갖춘  공연장으로 413석의 객석을 갖추고 있으며 극장전면 LCD 모니터를 통해 공연자막과 동영상 서비스를 제공하고 있습니다. 특히 최신 음향 장치를 설치하여 객석 구석구석까지 소리가 잘 전달되는 탁월한 음향 수준을 구현했습니다. 또한 무대 전환을 도와주는 배튼이 총 102개로 전환 속도가 빨라 역동적인 무대를 만들어 낼 수 있습니다. 클래식뿐만 아니라 다양한 장르를 소화해 낼 수 있는 다목적공연장입니다.
		    </div>
		  </div>
		  <div id="space" class="tab-pane fade">
		    <img src="/resources/additionImage/연습실.png" width="100%" height="300px">	
		    <div class="content-text">
		  <span>Musée d'art <span id="line">기타공간</span>은</span><br> 
		    첨단 시설을 갖춘  공연장으로 413석의 객석을 갖추고 있으며 극장전면 LCD 모니터를 통해 공연자막과 동영상 서비스를 제공하고 있습니다. 특히 최신 음향 장치를 설치하여 객석 구석구석까지 소리가 잘 전달되는 탁월한 음향 수준을 구현했습니다. 또한 무대 전환을 도와주는 배튼이 총 102개로 전환 속도가 빨라 역동적인 무대를 만들어 낼 수 있습니다. 클래식뿐만 아니라 다양한 장르를 소화해 낼 수 있는 다목적공연장입니다.
		    </div>
		 </div>
		</div>
		
		<button class="collapsible">Open Section 1</button>
		<div class="content">
		  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
		</div>
		<button class="collapsible">Open Section 2</button>
		<div class="content">
		  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
		</div>
		<button class="collapsible">Open Section 3</button>
		<div class="content">
		  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
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
	
	var coll = document.getElementsByClassName("collapsible");
	var i;

	for (i = 0; i < coll.length; i++) {
	  coll[i].addEventListener("click", function() {
	    this.classList.toggle("active");
	    var content = this.nextElementSibling;
	    if (content.style.maxHeight){
	      content.style.maxHeight = null;
	    } else {
	      content.style.maxHeight = content.scrollHeight + "px";
	    } 
	  });
	}
	function myFunction() {
		  document.getElementById("myDropdown").classList.toggle("show");
		}

		// Close the dropdown menu if the user clicks outside of it
		window.onclick = function(event) {
		  if (!event.target.matches('.dropbtn')) {
		    var dropdowns = document.getElementsByClassName("dropdown-content");
		    var i;
		    for (i = 0; i < dropdowns.length; i++) {
		      var openDropdown = dropdowns[i];
		      if (openDropdown.classList.contains('show')) {
		        openDropdown.classList.remove('show');
		      }
		    }
		  }
		}
	</script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>