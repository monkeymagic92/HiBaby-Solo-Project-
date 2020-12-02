<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.boardRegContainer {
	width: 850px;
	margin: 0 auto;
}

.selProductFile {
   width: 150px;
    height: 150px;
    margin: 0px 5px 10px 10px;
    object-fit: cover;
}

.pics2 input[type="file"]{
    width: 0;
    height: 0;
    padding: 0;
    border: 0;
    z-index: -1;
    overflow: hidden; 
}
      

</style>
</head>
<body>

	<div class="boardRegContainer">
		<form id="frm" action="/board/boardReg" method="post" enctype="multipart/form-data" onsubmit="return chk()">
			<div class="pics2">
                <label for="mfile">
					<img src="/res/img/이미지등록.jpg"  alt="" class="img2"  id="imgId">
                </label>
				<input type="file" name="images"  id="mfile" multiple accept="image/png, image/jpeg, image/jpg">
				<c:if test="${data.i_board != null}">
					<c:if test="${data.image_1 != '' }">
						<img src="/res/img/board/${data.i_board }/${data.image_1}" class="selProductFile">
					</c:if>
					<c:if test="${data.image_2 != '' }">
						<img src="/res/img/board/${data.i_board }/${data.image_2}" class="selProductFile">
					</c:if>					
					<c:if test="${data.image_3 != '' }">
						<img src="/res/img/board/${data.i_board }/${data.image_3}" class="selProductFile">
					</c:if>
					<c:if test="${data.image_4 != '' }">
						<img src="/res/img/board/${data.i_board }/${data.image_4}" class="selProductFile">
					</c:if>
					<c:if test="${data.image_5 != '' }">
						<img src="/res/img/board/${data.i_board }/${data.image_5}" class="selProductFile">
					</c:if>
				</c:if>
            </div>
            <br>
            <div>
            	<input type="text" name="title" placeholder="제목 입력"><br>
            </div>
            <div>
            	<textarea rows="10" cols="40" placeholder="내용 입력" name="ctnt"></textarea><br>
            </div>
            <input type="hidden" name="i_user" value="${loginUser.i_user }">
            <button type="submit">${data.i_board == null ? '글등록' : '글수정'}</button>
		</form>
	</div>
	
<script src="/res/js/boardReg.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>

// 비로그인시 글쓰기에 접근할경우
if(${loginMsg != null}) {
	alert('${loginMsg}')
	location.href="/user/login"
}


if(${ImageFail != null}) {
	alert('${ImageFail}')
}

if(${serverErr != null}) {
	alert('${serverErr}')
}


//--------@multiple image preview-----------//
var sel_files = [];

 $(document).ready(function() {
     $("#mfile").on("change", handleImgFileSelect);
 }); 
 
 function handleImgFileSelect(e) {
     $(".selProductFile").remove();

     sel_files = [];
   
     //파일 길이
     var files = e.target.files;
     
     if(files.length > 4) {
         alert('이미지는 4장만 업로드 가능합니다.');
         document.getElementById("mfile").value = "";
         return false;
     }
     
     //파일 길이를 배열로 바꿔줌
     var filesArr = Array.prototype.slice.call(files);
 
     var index = 0;
     filesArr.forEach(function(f) {
         
         if(!f.type.match("image.*")) {
             alert("이미지만 업로드 가능합니다.");
             return;
         } 

         sel_files.push(f)
        

         var reader = new FileReader();

         reader.onload = function(e) {
             var html = "<img src=\"" + e.target.result + "\"class='selProductFile'>";
             $(".pics2").append(html);
            
         }

         reader.readAsDataURL(f);
     });

 }
//--------@multiple image preview-----------//	
</script>
</body>
</html>