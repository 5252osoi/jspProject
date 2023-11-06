<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% pageContext.setAttribute("newLine", "\n"); %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<jsp:include page="/include/bs4.jsp"/>
	<title>guestList.jsp</title>	
	<script>
		'use strict';
		function delCheck(idx){
			let ans = confirm("현재 게시글을 삭제하시겠습니까?");
			if(ans) location.href="${ctp}/guestDelete?idx="+idx;
		}
		function pageCheck(){
			let pageSize = document.getElementById("pageSize").value;
			location.href="${ctp}/GuestList?pag=${pag}&pageSize="+pageSize;
		}
	</script>
	<style>
		th{
			text-align:center;
		}
	</style>
</head>
<body>
<jsp:include page="/include/header.jsp"/>
	<p><br/></p>
	<div class="container">
		<h2 class="text-center">방명록리스트</h2>
		<table class="table table-borderless">
			<tr>
				<td>
					<c:if test="${sAdmin != 'adminOk'}">
						<a href="${ctp}/guest/adminLogin.jsp" class="btn btn-primary">관리자</a>
					</c:if>
					<c:if test="${sAdmin == 'adminOk'}">
						<a href="${ctp}/adminLogout" class="btn btn-primary">관리자 로그아웃</a>
					</c:if>
				</td>
				<td class="text-right"><a href="${ctp}/guest/guestInput.jsp" class="btn btn-info">글쓰기</a></td>
			</tr>
		</table>
		<table class="table table-borderless m-0 p-0">
			<tr>
				<td>
					<select name="pageSize" id="pageSize" onchange="pageCheck()">
						<option <c:if test="${pageSize==2}">selected</c:if>>2</option>
						<option <c:if test="${pageSize==3}">selected</c:if>>3</option>
						<option <c:if test="${pageSize==5}">selected</c:if>>5</option>
						<option <c:if test="${pageSize==10}">selected</c:if>>10</option>
					</select>건
				</td>
				<!-- 페이지처리시작*(이전/다음) -->
				<td class="text-right">
					<c:if test="${pag>1}">
						<a href="${ctp}/GuestList?pag=1&pageSize=${pageSize}" title="첫페이지"><<</a>
					</c:if>
					<c:if test="${pag>1}">
						<a href="${ctp}/GuestList?pag=${pag-1}&pageSize=${pageSize}" title="이전퍼이지"><</a>
					</c:if>
					${pag}/${totPage}
					<c:if test="${pag<totPage}">
						<a href="${ctp}/GuestList?pag=${pag+1}&pageSize=${pageSize}" title="다음페이지">></a>
					</c:if>
					<c:if test="${pag<totPage}">
						<a href="${ctp}/GuestList?pag=${totPage}&pageSize=${pageSize}" title="마지막페이지">>></a>
					</c:if>
				</td>
				<!-- 페이지처리끝*(이전/다음) -->
			</tr>
		</table>
		<%-- <c:set var="curScrStartNo" value="${curScrStartNo}"/> --%>
		<c:forEach var="vo" items="${vos}" varStatus="st">
		<table class="table table-borderless">
			<tr>
				<td>
					<c:if test="${sAdmin == 'adminOk'}">
							<a href="javascript:delCheck(${vo.idx})" class="btn btn-danger btn-sm">삭제</a>
					</c:if>
				번호 : ${curScrStartNo} 
				</td>
				<td class="text-right">IP : ${vo.hostIp}</td>
			</tr>
		</table>
		<table class="table table-bordered">
			<tr>
				<th>성명</th>
				<td>${vo.name }</td>
				<th>방문일자</th>
				<td>${fn:substring(vo.visitDate,0,19)}</td>
			</tr>
			<tr>
				<th>메일주소</th>
				<td colspan="3">
					<c:if test="${empty vo.email || fn:length(vo.email)<5 || fn:indexOf(vo.email,'@')==-1 || fn.indexOf }"> 🙅 </c:if>
					<c:if test="${!empty vo.email && fn:length(vo.email)>=5 && fn:indexOf(vo.email,'@')!=-1 && fn.indexOf(vo.email,'.')!=-1 }">${vo.email}</c:if>
				</td>
			</tr>
			<tr>
				<th>홈페이지</th>
				<td colspan="3">
					<c:if test="${empty vo.homePage || fn:length(vo.homePage)<10 || fn:indexOf(vo.homePage,'.')==-1}"> 🙅 </c:if>
					<c:if test="${!empty vo.homePage && fn:length(vo.homePage)>=10 && fn:indexOf(vo.homePage,'.')!=-1}"><a href="https://${vo.homePage}"target="_blank">${vo.homePage}</a></c:if>
				</td>
			</tr>
			<tr>
				<th>방문소감</th>
				<td colspan="3">${fn:replace(vo.content, newLine,'<br/>')}</td>
			</tr>
		</table>		
		<c:set var="curScrStartNo" value="${curScrStartNo-1}"/></c:forEach>
		<br/>
		<!-- 블록페이지 시작(1블록의 크기를 3개(3page)로 한다. -->
		<div class="text-center">
			<c:if test = "${curBlock > 0}"><a href="${ctp}/GuestList?pag=${(curBlock-1)*blockSize+1}&pageSize=${pageSize}">이전블록</a></c:if>
			<c:forEach var="i" begin="${(curBlock*blockSize)+1}" end="${(curBlock*blockSize)+blockSize}" varStatus="st">
			<c:if test="${i<=totPage}">
				<a href = "${ctp}/GuestList?pag=${i}&pageSize=${pageSize}">
					<c:if test="${i==pag}"><font color='blue'><b>${i}</b></font></c:if>
					<c:if test="${i!=pag}">${i}</c:if>
				</a>
			</c:if>
			</c:forEach>
			<c:if test = "${curBlock < lastBlock}"><a href="${ctp}/GuestList?pag=${(curBlock+1)*blockSize+1}&pageSize=${pageSize}">다음블록</a></c:if>
		</div>
		<!--  블록페이지 끝 -->
	</div>
	<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>
