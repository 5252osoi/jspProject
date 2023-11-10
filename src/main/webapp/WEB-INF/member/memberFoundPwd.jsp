<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<jsp:include page="/include/bs4.jsp"/>
	<title>비밀번호찾기</title>	
	<script>
		'use strict';
		function fCheck(){
			//아이디.이메일 유효성체크
			let regMid = /^[a-zA-Z0-9_]{4,20}$/;
			let regEmail =/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
			//아이디공백잘라내기,이메일 합치기
			let mid = myform.mid.value.trim();
			let email1 = myform.email1.value.trim();
			let email2 = myform.email2.value;
			let email = email1 + "@" + email2;	
			
			if(!regMid.test(mid)) {
	    		alert("아이디는 4~20자리의 영문 소/대문자와 숫자, 언더바(_)만 사용가능합니다.");
	    		myform.mid.focus();
	    		return false;
	    	} else if(!regEmail.test(email)) {
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
		<h2>비밀번호 찾기</h2>
		<c:if test="${res!=1&&res!=0}">
			<form name="myform" method="post" action="memberFoundPwdOk.mem">
				<div>
					<div class="form-group">
				      <label for="mid">아이디 : &nbsp; &nbsp;</label>
				      <input type="text" class="form-control mb-2" name="mid" id="mid" placeholder="아이디를 입력하세요." required autofocus/>
				    </div>
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
				<button type="button" class="btn btn-success" onclick="fCheck()">비밀번호 찾기</button>&nbsp;
				<button type="reset" class="btn btn-secondary">다시 입력</button>&nbsp;
				<button type="button" class="btn btn-info" onclick="window.close();">돌아가기</button>
				<input type="hidden" name="email" />
			</form>
		</c:if>
		<c:if test="${res==0}">
			<script>
				'use strict';
				alert("${msg}");
				location.href="${url}";
			</script>
		</c:if>
		<c:if test="${res==1}">
			<div class="text-center">
				가입한 메일주소 : <b>${email}</b>
			</div>
			<div class="text-center mt-2">
				가입한 아이디 : <font color="brown"><b>${mid}</b></font>
			</div>
			<div class="text-center mt-2">
				임시 비밀번호 : <font color="brown"><b>${viewPwd}</b></font>
			</div>
			<div class= "text-center mt-3">
			<button onclick="location.href='memberFoundId.mem'"class="btn btn-info">재검색</button>
			<button onclick="window.close();" class="btn btn-success">창닫기</button>
			</div>
		</c:if>
	</div>
	<p><br/></p>
</body>
</html>
