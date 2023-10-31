<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String flag = request.getParameter("flag");
	System.out.println("flag : "+flag);
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<title>t3.jsp</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<script>
	'use strict';
	
	if('<%=flag%>' == 'no'){
		alert("자료가 잘못되었습니다. 회원가입");
	}
	function fCheck(){
		let name = myform.name.value;
		let age = document.getElementById("age").value;
		
		if(name.trim()==""){
			alert("성명을 입력하세요");
			myform.name.focus();
		} else if(age.trim()==""|| age<20){
			alert("20세 이상만 가입할 수 있습니다.");
			document.getElementById("age").focus();
		} else{
				//alert("정상처리 되었습니다.");
/* 				location.href=`test2Ok.jsp?name=${name}&age=${age}`; */
			//location.href="test2Ok.jsp?name="+name+"&age="+age;
			myform.submit();
		}
	}
		
	</script>
</head>
<body>
	<p><br/></p>
	<div class="container">
	<h2>회원가입 연습(response.sendRedirect)</h2>
	<hr/>
<!-- 	<form name ="myform" method="get" action="t3Ok.jsp"> -->
<!-- 	<form name ="myform" method="get" action="t3Ok2.jsp"> -->
	<form name ="myform" method="post" action="t3Ok5.jsp">
	
		<div class="cont">성명
			<input type="text" name ="name" value="홍길순" class="form-control mb-3" autofocus/>
		</div>
		<div class="cont">나이
			<input type="number" id="age" name ="age" value="22" class="form-control mb-3"/>
		</div>
		<div class="cont mb-3">성별
			<input type="radio" name ="gender" value="남자"/>남자
			<input type="radio" name ="gender" value="여자" checked/>여자
		</div>
		<div class="cont mb-3">취미 &nbsp;
			<input type="checkBox" name="hobby" value="등산" checked/>등산 &nbsp;
			<input type="checkBox" name="hobby" value="낚시"/>낚시 &nbsp;
			<input type="checkBox" name="hobby" value="수영"/>수영 &nbsp;
			<input type="checkBox" name="hobby" value="바둑"/>바둑 &nbsp;
			<input type="checkBox" name="hobby" value="싸이클"/>싸이클 &nbsp;
			<input type="checkBox" name="hobby" value="배드민턴" checked/>배드민턴
		</div>
		<div class = "cont">직업
			<select name="job" class="form-control mb-3">
				<option selected>학생</option>
				<option>회사원</option>
				<option>군인</option>
				<option>공무원</option>
				<option>웹프로그래머</option>
				<option>기타</option>
			</select>
		</div>
		<div class="cont">
			주소 : <input type="text" name="address" value="청주" class="form-control"/>
		</div>
		<div>
			<input type="submit" value ="전송(button)" class="btn btn-info form-control mt-3"/>
		</div>
		
	</form>
	</div>
	<p><br/></p>
</body>
</html>
