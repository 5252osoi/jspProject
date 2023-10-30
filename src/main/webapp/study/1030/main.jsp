<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String flag=request.getParameter("flag")==null?"":request.getParameter("flag");
	String mSw=request.getParameter("mSw")==null?"":request.getParameter("mSw");
	String mid=request.getParameter("mid")==null?"":request.getParameter("mid");
	pageContext.setAttribute("mSw", mSw);
	pageContext.setAttribute("mid", mid);
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<title>main.jsp</title>
<%--<jsp:include page="../../include/bs4.jsp">	 					--%>
<%--<%@ include file="../../include/bs4.jsp" %> 					--%>
<%--<jsp:include page="${request.contextPath}/include/bs4.jsp"/> 	--%>	
	<jsp:include page="/include/bs4.jsp"/>
<%-- jsp액션 태그 처음의 '/'은 ContextPath의 root명으로 간주된다. 				--%>
	<script>
		'use strict';
/* 		alert('${mSw}') */
		
		if('${mSw}'=='No'){
			alert( "회원정보를 확인하고 다시 로그인 하세요.");
			location.href = "login.jsp";	
		} 
//		} else{
		else if('${mSw}'=='Ok'){
			alert("${mid}님 방문을 환영합니다.");
		}
		
	
	</script>

</head>
<body>
<!-- 헤더 영역 (로고/메뉴/상단부 이미지 등) -->
	<div id="header" class="text-center" style="background-color: lightpink">
		<%@ include file="nav2.jsp" %>
		<p class="text-right">${mid}님 로그인 중입니다.</p>
	</div>	
	<p><br/></p>
	<div class="container" style="text-align:center">
<%	if(flag.equals("guest")){  			%>
<%@		include file ="guest2.jsp" 		%>
<%	} else if(flag.equals("board")){ 	%>
<%@		include file ="board2.jsp" 		%>
<%	} else if(flag.equals("pds")){ 		%>
<%@		include file ="pds2.jsp" 		%>
<% 	} else {							%>
		<h2>이곳은 메인 화면(Home)입니다.</h2>
		<hr/>
		<p><img src="../../images/001.png" width="600px"></p>
		<hr/>
<%	} 									%>
	</div>
<!-- 푸터 영역(카피라이트/이메일/사업자등록증 등) -->
	<div id="footer" class="text-center">
<%@ 	include file="footer.jsp" 		%>
	</div>	
</body>
</html>
