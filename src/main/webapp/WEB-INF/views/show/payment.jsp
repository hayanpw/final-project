<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.container{
    text-align: center;
}
.imgBox{
    display: flex;
    justify-content: center;
    align-items: center;
    margin: 20px 0;
}
.imgBox>img{
    width: 300px;
    height: 400px;
}
h1{
    margin: 10px 0;
}
#payment{
	margin-bottom: 10px;
	width: 150px;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<div class="container">
		 <div class="imgBox">
			<img src="${show.filepath}">
        </div>
        <h1>${show.showName }</h1>
        <h1>공연일 : ${seat.showDate }</h1>
        <h2>선택 좌석 : ${seat.seatList.size() }석</h2>
        <h1>결제 금액 : ${seat.seatList.size()*seat.seatPrice} 원</h1>
        <button id="payment" class="btn btn-danger btn-lg">결제</button><br>
        <a href="/cancelPayment.do?reservNo=${seat.reservNo }" class="btn btn-default">예매 취소</a>
	</div>
	<script>
		$("#payment").click(function() {
			var price = ${seat.seatList.size()*seat.seatPrice};
			var showName = "${show.showName}";
			var d = new Date();
			var date = d.getFullYear()+""+(d.getMonth()+1)+""+d.getDate()+""+d.getHours()+""+d.getMinutes()+""+d.getSeconds();
			IMP.init("imp76831421");	//결제 API 사용을 위해 가맹점 식별코드 입력
			IMP.request_pay({
				merchant_uid : showName+"_"+date,	//거래 아이디
				name : "공연 예매",				//결제 이름 설정
				amount : price,	//결제 금액
				buyer_email : "pache31@naver.com",	//구매자 이메일
				buyer_name : "최승준",						//구매자 이름
				buyer_phone : "010-0001-1000",				//구매자 전화번호
				buyer_addr : "서울시 영등포구 양평동",				//구매자 주소
				buyer_postcode : "76621" 					//구매자 우편번호
			}, function(rsp) {
				if(rsp.success){
					//성공시 로직 구현(ex. DB결제정보 insert -> 사용자 화면 처리)
					alert("결제 성공");
					console.log("카드 승인번호 : "+rsp.apply_num);
					location.href="/paymentSuccess.do";
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