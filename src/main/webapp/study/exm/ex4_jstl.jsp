<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<jsp:include page="/include/bs4.jsp"/>
	<title>ex4_jstl.jsp</title>	
</head>
<body>
	<p><br/></p>
	<div class="container">
		<pre>
		콤보상자에 숫자 1~5까지 기억시키고 화면에 보여준다.
		이 때 숫자를 선택하면 아래쪽(demo)로 선택한 숫자의 그림파일을 출력시켜주시오.
		콤보상자 옆에 텍스트 박스를 만들어주고 그곳에 아래 출력된 파일의 "이름"을 적어 준 후 "저장"버튼을 클릭하여 저장시켜준다.
		'전체그림출력' 버튼을 만들어서 이 버튼을 눌렀을 때 지금까지 저장된 그림파일들을 모두 demo 에 차례대로 출력시켜줄 수 있도록 한다.
		</pre>
		
	</div>
	<p><br/></p>
</body>
</html>
