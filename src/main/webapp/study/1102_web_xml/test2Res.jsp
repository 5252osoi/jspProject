<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<jsp:include page="/include/bs4.jsp"/>
	<title>test1Res.jsp</title>	
</head>
<body>
	<p><br/></p>
	<div class="container">
		<h2>test2Res.jsp</h2>
		<hr/>
		<div>
			메세지 : ${msg}
		</div>
		<hr/>
		<div><a href="${ctp}/study/1102_web_xml/test2.jsp" class="btn btn-success">돌아가기</a> </div>
	</div>
	<p><br/></p>
</body>
</html>
