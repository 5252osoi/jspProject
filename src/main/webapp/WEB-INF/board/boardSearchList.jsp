<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<jsp:include page="/include/bs4.jsp"/>
	<title>boardList.jsp</title>	
	<script>
		'use strict'
		function pageSizeCheck(){
			let pageSize=$("#pageSize").val();
			location.href="boardSearch.bo?pageSize="+pageSize+"&flag=search&search=${search}&searchString=${searchString}";
		}
	</script>	
</head>
<body>
<jsp:include page="/include/header.jsp"/>
	<p><br/></p>
	<div class="container">
		<h2 class="text-center">검색결과</h2>
		${searchTitle} (으)로 ' ${searchString} '(을)를 검색한 결과 ${searchCount} 건 검색되었습니다.
		<table class = "table table-borderless m-0">
			<tr>
				<td class="text-left">
					<a href="boardList.bo?pag=${pag}&pageSize=${pageSize}" class="btn btn-info btn-sm">돌아가기</a>
				</td>
				<td class="text-right">
					<select name="pageSize" id="pageSize" onchange="pageSizeCheck()">
						<option ${pageSize==3 ? "selected" : ""} >3</option>
						<option ${pageSize==5 ? "selected" : ""}>5</option>
						<option ${pageSize==10 ? "selected" : ""}>10</option>
						<option ${pageSize==15 ? "selected" : ""}>15</option>
						<option ${pageSize==20 ? "selected" : ""}>20</option>
					</select>건
				</td>
			</tr>
		</table>
		<table class="table table-hover text-center">
			<tr class="table-dark text-dark">
				<th>글번호</th>
				<th>글제목</th>
				<th>글쓴이</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
			<tr>
				<c:forEach var="vo" items="${vos}" varStatus="st">
					<tr>
						<td>${searchCount}</td>
						<td class="text-left">
							<a href="boardContent.bo?idx=${vo.idx}&pag=${pag}&pageSize=${pageSize}&flag=search&search=${search}&searchString=${searchString}">${vo.title}</a><c:if test="${vo.good>0}"> 💗${vo.good}</c:if>
							<c:if test="${vo.hour_diff<=24}"><img src="${ctp}/images/new.gif"/></c:if>
						</td>
						<td>${vo.nickName}</td>
						<td> <!-- 신규등록글(new.gif)은 시간만 표시시키고, 그렇지 않은 자료는 년월일만 표시 -->
							<c:if test="${vo.hour_diff<=24}">${fn:substring(vo.wDate,10,16)}</c:if>
							<!-- 이런경우는 24시간보다는 날짜가 바뀌면 달라지게끔 만드는게 더 좋다 -->
							<c:if test="${vo.hour_diff>24}">${fn:substring(vo.wDate,2,10)}</c:if>
						</td>
						<td>${vo.readNum}</td>
					</tr>
					<tr><td colspan="5" class="m-0 p-0"></td></tr>
					<c:set var="searchCount" value="${searchCount-1}"/>
				</c:forEach>
			</tr>
		</table>
	</div>
		<!-- 블록페이지 시작(1블록의 크기를 3개(3page)로 한다. -->
		<div class="text-center">
			<ul class="pagination justify-content-center" style="margin:20px 0">
				<c:if test="${pag>1}">
					<li class="page-item">
						<a class="page-link" href="boardSearch.bo?pag=1&pageSize=${pageSize}&flag=search&search=${search}&searchString=${searchString}" title="첫페이지">첫페이지</a>
					</li>
				</c:if>
				<li class="page-item">
					<c:if test = "${curBlock > 0}">
						<a class="page-link" href="boardSearch.bo?pag=${(curBlock-1)*blockSize+1}&pageSize=${pageSize}&flag=search&search=${search}&searchString=${searchString}">이전블록</a>
					</c:if>
				</li>
				<c:forEach var="i" begin="${(curBlock*blockSize)+1}" end="${(curBlock*blockSize)+blockSize}" varStatus="st">
					<c:if test="${i<=totPage}">
						<c:if test="${i==pag}">
							<li class="page-item active">
								<a class="page-link" href = "boardSearch.bo?pag=${i}&pageSize=${pageSize}&flag=search&search=${search}&searchString=${searchString}">${i}</a>
							</li>
						</c:if>
						<c:if test="${i!=pag}">
							<li class="page-item">
								<a class="page-link" href = "boardSearch.bo?pag=${i}&pageSize=${pageSize}&flag=search&search=${search}&searchString=${searchString}">${i}</a>
							</li>
						</c:if>
					</c:if>
				</c:forEach>
				<c:if test = "${curBlock < lastBlock}">
					<li class="page-item">
						<a class="page-link" href="boardSearch.bo?pag=${(curBlock+1)*blockSize+1}&pageSize=${pageSize}&flag=search&search=${search}&searchString=${searchString}">다음블록</a>
					</li>
				</c:if>
				<c:if test="${pag<totPage}">
					<li class="page-item">
						<a class="page-link" href="boardSearch.bo?pag=${totPage}&pageSize=${pageSize}&flag=search&search=${search}&searchString=${searchString}" title="마지막페이지">마지막페이지</a>
					</li>
				</c:if>
			</ul>
		</div>
		<!-- 블록페이지 끝 -->
		<!-- 글 검색기 -->
		<div class="container text-center">
			<form name="searchForm" method="post" action="boardSearch.bo">
				<select name="search" id="search">
					<option value="title" ${search=="title" ? "selected" : ""}>제목</option>
					<option value="nickName" ${search=="nickName" ? "selected" : ""}>작성자</option>
					<option value="content" ${search=="content" ? "selected" : ""}>내용</option>
				</select>
				<input type="text" id="searchString" name="searchString"/>
				<!-- <input type="button" value="검색" onclick="searchCheck()" class="btn btn-secondary btn-sm"/>-->
				<input type="submit" value="검색" class="btn btn-secondary btn-sm"/>
				<input type="hidden" name="pag" value="${pag}"/>
				<input type="hidden" name="pageSize" value="${pageSize}"/>
			</form>
		</div>
		<!-- 검색기끝 -->
	<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>
