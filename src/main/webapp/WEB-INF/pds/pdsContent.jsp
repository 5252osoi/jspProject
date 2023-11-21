<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<% pageContext.setAttribute("newLine","\n"); %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<jsp:include page="/include/bs4.jsp"/>
	<title>pdsContent.jsp</title>	
	<script>
		'use strict';
		//다운로드 수 증가시키기
		function downNumCheck(idx){
			$.ajax({
				url		:"pdsDownNumCheck.pds",
				type	:"post",
				data	:{idx:idx},
				success	:function(){
					location.reload();
				},
				error:function(){
					alert("응답없음")	
				}
			})	;
		}
		function reviewCheck(){
			let star = starForm.star.value;
			let review = $("#review").val();
			
			if(star == ""){
				alert("별점을 부여해주세요");
				return false;
			}
			let query={
					part	: 'pds',
					partIdx	: ${vo.idx},
					mid		: '${sMid}',
					star	: star,
					content	: review
			}
			$.ajax({
				url		:"reviewInput.ad",
				type	:"post",
				data	:query,
				success:function(res){
					if(res=="1"){
						alert("리뷰가 등록되었습니다.");
						location.reload();
					} else alert("리뷰 등록 실패");
				},
				error:function(){
					alert("전송오류");
				}
			});
			
		}
	</script>
	<style>
	th {
		background-color:#eee;
	}
	/*별점 스타일 설정*/

	#starForm fieldset{
		direction:rtl;
	}
	#starForm input[type=radio]{
		display:none;
	}
	#starForm label{
		font-size:1.8em;
		color:transparent;
		text-shadow: 0 0 0 lightgray;
	}
	#starForm label:hover{
		text-shadow: 0 0 0 orange;
	}
	#starForm label:hover ~ label{
		text-shadow: 0 0 0 orange;
	}
	#starForm input[type=radio]:checked ~ label{
		text-shadow: 0 0 0 orange;
	}
	
	</style>
</head>
<body>
<jsp:include page="/include/header.jsp"/>
	<p><br/></p>
	<div class="container">
		<h2>자료 상세보기</h2>
		<br/>
		<table class="table table-bordered text-center">
			<tr>
				<th>업로더</th>
				<td>${vo.nickName}</td>
				<th>올린날짜</th>
				<td>${fn:substring(vo.fDate,0,fn:length(vo.fDate)-5)}</td>
			</tr>
			<tr>
				<th>파일명</th>
				<td>
					<c:set var="fNames" value="${fn:split(vo.fName,'/')}"/>
					<c:set var="fSNames" value="${fn:split(vo.fSName,'/')}"/>
					<c:forEach var="fName" items="${fNames}" varStatus="st">
						<a href="${ctp}/images/pds/${fSNames[st.index]}" download="${fName}" onclick="downNumCheck(${vo.idx})">${fName}<br/></a>
					</c:forEach>
					(<fmt:formatNumber value="${vo.fSize/1024}" pattern="#,##0"/> KByte)
				</td>
				<th>다운횟수</th>
				<td>${vo.downNum }</td>
			</tr>
			<tr>
				<th>분류</th>
				<td>${vo.part }</td>
				<th>접속IP</th>
				<td>${vo.hostIp }</td>
			</tr>
			<tr>
				<th>제목</th>
				<td colspan="3">${vo.title}</td>
			</tr>
			<tr>
				<th>상세내역</th>
				<td colspan="3">${fn:replace(vo.content,newLine,'<br/>')}</td>
			</tr>
			<tr>
				<td colspan="4">
					<input type="button" value="돌아가기" onclick="location.href='pdsList.pds?pag=${pag}&pageSize${pageSize}&part=${part}';" class="btn btn-secondary"/>
				</td>
			</tr>
		</table>
		<hr/>
		<div>
			<span>별점 평균 : <fmt:formatNumber value="${reviewAvg}" pattern="#,##0.0"/></span>
			<form name="starForm" id="starForm" method="post">
				<fieldset style="border:none;" class="m-0">
					<div class="text-left viewPoint">
						<input type="radio" name="star" value="5" id="star1"><label for="star1">★</label>
						<input type="radio" name="star" value="4" id="star2"><label for="star2">★</label>
						<input type="radio" name="star" value="3" id="star3"><label for="star3">★</label>
						<input type="radio" name="star" value="2" id="star4"><label for="star4">★</label>
						<input type="radio" name="star" value="1" id="star5"><label for="star5">★</label>
						<span class="text-bold"> : 리뷰등록 ⭐ </span>
					</div>
				</fieldset>
				<div>
					<textarea name="review" id="review" rows="3" class="form-control mb-1" placeholder="별점 후기를 남겨주시면 100포인트를 지급합니다."></textarea>
				</div>
				<div>
					<input type="button" onclick="reviewCheck()" value="별점/리뷰등록" class="btn btn-info btn-sm form-control"/>
				</div>
			</form>
		</div>
		<hr/>
		<c:forEach var="vo" items="${rVos}" varStatus="st">
			<div id="reviewBox">
				<div class="row">
					<div class="col text-left"><b>${vo.mid}</b> ${fn:substring(vo.rDate,0,10)}</div>
					<div class="col"></div>
					<div class="col text-right">
						<c:forEach var="i" begin="1" end="${vo.star}" varStatus="iSt">
							<font color="orange">★</font>
						</c:forEach>
						<c:forEach var="i" begin="1" end="${5-vo.star}" varStatus="iSt">
							<font color="lightgrey">★</font>
						</c:forEach>
					</div>
				</div>
				<div class="row border">
					${fn:replace(vo.content,newLine,'<br/>')}
				</div>
			</div>
			<hr/>
		</c:forEach>
		<div class="text-center">
			<c:forEach var="fSName" items="${fSNames}" varStatus="st">
				${st.count}.${fSName}<br/>
				<c:set var="len" value="${fn:length(fSName)}"/>
				<c:set var="ext" value="${fn:substring(fSName,len-3,len)}" />
				<c:set var="extLower" value="${fn:toLowerCase(ext)}"/>
				<c:if test="${extLower == 'jpg' || extLower == 'gif' || extLower == 'png'}">
					<img src="${ctp}/images/pds/${fSName}" width="85%"/>
				</c:if>
				<hr/>
			</c:forEach>
		</div>
	</div>
	<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>
