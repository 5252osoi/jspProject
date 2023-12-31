<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<jsp:include page="/include/bs4.jsp"/>
	<title>mList.jsp</title>	
	<script>
		'use strict';
		
		function levelSearch(e){
			let level= document.getElementById("lv").value;
			location.href="mList.mem";

		}
		
		//페이징처리하기
		function pageCheck(){
			let pageSize = document.getElementById("pageSize").value;
			location.href="mList.mem?pag=${pag}&pageSize="+pageSize;
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
<jsp:include page="/include/header.jsp" />
	<p><br/></p>
	<div class="container">
		<h2>전체회원 리스트</h2>
		<table class="table table-hover text-center">
			<tr>		
				<td colspan="8" class="text-left">
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
				<th>성별</th>
				<th>공개여부</th>
				<th>오늘방문횟수</th>
				<th>회원등급</th>
			</tr>
			<c:forEach var="vo" items="${vos}" varStatus="st">
				<tr>
					<td>${vo.idx}</td>
					
					<td>
						<c:if test="${vo.userInfor=='공개'||vo.mid==sMid||sLevel==0}">
							<a href="mInfor.mem?mid=${vo.mid}&pag=${pag}&pageSize=${pageSize}">${vo.mid}</a>
						</c:if>
						<c:if test="${vo.userInfor!='공개' && vo.mid!=sMid && sLevel!=0}">
							${vo.mid}
						</c:if>
					</td>
<%-- 					<td><a href="adminMemberInfor.ad?idx=${vo.idx}&pag=${pag}&pageSize=${pageSize}&lv=${lv}">${vo.mid}</a></td> --%>
					<td>${vo.nickName}</td>
					<%-- <td>
						<c:if test="${vo.userInfor=='공개'}"> ${vo.name}</c:if>
						<c:if test="${vo.userInfor!='공개'}">비공개</c:if>
					</td> --%>
					
					<c:if test="${vo.userInfor=='공개'||vo.mid==sMid||sLevel==0}">
						<td>${vo.name}</td>
						<td>${vo.gender}</td>
						<td>${vo.userInfor}</td>
						<td>${vo.todayCnt}</td>
						<td>
							<c:choose>
								<c:when test="${vo.level==0}">관리자</c:when>
								<c:when test="${vo.level==1}">준회원</c:when>
								<c:when test="${vo.level==2}">정회원</c:when>
								<c:when test="${vo.level==3}">우수회원</c:when>
								<c:otherwise>비정상적접근</c:otherwise>
							</c:choose>
						</td>
					</c:if>
					<c:if test="${vo.userInfor!='공개' && vo.mid!=sMid && sLevel!=0}">
						<td colspan="5">비공개</td>
					</c:if>
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
						<a class="page-link" href="mList.mem?pag=1&pageSize=${pageSize}" title="첫페이지">첫페이지</a>
					</li>
				</c:if>
				<li class="page-item">
					<c:if test = "${curBlock > 0}">
						<a class="page-link" href="mList.mem?pag=${(curBlock-1)*blockSize+1}&pageSize=${pageSize}">이전블록</a>
					</c:if>
				</li>
				<c:forEach var="i" begin="${(curBlock*blockSize)+1}" end="${(curBlock*blockSize)+blockSize}" varStatus="st">
					<c:if test="${i<=totPage}">
						<c:if test="${i==pag}">
							<li class="page-item active">
								<a class="page-link" href = "mList.mem?pag=${i}&pageSize=${pageSize}">${i}</a>
							</li>
						</c:if>
						<c:if test="${i!=pag}">
							<li class="page-item">
								<a class="page-link" href = "mList.mem?pag=${i}&pageSize=${pageSize}">${i}</a>
							</li>
						</c:if>
					</c:if>
				</c:forEach>
				<c:if test = "${curBlock < lastBlock}">
					<li class="page-item">
						<a class="page-link" href="mList.mem?pag=${(curBlock+1)*blockSize+1}&pageSize=${pageSize}">다음블록</a>
					</li>
				</c:if>
				<c:if test="${pag<totPage}">
					<li class="page-item">
						<a class="page-link" href="mList.mem?pag=${totPage}&pageSize=${pageSize}" title="마지막페이지">마지막페이지</a>
					</li>
				</c:if>
			</ul>
		</div>
		<!--  블록페이지 끝 -->
		
	</div>
	<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>
