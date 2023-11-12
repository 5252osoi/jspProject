<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<jsp:include page="/include/bs4.jsp"/>
	<title>adminMemberList.jsp</title>	
	<script>
		'use strict';
		
		function levelChange(e){
			let ans = confirm("선택한 회원의 등급을 변경하시겠습니까?");
			if(!ans){
				location.reload();
				return false;
			}
			
			let items = e.value.split("/");
			let query={
				idx		: items[1],
				level	: items[0]
			}
			
			$.ajax({
	    		url  : "adminMemberLevelChange.ad",
	    		type : "post",
	    		data : query,
	    		success:function(res) {
	    			if(res != "0") {
	    				alert("등급 수정 완료!");
	    				location.reload();
	    			}
	    			else alert("등급 수정 실패~");
	    		},
	    		error : function() {
	    			alert("전송 오류~");
	    		}
	    	});
		}
		
		function levelSearch(e){
			let level= document.getElementById("lv").value;
			if(level==4){
				location.href="adminMemberList.ad";
				
			} else {
				location.href="AMLS.ad?level="+level;
			}
		}
		
		//페이징처리하기
		function pageCheck(){
			let pageSize = document.getElementById("pageSize").value;
				location.href="adminMemberList.ad?pag=${pag}&pageSize="+pageSize;
		}
		
	</script>
	<style>
		th{
			text-align:center;
		}
		.page-link {
		  color: #000; 
		  background-color: #fff;
		  border: 1px solid #ccc; 
		}
		
		.page-item.active .page-link {
		 z-index: 1;
		 color: #555;
		 font-weight:bold;
		 background-color: #f0f0f0;
		 border-color: #ccc;
		 
		}
		
		.page-link:focus, .page-link:hover {
		  color: #000;
		  background-color: #fafafa; 
		  border-color: #ccc;
		}
	</style>
</head>
<body>
	<p><br/></p>
	<div class="container">
		<h2>전체 회원 리스트</h2>
		<table class="table table-hover text-center">
			<tr>
				<td class="text-left">
					<div> 등급별 검색 </div><!-- (대 충 onchange로 검색하기) -->
					<select name="lv" id="lv" onchange="levelSearch(this)">
						<option value="4" ${lv==4 ? "selected" : ""}>전체보기</option>
						<option value="0" ${lv==0 ? "selected" : ""}>관리자</option>
						<option value="1" ${lv==1 ? "selected" : ""}>준회원</option>
						<option value="2" ${lv==2 ? "selected" : ""}>정회원</option>
						<option value="3" ${lv==3 ? "selected" : ""}>우수회원</option>
					</select>
				</td>			
				<td class="text-left">
					<div> 페이지당 회원수 </div><!-- (대 충 onchange로 검색하기) -->
					<select name="pageSize" id="pageSize" onchange="pageCheck(this)">
						<option ${pageSize==2 ? "selected" : ""}>2</option>
						<option ${pageSize==3 ? "selected" : ""}>3</option>
						<option ${pageSize==5 ? "selected" : ""}>5</option>
						<option ${pageSize==10 ? "selected" : ""}>10</option>
					</select>
				</td>			
			</tr>
			<tr>
				<th>번호</th>
				<th>아이디</th>
				<th>닉네임</th>
				<th>성명</th>
				<th>공개여부</th>
				<th>오늘방문횟수</th>
				<th>탈퇴신청</th>
				<th>레벨</th>
			</tr>
			<c:forEach var="vo" items="${vos}" varStatus="st">
				<tr>
					<td>${vo.idx}</td>
					<td>${vo.mid}</td>
					<td>${vo.nickName}</td>
					<td>${vo.name}</td>
					<td>${vo.userInfor}</td>
					<td>${vo.todayCnt}</td>
					<td>${vo.userDel}</td>
					<td>
						<form name="levelForm">
				            <select name="level" id="level" onchange="levelChange(this)">
				              <option value="0/${vo.idx}" ${vo.level==0 ? "selected" : ""}>관리자</option>
				              <option value="1/${vo.idx}" ${vo.level==1 ? "selected" : ""}>준회원</option>
				              <option value="2/${vo.idx}" ${vo.level==2 ? "selected" : ""}>정회원</option>
				              <option value="3/${vo.idx}" ${vo.level==3 ? "selected" : ""}>우수회원</option>
							</select>
						</form>
					</td>
				</tr>
			</c:forEach>
			<tr><td colspan="8" class="m-0"></td></tr>
		</table>
		<!-- 페이징처리하기 -->
		<c:set var="curScrStartNo" value="${curScrStartNo-1}"/>
		<hr/>
		<!-- 블록페이지 시작(1블록의 크기를 3개(3page)로 한다. -->
		<div class="text-center">
			<ul class="pagination justify-content-center" style="margin:20px 0">
				<c:if test="${pag>1}">
					<li class="page-item">
						<a class="page-link" href="adminMemberList.ad?pag=1&pageSize=${pageSize}" title="첫페이지">첫페이지</a>
					</li>
				</c:if>
				<li class="page-item">
					<c:if test = "${curBlock > 0}">
						<a class="page-link" href="adminMemberList.ad?pag=${(curBlock-1)*blockSize+1}&pageSize=${pageSize}">이전블록</a>
					</c:if>
				</li>
				<c:forEach var="i" begin="${(curBlock*blockSize)+1}" end="${(curBlock*blockSize)+blockSize}" varStatus="st">
					<c:if test="${i<=totPage}">
						<c:if test="${i==pag}">
							<li class="page-item active">
								<a class="page-link" href = "adminMemberList.ad?pag=${i}&pageSize=${pageSize}">${i}</a>
							</li>
						</c:if>
						<c:if test="${i!=pag}">
							<li class="page-item">
								<a class="page-link" href = "adminMemberList.ad?pag=${i}&pageSize=${pageSize}">${i}</a>
							</li>
						</c:if>
					</c:if>
				</c:forEach>
				<c:if test = "${curBlock < lastBlock}">
					<li class="page-item">
						<a class="page-link" href="adminMemberList.ad?pag=${(curBlock+1)*blockSize+1}&pageSize=${pageSize}">다음블록</a>
					</li>
				</c:if>
				<c:if test="${pag<totPage}">
					<li class="page-item">
						<a class="page-link" href="adminMemberList.ad?pag=${totPage}&pageSize=${pageSize}" title="마지막페이지">마지막페이지</a>
					</li>
				</c:if>
			</ul>
		</div>
		<!--  블록페이지 끝 -->
		
	</div>
	<p><br/></p>
</body>
</html>
