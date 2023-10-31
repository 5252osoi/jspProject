<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String check=request.getParameter("check")==null?"":request.getParameter("check");
	String mid=request.getParameter("mid")==null?"":request.getParameter("mid");
	String pwd=request.getParameter("pwd")==null?"":request.getParameter("pwd");
	
	//쿠키에 체크저장 
 	Cookie cookieMid = new Cookie("cMid",mid);
	Cookie cookiePwd = new Cookie("cPwd",pwd);
 	Cookie cookieCheck = new Cookie("cCheck",check);

 	
	if(check.equals("")){
		cookieMid.setMaxAge(0);
		cookiePwd.setMaxAge(0);
		cookieCheck.setMaxAge(0);
		
	} else {
		cookieMid.setMaxAge(60*60*24*7);
		cookiePwd.setMaxAge(60*60*24*7);
		cookieCheck.setMaxAge(60*60*24*7);
		
	}
	
	response.addCookie(cookieMid);
	response.addCookie(cookiePwd); 
	response.addCookie(cookieCheck); 

	
	
%>
<jsp:include page="/include/bs4.jsp"/>
<p><br/></p>
<div class="container">
	<h2>저장된 쿠키 확인하기</h2>
	<hr/>
	<p>

	<%
		
		Cookie[] cookies = request.getCookies();
		
		out.println("저장된 쿠키 <br/>");
		for(int i=0; i<cookies.length;i++){
			out.println("쿠키명 : " +cookies[i].getName()+" , ");
			out.println("쿠키값 : " +cookies[i].getValue()+" , ");
			out.println("만료 시간 : " +cookies[i].getMaxAge()+" , <br/>");
		}

	%>
	</p>
	<hr/>
	<p>
		<a href="cookie.jsp" class="btn btn-info" >로그아웃</a>
	</p>
</div>
<p><br/></p>
