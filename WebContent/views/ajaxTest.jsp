<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/js/jquery-3.3.1.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<section class="container">
	
		<h3>1. ajax로 서버에 전송값 보내기</h3>
		<p>버튼 클릭시 전송값을 서버에서 출력</p>
		<input type="text" class="form-control" id="msg1">
		<button class="btn btn-primary" onclick="jsFunction();">보내기(js)</button>
		<button class="btn btn-primary" id="jQ1">보내기(jQuery)</button>
		
		<h3>2. 버튼 클릭시 서버에서 보낸값 수신</h3>
		<button class="btn btn-primary" id="jQ2">서버에서 보낸 값 확인하기</button>
		<p id="p2" class="border border-danger"></p>
		
		<h3>3. 서버로 기본형 전송값 보내고, 결과로 분자열 받아서 처리</h3>
		<p>숫자 2개를 전송하고 더한값을 받기</p>
		첫번째 수 : <input type="text" id="num1"><br>
		두번째 수 : <input type="text" id="num2"><br>
		<button class="btn btn-primary" id="jQ3">실행</button>
		<p id="p3" class="border border-danger"></p>
		
		<h3>4. 서버로 객체 타입 전송</h3>
		이름 : <input type="text" id="name"><br>
		나이 : <input type="text" id="age"><br>
		주소 : <input type="text" id="addr"><br>
		<button class="btn btn-primary" id="jQ4">실행</button>
		
		<h3>5. 서버로 기본형 전송값을 보내고 결과로 객체를 받아서 처리</h3>
		<p>JSON 사용</p>
		유저번호 입력 : <input type="text" id="userNum"><br>
		<button class="btn btn-primary" id="jQ5">실행</button>
		<p id="p5" class="border border-danger"></p>
		
		<h3>6. 서버로 기본형 전송값을 보내고, 결과로 리스트 받아서 처리하기</h3>
		<p>JSON 사용</p>
		<p>유저번호를 보내서 해당 유저 정보를 가져오고 ,유저가 없는 경우 전체리스트 가져오기</p>
		유저번호 입력 : <input type="text" id="userNum1"><br>
		<button class="btn btn-primary" id="jQ6">실행</button>
		<p id="p6" class="border border-danger"></p>
		
		<h3>7.여러 전송값을 보내고, 결과로 맵을 받아서 처리</h3>
		<p>JSON 사용</p>
		<p>유저 번호들 정송->해당유저 맵으로 받아서 처리</p>
		유저번호 입력 : <input type="text" id="userNum7"><br>
		<button class="btn btn-primary" id="jQ7">실행</button>
		<p id="p7" class="border border-danger"></p>
		<h3>8. 서버에 값을 보내서, 리스트로 받아 select로 표현</h3>
		<select id="sel1">
			<option value="1">1</option>
			<option value="2">2</option>
		</select>
		<select id="sel2"></select>
		
		<h3>9. GSON을 이용한 list 반환</h3>
		<button class="btn btn-primary" id="jQ9">실행</button>
		<p id="p9" class="border border-danger"></p>
		
		<h3>10. GSON을 이용한 map 반환</h3>
		<button class="btn btn-primary" id="jQ10">실행</button>
		<p id="p10" class="border border-danger"></p>
	</section>
	<script>
		function jsFunction(){
			//1.XMLHttpRequest객체 생성
			var xhttp = new XMLHttpRequest();
			var msg = document.getElementById("msg1").value;
			//2.요청 정보 설정
			xhttp.open("GET","/ajaxTest1?msg="+msg,true);
			//3.데이터 처리에 따른 동작함수 설정
			xhttp.onreadystatechange = function(){
				if(this.readyState==4 && this.status==200){
					console.log("서버 전송 성공");
				}else if(this.readyState==4 && this.status==404){
					console.log("서버전송 실패!");
				}
			}
			//4.서버에 전송
			xhttp.send();
		}
		$("#jQ1").click(function(){
			var msg = $("#msg1").val();
			$.ajax({
				url : "/ajaxTest1",
				data : {msg : msg},
				type : "get",
				success : function(){
					console.log("서버 전송 성공");
				},
				error : function(){
					console.log("서버 전송 실패");
				},
				complete : function(){
					console.log("무조건 호출");
				}
			});
		});
		$("#jQ2").click(function(){
			$.ajax({
				url : "/ajaxTest2",
				type : "get",
				success : function(data){
					$("#p2").html(data);
				},
				arror : function(){
					console.log("실패");
				}
			})
		});
		$("#jQ3").click(function(){
			var num1 = $("#num1").val();
			var num2 = $("#num2").val();
			$.ajax({
				url : "/ajaxTest3",
				data : {num1:num1,num2:num2},
				type : "get",
				success : function(data){
					$("#p3").html(data);
				},
				error : function(data){
					console.log("실패");
				}
			});
		});
		$("#jQ4").click(function(){
			var name=$("#name").val();
			var age=$("#age").val();
			var addr=$("#addr").val();
			var user = {name:name,age:age,addr:addr};
			$.ajax({
				url : "/ajaxTest4",
				data : user,
				type : "post",
				success : function(){
					console.log("성공");
				},
				error : function(){
					console.log("실패");
				}
			});
		});
		$("#jQ5").click(function(){
			var userNum = $("#userNum").val();
			$.ajax({
				url : "/ajaxTest5",
				type : "get",
				data : {userNum : userNum},
				success : function(data){
					var userNo = data.userNo;
					var userName = decodeURIComponent(data.userName);
					var userAddr = decodeURIComponent(data.userAddr);
					$("#p5").html("번호 : "+userNo+" / 이름 : "+userName+" / 주소 : "+userAddr);
				},
 				error : function(){
					console.log("실패");
				}
			});
		});
		$("#jQ6").click(function(){
			var userNum = $("#userNum1").val();
			$.ajax({
				url : "/ajaxTest6",
				type : "get",
				data : {userNum : userNum},
				success : function(data){
					var resultText = "";
					for(var i=0; i<data.length; i++){
						var userNo = data[i].userNo;
						var userName = decodeURIComponent(data[i].userName);
						var userAddr = decodeURIComponent(data[i].userAddr);	
						resultText += "번호 : "+userNo+" / 이름 : "+userName+" / 주소 : "+userAddr+"<br>";
					}					
					$("#p6").html(resultText);
				},
				error : function(){
					console.log("실패");
				}
			});
		});
		$("#jQ7").click(function(){
			var userNum = $("#userNum7").val();
			$.ajax({
				url : "/ajaxTest7",
				type : "get",
				data : {userNum : userNum},
				success : function(data){
					var resultText = "";
					var keys = Object.keys(data);
					for(var i=0; i<keys.length; i++){
						var userNo = data[keys[i]].userNo;
						var userName = decodeURIComponent(data[keys[i]].userName);
						var userAddr = decodeURIComponent(data[keys[i]].userAddr);	
						resultText += "번호 : "+userNo+" / 이름 : "+userName+" / 주소 : "+userAddr+"<br>";
					}					
					$("#p7").html(resultText);
				},
				error : function(){
					console.log("실패");
				}
			});
		});
		$("#sel1").change(function(){
			var sel1 = $("#sel1").val();
			$.ajax({
				url:"/ajaxTest8",
				data : {sel1 : sel1},
				type : "get",
				success : function(data){
					var sel2 = $("#sel2");
					sel2.find("option").remove();
					for(var i=0; i<data.length; i++){
						var num = data[i].num;
						sel2.append("<option>"+num+"</option>");
					}
				},
				error : function(){
					
				}
			})
		});
		$("#jQ9").click(function(){
			$.ajax({
				url : "/ajaxTest9",
				type : "get",
				success : function(data){
					var resultText = "";
					for(var i=0; i<data.length; i++){
						var userNo = data[i].userNo;
						var userName = decodeURIComponent(data[i].userName);
						var userAddr = decodeURIComponent(data[i].userAddr);	
						resultText += "번호 : "+userNo+" / 이름 : "+userName+" / 주소 : "+userAddr+"<br>";
					}					
					$("#p9").html(resultText);
				},
				error : function(){
					console.log("실패");
				}
			});
		});
		
		$("#jQ10").click(function(){
			$.ajax({
				url : "/ajaxTest10",
				type : "get",
				success : function(data){
					var resultText = "";
					for(var key in data){
						var userNo = data[key].userNo;
						var userName = data[key].userName;
						var userAddr = data[key].userAddr;	
						resultText += "번호 : "+userNo+" / 이름 : "+userName+" / 주소 : "+userAddr+"<br>";
					}					
					$("#p10").html(resultText);
				},
				error : function(){
					console.log("실패");
				}
			});
		});
	</script>
</body>
</html>