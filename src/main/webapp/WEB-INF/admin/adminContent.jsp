<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<jsp:include page="/include/bs4.jsp"/>
	<title>adminContent.jsp</title>	
</head>
<body>
	<p><br/></p>
	<div class="container">
		<h3>관리자 메인화면</h3>
		<hr/>
		<p> 방명록 새글 : ??? </p>
		<p> 게시판 새글 : ??? </p>
		<p> 신규 등록회원 : <a href="AMLS.ad?lv=1&level=1">${newCrew}</a></p>
		
	</div>
	<p><br/></p>
</body>
</html>
