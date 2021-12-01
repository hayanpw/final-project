<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공연 등록</title>
<link href="resources/showCss/show_default.css" rel="stylesheet">
<link href="resources/showCss/show_insert.css" rel="stylesheet">
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<div class="container">
        <h1>공연 등록</h1>
        <form action="/insertShow.do" method="post" enctype="multipart/form-data">
            <table>
                <tr>
                    <th>공연 이름</th>
                    <td colspan="3">
                        <input type="text" class="form-control" name="showName">
                    </td>
                </tr>
                <tr>
                    <th>공연 장소</th>
                    <td colspan="3">
                        <input type="text" class="form-control" name="showHall">
                    </td>
                </tr>
                <tr>
                    <th>공연 시작일</th>
                    <td>
                        <input type="text" class="form-control" id="datepicker" name="showStart">
                    </td>
                    <th>공연 종료일</th>
                    <td>
                        <input type="text" class="form-control" id="datepicker2" name="showEnd">
                    </td>
                </tr>
                <tr>
                    <th>공연 포스터</th>
                    <td>
                        <input type="file" name="upfile" accept=".jpg,.jpeg,.png,.gif">
                    </td>
                </tr>
                <tr>
                    <th>공연 시간</th>
                    <td><input type="text" class="form-control" name="showTime" placeholder="ex) 170분(인터미션 20분)"></td>
                    <th>관람가능 연령</th>
                    <td>
                        <select name="showAge" class="form-control">
                            <option value="0">전체관람가</option>
                            <option value="7">7세 이상</option>
                            <option value="12">12세 이상</option>
                            <option value="15">15세 이상</option>
                            <option value="19">19세 이상</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th>좌석가격</th>
                    <td colspan="3">
                        <input type="text" class="form-control" name="showPrice" placeholder="숫자만 입력">
                    </td>
                </tr>
                <tr>
                    <th>공연 정보</th>
                    <td colspan="3">
                    	<textarea id="summernote" class="form-control" name="showContent"></textarea>
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        <input type="submit" class="btn btn-default" value="등록">
                    </td>
                </tr>
            </table>
        </form>

    <script>
    $('#summernote').summernote({
		  height: 300,                 // set editor height
		  minHeight: null,             // set minimum height of editor
		  maxHeight: null,             // set maximum height of editor
		  focus: true                  // set focus to editable area after initializing summernote
		});
    $(document).ready(function() {
    	  $('#summernote').summernote();
    	});
        $(function() {
        	
            var date = new Date();
            $( "#datepicker" ).datepicker({
                dateFormat: "yy-mm-dd",
                monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월','9월', '10월', '11월', '12월' ],
                monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월','9월', '10월', '11월', '12월' ],
                dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
                dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
                dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
                yearSuffix : '년',
                minDate: date
            });
            $( "#datepicker2" ).datepicker({
                dateFormat: "yy-mm-dd",
                monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월','9월', '10월', '11월', '12월' ],
                monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월','9월', '10월', '11월', '12월' ],
                dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
                dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
                dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
                yearSuffix : '년',
                minDate: date
            });
        });
    </script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>