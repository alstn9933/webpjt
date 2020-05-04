<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.table {
	width: 1000px;
	margin: 0 auto;
	text-align: center;
}

.table tr>td:nth-child(1) {
	width: 10%;
}

.table tr>td:nth-child(2) {
	width: 60%;
}

.table tr>td:nth-child(3) {
	width: 20%;
}

.table tr>td:nth-child(4) {
	width: 10%;
}

#pageNavi {
	text-align: center;
	width: 1000px;
	margin: 0 auto;
}

#pageNavi>* {
	margin: 10px;
}

.selectPage {
	font-size: 18px;
	color: blue;
}
table td>a{
	display:inline-block;
	width:660px;
	height:24px;
	line-height:24px;
	color:black;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<section class="container">
		<h1>공지사항</h1>
		<c:if test="${sessionScope.member.memberId eq 'admin' }">
			<div style="text-align: right">
				<a class="btn btn-outline-primary btn-sm" href="/noticeWriteFrm">글쓰기</a>
			</div>
		</c:if>
		<table class="table table-striped">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
			</tr>
			<c:forEach items="${list }" var="n">
				<tr>
					<td>${n.noticeNo }</td>
					<td><a href="/noticeView?noticeNo=${n.noticeNo}">${n.noticeTitle }</a></td>
					<td>${n.noticeWriter }</td>
					<td>${n.noticeDate }</td>
				</tr>
			</c:forEach>
		</table>
		<div id="pageNavi">${pageNavi }</div>
	</section>
</body>
</html>