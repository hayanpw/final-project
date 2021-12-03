<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="container">
		<img src="${show.filepath}" class="poster">
	</div>
	<script>
		$("#payment").click(function() {
			var price = $("#totalPrice").html();
			var d = new Date();
			var date = d.getFullYear()+""+(d.getMonth()+1)+""+d.getDate()+""+d.getHours()+""+d.getMinutes()+""+d.getSeconds();
			IMP.init("imp76831421");	//결제 API 사용을 위해 가맹점 식별코드 입력
			IMP.request_pay({
				merchant_uid : ${show.showName}+"_"+date,	//거래 아이디
				name : "공연 예매",				//결제 이름 설정
				amount : ${seat.seatList.size()*seat.seatPrice},	//결제 금액
				buyer_email : "2016219073@semyung.ac.kr",	//구매자 이메일
				buyer_name : "나야나",						//구매자 이름
				buyer_phone : "010-0001-1000",				//구매자 전화번호
				buyer_addr : "서울시 영등포구 양평동",				//구매자 주소
				buyer_postcode : "76621" 					//구매자 우편번호
			}, function(rsp) {
				if(rsp.success){
					//성공시 로직 구현(ex. DB결제정보 insert -> 사용자 화면 처리)
					alert("결제 성공");
					console.log("카드 승인번호 : "+rsp.apply_num);
				}else{
					//실패시 로직 구현(ex. 장바구니 저장 -> 사용자 화면 처리)
					alert("결제 실패");
				}
			});
		});
	</script>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>