<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!-- index.jsp에 화면 띄우는방법 -->

<!-- <script> location.href="main.ad"; </script> -->
<%-- <jsp:forward page="main.ad"/> --%>
<%
	//response.sendRedirect("main.ad");
	pageContext.forward("main.ad");
%>
