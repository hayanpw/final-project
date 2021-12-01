<%@page import="show.vo.ShowReview"%>
<%@page import="java.util.ArrayList"%>
<%@page import="show.vo.ShowAndReview"%>
<%@page import="show.vo.Show"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%
    	ShowAndReview snr = (ShowAndReview)request.getAttribute("snr");
    	ArrayList<ShowReview> srList = snr.getList();
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${snr.s.showName }</title>
<link href="resources/showCss/show_default.css" rel="stylesheet">
<link href="resources/showCss/show_view.css" rel="stylesheet">
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/jquery-ui/jquery-ui-big.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<script type="text/javascript" src="/resources/jquery-ui/jquery-ui.min.js"></script>
    <div class="container">
        <div class="summary">
            <div class="summaryTop">
                <h1>${snr.s.showName }</h1>
                <%for(int i=0; i<Math.round(snr.getS().getShowStar()); i++){ %>
                <span><img src="resources/showImage/star-on.png"></span>
                <%} %>
                <%for(int i=0; i<5-Math.round(snr.getS().getShowStar()); i++){ %>
                <span><img src="resources/showImage/star-off.png"></span>
                <%} %>
                <span id="reviewAvg">${snr.s.showStar }</span>
            </div>
            <div class="summaryBottom">
                <div class="poster">
                    <img src="${snr.s.filepath}" class="poster">
                </div>
                <div class="info">
                    <table>
                        <tr>
                            <td>장소</td>
                            <td>${snr.s.showHall }</td>
                        </tr>
                        <tr>
                            <td>공연기간</td>
                            <td>${snr.s.showStart } ~ ${snr.s.showEnd }</td>
                        </tr>
                        <tr>
                            <td>공연시간</td>
                            <td>${snr.s.showTime }</td>
                        </tr>
                        <tr>
                            <td>관람연령</td>
                            <c:choose>
                            	<c:when test="${snr.s.showAge > 0 }">
                            		<td>${snr.s.showAge }세 이상 관람가</td>
                            	</c:when>
                            	<c:otherwise>
                            		<td>전체 관람가</td>
                            	</c:otherwise>
                            </c:choose>
                        </tr>
                        <tr>
                            <td>가격</td>
                            <td>${snr.s.showPrice } 원</td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
        <div class="controllBox">
        	<c:if test="${sessionScope.m.memberLevel == 0 }">
	            <a href="/updateShowFrm.do?showNo=${snr.s.showNo}" class="btn btn-primary">수정</a>
	            <a href="javascript:void(0)" onclick="deleteShow('${snr.s.showNo}')" class="btn btn-primary">삭제</a>
        	</c:if>
        </div>
        <div class="infoWrapper">
            <div class="showInfo">
                <div class="showNavi">
                    <div><h2>공연정보</h2></div>
                    <div><h2>부가정보</h2></div>
                    <div><h2>관람평</h2></div>
                </div>
                <div class="showContent hideContent">
					${snr.s.showContent }
                </div>
                <div class="sideInfo hideContent">
                   	 부가정보정보임
                </div>
                <div class="reviewBox hideContent">
                
			        <c:if test="${sessionScope.m != null }">
			        	<div class="inputReviewBox">
							<form action="/insertReview.do" method="post">
								<input type="hidden" name="reviewWriter" value="${sessionScope.m.memberId }">
								<input type="hidden" name="showNo" value="${snr.s.showNo }">
								<div class="selectStar">
									<p>평점선택</p>
									<select name="star">
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
									</select>
								</div>
								<textarea name="reviewContent" class="form-control" style="width: 90%;resize: none;"></textarea>
								<button type="submit" class="btn btn-defualt">등록</button>
							</form>
						</div>
			        </c:if>
					
					<div class="reviewList">
						<c:forEach items="${snr.list }" var="sr" varStatus="i">
							<ul class="reviews">
								<li>
									<p>${sr.reviewWriter }</p>
									<p>${sr.reviewDate }</p>
								</li>
								<li>
									<p>${sr.reviewContentBr }</p>
									<textarea name="reviewContent" class="form-control updateContent" style="display: none;">${sr.reviewContent }</textarea>
									<div style="display: none;" class="updateStar">
										<p>평점선택</p>
										<select name="star">
											<option value="1">1</option>
											<option value="2">2</option>
											<option value="3">3</option>
											<option value="4">4</option>
											<option value="5">5</option>
										</select>
									</div>
									<div class="starBox">
										<c:forEach begin="1" end="${sr.star }" >
											<span><img src="resources/showImage/star-on.png" style="height: 10px;"></span>											
										</c:forEach>									
									</div>
									<p class="reviewsBtn">
										<c:if test="${sessionScope.m != null }">
											<c:choose>
												<c:when test="${sessionScope.m.memberId == sr.reviewWriter}">
													<a href="javascript:void(0)" onclick="modifyReview(this,'${sr.reviewNo }','${snr.s.showNo }');">수정</a>
													<a href="javascript:void(0)" onclick="deleteReview(this,'${sr.reviewNo }','${snr.s.showNo }');">삭제</a>
												</c:when>
												<c:when test="${sessionScope.m.memberLevel == 0 }">
													<a href="javascript:void(0)" onclick="deleteReview(this,'${sr.reviewNo }','${snr.s.showNo }');">삭제</a>
												</c:when>
											</c:choose>
										</c:if>
									</p>
								</li>
							</ul>
						</c:forEach>
					</div>
					
                </div>
            </div>
            <div class="reserv">
                <div id="datepicker"></div>
                <form action="/selectSeat.do" method="post">
	                <input type="hidden" name="reservDate">
	                <input type="hidden" name="showNo" value="${snr.s.showNo }">
	                <input type="hidden" name="memberNo" value="${sessionScope.m.memberNo }">
	                <h3>티켓 정보</h3>
	                <div class="ticketPrice">
	                	<c:choose>
	                		<c:when test="${snr.s.showSeat == 0 }">
	                			<h4>전좌석 ${snr.s.showPrice } 원</h4>
	                		</c:when>
	                		<c:otherwise>
	                			<!-- 수정 필요 -->
	                			<h4>전좌석 ${snr.s.showPrice } 원</h4>
	                		</c:otherwise>
	                	</c:choose>
	                </div>
	                <input type="submit" class="btn btn-danger btn-lg reservBtn" value="예매하기">
                </form>
            </div>
        </div>
    </div>
    <script>
	    $(function() {
	    	var showNo = ${snr.s.showNo};
	    	var memberNo = 1;
	        $(".showNavi>div").click(function() {
	            $(".showNavi>div").removeClass("selec");
	            $(this).addClass("selec");
	            $(".showNavi").nextAll().addClass("hideContent");
	            if($(this).index() == 0){
	                $(".showContent").removeClass("hideContent");
	            }else if($(this).index() == 1){
	                $(".sideInfo").removeClass("hideContent");
	            }else if($(this).index() == 2){
	                $(".reviewBox").removeClass("hideContent");
	            }
	        });
	        $(".showNavi>div").first().click();
	        
	        var today = new Date();
	        var endDate = "${snr.s.showEnd}";
	        $("#datepicker").datepicker({
	            dateFormat: "yy-mm-dd",
	            monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월','9월', '10월', '11월', '12월' ],
	            monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월','9월', '10월', '11월', '12월' ],
	            dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
	            dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
	            dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
	            yearSuffix : '년',
	            minDate: today,
	            maxDate: endDate
	        });
	
	        $("#datepicker").change(function() {
				selectDate = $(this).val();
				$(".slide").fadeOut();
				$("input[name=reservDate]").val(selectDate);
	        });
	    });
	    
	    function deleteShow(showNo) {
	    	if(confirm("공연을 삭제하시겠습니까?")){
				location.href="/deleteShow.do?showNo="+showNo;
			}
		}
	    
	    function modifyReview(obj,reviewNo,showNo) {
			//textarea를 화면에 표현
			$(obj).parents("li").children().filter(".updateContent").show();
			$(obj).parents("li").children().filter(".updateStar").show();
			//기존 본문 내용을 숨김
			$(obj).parents("li").children().first().hide();
			$(obj).parents("li").children().filter(".starBox").hide();
			//수정 -> 수정완료
			$(obj).html('수정완료');
			$(obj).attr("onclick", "modifyComplete(this, '"+reviewNo+"', '"+showNo+"');");
			//삭제 -> 취소
			$(obj).next().html('취소');
			$(obj).next().attr("onclick", "modifyCancel(this, '"+reviewNo+"', '"+showNo+"');");
			//답글달기 버튼 숨기기
			$(obj).next().next().hide();
		}
		function modifyCancel(obj,reviewNo,showNo) {
			//textarea 숨김
			$(obj).parents("li").children().first().show();
			$(obj).parents("li").children().filter(".starBox").show();
			//기존 본문내용을 화면에 다시 표현
			$(obj).parents("li").children().filter(".updateContent").hide();
			$(obj).parents("li").children().filter(".updateStar").hide();
			//수정완료 -> 수정
			$(obj).prev().html('수정');
			$(obj).prev().attr("onclick", "modifyReview(this, '"+reviewNo+"', '"+showNo+"');");
			//취소 -> 삭제
			$(obj).html('삭제');
			$(obj).attr("onclick", "deleteReview(this, '"+reviewNo+"', '"+showNo+"');");
			//답글달기 버튼 보이기
			$(obj).next().show();
		}
		function modifyComplete(obj,reviewNo,showNo){
			var form = $("<form action='/updateReview.do' method='post'></form>");
			//form안에 수정댓글 번호 설정
			form.append($("<input type='text' name='reviewNo' value='"+reviewNo+"'>"));
			//form에 공지사항 번호 설정
			form.append($("<input type='text' name='showNo' value='"+showNo+"'>"));
			//수정한 댓글 내용을 설정
			form.append($(obj).parents("li").children().filter(".updateContent"));
			form.append($(obj).parents("li").children().filter(".updateStar"));
			//전송할 form태그를 현재 페이지에 추가
			$("body").append(form);
			//form태그 전송
			form.submit();
			
		}
		function deleteReview(obj,reviewNo,showNo){
			if(confirm("관람평을 삭제하시겠습니까?")){
				location.href="/deleteReview.do?reviewNo="+reviewNo+"&showNo="+showNo;
			}
		}
    </script>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>