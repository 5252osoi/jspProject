<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String mid = request.getParameter("mid");
	String name = request.getParameter("name");
	String nickName = request.getParameter("nickName");
	String email = request.getParameter("email");
	String content = request.getParameter("content");
	
	System.out.println("=====newRegRes=====");
	System.out.println("mid : "+mid);
	System.out.println("name : "+name);
	System.out.println("nickName : "+nickName);
	System.out.println("email : "+email);
	System.out.println("content : "+content);
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
	<title>회원가입정보내역 </title>
	<script>
        'use strict';
        if('<%=nickName%>'!=''){
        	alert('<%=nickName%>'+"님의 신규 가입을 환영합니다. \n\n회원 메인창으로 이동합니다.")
        } else{
        	location.href='newReg.jsp?flag=no';
        }
        
        function logoutCheck(){
        	let ans= confirm("로그아웃 하시겠습니까?");
        	if(ans){
        		alert('<%=nickName%>'+"님 로그아웃 되셨습니다.");
        		location.href='newReg.jsp'
        	}
        }
        
    </script>
</head>
<body>
    <p><br/></p>
    <div class="container">
    	<img src="../../images/002.png" width='300px' style="display:block; margin:auto;" />
        <h2 style="text-align:center;"><%= nickName %>님 환영합니다.</h2>
        <div class="card" style="width:500px; display:block; margin:auto; ">
        	<img class="card-img-top" src="../../images/avatar1.png" width='100%' alt="Card image">
        	
        	<div class="card-body">
        		<h4 class="card-title"><%= nickName %></h4>
        		<p class="card-text">아이디 : <%= mid %></p>
        		<p class="card-text">이 름 : <%= name %></p>
        		<p class="card-text">이메일 : <%= email %></p>
        		<p class="card-text">소 개 : <%= content %></p>
        		<a href="#" class="btn btn-primary" onclick="logoutCheck()">로그아웃</a>
        	</div>
        </div>
    </div>
    <p><br/></p>
</body>
</html>
