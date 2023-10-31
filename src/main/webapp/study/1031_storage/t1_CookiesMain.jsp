<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<jsp:include page="/include/bs4.jsp"/>
	<title>t1_CookiesMain.jsp</title>	
</head>
<body>
	<p><br/></p>
	<div class="container">
		<h2>쿠키연습 메인메뉴</h2>
		<hr/>
		<div class="row">
			<div class="col"><a href="t1_CookiesSave.jsp" class="btn btn-success form-control">쿠키 저장</a></div>
			<div class="col"><a href="t1_CookiesCheck.jsp" class="btn btn-primary form-control">쿠키 확인</a></div>
			<div class="col"><a href="t1_CookiesDelete.jsp" class="btn btn-info form-control">전체 쿠키삭제</a></div>
			<div class="col"><a href="t1_CookiesPwdDelete.jsp" class="btn btn-info form-control">비밀번호 쿠키삭제</a></div>
		</div>
	</div>
	<p><br/></p>
</body>
</html>
