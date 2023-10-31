<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<jsp:include page="/include/bs4.jsp"/>
	<title>t3_ApplicationMain.jsp</title>	
	
	<style>
		div{margin: 20px;}
	</style>
	
</head>
<body>
	<p><br/></p>
	<div class="container">
		<h2>Application 연습 메인메뉴</h2>
		<hr/>
		<form name="myform" method="post" action="t3_ApplicationSave.jsp">
			<div> 아이디 : 
				<input type = "text" name="mid" value="${aMid}" autofocus class="form-control"/>
			</div>
			<div> 닉네임 : 
				<input type = "text" name="nickName" value="${aNickName}" autofocus class="form-control"/>
			</div>
			<div> 성명 : 
				<input type = "text" name="name" value="${aName}" autofocus class="form-control"/>
			</div>
			<hr/>
			<div class="row">
				<div class="col"><button type="submit" class="btn btn-success form-control">어플리케이션 저장</button></div>
				<div class="col"><a href="t3_ApplicationCheck.jsp" class="btn btn-primary form-control">어플리케이션 값 확인</a></div>
				<div class="col"><a href="t3_ApplicationNameCheck.jsp" class="btn btn-info form-control">어플리케이션 이름 목록</a></div>
				<div class="col"><a href="t3_ApplicationMidDelete.jsp" class="btn btn-info form-control">아이디 세션삭제</a></div>
			</div>
			
		</form>	
	</div>
	<p><br/></p>
</body>
</html>
