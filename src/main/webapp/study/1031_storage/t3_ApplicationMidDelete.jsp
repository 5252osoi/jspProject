<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- t3_ApplicationMidDelete.jsp -->
<%
	application.removeAttribute("aMid");
%>
<script>
	alert("아이디 어플리케이션을 삭제했습니다.");
	location.href="t3_ApplicationMain.jsp"
</script>