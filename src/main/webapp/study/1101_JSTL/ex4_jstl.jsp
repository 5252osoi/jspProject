<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>ex4_jstl.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
	
  	<script>
        'use strict';
	
        function change(){
        	let val=document.getElementById("select").value; 
        	console.log(val);
        	if(val!=""){
         		demo.innerHTML="<img src='../../images/"+val+".png' width='200px'/>"       		
        	}
        }
         
        function printImg(){
        	let str="";
			<c:if test="${imgList!=null}">
				<c:forEach var="i" begin="0" end="${fn:length(imgList)-1}">
					str+=${imgList[i]}
				</c:forEach>
			</c:if>
			demo.innerHTML=str;
        }

    </script>
</head>
<body>
<p><br/></p>
<div class="container">
	<pre>
		콤보상자에 숫자 1~5까지 기억시켜서 화면에 보여준다.
		이때 숫자를 선택하면 아래쪽(demo)으로 선택한 숫자의 그림파일을 출력시켜주시오.
		콤보상자옆에 텍스트박스를 만들어준후, 그곳에 아래 출력된 파일의 '이름'을 적어준후 '저장'버튼을 클릭하여 저장시켜준다.
		'전체그림출력'버튼을 만들어서 이 버튼을 클릭하면 지금까지 저장된 그림파일들을 모두 demo에 차례되로 출력시켜줄수 있도록 한다.
	</pre>
  
	<h2>콤보박스 선택으로 화면에 이미지 출력시키기</h2>
	

	<div>
		<form name="myform" method="post" action="${ctp}/exm/imgSave">
			<div style="display:inline-block">
			   	<select class="form-control" name="select" id="select" onchange="change()">
			   		<option value=""> 이미지를 선택하기 </option>
			   		<option value="1"> 1 </option>
			   		<option value="2"> 2 </option>
			   		<option value="3"> 3 </option>    	
			   		<option value="4"> 4 </option>    	
			   		<option value="5"> 5 </option>    	
			   	</select>			
			</div>
			<div style="display:inline-block">
				<input type="submit" value="저장" class="btn btn-success"/>
			</div>
			<div style="display:inline-block">
				<input type="button" value="전체그림출력" onclick="printImg()" class="btn btn-info"/>
			</div>
		</form>
	</div>


  	<hr/>
	<div id="demo"></div>
</div>
<p><br/></p>
</body>
</html>