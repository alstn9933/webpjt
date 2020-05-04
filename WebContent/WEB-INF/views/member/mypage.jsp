<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<style>
		#mypage{
			width:600px;
			margin: 0 auto;
		}
		#mypage>table th{
			vertical-align:middle;
		}
		#btn-box{
			text-align:center;
		}
	</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<section class="container">
		<form action="/updateMember" method="post" id="mypage">
			<h1>회원정보</h1>
			<table class="table">
				<tr>
					<td><label for="memberId">아이디</label></td>
					<td>
						<input type="text" name="memberId" id="memberId" class="form-control" value="${m.memberId }" readonly>
					</td>
				</tr>
				<tr>
					<td><label for="memberPw">비밀번호</label></td>
					<td>
						<input type="password" name="memberPw" id="memberPw" class="form-control" value="${m.memberPw }">
					</td>
				</tr>
				<tr>
					<td><label for="memberName">이름</label></td>
					<td>
						<input type="text" name="memberName" id="memberName" class="form-control" value="${m.memberName }">
					</td>
				</tr>
				<tr>
					<td><label for="age">나이</label></td>
					<td>
						<input type="text" name="age" id="age" class="form-control" value="${m.age }">
					</td>
				</tr>
				<tr>
					<td><label for="email">이메일</label></td>
					<td>
						<input type="text" name="email" id="email" class="form-control" value="${m.email }">
					</td>
				</tr>
				<tr>
					<td><label for="phone">전화번호</label></td>
					<td>
						<input type="text" name="phone" id="phone" class="form-control" value="${m.phone }">
					</td>
				</tr>
				<tr>
					<td><label for="address">주소</label></td>
					<td>
						<input type="text" name="address" id="address" class="form-control" value="${m.address }">
					</td>
				</tr>
				<tr>
					<td><label for="enrollDate">가입일</label></td>
					<td>
						<input type="text" id="enrollDate" class="form-control" value="${m.enrollDate }" readonly>
					</td>
				</tr>
			</table>
			<div id="btn-box">
			<button class="btn btn-outline-danger btn-lg" id="btn-box" type="submit">수정하기</button>
			<c:if test="${m.memberId eq 'admin' }">
				<button class="btn btn-outline-danger btn-lg" type="button" onclick="location.href='/adminPage'">회원관리</button>
			</c:if>
			<c:if test="${m.memberId ne 'admin' }">
				<button class="btn btn-outline-danger btn-lg" type="button" onclick="deleteMember('${m.memberId}');">회원탈퇴</button>
			</c:if>
			</div>
		</form>
	</section>
	<script>
		function deleteMember(memberId){
			if(confirm("탈퇴하시겠습니까")){
				location.href="/deleteMember?memberId="+memberId;
			}
		}
	</script>
</body>
</html>