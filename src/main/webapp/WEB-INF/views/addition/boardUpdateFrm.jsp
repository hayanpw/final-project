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
<<link rel="stylesheet" href="/resources/additionCss/boardUpdateFrm.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
 	 <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
 	 <script src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>
	<div class="container">
	<c:choose>
		<c:when test="${boardType eq 1 }">
		<div id="title">공지사항</div>
		</c:when>
		<c:when test="${boardType eq 2 }">
		<div id="qnaTitle">질문과 답변</div>
		</c:when>
		<c:when test="${boardType eq 5 }">
		<div id="event">이벤트</div>
		</c:when>
		<c:otherwise>
		<div id="freeTitle">소통게시판</div>
		</c:otherwise>
	</c:choose>
	<form action="/boardUpdate.do" method="post" enctype="multipart/form-data">
				<input type="hidden" name="boardType" value="${boardType }">
				<table class="table" style="width:100%;">
					<tr>
						<td>제목</td>
						<td colspan="3">
							<input type="text" id="text" name="boardTitle" class="form-control" value="${b.boardTitle }">
						</td>
					</tr>
					<tr>
						<td>작성자</td>
						<td><input type="text" id="boardWriter" name="boardWriter" value="${sessionScope.m.memberId }" readonly></td>
				   		
				   		<td>첨부파일</td>
						<td style="text-align:left;">
						<input type="hidden" name="boardNo" value="${b.boardNo }">
						<input type="hidden" name="status" value="1">
							<c:choose>
							<c:when test="${not empty b.filename }">
								<span class="delFile">${b.filename }</span>
								<button type="button" id="delBtn" class="btn btn-primary btn-sm delFile">
								삭제
								</button>
								<input type="file" id="addFile" name="addFile" style="display:none;">
								<input type="hidden" class="oldFilename" name="oldFilename" value="${b.filename }">
								<input type="hidden" class="oldFilepath" name="oldFilepath" value="${b.filepath }">
							</c:when>
							<c:otherwise>
							<input type="file" name="addFile">
							</c:otherwise>
							</c:choose>
						</td> 
					</tr>
					<tr>
						<td>내용</td>
						<td id="img" colspan="3">
							<img id="img-view" width="500px">
							<textarea id="summernote" name="boardContent" class="form-control">${b.boardContent }</textarea>
						</td>
					</tr>
					<tr>
						<td colspan="4">
							<button type="submit" class="btn btn-block" onclick="return contentChk();">글수정</button>
						</td>
					</tr>
				</table>
		</form>
	</div>
	<script type="text/javascript">
	$(document).on("click",".delFile",function(){
		$(".delFile").hide();
		$(this).next().show();
		$("[name=status]").val(2);
    });
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
	
	function contentChk(){
		var text = $("#text").val();
		var login = $("#boardWriter").val();
		if(login== ""){
			alert("로그인이 필요합니다.");
			return false;
		}
		if(text == "" ){
			alert("제목을 입력하세요.");
			return false;
		}
		if ($('#summernote').summernote('isEmpty')) {
			  alert('글내용을 입력하세요');
			  return false;
			}
	}
	</script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>