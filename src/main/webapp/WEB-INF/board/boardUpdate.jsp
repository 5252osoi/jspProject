<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<jsp:include page="/include/bs4.jsp"/>
	<title>boardInput.jsp</title>
	<style>
		th{
			text-alignL:center;
			background-color: #eee;
		}
	</style>	
</head>
<body>
<jsp:include page="/include/header.jsp"/>
	<p><br/></p>
	<div class="container">
		<h2>게시판 글쓰기</h2>
		<form name = "myform" method="post" action = "boardUpdateOk.bo">
			<table class="table table-bordered">
				<tr>
					<th>글쓴이</th>
					<td>${sNickName}</td>
				</tr>			
				<tr>
					<th>글제목</th>
					<td><input type="text" name="title" id="title" value="${vo.title}" autofocus required class="form-control" ></td>
				</tr>			
				<tr>
					<th>이메일</th>
					<td><input type="text" name="email" id="email" value="${vo.email}"  class="form-control" ></td>
				</tr>			
				<tr>
					<th>홈페이지</th>
					<td><input type="text" name="homePage" id="homePage" value="${vo.homePage}"  class="form-control" ></td>
				</tr>			
				<tr>
					<th>내 용</th>
					<td><textarea rows="10" name="content" id="content" class="form-control" required>${vo.content}</textarea></td>
				</tr>			
				<tr>
					<th>공개 여부</th>
					<td>
						<input type="radio" name="openSw" value="OK" <c:if test="${vo.openSw=='OK' }">checked</c:if> />공개 &nbsp;
						<input type="radio" name="openSw" value="NO" <c:if test="${vo.openSw=='NO' }">checked</c:if> />비공개
					</td>
				</tr>			
				<tr>
					<td colspan="2" class="text-center">
						<input type="submit" value="수정하기" class="btn btn-success"/> &nbsp;
						<input type="button" onclick="location.href='boardList.bo?pag=${pag}&pageSize=${pageSize}';" value="취소" class="btn btn-success"/>
					</td>
				</tr>
			</table>
			<input type="hidden" name="idx" value="${vo.idx}"/>
			<input type="hidden" name="pag" value="${pag}"/>
			<input type="hidden" name="pageSize" value="${pageSize}"/>
			<input type="hidden" name="hostIp" value="${pageContext.request.remoteAddr}" />
		</form>
	</div>
	<p><br/></p> 
<jsp:include page="/include/footer.jsp"/>
</body>
</html>
