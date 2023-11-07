<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<jsp:include page="/include/bs4.jsp"/>
	<title>test5_3.jsp</title>	

</head>
<body>
<jsp:include page="/include/header.jsp"/>
	<p><br/></p>
	<div class="container text-center">
		<h2>URL매핑(확장자매핑)</h2>
		<p>이곳은 test5_3.jsp입니다.</p>
		<hr/>
		<img src="${ctp}/images/5.png" width="300px"/>
		<hr/>
		<div>
			<input type="button" value="test5_1.jsp" onclick="location.href='${ctp}/mapping/test5.do';" class="btn btn-success m-3"/>
			<input type="button" value="test5_2.jsp" onclick="location.href='${ctp}/mapping/test5_2.do';" class="btn btn-primary m-3"/>
		</div>
		<hr/>
		<div>
			<div> 
				<form name = "myform" method="post" >
					<input type="number" name="su1" id="su1" value="${empty su1 ? 0 : su1}" class="form-control mb-2"/>
					<input type="number" name="su2" id="su2" value="${empty su2 ? 0 : su2}" class="form-control mb-2"/>
				</form>
			</div>
			<div>두 수의 합 : ${hap}</div>
			<div>두 수의 차 : ${cha}</div>
		</div>
		<hr/>
		<pre>
			test1.jsp/test2.jsp/test3.jsp 파일에 접속시키고 해당 파일이 화면에 파일명을 출력하시오.
			test4.jsp 클릭시 test1.jsp화면에 입력된 su1,su2의 내용에 해당되는 합/차를 구해서 test1.jsp에 출력시키시오.
			(단, test4컨트롤러는 이동지시만 하고 계산은 test4Service에서 처리)
		</pre>
	</div>
	<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>
