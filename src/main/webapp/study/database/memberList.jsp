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
	<title>memberList.jsp</title>	
</head>
<body>
	<p><br/></p>
	<div class="container">
		<h2>전 체 회 원 리 스 트</h2>
		<table class="table table-hover text-center">
			<tr class="table-dark text-dark">
				<th>번호</th>
				<th>아이디</th>
				<th>성명</th>
				<th>최종방문일</th>
				<th>보유포인트</th>
				<th>오늘방문횟수</th>
			</tr>
			<c:forEach var="vo" items="${vos}" varStatus="st">
				<tr>
					<td>${vo.idx}</td>
					<td>${vo.mid}</td>
					<td>${vo.name}</td>
					<td>${fn:substring(vo.lastDate,0,16)}</td>
					<td>${vo.point}</td>
					<td>${vo.todayCount}</td>
				<tr>
			</c:forEach>
			<tr><td colspan="6" class="m-0 p-0"></td></tr>
		</table>
		<br/>
		<div>
			<a href="${ctp}/study/database/memberMain.jsp" class="btn btn-success">돌아가기</a>
		</div>
	</div>
	<p><br/></p>
</body>
</html>