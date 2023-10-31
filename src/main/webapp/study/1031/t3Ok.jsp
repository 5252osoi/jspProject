<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	String name = request.getParameter("name")==null ? "" : request.getParameter("name");
	String age = request.getParameter("age")==null ? "" : request.getParameter("age");
	pageContext.setAttribute("name", name);
	request.setAttribute("age", age);
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<jsp:include page="/include/bs4.jsp"/>
	<title>t3Ok.jsp</title>	
</head>
<body>
	<p><br/></p>
	<div class="container">
		<h2>처리된 자료를 view2에 출력</h2>
		<table class="table table-bordered">
			<tr>
				<td>성명</td>
				<td><%=name %>/${name}</td>				
			</tr>
			<tr>
				<td>나이</td>
				<td><%=age %>/${age}</td>				
			</tr>
			<tr>
				<td>성별</td>
				<td></td>				
			</tr>
			<tr>
				<td>취미</td>
				<td></td>				
			</tr>
			<tr>
				<td>직업</td>
				<td></td>				
			</tr>
			<tr>
				<td>주소</td>
				<td></td>				
			</tr>
		</table>
		<p><a href="t3.jsp" class="btn btn-info"></a></p>
	</div>
	<p><br/></p>
</body>
</html>
