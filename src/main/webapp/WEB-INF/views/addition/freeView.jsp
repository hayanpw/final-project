<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#title{
	padding-top:30px;
	padding-left:30px;
	font-weight:700;
	font-size: 40px;
	padding-bottom: 30px;
	}
	#table{
	margin-left: 50px;
	margin-right: 50px;
	text-align: left;
	}
	#table>a:first-child {
	float: left;
	}
	#table>a:nth-child(2) {
	float: left;
	}
	#table>a:nth-child(3) {
	float: left;
	}
	.inputCommentBox ul{
	list-style-type: none;
	padding : 0;
	display: flex;
	}
	.inputCommentBox textarea[name=commentContent]{
		height:100%;
		resize: none;
	}
	.inputCommentBox ul>li:first-child,.inputCommentBox ul>li:last-child {
		width:15%;
		text-align: center;
		display: flex;	
		justify-content: center;
		align-items: center;
	}
	.inputCommentBox ul>li:nth-child(2) {
		width:70%;
	}
	.comments,.recomments{
		list-style-type: none;
		padding : 0;
		display: flex;
		background-color: #f2f2f2;
	}
	.comments>li>p,.recomments>li>p{
		margin: 0;
	}
	.comments>li:first-child{
		display: flex;
		flex-flow:column;
		justify-content: flex-start;
		align-items: center;
		width:15%;
		padding : 5px 0px 5px 0px;
	}
	
	.comments>li:last-child{
		padding : 5px 0px 5px 0px;
		width : 85%;
		display:flex;
		flex-flow:column;
		justify-content: space-between;	
		
	}
	.commentsBtn{	
		text-align: right;	
	}
	.recoment{
		display: none;	
		justify-content: space-around;
	}
	.recoment>textarea{
		width: 85%;
		resize: none;
	}
	textarea.form-control{
		height:100%;
		resize:none;
	}
	.recoment>div{
		width:10%;
	}
	.recomments>li:first-child{
		display: flex;	
		justify-content: center;
		align-items: center;
		width:15%;
		padding : 5px 0px 5px 0px;
	}
	.recomments>li:nth-child(2){
		display: flex;
		flex-flow:column;	
		justify-content: center;
		align-items: center;
		width:10%;
		padding : 5px 0px 5px 0px;
	}
	.recomments>li:last-child{
		padding : 5px 0px 5px 0px;
		width : 75%;
		display:flex;
		flex-flow:column;
		justify-content: space-between;	
	}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="container" id="container">
		<p id="title">소통게시판</p>
		<div id="table">
			<a class="btn" href="#">목록</a>
			<a class="btn" href="#">이전글</a>
			<a class="btn" href="#">다음글</a>
			<table class="table">
				<tr>
					<td colspan="7">${b.boardTitle }(제목자리)</td>
				</tr>
				<tr>
					<td>${b.boardWriter }</td>
					<td>조회수</td>
					<td>${b.readCount }</td>
					<td>작성일</td>
					<td>${b.regDate }</td>
					<td>댓글수</td>
					<td>1</td>
				</tr>
				<tr>
					<td>첨부파일</td>
					<td colspan="6">
						<c:forEach items="${b.list }" var="f">
							<a href="/boardFileDownload?fileNo=${f.fileNo }">${f.filename }</a><br>
						</c:forEach>
					</td>
				</tr>
				<tr>
					<td colspan="7">${b.boardContent }(내용자리)</td>
				</tr>
			</table>
			
			<!-- 댓글쓰기창 로그인 되있을때 -->
			<div class="inputCommentBox">
				<form action="/insertComment" method="post">
					<ul>
						<li>
							<i class="far fa-user fa-5x"></i>
						</li>
						<li>
							<input type="hidden" name="bcLevel" value="1">
							<input type="hidden" name="bcWriter" value="hy01">
							<input type="hidden" name="boardRef" value="${b.boardNo }">
							<input type="hidden" name="bcRef" value="0">
							<input type="hidden" name="bcidRef" value="">
							<textarea name="bcContent" class="form-control"></textarea>
						</li>
						<li>
							<button type="submit" class="btn btn-primary btn-lg btn-block">등록</button>
						</li>
					</ul>
				</form>
			</div>
			<!-- 댓글출력 -->
			<div class="commentBox">
				<c:forEach items="${list }" var="bc">
					<!-- ncLevel ==1 일반댓글인 경우 -->
					<c:if test="${bc.bcLevel eq 1 }">
						<ul class="comments">
							<li>
								<p>${bc.bcWriter }</p>
								<p>${bc.regDate }</p>
							</li>
							<li>
								<p>${bc.bcContentBr }</p>
								<textarea name="bcContent" class="form-control" style="display:none;">${bc.bcContentBr }</textarea><!-- 수정시보임 -->
								<p class="commentsBtn">
									<a href="javascript:void(0)"  onclick="modifyComment(this,'${bc.bcNo }','${b.boardNo }');">수정</a>
									<a href="javascript:void(0)" onclick="deleteComment(this,'${bc.bcNo }','${b.boardNo }');">삭제</a>
									<a href="javascript:void(0)" class="recShow">답글달기</a>
								</p>
								<form action="/insertComment" class="recoment"> <!-- recoment 클래스가 안보이게 하는 속성 -->
									<input type="hidden" name="bcLevel" value="2">
									<input type="hidden" name="bcWriter" value="hy01">
									<input type="hidden" name="boardRef" value="${b.boardNo }">
									<input type="hidden" name="bcRef" value="${bc.bcNo }">
									<input type="hidden" name="bcidRef" value="hy01">
									<textarea name="ncContent" class="form-control"></textarea> 
									<div>
										<button type="submit" class="btn btn-outline-primary">등록</button>
										<button type="reset" class="btn btn-outline-primary recCancel">취소</button>
									</div>
								</form>
							</li>
						</ul>
						<!-- 대댓글 시작 -->
						<c:forEach items="${list }" var="bcc">
							<c:if test="${bcc.bcLevel eq 2 && bc.bcNo eq bcc.bcRef }">
								<ul class="recomments">
									<li>
										<i class="fas fa-angle-double-right fa-3x"></i><!-- 화살표 -->
									</li>
									<li>
										<i class="far fa-user fa-3x"></i> <!-- 인간모양 -->
										<p>${bcc.bcWriter }</p>
										<p>${bcc.regDate }</p>
									</li>
									<li>
										<p>${bcc.bcContentBr }</p>
										<textarea name="ncContent" class="form-control" style="display:none;">${bcc.bcContentBr }</textarea>
										<p class="commentsBtn">
												<a href="javascript:void(0)" onclick="modifyComment(this,'${bcc.bcNo }','${b.boardNo }');">수정</a>
												<a href="javascript:void(0)" onclick="deleteComment(this,'${bcc.bcNo }','${b.boardNo }');">삭제</a>
										</p>
									</li>
								</ul>
							<%-- <%} %> --%>
							</c:if>
						<%-- <%}//대댓글 반복문 끝 %> --%>
						</c:forEach>
					<%-- <%} //일반댓글 if문%> --%>
					</c:if>
				<%-- <%}//일반 댓글 반복문 %> --%>
				</c:forEach>
			</div>
			
			
			
			
			<a class="btn" href="/boardDelete.do?boardNo=${b.boardNo }">글삭제</a>
			<a class="btn" href="/boardUpdate.do?boardNo=${b.boardNo }">글수정</a>
			<a class="btn" href="/additionFree.do?boardType=3&reqPage=1">목록</a>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>