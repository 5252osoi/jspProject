<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<jsp:include page="/include/bs4.jsp"/>
	<title>test4_init.jsp</title>	
</head>
<body>
	<p><br/></p>
	<div class="container">
		<h2>web.xml에 작성한 초기값 확인하기 - init(servlet)에서 보낸 값 출력하기</h2>
		<p>
			회사명 : ${sLogoName}<br/>
			홈페이지 주소 : ${sHomeAddress} <br/>
		</p>
		<hr/>
		<p><a href="${ctp}/j1102/Test4Ok" class="btn btn-success">머엿더라 이버튼</a> </p>
		<hr/>
		<p><a href="${ctp}/j1102/SessionOut?sw=tes4_init" class="btn btn-danger">세션 끊기</a></p>
	</div>
	<p><br/></p>
</body>
</html>
