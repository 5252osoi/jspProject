<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="/include/loginCheck.jsp" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>memberList.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
</head>
<body>
<jsp:include page="/include/header.jsp"/>
<p><br/></p>
<div class="container text-center">
  <h2 class="mb-4">전 체 회 원 리 스 트</h2>
  <table class="table table-hover text-center">
    <tr class="table-dark text-dark">
      <th>번호</th>
      <th>아이디</th>
      <th>성명</th>
      <th>최종방문일</th>
      <c:if test="${sMid=='admin'}"><th>포인트</th></c:if>
      <th>오늘방문횟수</th>
    </tr>
    <c:forEach var="vo" items="${vos}" varStatus="st">
      <tr>
        <td>${vo.idx}</td>
        <td>${vo.mid}</td>
        <td>${vo.name}</td>
        <td>${fn:substring(vo.lastDate,0,16)}</td>
        <c:if test="${sMid=='admin'}"><td>${vo.point}</td></c:if>
        <td>${vo.todayCount}</td>
      </tr>
    </c:forEach>
    <tr><td colspan="6" class="m-0 p-0"></td></tr>
  </table>
  <br/>
  <div class="text-center">
  	<ul class="pagination justify-content-center" style="margin:20px 0">
  		<c:if test="${pg>1}">
  			<li class="page-item">
  				<a class="page-link" href="${ctp}/database/memberList?pg=1">첫페이지</a>
  			</li>
  		</c:if>
  		<c:if test="${curBlock>0}">
  			<li class="page-item">
  				<a class="page-link" href="${ctp}/database/memberList?pg=${(curBlock-1)*blockSize+1}">이전블록</a>
  			</li>
  		</c:if>
		<c:forEach var="i" begin="${(curBlock*blockSize)+1}" end="${(curBlock*blockSize)+blockSize}" varStatus="st">
			<c:if test="${i<=totPage}">
				<c:if test="${i==pg}">
					<li class="page-item active">
						<a class="page-link" href="${ctp}/database/memberList?pg=${i}&pageSize">${i}</a>
					</li>
				</c:if>
				<c:if test="${i!=pg}">
					<li class="page-item">
						<a class="page-link" href="${ctp}/database/memberList?pg=${i}">${i}</a>
					</li>
				</c:if>
			</c:if>
		</c:forEach>

  		<c:if test="${curBlock<lastBlock}">
  			<li class="page-item">
  				<a class="page-link" href="${ctp}/database/memberList?pg=${(curBlock+1)*blockSize+1}&pageSize=${pageSize}">다음블록</a>
  			</li>
  		</c:if>
  		<c:if test="${pg<totPage}">
  			<li class="page-item">
  				<a class="page-link" href="${ctp}/database/memberList?pg=${totPage}">끝페이지</a>
  			</li>
  		</c:if>
  	</ul>
  </div>
  <div>
    <a href="${ctp}/study/database/memberMain.jsp" class="btn btn-success">돌아가기</a>
  </div>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>