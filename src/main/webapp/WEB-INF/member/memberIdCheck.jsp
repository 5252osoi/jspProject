<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<jsp:include page="/include/bs4.jsp"/>
	<title>memberIdCheck.jsp</title>	
	<script>
		'use strict'
		//사용가능한 아이디를 부모창으로 전송 후 창 닫기
		function sendCheck(){
			opener.window.document.myform.mid.value='${mid}';
			opener.window.document.myform.pwd.focus();
			window.close();
		}
		function idCheck(){
			let mid = childForm.mid.value;
			
			if(mid.trim()==""){
				alert("아이디를 입력하세요");
				childForm.mid.focus();
			} else{
				childForm.submit();
			} 
		}
	</script>
</head>
<body>
	<p><br/></p>
	<div class="container">
		<h2>아이디 체크폼</h2>
		<c:if test="${res==1}">
			<h4><font color="brown"><b>${mid}</b></font><br/>이 아이디는 사용 가능합니다.</h4>	
			<p><input type="button" value="창닫기" onclick="sendCheck()"/></p>
		</c:if>
		<c:if test="${res!=1}">
			<h4>이미 사용중인 아이디입니다.</h4>	
			<form name = "childForm" method="post" action="memberIdCheck.mem">
				<p>
					<input type="text" name="mid"/>
					<input type="button" value="아이디재검색" onclick="idCheck()"/>
				</p>
			</form>		
		</c:if>
	</div>
	<p><br/></p>
</body>
</html>
