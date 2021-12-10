<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>Bootstrap Example</title>
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
    <title>Document</title>
</head>
<body data-spy="scroll" data-target=".navbar" data-offset="50">
  <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <div class="s-container">
        <div id="section1" class="container-fluid">
            <div id="myCarousel" class="carousel slide" data-ride="carousel">
                <!-- Indicators -->
                <ol class="carousel-indicators">
                  <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                  <li data-target="#myCarousel" data-slide-to="1"></li>
                  <li data-target="#myCarousel" data-slide-to="2"></li>
                </ol>
            
                <!-- Wrapper for slides -->
                <div class="carousel-inner">
                  <div class="item active">
                    <img src="/resources/mainImage/upload/m-main4.jpg" alt="Los Angeles" style="width:100%; height:700px">
                  </div>
            
                  <div class="item">
                    <img src="/resources/mainImage/upload/m-main2.jpg" alt="Chicago" style="width:100%; height:700px;">
                  </div>
                
                  <div class="item">
                    <img src="/resources/mainImage/upload/m-main3.jpg" alt="New york" style="width:100%; height:700px;">
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

        <div id="section2" class="container-fluid">
          <!-- Swiper -->
          <div class="swiper mySwiper" >
            <div class="swiper-wrapper">
              <div class="swiper-slide"><img src="/resources/mainImage/upload/m-show2.jpg">
              <div class="cover">
                <div class="cover-content">
                    <h5>호두까기 인형</h5>
                    <hr>
                    <p>크리스마스 이브 , 마리의 집에서 크리스마스 파티가 열리고 마리의 대부
                        드로셀마이어가 마리에게 호두까기 인형을 선물합니다. 
                        호두까지 인형을 품에 안고 잠이 든 마리,
                        꿈속에서 거실의 트리가 켜지고,  각나라의 ...
                    </p>
                    <button class="reserve-button">예매</button>
                </div>
            </div>
          </div>
              <div class="swiper-slide"><img src="/resources/mainImage/upload/m-show2.gif">
              <div class="cover">
                <div class="cover-content">
                    <h5>프랑켄슈타인</h5>
                    <hr>
                    <p>크리스마스 이브 , 마리의 집에서 크리스마스 파티가 열리고 마리의 대부
                        드로셀마이어가 마리에게 호두까기 인형을 선물합니다. 
                        호두까지 인형을 품에 안고 잠이 든 마리,
                        꿈속에서 거실의 트리가 켜지고,  각나라의 ...
                    </p>
                    <button class="reserve-button">예매</button>
                </div>
              </div>
            </div>
              <div class="swiper-slide"><img src="/resources/mainImage/upload/m-show3.gif">
                <div class="cover">
                  <div class="cover-content">
                      <h5>라이언킹</h5>
                      <hr>
                      <p>크리스마스 이브 , 마리의 집에서 크리스마스 파티가 열리고 마리의 대부
                          드로셀마이어가 마리에게 호두까기 인형을 선물합니다. 
                          호두까지 인형을 품에 안고 잠이 든 마리,
                          꿈속에서 거실의 트리가 켜지고,  각나라의 ...
                      </p>
                      <button class="reserve-button">예매</button>
                  </div>
                </div>
              </div>
              <div class="swiper-slide"><img src="/resources/mainImage/upload/m-show4.JPG"></div>
              <div class="swiper-slide"><img src="/resources/mainImage/upload/m-show5.gif"></div>
              <div class="swiper-slide"><img src="/resources/mainImage/upload/show6.jpg"></div>
              <div class="swiper-slide"><img src="/resources/mainImage/upload/m-show7.gif"></div>
              <div class="swiper-slide"><img src="/resources/mainImage/upload/m-show5.gif">
                <div class="cover">
                  <div class="cover-content">
                      <h5>지킬앤하이드</h5>
                      <hr>
                      <p>크리스마스 이브 , 마리의 집에서 크리스마스 파티가 열리고 마리의 대부
                          드로셀마이어가 마리에게 호두까기 인형을 선물합니다. 
                          호두까지 인형을 품에 안고 잠이 든 마리,
                          꿈속에서 거실의 트리가 켜지고,  각나라의 ...
                      </p>
                      <button class="reserve-button">예매</button>
                  </div>
                </div>
              </div>
              <div class="swiper-slide"><img src="/resources/mainImage/upload/droopy.gif">
                <div class="cover">
                  <div class="cover-content">
                      <h5>드루피와함께 춤을</h5>
                      <hr>
                      <p>크리스마스 이브 , 마리의 집에서 크리스마스 파티가 열리고 마리의 대부
                          드로셀마이어가 마리에게 호두까기 인형을 선물합니다. 
                          호두까지 인형을 품에 안고 잠이 든 마리,
                          꿈속에서 거실의 트리가 켜지고,  각나라의 ...
                      </p>
                      <button class="reserve-button">예매</button>
                  </div>
                </div>
              </div>
            </div>
            <div class="swiper-button-next"></div>
            <div class="swiper-button-prev"></div>
            <div class="swiper-pagination"></div>
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
        </div>
      <!--   <div id="section3" class="container-fluid">
          <div class="slide-right up-on-scroll">
                <div class="slide-right up-on-scroll">
                  <div class="banner" style="border: 1px solid #000;"></div>
                </div>
                <div class="slide-right up-on-scroll">
                  <div class="main-content">
                  <div class="m-menu"><img src="/resources/mainImage/upload/m-gifimage.gif"></div>
                  <div class="m-menu"><img src="/resources/mainImage/upload/m-sub1.JPG"></div>
                  <div class="m-menu">
                    <div class="m-sub"><img src="/resources/mainImage/upload/m-sub2.JPG"></div>
                    <div class="m-sub"><img src="/resources/mainImage/upload/m-sub2.JPG"></div>
                  </div>
                  </div>
                </div>
          </div> -->
        </div> 
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>

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
</html>