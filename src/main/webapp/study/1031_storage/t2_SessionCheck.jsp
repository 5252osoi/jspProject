<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- t2_SessionCheck.jsp -->
<jsp:include page="/include/bs4.jsp"/>
<p><br/></p>
<div class="container">
<%
	String mid =(String) session.getAttribute("sMid");
	String nickName =(String) session.getAttribute("sNickName");
	String name =(String) session.getAttribute("sName");
%>
	<h2>세션값 출력하기</h2>
	<p>아이디 : <%=mid %></p>
	<p>닉네임 : <%=nickName %></p>
	<p>성 명 : <%=name %></p>
	<hr/>
	<p><a href="t2_SessionMain.jsp" class="btn btn-success">돌아가기</a></p>
</div>
