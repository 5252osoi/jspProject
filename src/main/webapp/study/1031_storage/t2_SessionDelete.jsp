<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- t2_SessionDelete.jsp -->

<%
	//현재 브라우저에 생성되어있는 모든 세션을 삭제한다.
	session.invalidate();

%>
<script>
	alert("모든 세션을 삭제했습니다.");
	location.href="t2_SessionMain.jsp"
</script>