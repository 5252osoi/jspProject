<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<jsp:include page="/include/bs4.jsp"/>
	<title>jstl3.jsp</title>	
</head>
<body>
	<p><br/></p>
	<div class="container">
		<h2>구구단 연습</h2>
		<form>
			<div>시작단 : <input type="number" name = "starDan" value="2" autofocus class="form-control"/></div>
			<div>끝단 : <input type="number" name = "endDan" value="8" autofocus class="form-control"/></div>
			<div><input type="submit" value="계산" class="btn btn-success"/></div>
		</form>
		<hr/>
		<div id="demo">
			<c:set var="sDan" value="${param.startDan}"/>
			<c:set var="eDan" value="${param.endDan}"/>
			<c:if test="${!empty sDan && !empty eDan}"> </c:if>
			  	<c:forEach var="i" begin="${sDan}" end="${eDan}">
				  	* ${i} 단 * <br/>
				  	<c:forEach var="j" begin="1" end="9">
				  		${i} * ${j} = ${i*j}<br/>
				  	</c:forEach>
				  	<br/>
			  	</c:forEach>
		</div>
	</div>
	<p><br/></p>
</body>
</html>
