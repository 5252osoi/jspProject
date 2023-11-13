<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<jsp:include page="/include/bs4.jsp"/>
	<title>adminMemberInfor.jsp</title>	
</head>
<body>
	<p><br/></p>
		
		<div class="container">
        <h2 style="text-align:center">${vo.nickName}님 환영합니다.</h2>
        <div class="card" style="width:500px; display:block; margin:auto; ">
        	<img class="card-img-top" src="${ctp}/images/avatar1.png" width='100%' alt="Card image">
        	
        	<div class="card-body">
        		<h4 class="card-title">${vo.nickName}</h4>
        		<p class="card-text">아이디 : ${vo.mid}</p>
        		<p class="card-text">이 름 : ${vo.name}</p>
        		<p class="card-text">이메일 : ${vo.email}</p>
        		<p class="card-text">가입일 : ${vo.startDate}</p>
        		<p class="card-text">정보공개유무 : ${vo.userInfor}</p>
				<a href="adminMemberList.ad?pag=${pag}&pageSize=${pageSize}" class="btn btn-warning">돌아가기</a>
        	</div>
        </div>
    </div>
		
		
	<p><br/></p>
</body>
</html>
