<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<style>
		.table-wrapper{
			width:1000px;
			margin: 0 auto;
		}
		.table tr>td:first-child{
			width:20%;
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