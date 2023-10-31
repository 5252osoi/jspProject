<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	String cMid ="";
	String cPwd ="";
	String cCheck ="";
	
	if(request.getCookies().length!=1){
		Cookie[] cookies = request.getCookies();
		cMid = cookies[0].getValue()==null?"":cookies[0].getValue();
		cPwd = cookies[1].getValue()==null?"":cookies[1].getValue();
		cCheck = cookies[2].getValue()==null?"":cookies[2].getValue();
	}
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<jsp:include page="/include/bs4.jsp"/>
	<title>쿠키로 아이디 저장하기 (숙)</title>	
</head>
<body>
	<p><br/></p>
	<div class="container">
		<h2>세션연습 메인메뉴</h2>
		<hr/>
		<form name="myform" method="post" action="cookieLogin.jsp">
			<div> 아이디 : 
				<input type = "text" name="mid" value="<%=cMid%>" autofocus class="form-control mb-2"/>
			</div>
			<div> 비밀번호 : 
				<input type = "password" name="pwd" value="<%=cPwd%>" autofocus class="form-control mb-3"/>
			</div>
			<div>
				<input type="checkBox" name="check" value="checked" class="mr-1" <%=cCheck%>/> 아이디 기억
			</div>

			<hr/>
			<div class="row">
				<div class="col"><button type="submit" class="btn btn-success form-control">로그인</button></div>
				<div class="col"><button type="reset" class="btn btn-success form-control">다시입력</button></div>
			</div>
			
		</form>	
	</div>
	<p><br/></p>
</body>
</html>
