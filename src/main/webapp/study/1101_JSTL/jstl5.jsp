<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<jsp:include page="/include/bs4.jsp"/>
	<title>jstl5.jsp</title>	
</head>
<body>
	<p><br/></p>
	<div class="container">
		<h2>회원 자료 출력하기</h2>
		<form name="myform" method="post" action="${ctp}/j1101/jstl5Ok">
			<input type="submit" value="회원목록" class="btn btn-success"/>
		</form>
	</div>
	<p><br/></p>
</body>
</html>
