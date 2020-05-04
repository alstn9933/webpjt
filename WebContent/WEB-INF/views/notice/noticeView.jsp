<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<style>
		.table-wrapper,.comment-write,.comment-wrapper{
			width:1000px;
			margin: 0 auto;
		}
		.table-wrapper tr>td:first-child{
			width:20%;
		}
		.commentList{
			width: 100%;
			clear: both;
			border: 1px solid #ccc;
			border-radius: 5px;
			overview:hidden;
		}
		.commentList>li{
			float:left;
			color:black;
		}
	</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<section class="container">
		<div class="table-wrapper">
			<h1>공지사항</h1>
			<table class="table table-bordered">
				<tr>
					<td>제목</td>
					<td>${n.noticeTitle }</td>
				</tr>
				<tr>
					<td>작성자</td>
					<td>${n.noticeWriter }</td>
				</tr>
				<tr>
					<td>첨부파일</td>
					<td>
						<c:if test="${not empty n.filename }">
							<img src="/img/file.png" width="16px">
							<a href="javascript:fileDownload('${n.filename }','${n.filepath }')">${n.filename }</a>
						</c:if>
					</td>
				</tr>
				<tr>
					<td>내용</td>
					<td>${n.contentBr }</td>
				</tr>
				<tr>
					<th colspan="2" style="text-align:center">
						<c:if test="${not empty sessionScope.member && sessionScope.member.memberId=='admin' }">
							<a class="btn btn-outline-primary btn-sm" href="/updateNoticeFrm?noticeNo=${n.noticeNo }">수정하기</a>
							<a class="btn btn-outline-primary btn-sm" href="javascript:void(0);" onclick="deleteNotice(${n.noticeNo});">삭제하기</a>
						</c:if>
						<a href="/noticeList?reqPage=1" class="btn btn-outline-primary btn-sm">목록으로</a>
					</th>
				</tr>
			</table>
		</div>
		<c:if test="${not empty sessionScope.member }">
			<div class="comment-write">
				<form action="/noticeCommentInsert" method="post">
				<input type="hidden" name="noticeCommentWriter" value="${sessionScope.member.memberId }">
				<input type="hidden" name="noticeRef" value="${n.noticeNo }">
				<input type="hidden" name="noticeCommentLevel" value="1">
				<input type="hidden" name="noticeCommentRef" value="0">
					<table class="table">
						<tr>
							<td width="85%">
								<input type="text" class="form-control" name="noticeCommentContent">
							</td>
							<td width="15%">
								<button type="submit" class="btn btn-primary">등록</button>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</c:if>
		<div class="comment-wrapper">
			<c:forEach items="${list }" var="nc">
				<ul class="commentList">
					<li style="width:10%; text-align:center;"><span>${nc.noticeCommentWriter }</span></li>
					<li style="width:60%;"><span>${nc.noticeCommentContent }</span></li>
					<li style="width:10%; text-align:center;"><span>${nc.noticeCommentDate }</span></li>
					<li style="width:20%; text-align:center;">
						<c:if test="${not empty sessionScope.member }">
							<a href="javascript:void(0)" onclick="insertComment(this, '${nc.noticeCommentNo}','${n.noticeNo }','${sessionScope.member.memberId }')">댓글달기</a>
							<c:if test="${sessionScope.member.memberId==nc.noticeCommentWriter }">
								<a href="javascript:void(0)">수정</a>
								<a href="javascript:void(0)">삭제</a>
							</c:if>
						</c:if>
					</li>
				</ul>
			</c:forEach>
		</div>
	</section>
	<script>
		function fileDownload(filename,filepath){
			var newFilename = encodeURIComponent(filename);
			var newFilepath = encodeURIComponent(filepath);
			location.href="/noticeFileDownload?filename="+newFilename+"&filepath="+newFilepath;
		}
		function deleteNotice(noticeNo){
			if(confirm("정말 삭제하시겠습니까?")){
				location.href="/deleteNotice?noticeNo="+noticeNo;
			}
		}
	</script>
</body>
</html>