<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<jsp:include page="/include/bs4.jsp"/>
	<title>ajaxTest1.jsp</title>
	<script>
		'use strict'
		//일반아이디검색
		function idCheck(){
		//	let mid = document.myform.value;;
		//	let mid = myform.value;;
		//	let mid = document.getElementById("mid").value;
			let mid = $("#mid").val();
			
			if(mid.trim()==""){
				alert("아이디를 입력하세요");
				$("#mid").focus();
				return false;
			}
			location.href="ajaxTest1Ok.st?mid="+mid;
		}		
	
		//ajax로 아이디검색1
		function idCheck1(){
			let mid = $("#mid").val();
			if(mid.trim()==""){
				alert("아이디를 입력하세요");
				$("#mid").focus();
				return false;
			}
			$.ajax({
				url: "${ctp}/ajaxTest1" ,
				type: "get" ,
				data: {
					mid:mid
				},
				<!--data: {서버에서 받는 변수명:클라이언트값을 담은 변수}-->
				contextType: "application/json",
				charset: "utf-8",
				success: function(res){
					alert("서버에 성공적으로 다녀왔습니다. => "+res);
					//demo.innerHtml = res;
					$("#demo").html(res);
				} ,
				error : function(){
					alert("전송오류");
				}
			});	
		}
		
		function idCheck2(){
			let mid = $("#mid").val();
			if(mid.trim()==""){
				alert("아이디를 입력하세요");
				$("#mid").focus();
				return false;
			}
			
			let query={
				mid : mid
			}
			
			$.ajax({
				url : "${ctp}/ajaxTest2",
				type : "post",
				data : query,
				success:function(res){
					$("#demo").html(res);
					let str = res.split("/");
					$("#tmid").html(str[0]);
					$("#name").html(str[1]);
					$("#point").html(str[2]);
					$("#todayCount").html(str[3]);
				},
				error : function(){
					alert("전송오류");
				}
			});
		}
		function idCheck3(){
			let mid = $("#mid").val();
			if(mid.trim()==""){
				alert("아이디를 입력하세요");
				$("#mid").focus();
				return false;
			}
			$.ajax({
				url : "${ctp}/ajaxTest3",
				type : "post",
				data : {mid:mid},
				success:function(res) {
					$("#demo").html(res);
					/* res=res.substring(res.indexOf("[]")+1,res.lastIndexOf("]")); */
					$("#tmid").html(res.substring(res.indexOf("mid=")+4,res.indexOf(",",res.indexOf("mid="))));
					$("#name").html(res.substring(res.indexOf("name=")+5,res.indexOf(",",res.indexOf("name="))));
					$("#point").html(res.substring(res.indexOf("point=")+6,res.indexOf(",",res.indexOf("point="))));
					$("#todayCount").html(res.substring(res.indexOf("todayCount=")+11,res.indexOf("]")));
				},
				error : function(){
					alert("전송오류");
				}
			});
		}
		function idCheck4(){
			let mid = $("#mid").val();
			if(mid.trim()==""){
				alert("아이디를 입력하세요");
				$("#mid").focus();
				return false;
			}
			$.ajax({
				url : "${ctp}/ajaxTest4",
				type:"post",
				data:{mid:mid},
				success:function(res){
					console.log("res",res); 
					$("#demo").html(res);
					
					let js = JSON.parse(res);
					console.log("js",js); 
					
					$("#tmid").html(js.mid);
					$("#name").html(js.name);
					$("#point").html(js.point);
					$("#todayCount").html(js.todayCount);
				},
				error :function(){
					alert("전송오류")
				}
			});
		}
		
		//아이디체크 5 (vos형식으로 처리)
		function idCheck5(){
			let mid = $("#mid").val();
			if(mid.trim()==""){
				alert("아이디를 입력하세요");
				$("#mid").focus();
				return false;
			}
			$.ajax({
				url : "${ctp}/ajaxTest5",
				type : "post",
				data : {mid : mid},
				success : function(res){
					$("#demo").html(res);
					let js=JSON.parse(res);
					console.log("js",js);
					
					let tMid="",name="",point="",todayCount="";
					for(let j of js){
						tMid+=j.mid+"/";
						name+=j.name+"/";
						point+=j.point+"/";
						todayCount+=j.todayCount+"/";
					}
					$("#tmid").html(tMid);
					$("#name").html(name);
					$("#point").html(point);
					$("#todayCount").html(todayCount);
				},
				error : function(){
					alert("전송오류");
				}
			});
		}
			
	</script>
</head>
<body>
<jsp:include page="/include/header.jsp"/>
	<p><br/></p>
	<div class="container">
		<h2>AJax연습</h2>
		<hr/>
		<form name="myform">
			<div class="input-group mb-3">
				<input type="text" name="mid" id="mid"  class="form-control" placeholder="아이디">
				<div class="input-group-append">
					<button class="btn btn-success" value="아이디일반검색"  onclick="idCheck()" type="submit">Go</button>
				</div>
			</div>
		</form>
		<hr/>
		ajax로 검색 : <br/> 
		<div>
			<input type="button" value="아이디검색1" onclick="idCheck1()" class="btn btn-success"/>
			<input type="button" value="아이디검색2" onclick="idCheck2()" class="btn btn-primary"/>
			<input type="button" value="아이디검색3" onclick="idCheck3()" class="btn btn-info"/>
			<input type="button" value="아이디검색4" onclick="idCheck4()" class="btn btn-danger"/>
			<input type="button" value="아이디검색4" onclick="idCheck5()" class="btn btn-warnning"/>
		</div>
		<hr/>
		<div> 출력결과 <span id="demo"></span></div>
		<hr/>
		<div>
			<div>
				<div>아이디 :<b> <span id="tmid"></span></b></div>
				<div>성명 : <b><span id="name"></span></b></div>
				<div>포인트 : <b><span id="point"></span></b></div>
				<div>오늘 방문카운트 : <b><span id="todayCount"></span></b></div>
			</div>
		</div>
		
		<div><a href="javascript:location.href='/';" class="btn btn-success">돌아가기</a></div>
		
	</div>
	<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>
