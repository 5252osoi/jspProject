<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<jsp:include page="/include/bs4.jsp"/>
	<title>memberMain.jsp</title>
<!-- 	<script>
		'use strict'
		function searchCheck() {
			let str=""
			str += "검색할 아이디 : ";
			str += "";
			str += "";
			
			demo.innerHTML=str;
		}
	
	</script>	 -->
</head>
<body>
	<p><br/></p>
	<div class="container text-center">
		<h2>회원 메인화면입니다</h2>
		<div>${sName}님 로그인중입니다.</div>
		<hr/>
		
		<p>현재 보유중인 포인트 : ${sPoint}<p/>
		<p>최종 접속일 : ${sLastDate}<p/>
		<p>오늘 접속횟수 : ${sTodayCount}</p>
		<hr/>
		<c:set var="random"><%=(int)(Math.random()*4)+1 %></c:set>
		<p><img src="${ctp}/images/${random}.png" width="300px"/></p>
		<hr/>
		<hr/>
		<div class="row">
			<div class="col-2"></div>
			<div class="col-4">
				<form name="searchform" method="post" action="${ctp}/database/memberSearch">
			<input type="text" name="mid" value="hkd1234" class="mr-1"/>
			<input type="submit" value="개별조회" class="btn btn-success"/>
				</form>
			</div>
			<div class="col-2"><a href="${ctp}/database/memberList" class="btn btn-info">전체조회</a></div>
			<div class="col-2"><a href="login.jsp" class="btn btn-warning">로그아웃</a></div>
			<div class="col-2"></div>
		</div>
		<hr/>
		<div id="demo"></div>
	</div>
	<p><br/></p>
</body>
</html>
