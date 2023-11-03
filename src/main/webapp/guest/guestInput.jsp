<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<jsp:include page="/include/bs4.jsp"/>
	<title>title</title>	
</head>
<body>
<jsp:include page="/include/header.jsp"/>
	<p><br/></p>
	<div class="container">
		<h2 class="text-center">방명록리스트</h2>
		<table class="table table-borderless">
			<tr>
				<td></td>
				<td class="text-right"><a href="${ctp}/guest/guestList.jsp" class="btn btn-info">취소</a></td>
			</tr>
		</table>
		<table class="table table-borderless">
			<tr>
				<td></td>
				<td></td>
			</tr>
		</table>
		<form name="myform" method="post" action="${ctp}/GuestInput">
			<table class="table table-bordered">
				<tr>
					<th>성명</th>
					<td><input type="text" name="name" id="name" class="form-control" required></td>
					<th>메일주소</th>
					<td><input type="text" name="email" id="email" class="form-control"></td>
				</tr>
				<tr>
					<th colspan="2">내용작성</th>
					<th>홈페이지</th>
					<td><input type="text" name="homePage" id="homePage" class="form-control"></td>
				</tr>
				<tr>
					<!-- <td colspan="4"><input type="text" name="content" id="content" style="height:300px;" class="form-control"/></td> -->
					<td colspan="4"><textarea name="content" id="content" rows="8" class="form-control" style="resize:none;" required></textarea></td>
				</tr>
				<tr>
					<td colspan="4"><input type="submit" class="btn btn-success btn-block"></td>
				</tr>
			</table>				
		</form>
	</div>
		
	<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>
