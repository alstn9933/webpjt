<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/js/jquery-3.3.1.js"></script>
	<style>
		section.container{
			width:1000px;
			margin: 0 auto;
		}
		.table th, .table td{
			text-align:center;
		}
		#searchBox{
			margin:0 auto;
			width:500px;
			text-align:center;
		}
		select[name=type]{
			display:inline-block;
			width:100px;
			height:30px;
			font-size:0.8em;
		}
		input[name=keyword]{
			display:inline-block;
			width:200px;
			height: 30px;
			font-size: 0.8em;
		}
	</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<section class="container">
		<table class="table table-hover">
			<tr>
				<th>ID</th>
				<th>이름</th>
				<th>나이</th>
				<th>EMAIL</th>
				<th>전화번호</th>
				<th>주소</th>
				<th>가입일</th>
				<th>제거</th>
			</tr>
			<c:forEach items="${list }" var="m">
				<tr>
					<td>${m.memberId }</td>
					<td>${m.memberName }</td>
					<td>${m.age }</td>
					<td>${m.email }</td>
					<td>${m.phone }</td>
					<td>${m.address }</td>
					<td>${m.enrollDate }</td>
					<td>
						<button class="btn btn-outline-info btn-sm" onclick="admindel('${m.memberId}');">제거</button>
					</td>
				</tr>
			</c:forEach>
		</table>
		<div id="searchBox">
			<form action="/searchKeyword">
				<select name="type" class="form-control">
					<c:if test="${type eq 'memberId' }">
						<option value="memberId" selected>아이디</option>
						<option value="memberName">이름</option>
					</c:if>
					<c:if test="${type eq 'memberName' }">
						<option value="memberId">아이디</option>
						<option value="memberName" selected>이름</option>
					</c:if>
					<c:if test="${empty type}">
						<option value="memberId">아이디</option>
						<option value="memberName">이름</option>
					</c:if>
				</select>
				<input type="text" class="form-control" name="keyword" value="${keyword }">
				<button type="submit" class="btn btn-outline-secondary btn-sm">조회</button>
			</form>
		</div>
	</section>
	<script>
		function admindel(memberId){
			if(confirm("이 회원을 탈퇴시키겠습니까?")){
				location.href="/adminDelMember?memberId="+memberId;
			}
		};
		$(function(){
			$("select").change(function(){
				if($("option").eq(0).attr("selected")==true){
					console.log("asd");
				}
			});
		});
	</script>
</body>
</html>