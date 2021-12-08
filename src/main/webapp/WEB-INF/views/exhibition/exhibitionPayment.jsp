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
        <h2>전시 결제</h2>
        <div class="row" style="width: 600px ;margin: 0 auto;">
            <div style="width: 600px;  ">
                <div class="thumbnail">
                	<img src=${exbp.exhibitionPhoto } style="width:100%">
                </div>
            </div>
            <table class="table table-bordered" style="width: 600px; text-align: center;">
                <tbody>
                    <tr>
                        <td>${exbp.exhibitionTitle }</td>
                    </tr>
                    <tr>
                        <td>예약 날짜</td>
                    </tr>
                    <tr>
                        <td>${exbp.paymentPrice }/${exbp.paymentQuantity }</td>
                    </tr>
                </tbody>
            </table>
            <span>결제금액 크~~~~~게</span>
            <button type="button" class="btn" style="float: right;">결제하기</button>
        </div>
    </div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>