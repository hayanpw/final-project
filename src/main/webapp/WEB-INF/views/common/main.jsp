<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="jquery.js"></script>
  <script src="jquery.fadethis.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.min.css">
  <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1"/>
  <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"/>
  <link rel="stylesheet" href="/resources/commonCss/main.css">  
  <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.css"/>
  <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick-theme.css"/>
   <link rel="stylesheet" href="/resources/commonCss/mainhf.css">
</head>
<body data-spy="scroll" data-target=".navbar" data-offset="50">
  <div class="popup">
        <div id="popup">
            <header class="top"> 
<!--                 <h1 class="infoTit">소개</h1>  -->
            </header>
            <main class="textBox">
                <h2 class="tit">Musée d'art</h2>
                <p class="textContents">
                    musée d'art 뜻은 프랑스어로 '미술관'을 뜻합니다.<br> 
                    발음대로 읽으면 '무지다'가 되며 강원도 방언으로 '모이다'라는 뜻도 더하여 
                    저희 홈페이지는 공연 전시 관람 및 열람 다양한 문화생활을 모은 장소를 만들었습니다.
                <p><strong>적용기간 : 2021.07.14~12.29</strong></p>
                <p style="font-size:7px;"> 예쁘게 봐주시구 5개월동안 수고많으셨습니다 :) Au revir!</p>
                <p> KH Team3 </p>
                </p>
            </main>
            
        </div>   
        <footer class="btnBox_todayClose">
            <form method="post" action="" name="pop_form">
                <span id="check">
                    <a href="javascript:void(0)" id="cp" style="color:#fff">닫기</a>
                </span>
            </form>
        </footer>
    </div>
     <!-- <div class="container" style="width: 100%;"> -->
        <div class="slider-for d1">
            <div class="sf"><img src="/resources/mainImage/upload/m-main1.jpg"></div>
            <div class="sf"><img src="/resources/mainImage/upload/m-main2.jpg"></div>
            <div class="sf"><img src="/resources/mainImage/upload/m-main3.jpg"></div>
            <div class="sf"><img src="/resources/mainImage/upload/m-main4.jpg"></div>
            <div class="sf"><img src="/resources/mainImage/upload/m-main5.jpg"></div>
        </div>
        <div class="sliderbg">
        <div class="slider-nav d2">
            <div class="sn"><img src="/resources/mainImage/upload/m-show1.jpg"></div>
            <div class="sn"><img src="/resources/mainImage/upload/m-show2.jpg"></div>
            <div class="sn"><img src="/resources/mainImage/upload/m-show3.jpg"></div>
            <div class="sn"><img src="/resources/mainImage/upload/m-show4.jpg"></div>
            <div class="sn"><img src="/resources/mainImage/upload/m-show5.jpg"></div>
        </div>
        </div>
      <div class="header-title">
        <div class="h-logo">
			<a href="/main.do">Musée d'art</a>
        </div>
		<div class="h-left">
        <nav class="header-nav">
           <div class="navi">
               <ul>
                   <li><a href="/showList.do">공연 · 예매</a></li>
                   <li><a href="/spaceMain.do">공간 · 대관</a>
                   		<ul class="sub">
                           <li><a href="/spaceMain.do">대관 안내</a></li>
                           <li><a href="/spaceList.do">공간 소개</a></li>
                           <li><a href="/spaceRes.do?spaceNo=0">대관 현황</a></li>
                           <li><a href="/selectSpaceBoardList.do?reqPage=0">사용 게시판</a></li>
                        </ul>
                   </li>
                   <li><a href="/exhibitionList.do?reqPage=4">전시</a></li>
                   <li><a href="/readingNotice.do">열람실</a></li>
                   <li>
                       <a href="/academyList.do?reqPage=4&category=all">아카데미</a>
                       <ul class="sub">
                           <li><a href="/academyList.do?reqPage=4&category=all">수강 신청</a></li>
                           <li><a href="/requritList.do?reqPage=1">강사 모집</a></li>
	                     	<c:choose>
						    	<c:when test="${not empty sessionScope.m && sessionScope.m.memberLevel == 1 }">
									<li><a href="#">수업 관리</a></li>
								</c:when>
								<c:when test="${not empty sessionScope.m && sessionScope.m.memberLevel == 2 }">
								    <li><a href="#">학생 관리</a></li>
								</c:when>
							</c:choose>
                        </ul>
                   </li>
                   <li>
                       <a href="/additionBoard.do?boardType=1&reqPage=1">부가서비스</a>
                       <ul class="sub">
                           <li><a href="/additionBoard.do?boardType=1&reqPage=1">공지사항</a></li>
                           <li><a href="/additionBoard.do?boardType=3&reqPage=1">소통게시판</a></li>
                           <li><a href="/additionBoard.do?boardType=2&reqPage=1">문의게시판</a></li>
                           <li><a href="/additionGuide.do">시설안내 · 오시는 길</a></li>
                           <li><a href="/discount.do">이벤트</a></li>
                       </ul>
                   </li>
               </ul>
           </div>
	</nav>
        </div>  
        <div class="h-right">
		<c:choose>
	    	<c:when test="${empty sessionScope.m }">
				<a href="/loginFrm.do">Sign in <span>></span></a>
			</c:when>
			<c:when test="${not empty sessionScope.m && sessionScope.m.memberLevel == 0}">
			    <a href="/adminpage.do">My Page[관리] <span>></span></a>
			    <a href="/logout.do">로그아웃</a>
			</c:when>
			<c:when test="${not empty sessionScope.m && sessionScope.m.memberLevel == 1 || sessionScope.m.memberLevel == 2}">
			    <a href="/mypage.do?memberNo=${sessionScope.m.memberNo }">My Page[일반] <span>></span></a>
			    <a href="/logout.do"> 로그아웃</a>
			</c:when>
		</c:choose>
		</div>
		<div class="headerText" style="text-shadow: 2px 2px 2px gray;">	
 			<strong>${headerText}</strong>
		</div>
	</div>
        <script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
        <script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.js"></script>
      
        <script type="text/javascript">
        
        $('#cp').click(function () {
			$('.popup').hide();
		})
		
       $('.slider-for').slick({
        slidesToShow: 1,
        slidesToScroll: 1,
        arrows: false,
        fade: true,
        asNavFor: '.slider-nav'
      });
      $('.slider-nav').slick({
        autoplay: true,
        slidesToShow: 4,
        slidesToScroll: 1,
        asNavFor: '.slider-for',
        dots: false,
        centerMode: true,
        focusOnSelect: true
      });
        </script>


         <div class="showslide">
         <!-- Swiper -->
         <div class="swiper mySwiper" >
          <div class="swiper-wrapper">
            <div class="swiper-slide"><img src="/resources/mainImage/upload/m-art1.jpg">
            <div class="cover">
              <div class="cover-content">
                  <h5>호두까기 인형</h5>
                  <hr>
                  <button class="reserve-button">예매</button>
              </div>
          </div>
        </div>
            <div class="swiper-slide"><img src="/resources/mainImage/upload/m-art2.jpg">
            <div class="cover">
              <div class="cover-content">
                  <h5>프랑켄슈타인</h5>
                  <hr>
                  <button class="reserve-button">예매</button>
              </div>
            </div>
          </div>
            <div class="swiper-slide"><img src="/resources/mainImage/upload/m-art3.jpg">
              <div class="cover">
                <div class="cover-content">
                    <h5>라이언킹</h5>
                    <hr>
                    <button class="reserve-button">예매</button>
                </div>
              </div>
            </div>
            <div class="swiper-slide"><img src="/resources/mainImage/upload/m-art4.jpg"></div>
            <div class="swiper-slide"><img src="/resources/mainImage/upload/m-art5.jpg"></div>
            <div class="swiper-slide"><img src="/resources/mainImage/upload/m-art6.jpg"></div>
            <div class="swiper-slide"><img src="/resources/mainImage/upload/m-art4.jpg"></div>
            <div class="swiper-slide"><img src="/resources/mainImage/upload/m-art5.jpg">
              <div class="cover">
                <div class="cover-content">
                    <h5>지킬앤하이드</h5>
                    <hr>
                    <button class="reserve-button">예매</button>
                </div>
              </div>
            </div>
            <div class="swiper-slide"><img src="/resources/mainImage/upload/m-art6.jpg">
              <div class="cover">
                <div class="cover-content">
                    <h5>드루피와함께 춤을</h5>
                    <hr>
                    <button class="reserve-button">예매</button>
                </div>
              </div>
            </div>
          </div>
          <div class="swiper-button-next"></div>
          <div class="swiper-button-prev"></div>
          <div class="swiper-pagination"></div>
        </div>
      </div>
        <!-- Swiper JS -->
        <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
      
        <!-- Initialize Swiper -->
        <script>
          var swiper = new Swiper(".mySwiper", {
            slidesPerView: 5,
            spaceBetween: 30,
            slidesPerGroup: 3,
            loop: true,
            loopFillGroupWithBlank: true,
            pagination: {
              el: ".swiper-pagination",
              clickable: true,
            },
            navigation: {
              nextEl: ".swiper-button-next",
              prevEl: ".swiper-button-prev",
            },
          });
        </script>

        <div class="banner">
          <div class="slide-right up-on-scroll">
          <img src="/resources/mainImage/upload/m-newbanner.jpg">
        </div> 
        </div>

        <div class="m-notice">
          <div class="slide-right up-on-scroll">
          <div class="notice-menu">
            <li class="l-notice">
                  <div class="tit-main">
                    <span class="small">Notice</span>
                    <h2 class="t">최신소식</h2>
                  </div>
                  <ul class="ln-content">
                    <li class="lnc-box">
                      <a href="#"><span class="t">제목칸 : [안내] 코로나19 특별방역 대처</span></a>
                      <span class="date">2021.11.30</span>
                    </li>
                      <li class="lnc-box">
                        <a href="#"><span class="t">제목칸 : [채용공고] 아카데미'첼로' 선생모집 </span></a>
                        <span class="date">2021.12.08</span>
                      </li>
                  </ul>
               </li>

                <li class="r-popup">
                  <div class="tit-main">
                    <span class="small">Popup Zone</span>
                    <h2 class="t">팝업존</h2>
                  </div>
                  <div class="w">
                    <ul class="ln-content">
                        <li class="rpc-box">
                          <a href="#"><img src="/resources/mainImage/upload/m-popup1.jpg"></a>
                          <span class="date">2021.11.30</span>
                        </li>
                          <li class="rpc-box">
                            <a href="#"><img src="/resources/mainImage/upload/m-popup2.jpg"></a>
                            <span class="date">2021.12.08</span>
                          </li>
                      </ul>
                  </div>
                </li>
            </div>
          </div>
        </div>
          <script>
		   $('.autoplay').slick({
			  slidesToShow: 3,
			  slidesToScroll: 1,
			  autoplay: true,
			  autoplaySpeed: 2000,
			});
</script>
        <script>
        function isElementUnderBottom(elem, triggerDiff) {
      const { top } = elem.getBoundingClientRect();
      const { innerHeight } = window;
      return top > innerHeight + (triggerDiff || 0);
    }
          function handleScroll() {
      const elems = document.querySelectorAll('.up-on-scroll');
      elems.forEach(elem => {
        if (isElementUnderBottom(elem, -20)) {
          elem.style.opacity = "0";
          elem.style.transform = 'translateY(70px)';
        } else {
          elem.style.opacity = "1";
          elem.style.transform = 'translateY(0px)';
        }
      })
    }
    
    window.addEventListener('scroll', handleScroll);
        </script>
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
    	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>