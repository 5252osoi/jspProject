<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- test13Logout.jsp -->
<%
	//현재페이지에서 이름을 띄우기위해서 현재페이지의 저장소에 저장을함
	String name = request.getParameter("name");
	pageContext.setAttribute("name", name);
	
%>

<script>
	alert("${name}님 로그아웃 되었습니다.(MVC)");
<%-- 	location.href="<%=request.getContextPath()%>/study/1026/test13.jsp"; --%>
/* 	location.href="test13.jsp"; */
	location.href="${pageContext.request.contextPath}/study/1026/test13.jsp";
</script>