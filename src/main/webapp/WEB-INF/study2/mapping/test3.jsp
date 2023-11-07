<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<jsp:include page="/include/bs4.jsp"/>
	<title>test3.jsp</title>	
</head>
<body>
<jsp:include page="/include/header.jsp"/>
	<p><br/></p>
	<div class="container text-center">
		<h2>URL매핑 (Directory Mapping) 패턴</h2>
		<p>이곳은 test3.jsp입니다.</p>
		<hr/>
		<img src="${ctp}/images/3.png" width="300px"/>
		<hr/>
		<div>
			<input type="button" value="test1.jsp" onclick="location.href='${ctp}/mapping/test1'" class="btn btn-success" m-3/>
			<input type="button" value="test2.jsp" onclick="location.href='${ctp}/mapping/test2'" class="btn btn-primary" m-3/>
		</div>
	</div>
	<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>
