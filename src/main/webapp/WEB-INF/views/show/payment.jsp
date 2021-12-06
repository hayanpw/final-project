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
        <a href="/cancelPayment.do?reservNo=${seat.reservNo }" class="btn btn-default" id="cancelPay">예매 취소</a>
	</div>
	<script>
		$("#payment").click(function() {
			var price = ${seat.seatList.size()*seat.seatPrice};
			var d = new Date();
			var date = d.getFullYear()+""+(d.getMonth()+1)+""+d.getDate()+""+d.getHours()+""+d.getMinutes()+""+d.getSeconds();
			var showName = "${show.showName}";
			IMP.init("imp76831421");	//결제 API 사용을 위해 가맹점 식별코드 입력
			IMP.request_pay({
				merchant_uid : showName+"_"+date,	//거래 아이디
				name : showName,				//결제 이름 설정
				amount : price,	//결제 금액
				buyer_email : "${sessionScope.m.memberEmail}",	//구매자 이메일
				buyer_name : "${sessionScope.m.memberName}",	//구매자 이름
				buyer_phone : "${sessionScope.m.memberPhone}",	//구매자 전화번호
				buyer_addr : "${sessionScope.m.addressRoad}",	//구매자 주소
				buyer_postcode : "${sessionScope.m.postcode}" 	//구매자 우편번호
			}, function(rsp) {
				if(rsp.success){
					//DB결제정보 update
					alert("결제 성공");
					//console.log("카드 승인번호 : "+rsp.apply_num);
					location.href="/paymentSuccess.do?reservNo="+${seat.reservNo};
				}else{
					alert("결제 실패");
					location.href="/cancelPayment.do?reservNo="+${seat.reservNo};
				}
			});
		});
		$(function() {
			$("#payment").click();
		});
	</script>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>