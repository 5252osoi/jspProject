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
</head>
<body>
<jsp:include page="/include/header.jsp"/>
	<p><br/></p>
	<div class="container">
		<h2> 회 원 전 용 방 </h2>
		<hr/>
		<pre>
			정회원 등업조건은... 어쩌고저쩌고...
		</pre>
		<hr/>
		<div><img src="${ctp}/images/member/noimage.jpg" width="200px"/></div>
		<div>
			<p>현재  (${strLevel}) ${sNickName} 님 로그인 중입니다.</p>
			<p>총 방문횟수 : </p>
			<p>오늘의 방문횟수 : </p>
			<p>보유 포인트 : </p>
			<hr/>
			<h4>활동내역 </h4>
			<p>방명록에 작성한 글 수 : </p>
			<p>게시판에 작성한 글 수 : </p>
			<hr/>
		</div>
	</div>
	<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>
