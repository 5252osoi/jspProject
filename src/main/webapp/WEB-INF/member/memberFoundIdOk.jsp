<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<jsp:include page="/include/bs4.jsp"/>
	<title>아이디찾기</title>	
</head>
<body>
	<p><br/></p>
	<p><br/></p>
	<div class="container mt-3">
		<h2></h2>
		<c:if test="${res==1}">
			<div class="text-center">
				가입한 메일주소 : <b>${email}</b>
			</div>
			<div class="text-center mt-2">
				가입한 아이디 : <font color="brown"><b>${mid}</b></font>
			</div>
			<div class= "text-center mt-3">
			<button onclick="location.href='memberFoundId.mem'"class="btn btn-info">재검색</button>
			<button onclick="window.close();" class="btn btn-success">창닫기</button>
			</div>
		</c:if>
		<c:if test="${res!=1}">
			<script>
				'use strict';
				alert("${msg}");
				location.href="${url}";
			</script>
		</c:if>
	</div>
	<p><br/></p>
</body>
</html>
