<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title> 
<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<style type="text/css">
	#title{
	padding-top:30px;
	padding-left:30px;
	font-weight:700;
	font-size: 40px;
	padding-bottom: 30px;
	}
	#boardContent{
	border: 1px white;
	}
	table input{
	border: none;
	}
	#text{
	border: none;
	box-shadow: none;
	}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
 	 <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
 	 <script src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>
	<div class="container">
	<c:choose>
		<c:when test="${boardType eq 1 }">
		<p id="title">공지사항</p>
		</c:when>
		<c:when test="${boardType eq 2 }">
		<p id="title">질문과 답변</p>
		</c:when>
		<c:otherwise>
		<p id="title">소통게시판</p>
		</c:otherwise>
	</c:choose>
	<form action="/boardWrite.do" method="post" enctype="multipart/form-data">
				<table class="table" style="width:100%;">
					<tr>
						<td>제목</td>
						<td colspan="3">
							<input type="text" id="text" name="boardTitle" class="form-control">
							<input type="hidden" name="boardType" value="${boardType }">
						</td>
					</tr>
					<tr>
						<td>작성자</td>
						<td><input type="text" name="boardWriter" value="hy01" readonly></td>
						<td>첨부파일</td>
						<td style="text-align:left;">
							<input type="file" name="files" multiple>
						</td>
					</tr>
					<tr>
						<th>내용</th>
						<td id="img" colspan="3">
							<img id="img-view" width="500px">
							<textarea id="summernote" name="boardContent" class="form-control"></textarea>
						</td>
					</tr>
					<tr>
						<th colspan="4">
							<button type="submit" class="btn btn-block">글등록</button>
						</th>
					</tr>
				</table>
		</form>
	</div>
	<script type="text/javascript">
	/* function loadImg(obj){
		var files = obj.files; //input type=file 에서 선택한 파일을 배열로 가져옴 files속성은 무조건 배열
		console.log(files);
		if(files.length != 0){ //첨부파일 있는경우
			for(i=0;i<files.length;i++){
			var reader =new FileReader();//파일에 대한 정보를 읽어오는 객체
			reader.readAsDataURL(files[i]); //파일 경로를 읽어옴
			//경로를 다 읽어오면 실행할 함수 설정
			reader.onload = function(e) {
				var img = $('<img>', { 
                    'src' : e.target.result,
                     'width' : '500px'}); 			
				$("#img").prepend(img);
				$("#img").prepend('<br>');
			}
			}
		}else{  //첨부파일 없는경우
			$("#img-view").attr("src","");
		}
	} */

	$(function() {
		$("#summernote").summernote({
			height:400,
			lang : "ko-KR",
			callbacks:{
				onImageUpload : function(files) {
					 for (i=0;i<files.length;i++) {
				            uploadSummernoteImageFile(files[i],
				            this);
					 }
				}
			}
		});
	});
	function uploadSummernoteImageFile(file, editor) {
		var form = new FormData();
		form.append("file", file);
		$.ajax({
			url : "/uploadSummernoteImageFile.do",
			type : "post",
			data : form,
			processData : false,
			contentType : false,
			success : function(data){
				//결과로 받은 업로드 경로를 이용해서 에디터에 이미지 추가
				$(editor).summernote("insertImage",data);
			}
		});
	}
	
	</script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>