<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String flag = request.getParameter("flag");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<title> 회원가입 </title>
	<script>
        'use strict';
        
        if('<%=flag%>'=="no") alert("비정상적인 경로입니다.");
        
        function fCheck() {
            let regMid = /^[a-zA-Z0-9_]{4,20}$/;
            let regPwd = /^(?=.*[a-zA-Z0-9])(?=.*[~!@#$%^&*()_+{}|;<>?]).{4,20}$/;
            let regName = /^[가-힣a-zA-Z]*$/;
            let regNickName=/^[가-힣]*$/;
            let regEMail=/^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-z]{2,3}$/;

            let mid=document.getElementById("mid").value.trim();
            let pwd=document.getElementById("pwd").value.trim();
            let name=document.getElementById("name").value.trim();
            let nickName=document.getElementById("nickName").value.trim();
            let email=document.getElementById("email").value.trim();
 
            if(!regMid.test(mid)){
                alert("아이디는 영문 대/소문자, 그리고 밑줄을 포함하여 20글자입니다.");
                return false;
            } else if(!regPwd.test(pwd)){
                alert("비밀번호는 영문 대/소문자,그리고 특수문자를 포함하여 4~20글자입니다.");
                return false;
            } else if(!regName.test(name)){
                alert("이름은 한글 또는 영어로만 작성 가능합니다.");
                return false;
            } else if(!regNickName.test(nickName)){
                alert("닉네임은 한글로만 작성 가능합니다.");
                return false;
            } else if(!regEMail.test(email)){
                alert("이메일을 형식에 맞게 작성해주세요");
                return false;
            } else {
            	 alert("유효성 검사 완료")
            	 myform.submit();
            }
 
           
        }
    </script>
</head>
<body>
    <p><br/></p>
    <div class="container">
        <img src="../../images/002.png" width='300px' style="display:block; margin:auto;" />
		<h2 class="mb-0">회원가입</h2>
        <br/>
        <form name="myform" method="post" action="<%=request.getContextPath() %>/exm/newRegCheck">
        
	        <div class="form-group">
	            <label for = "id">아이디</label>
	            <input type="text" name="mid" id="mid" value="hk1234" placeholder="아이디를 입력하세요" class="form-control" autofocus required/>
	        </div>
	        <div class="form-group">
	            <label for = "password">비밀번호</label>
	            <input type="password" name="pwd" id="pwd" value="!a234" placeholder="비밀번호 입력하세요" class="form-control"  required/>
	        </div>
	        <div class="form-group">
	            <label for = "name">성명</label>
	            <input type="text" name="name" id="name" value="홍길동" placeholder="이름을 입력하세요" class="form-control"  required/>
	        </div>
	        <div class="form-group">
	            <label for = "nickName">닉네임</label>
	            <input type="text" name="nickName" id="nickName" value="홍장군" placeholder="닉네임을 입력하세요" class="form-control"  required/>
	        </div>
	        <div class="form-group">
	            <label for = "email">이메일</label>
	            <input type="email" name="email" id="email" value="hk1234@naver.com" placeholder="메일주소를 입력하세요" class="form-control" />
	        </div>
	        <div class="form-group">
	            <label for = "jumin">자기소개서</label>
	            <textarea rows="5" name="content" id="content" class="form-control">자기소개서 등록하기 </textarea>
	        </div>
	        <div class="row">
	            <div class="col"><input type="button" value="회원등록" onclick="fCheck()" class="bnt btn-success form-control"/></div> 
	            <div class="col"><input type="reset"  value="다시입력" onclick="location.reload()" class="bnt btn-success form-control"/></div> 
	        </div>
	        
        </form>
    </div>
    <p><br/></p>
</body>
</html>
