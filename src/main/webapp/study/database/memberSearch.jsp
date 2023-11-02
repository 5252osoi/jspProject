<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<jsp:include page="/include/bs4.jsp"/>
	<title>memberSearch.jsp</title>
	<script>
	</script>
		
</head>
<body>
	<p><br/></p>
	<div class="container text-center">
        <h2 style="text-align:center;">${vo.name}님 환영합니다.</h2>
        <div class="card" style="width:500px; display:block; margin:auto; ">
        	<img class="card-img-top" src="${ctp}/images/avatar1.png" width='100%' alt="Card image">
        	
        	<div class="card-body">
        		<h4 class="card-title">${vo.name}</h4>
        		<p class="card-text">회원번호 : ${vo.idx}</p>
        		<p class="card-text">아이디 : ${vo.mid}</p>
        		<p class="card-text">이 름 : ${vo.name}</p>
        		<p class="card-text">보유포인트 : ${vo.point}</p>
        		<p class="card-text">최근접속일 : ${fn:substring(vo.lastDate,0,16)}</p>
        		<a href="${ctp}/study/database/memberMain.jsp" class="btn btn-primary">로그아웃</a>
        	</div>
        </div>
	</div>
	<p><br/></p>
</body>
</html>
