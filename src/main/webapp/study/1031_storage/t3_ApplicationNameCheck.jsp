<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- t3_ApplicationNameCheck.jsp -->
<jsp:include page="/include/bs4.jsp"/>
<p><br/></p>
<div class="container">
<h2>전체 어플리케이션 변수명 목록</h2>
<hr/>
<%
	Enumeration names =application.getAttributeNames();
	while(names.hasMoreElements()){
		String name = (String) names.nextElement();
		out.println("어플리케이션 명 : "+name+"<br/>");
	}
%>
	<hr/>
	<p><a href="t3_ApplicationMain.jsp" class="btn btn-success">돌아가기</a></p>
<script>

	//alert("모든 세션을 삭제했습니다.");
	//location.href="t3_ApplicationMain.jsp"
</script>