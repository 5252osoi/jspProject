<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<title>pds.jsp</title>
	<%@ include file = "../../include/bs4.jsp" %>
		
</head>
<body>
<!-- 헤더 영역 (로고/메뉴/상단부 이미지 등) -->
	<div id="header" class="text-center" style="background-color: skyblue">
		<%@ include file="nav.jsp" %>
	</div>	
	<p><br/></p>
	<div class="container" style="text-align:center">
	<h2>이곳은 자료실(pds)입니다.</h2>
	<hr/>
	<p><img src="../../images/5.png" width="600px"></p>
	<hr/>
	</div>
	<p><br/></p>
<!-- 푸터 영역(카피라이트/이메일/사업자등록증 등) -->
	<div id="footer" class="text-center">
		<%@ include file="footer.jsp" %>
	</div>	
</body>
</html>
