<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
		<div class="container">
        <h2 style="margin-left: 166px;">전시 결제</h2>
        <div class="row" style="width: 600px; margin: 0 auto;">
            <div style="width: 600px; height: 305px;">
                <div class="thumbnail" style="margin: 0 auto; border-radius: 0px; border-bottom: none;">
                	<img src=${exbp.exhibitionPhoto } style="width:50%; height: 100%;">
                </div>
            </div>
            <table class="table table-bordered" style="width: 600px; text-align: center;">
                    <tr>
                        <td style="padding: none;">${exbp.exhibitionTitle }</td>
                    </tr>
                    <tr>
                        <td>예약 날짜 ${exbp.bookDate }</td>
                    </tr>
                    <tr>
                        <td>${exbp.paymentPrice }원/${exbp.paymentQuantity }명</td>
                    </tr>
            </table>
            <span>${exbp.paymentPrice }원</span>
            <button type="button" class="btn" style="float: right;">결제하기</button>
        </div>
    </div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>