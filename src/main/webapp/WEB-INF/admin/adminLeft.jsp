<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<jsp:include page="/include/bs4.jsp"/>
	<title>adminLeft.jsp</title>	
</head>
<body style="background-color:#eee">
	<p><br/></p>
	<div class="container">
		<p><a href="${ctp}/" target="_top">홈으로</a></p>
		<h5><a href="adminContent.ad" target="adminContent">관리자메뉴</a></h5>
		<hr/>
		<hr/>
		<div>
			<h4>방명록</h4>
			<div><a href="#" target="adminContent">방명록리스트</a></div>
		</div>
		<hr/>
		<div>
			<h4>일반관리</h4>
			<div><a href="adminMemberList.ad" target="adminContent">회원리스트</a></div>
			<div><a href="#" target="adminContent">게시판리스트</a></div>
		</div>
	</div>
</body>
</html>
