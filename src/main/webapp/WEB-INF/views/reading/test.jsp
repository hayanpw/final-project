<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.3/css/dataTables.bootstrap.min.css">
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.js"></script>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.3/js/dataTables.bootstrap.min.js"></script>
<link href="resources/readingCss/test.css" rel="stylesheet">
</head>
<body>
	<table id="table_id" class="table table-striped table-bordered" style="width:100%">
        <thead>
            <tr>
            	<th>선택</th>
                <th>예약일</th>
                <th>예약일자</th>
                <th>좌석번호</th>
                <th>예약아이디</th>
                <th>예약자</th>
                <th>이용시간</th>
                <th>퇴실유무</th>
            </tr>
        </thead>
        <tbody>
        	<c:forEach	items="${list }" var="re" varStatus="i">
				<tr>
					<td class="chktd"><input type="checkbox" class="chk"></td>
					<td>${re.readingTime }</td>
					<td>${re.readingDay }</td>
					<td>${re.readingNum }</td>
					<td>${re.readingId }</td>
					<td>${re.readingName }</td>
					<td>
						<c:choose>
							<c:when test="${re.readingTy eq 0}">
								종일 09:00 ~ 19:00
							</c:when>
							<c:when test="${re.readingTy eq 1}">
								오전 09:00 ~ 14:00
							</c:when>
							<c:when test="${re.readingTy eq 2}">
								오후 14:00 ~ 19:00
							</c:when>
						</c:choose>
					</td>
					<td>
						<c:choose>
							<c:when test="${re.readingCheckOut eq 0}">
								미퇴실
							</c:when>
							<c:when test="${re.readingCheckOut eq 1}">
								퇴실
							</c:when>
						</c:choose>
					</td>
				</tr>
			</c:forEach>
        </tbody>
        <tfoot>
        	<tr>
        		<th colspan="8">
        			<button style="float:right; margin-right:10px">강제퇴실</button>
        			<button style="float:right; margin-right:10px">조기퇴실</button>
        		</th>
        	</tr>
        	
        </tfoot>
	</table>
	<script>
	    $(document).ready(function() {
	        $("#table_id").DataTable({
	        	 order: [[ 1, "asc" ]],
	        	 "language": {
		        		"decimal" : "",
		                "emptyTable" : "데이터가 없습니다.",
		                "info" : "총 _TOTAL_명   _START_에서 _END_까지 표시",
		                "infoEmpty" : "0명",
		                "infoFiltered" : "(전체 _MAX_ 명 중 검색결과)",
		                "infoPostFix" : "",
		                "thousands" : ",",
		                "lengthMenu" : "_MENU_ 개씩 보기",
		                "loadingRecords" : "로딩중...",
		                "processing" : "처리중...",
		                "search" : "검색 : ",
		                "zeroRecords" : "검색된 데이터가 없습니다.",
		                "paginate" : {
		                    "first" : "첫 페이지",
		                    "last" : "마지막 페이지",
		                    "next" : "다음",
		                    "previous" : "이전"
		                },
		                "aria" : {
		                    "sortAscending" : " :  오름차순 정렬",
		                    "sortDescending" : " :  내림차순 정렬"
		                }
		            }
	        });
	    } );
	</script>
</body>
</html>