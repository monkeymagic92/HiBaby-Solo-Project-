<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세페이지</title>
<link rel="stylesheet" href="/res/css/detail.css">
</head>
<style>
	.detailContainer {
		width: 850px;
		margin: 0 auto;
	}
	
	.imgDiv {
		display: flex;
	}
	
	.selProductFile {
		width: 200px;
		height: 200px;
		margin-left: 12px;
	}
	
	.profileImg {
		width: 150px;
		height: 150px;
	}
			
	
</style>
<body>
<div class="detailContainer">
            <div class="titleDiv">
                <div class="title">
                    ${data.title}
                </div>
                <div class="boardData">조회수(#) ${data.r_dt}</div>
                <div class="data">
                    <c:if test="${data.profile_img == null }">
			     		<img src="/res/img/HiBaby.jpg" onchange="setThumbnail(e)" alt="" class="detailImg" onclick="moveToMyPage(${data.i_user})">
			     	</c:if>
			     	<c:if test="${data.profile_img != null }">
			             <img src="/res/img/HiBaby/profile_img/user/${data.i_user}/${data.profile_img}" class="detailImg" onclick="moveToMyPage(${data.i_user})">                    	
			     	</c:if>
                    <div class="userNick">${data.nick}</div>
                </div>
                <hr>
                
            </div>
            <div class="imgDiv">
                <c:if test="${data.i_board != null}">
                	<c:if test="${data.image_1 == ''}">
                		<h1>사진이 없어요 ㅠㅠ</h1>
                	</c:if>
					<c:if test="${data.image_1 != '' }">
						<img src="/res/img/board/${data.i_board }/${data.image_1}" class="selProductFile" onclick="popup(this.src)">
					</c:if>
					<c:if test="${data.image_2 != '' }">
						<img src="/res/img/board/${data.i_board }/${data.image_2}" class="selProductFile" onclick="popup(this.src)">
					</c:if>					
					<c:if test="${data.image_3 != '' }">
						<img src="/res/img/board/${data.i_board }/${data.image_3}" class="selProductFile" onclick="popup(this.src)">
					</c:if>
					<c:if test="${data.image_4 != '' }">
						<img src="/res/img/board/${data.i_board }/${data.image_4}" class="selProductFile" onclick="popup(this.src)">
					</c:if>
				</c:if>
            </div>
            <hr>

            <!-- ㅡ ㅡ  ㅡ   자바스크립 function aa.hover() 써서 사진 마우스올리면 확대되게-->
            <section class="sectionP">
                <p class="ctntP">${data.ctnt}</p>
            </section>
            <hr>
            <!-- 댓글 -->
            <h3 id="cmtCount">댓글수(#)</h3>
            <div class="cmtTable">
                <form id="frm">
                    <textarea id="cmtIn" type="text" name="cmt" placeholder="댓글을 입력해주세요"></textarea>
                    <button id="cmtInsBtn" onclick="#">등록</button>
                    <button id="cmtCancleBtn" onclick="#">취소</button>
                </form>
            </div>
            <!-- 댓글 목록 -->
            <div id="cmtListBox">
                <div class="cmtList">
                    <img src="/res/img/HiBaby/profile_img/user/${loginUser.i_user }/${loginUser.profile_img}" class="cmtImg">                    	
                    <div class="cmtInfo">
                        <span class="cmtNick">재용아이디임()</span>
                        <div class="cmtData">2020.10.10 12:45</div>
                        <div class="cmtCmt">안녕하세요 첫 댓글 입니다.안녕하세요 첫 댓글 입니다.안녕하세요 첫 댓글 입니다안녕하세요 첫 댓글 입니다.안녕하세요 첫 댓글 입니다.안녕하세요 첫 댓글 입니다.</div>
                        <button id="cmtDel" onclick="cmtDel()">삭제</button>
                    </div>
                </div>
                <hr>
            </div>
            <!-- 더보기 -->
            <div id="divSelMoreCtn"></div> 
        </div>
        
    










	<!-- ㅡ	ㅡ	ㅡ	ㅡ	ㅡ	ㅡ	ㅡㅡ		ㅡㅡ	ㅡ	ㅡ	ㅡ	ㅡ	ㅡ	ㅡ	ㅡ	ㅡ	ㅡ	ㅡ	ㅡ	ㅡ -->


	<!-- 
	<div class="detailContainer">
		<div class="imgDiv">
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
			</c:if>
		</div>
		<br>
		<div>i_user : ${data.i_user}</div>
		<div>닉네임 : ${data.nick }</div>
		<div>제목 : ${data.title }</div>
		<div>내용 : ${data.ctnt }</div>
		<br>
		<c:if test="${loginUser.profile_img == null }">
     		<img src="/res/img/HiBaby.jpg" onchange="setThumbnail(e)" alt="" class="profileImg">
     	</c:if>
     	<c:if test="${loginUser.profile_img != null }">
             <img src="/res/img/HiBaby/profile_img/user/${loginUser.i_user }/${loginUser.profile_img}" class="profileImg">                    	
     	</c:if>
     	<c:if test="${loginUser.i_user == data.i_user}">
     		<button onclick="updBoard(${data.i_board})">수정</button>
     		<button onclick="boardDelete(${data.i_board})">삭제</button>
     	</c:if>
	</div>
	 -->
<script>
	// 글 삭제시 에러떳을경우
	if(${deleteErr != null}) {
		alert('${deleteErr}')
	}
	
	// 글수정 성공시
	if(${updMsg != null}) {
		alert('${updMsg}')
	}
	
	// 이미지 클릭시 팝업창
	function popup(src){
        var url = "popup.html";
        var name = "popup test";
        var option = "width = 850, height = 750, top = 100, left = 100, location = no"
        window.open(src, url, option);
    }
	
	// 글수정
	function updBoard(i_board) {
		location.href="/board/boardReg?i_board="+i_board
	}
	
	// 글삭제
	function boardDelete(i_board) {
		if(confirm('게시글을 삭제하시겠습니까 ?')) {
			location.href="/board/delete?i_board="+i_board	
		}
	}
	
	function moveToMyPage(i_user) {
		location.href="/user/myPage?i_user="+i_user
	}
	
	
</script>
</body>
</html>