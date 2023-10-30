<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	<title>콤보박스 선택하고 이미지 출력 </title>
	<script>
        'use strict';

        function change(){
        	let val=document.getElementById("select").value;
        	console.log("넘어온 값 : "+val);  	
        	
        	if(val!=""){
         		demo.innerHTML="<img src='../../images/"+val+".png' width='200px'/>"       		
        	}
        }
    </script>
</head>
<body>
    <p><br/></p>
    <div class="container">
        <h2>콤보박스 선택으로 화면에 이미지 출력시키기</h2>
    	<select class="form-control" id="select" onchange="change()">
    		<option value=""> 이미지를 선택하기 </option>
    		<option value="1"> 1 </option>
    		<option value="2"> 2 </option>
    		<option value="3"> 3 </option>    	
    		<option value="4"> 4 </option>    	
    	</select>
    	<div id="demo"></div>
    </div>
</body>
</html>
