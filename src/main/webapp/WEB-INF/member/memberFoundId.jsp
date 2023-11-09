<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<jsp:include page="/include/bs4.jsp"/>
	<title>아이디찾기</title>	
	<script>
		'use strict';
		function fCheck(){
			//이메일 유효성체크
			let regEmail =/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
			//이메일 합치기
			let email1 = myform.email1.value.trim();
			let email2 = myform.email2.value;
			let email = email1 + "@" + email2;	
			
			if(!regEmail.test(email)) {
		        alert("이메일 형식에 맞지않습니다.");
		        myform.email1.focus();
		        return false;
		        
			} else{
				myform.email.value = email;
				myform.submit();
			}
		}
		
	</script>
</head>
<body>
	<p><br/></p>
	<div class="container">
		<h2>아이디 찾기</h2>
		<form name="myform" method="post" action="memberFoundIdOk.mem">
			<div>
				<label for="email1">이메일 주소:</label>
		        <div class="input-group mb-3">
		          <input type="text" class="form-control" placeholder="가입시 기입하신 Email을 입력하세요." id="email1" name="email1" required />
		          <div class="input-group-append">
		            <select name="email2" class="custom-select">
		              <option value="naver.com" selected>naver.com</option>
		              <option value="hanmail.net">hanmail.net</option>
		              <option value="hotmail.com">hotmail.com</option>
		              <option value="gmail.com">gmail.com</option>
		              <option value="nate.com">nate.com</option>
		              <option value="yahoo.com">yahoo.com</option>
		            </select>
		          </div>
		        </div>
			</div>
			<button type="button" class="btn btn-success" onclick="fCheck()">아이디 찾기</button>&nbsp;
			<button type="reset" class="btn btn-secondary">다시 입력</button>&nbsp;
			<button type="button" class="btn btn-info" onclick="window.close();">돌아가기</button>
			<input type="hidden" name="email" />
		</form>
	</div>
	<p><br/></p>
</body>
</html>
