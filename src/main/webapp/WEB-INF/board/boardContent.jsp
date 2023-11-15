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
	<title>boardContent.jsp</title>	
	<style>
		th{
			text-align:center;
			background-color: #eee;
		}
	</style>
	<script>
		'use strict';
		//게시글좋아요 조회수 증가(중복불허하기 **세션당한번) 만들어오기
		function goodCheck(){
			$.ajax({
				url		:"boardGoodCheck.bo",
				type	:"post",
				data	:{idx:${vo.idx}},
				success	:function(res){
					if(res == "0") alert('이미 좋아요 버튼을 눌렀습니다.');
					else location.reload();
				},
				error	:function(){
					alert("전송오류")
				}
			});
		}
		//게시글좋아요 중복허용
		function goodCheckPlus(){
			$.ajax({
				url		:"boardGoodCheckPlus.bo",
				type	:"post",
				data	:{idx:${vo.idx}},
				success	:function(res){
					if(res == "0") alert('이미 좋아요 버튼을 눌렀습니다.');
					else location.reload();
				},
				error	:function(){
					alert("전송오류")
				}
			});
		}

		//비추(중복허용)
		function goodCheckMinus(){
			$.ajax({
				url		:"boardGoodCheckMinus.bo",
				type	:"post",
				data	:{idx:${vo.idx}},
				success	:function(res){
					location.reload();
				},
				error	:function(){
					alert("전송오류")
				}
			});
		}
		//게시글삭제
		function boardDelete(){
			let ans = confirm("게시글을 삭제하시겠습니까?");
			if(ans)location.href="boardDelete.bo?idx=${vo.idx}";
		}
	</script>
</head>
<body>
<jsp:include page="/include/header.jsp"/>
	<p><br/></p>
	<div class="container">
		<h2 class="text-center">글 내용보기</h2>
		<table class="table table-bordered m-0 p-0">
			<tr>
				<th>글쓴이</th>
				<td>${vo.nickName}</td>
				<th>작성일</th>
				<td>${fn:substring(vo.wDate,0,16)}</td>
			<tr>
			<tr>
				<th>제목</th>
				<td colspan="3">${vo.title}</td>
			<tr>
			<tr>
				<th>전자메일</th>
				<td>
					<c:if test="${empty vo.email}">없음</c:if>
					<c:if test="${!empty vo.email}">${vo.email}</c:if>
				</td>
				<th>조회수</th>
				<td>${vo.readNum}</td>
			<tr>
			<tr>
				<th>홈페이지</th>
				<td>
					<c:if test="${empty vo.homePage || (fn:indexOf(vo.homePage,'http://')==-1 &&  fn:indexOf(vo.homePage,'https://') == -1) || fn:length(vo.homePage)<10}">없음</c:if>
					<c:if test="${!empty vo.homePage && (fn:indexOf(vo.homePage,'http://')!=-1 ||fn:indexOf(vo.homePage,'https://') !=-1) && fn:length(vo.homePage) >10}"><a href="${vo.homePage}" target="_blank">${vo.homePage }</a></c:if>
				</td>
				<th>좋아요</th>
				<td>
					<a href="javascript:goodCheck()"><font color="red">💗</font></a>${vo.good} / <a href="javascript:goodCheckPlus()"> 👍</a>&nbsp; <a href="javascript:goodCheckMinus()"> 👎</a>
				</td>
			<tr>
			<tr>
				<td colspan="4" style="height:220px">${fn:replace(vo.content, newLine,'<br/>')}</td>
			<tr>
			<tr>
				<td colspan="4" class="text-center">
					<c:if test="${flag!='search'}"><input type="button" value="돌아가기" onclick="location.href='boardList.bo?pag=${pag}&pageSize=${pageSize}';" class="btn btn-warning"/></c:if>
					<c:if test="${flag=='search'}"><input type="button" value="돌아가기" onclick="location.href='boardSearch.bo?pag=${pag}&pageSize=${pageSize}&search=${search}&searchString=${searchString}';" class="btn btn-warning"/></c:if>
					<c:if test="${sMid==vo.mid||sLevel==0}">
						<input type="button" value="수정하기" onclick="location.href='boardUpdate.bo?idx=${vo.idx}&pag=${pag}&pageSize=${pageSize}';" class="btn btn-info"/>
						<input type="button" value="삭제하기" onclick="boardDelete()" class="btn btn-danger"/>
					</c:if>
				</td>
			<tr>
		</table>
		<!-- 이전글/다음글 처리 -->
		<table class="table table-borderless">
			<tr>
				<td>
					<c:if test="${!empty nextVo.title}">
						<a href="boardContent.bo?idx=${nextVo.idx}&pag=${pag}&pageSize=${pageSize}">다음글  ${nextVo.title}</a><br/>
					</c:if>
					<c:if test="${!empty preVo.title}">
						<a href="boardContent.bo?idx=${preVo.idx}&pag=${pag}&pageSize=${pageSize}">이전글  ${preVo.title}</a>
					</c:if>
				</td>
			</tr>
		</table>
	</div>
	<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>
