<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<jsp:include page="/include/bs4.jsp"/>
	<title>test1.jsp</title>	
	<style>
		div{margin-bottom:4px;};
	</style>
</head>
<body>
	<p><br/></p>
	<div class="container">
		<h2>이곳은 test1.jsp입니다.</h2>
		<form method="post" action="${ctp}/j1102/test1Ok">
			<div><input type="text" name="content" value="간단한 소개입니다." class="form-control"/></div>
			<div><textarea rows="5" name="introduce" class="form-control">자기소개를 자세히 기록해주세요. </textarea></div>
			<div><input type="submit" value="전송하기1" class="btn btn-success form-control"/></div>
			<div><input type="button" value="전송하기2" onclick="location.href='${ctp}/j1102/test1Ok2';" class="btn btn-info form-control"/></div>
		</form>
	</div>
	<p><br/></p>
</body>
</html>
