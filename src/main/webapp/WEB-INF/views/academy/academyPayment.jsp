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
        <h2>수업 결제</h2>
        <div class="row" style="width: 600px ;margin: 0 auto;">
            <div style="width: 600px;  ">
                <div class="thumbnail">
                <img src="/w3images/nature.jpg" alt="Nature" style="width:100%">
                    <div class="caption">
                        <p>담당 선생님 : 룰루라라</p>
                    </div>
                </div>
            </div>
            <table class="table table-bordered" style="width: 600px; text-align: center;">
                <tbody>
                    <tr>
                        <td>수업이름</td>
                    </tr>
                    <tr>
                        <td>수업 날짜</td>
                    </tr>
                    <tr>
                        <td>결제금액</td>
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