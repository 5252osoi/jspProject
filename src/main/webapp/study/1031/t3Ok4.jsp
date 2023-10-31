<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:useBean id="vo" class="study.j1031.T3VO"/>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<title>t3Ok4.jsp</title>	

	<jsp:setProperty property="*" name="vo"/>
	<jsp:include page="/include/bs4.jsp"/>
	
</head>
<body>
	<p><br/></p>
	<div class="container">
		<h2>처리된 자료를 view2에 출력</h2>
		<table class="table table-bordered">
			<tr>
				<td>성명</td>
				<td><jsp:getProperty property="name" name="vo"/>/${vo.name}</td>				
			</tr>
			<tr>
				<td>나이</td>
				<td><jsp:getProperty property="age" name="vo" />/${vo.age}</td>				
			</tr>
			<tr>
				<td>성별</td>
				<td><jsp:getProperty property="gender" name="vo" />/${vo.gender}</td>				
			</tr>
			<tr>
				<td>취미</td>
				<td><jsp:getProperty property="hobby" name="vo" />/${vo.hobby}</td>				
			</tr>
			<tr>
				<td>직업</td>
				<td><jsp:getProperty property="job" name="vo" />/${vo.job}</td>				
			</tr>
			<tr>
				<td>주소</td>
				<td><jsp:getProperty property="address" name="vo" />/${vo.address}</td>				
			</tr>
		</table>
		<p><a href="t3.jsp" class="btn btn-info">눌러유</a></p>
	</div>
	<p><br/></p>
</body>
</html>
