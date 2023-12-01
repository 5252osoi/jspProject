<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>title</title>
  <jsp:include page="/include/bs4.jsp" />
  <style>
		ul, #myUL {
		  list-style-type: none;
		}
		
		#myUL {
		  margin: 0;
		  padding: 0;
		}
		
		.menu {
		  cursor: pointer;
		  user-select: none;		/* 드래그, 더블클릭시 범위설정으로 선택되지 않도록 처리, 기본은 auto */
		  margin: 3px;
		}
		
		.menu::before {
		  content: "\25B6";		/* 선택한 요소의 앞이나 뒤에 텍스트, 이미지 등을 추가한다. :앞의 번호는 '화살표기호'이다. */
		  color: black;
		  display: inline-block;
		  margin-right: 6px;
		}
		
		.menu-down::before {
		  transform: rotate(90deg);  
		}
		
		.nested {
		  display: none;
		  user-select: none;
		}
		
		.active {
		  display: block;
		}
		
	</style>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<p><br/></p>
<div class="container">
	<h2>Tree Menu</h2>
	<p>Tree Menu Test</p>
	<p>화살표를 클릭하시면 하위메뉴가 열리고/닫힙니다.</p>
	
	<ul id="myUL">
	  <li><span class="menu"><a href="#">좋아하는산</a></span>
	    <ul class="nested">
	      <li><a href="#">서울지역</a></li>
	      <li><a href="#">경기지역</a></li>
	      <li><span class="menu"><a href="#">충북지역</a></span>
	        <ul class="nested">
	          <li><a href="#">청주</a></li>
	          <li><a href="#">옥천</a></li>
	          <li><span class="menu"><a href="#">괴산</a></span>
	            <ul class="nested">
	              <li><a href="#">월악산</a></li>
	              <li><a href="#">군자산</a></li>
	              <li><a href="#">희양산</a></li>
	              <li><a href="#">칠보산</a></li>
	            </ul>
	          </li>
	        </ul>
	      </li>  
	    </ul>
	  </li>
	  <li><span class="menu"><a href="#">좋아하는음료</a></span>
	    <ul class="nested">
	      <li><a href="#">Water</a></li>
	      <li><span class="menu"><a href="#">Coffee</a></span>
	        <ul class="nested">
	          <li><a href="#">에스프레소</a></li>
	          <li><a href="#">아메리카노</a></li>
	          <li><a href="#">카푸치노</a></li>
	          <li><a href="#">카페라떼</a></li>
	          <li><a href="#">카페모카</a></li>
	          <li><a href="#">캐러멜마키아토</a></li>
	          <li><a href="#">아포가토</a></li>
	          <li><a href="#">비엔나커피</a></li>
	          <li><span class="menu"><a href="#">맥심커피</a></span>
	            <ul class="nested">
	              <li><a href="#">오리지날</a></li>
	              <li><a href="#">슈프림골드</a></li>
	              <li><a href="#">카누</a></li>
	              <li><a href="#">모카골드</a></li>
	              <li><a href="#">화이트골드</a></li>
	            </ul>
	          </li>
	        </ul>
	      </li>
	      <li><span class="menu"><a href="#">국내커피점</a></span>
	        <ul class="nested">
	          <li><a href="#">스타벅스</a></li>
	          <li><a href="#">튜썸플레이스</a></li>
	          <li><a href="#">탐앤탐스</a></li>
	          <li><a href="#">파스쿠찌</a></li>
	          <li><a href="#">파스쿠찌</a></li>
	          <li><a href="#">이디아</a></li>
	          <li><a href="#">앤제리너스</a></li>
	        </ul>
	      </li>  
	    </ul>
	  </li>
	</ul>
	
	<script>
		let toggler = document.getElementsByClassName("menu");
		let i;
		
		for (i = 0; i < toggler.length; i++) {
		  toggler[i].addEventListener("click", function() {
		    this.parentElement.querySelector(".nested").classList.toggle("active");
		    this.classList.toggle("menu-down");
		  });
	}
	</script>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>