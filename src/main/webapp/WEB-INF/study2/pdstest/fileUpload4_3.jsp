<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>fileUpload4.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
  <script>
    'use strict';
    
    function fCheck() {
    	let fName = document.getElementById("file").value;
    	if(fName.trim() == "") {
    		alert("업로드할 파일을 선택하세요!");
    		return false;
    	}
    	
    	//let ext = fName.substring(fName.lastIndexOf(".")+1).toLowerCase();
    	let maxSize = 1024 * 1024 * 20;   // 1KByte=1024Byte=10^3Byte=2^10Byte, 1MByte=2^20Byte=10^6Byte, 1GByte=2^30Byte=10^9Byte, 1TByte=2^40Byte=10^12Byte)
    	let fileCount = document.getElementById("file").files.length;
    	let fileSize = 0;
    	let fileName = "";
    	let ext;
    	fName = ""

    	// 업로드 파일명을 시간명으로 변경처리하기위함.
  		let today = new Date();
    	let year = today.getFullYear();
    	let month = ('0' + (today.getMonth() + 1)).slice(-2);
    	let day = ('0' + today.getDate()).slice(-2);
    	let hours = ('0' + today.getHours()).slice(-2); 
    	let minutes = ('0' + today.getMinutes()).slice(-2);
    	let seconds = ('0' + today.getSeconds()).slice(-2); 
    	let milliseconds = today.getMilliseconds(); // 밀리초
    	let strToday = year + month + day + hours + minutes + seconds + milliseconds;
  	  
    	for(let i=0; i<fileCount; i++) {
    	  fileName = document.getElementById("file").files[i].name;
    	  ext = fileName.substring(fileName.lastIndexOf(".")+1).toLowerCase();
    	  
	    	if(ext != 'jpg' && ext != 'gif' && ext != 'png' && ext != 'zip' && ext != 'hwp' && ext != 'ppt' && ext != 'pptx' && ext != 'xlsx') {
	    		alert("업로드 가능한 파일은 'jgp/gif/png/zip/hwp/ppt/pptx/xlsx' 만 가능합니다.");
	    		return false;
	    	}
	    	else {
	    	  fileSize += document.getElementById("file").files[i].size;
	    	  
	    	  // 업로드할 파일명 변경해서 업로드 시키기
	        let newFile = null // 새로운 파일이름인 newFile 선언
	        switch (ext) {
            case 'jpg': //jpg일 경우
              newFile = new File([fileName], strToday+'.jpg', { type: fileName.type }) // File생성자를 이용해서 oldFile의 이름을 바꿔준다
              //setImgs((prev) => [...prev, newFile]) // 저장
              break;
            case 'gif':
              newFile = new File([fileName], strToday+'.gif', { type: fileName.type })
              //setImgs((prev) => [...prev, newFile])
              break;
            case 'png':
              newFile = new File([fileName], strToday+'.png', { type: fileName.type })
              //setImgs((prev) => [...prev, newFile])
              break;
            default:
              alert('지원하지 않는 파일 형식입니다.')
              return false;
              break
	        }
	    	  
	    	  fName += fileName + "/";
	    	}
    	}
    	fName = fName.substring(0,fName.length-1);
    	
    	if(fileSize > maxSize) {
    		alert("업로드할 파일의 최대용량은 20MByte입니다.");
    	}
    	else {
    		myform.submit();
    	}
    	
    }
    
    // 업로드시키는 파일의 정보를 가져와서 이미지를 브라우져에 출력시켜주기(이미지파일만 처리했다.)
    $(function(){
    	$("#file").on("change", function(e){
    		document.getElementById("pdsDemo").innerHTML = null;	// 기존에 존재하는 그림들이 있으면 먼저 없애고 작업을 시작한다.
    		
    		// 그림파일 체크
    		let files = e.target.files;
    		let filesArr = Array.prototype.slice.call(files);
    		
    		//console.log('filesArr',filesArr);
    		
    		filesArr.forEach(function(f){
    			if(!f.type.match("image.*")) {
    				alert("업로드할 파일은 이미지파일만 가능합니다.");
    			}
    		});
    		
    		// 멀티파일 이미지 미리보기
    		let imgCount = e.target.files.length;
    		//let i = 0;
    		for(let image of files) {
    			let img = document.createElement("img");
    			let reader = new FileReader();
    			reader.onload = function(e) {
    				img.setAttribute("src", e.target.result);
    				img.setAttribute("width", 200);
    			}
    			reader.readAsDataURL(e.target.files[--imgCount]);
    			document.querySelector(".demo").append(img);
    			
    			// 파일명 1개씩 가져오기
    			//console.log("File Name : ", e.target.files[i].name);
    			//i++;
    		}
    	});
    });
  </script>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<p><br/></p>
<div class="container">
  <h2>파일 업로드 연습(멀티파일처리)</h2>
  <p>COS라이브러리를 이용한 파일 업로드</p>
  <div>(http://www.servlets.com/cos/)</div>
  <hr/>
  <form name="myform" method="post" action="fileUpload4Ok.st" enctype="multipart/form-data">
    파일명(그림파일만업로드) :
    <div>
	    <input type="file" name="fName" id="file" multiple class="form-control-file mb-2 border"/>
    </div>
    <input type="button" value="전송" onclick="fCheck()" class="btn btn-success form-control mb-2"/>
  </form>
  <div class="demo" id="pdsDemo"></div>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>