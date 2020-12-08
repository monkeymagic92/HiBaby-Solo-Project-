<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세페이지</title>
<link rel="stylesheet" href="/res/css/detail.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
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
                <div class="boardData"><span id="hits" class="material-icons">visibility</span><span id="hitsRs">${data.hits}</span> &nbsp;&nbsp;&nbsp;&nbsp; ${data.r_dt}</div>
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
            <c:if test="${data.image_1 != ''}">
            	<h3>이미지를 클릭하면 크게 볼수 있습니다.</h3>
            </c:if>
            <hr>

            <section class="sectionP">
                <pre class="ctntP">${data.ctnt}</pre>
            </section>
            <hr>
            <div class="utilBtn">
                <button id="utilBtnUpd" onclick="updBoard(${data.i_board})">수정하기</button>
                <button id="utilBtnDel" onclick="boardDelete(${data.i_board})">삭제하기</button>
            </div>
            <!-- 댓글 -->
            <h2 id="cmtCount"></h2>
            <div class="cmtTable">
                <form id="frm">
                    <textarea id="cmtIn" name="ctnt" placeholder="댓글을 입력해주세요"></textarea>
                    <input type="hidden" name="i_cmt" value="0">
                    <input type="button" id="cmtSubmit" onclick="cmtReg()" value="등록">
                    <button type="button" id="cmtCancleBtn" onclick="clkCmtCancle()">취소</button>
                </form>
            </div>



            
            <!-- 작업공간 -->
            <!-- 댓글 목록 -->
            <!-- 
            <div id="cmtListBox">
                <div class="cmtList">
                    <img src="/res/img/HiBaby/profile_img/user/${loginUser.i_user }/${loginUser.profile_img}" class="cmtImg">                    	
                    <div class="cmtInfo">
                        <span class="cmtNick">재용아이디임()</span>
                        <div class="cmtData">2020.10.10 12:45</div>
                        <div class="cmtCmt">안녕하세요 첫 댓글 입니다.안녕하세요 첫 댓글 입니다.안녕하세요 첫 댓글 입니다안녕하세요 첫 댓글 입니다.안녕하세요 첫 댓글 입니다.안녕하세요 첫 댓글 입니다.</div>
                        <button id="cmtDel" onclick="기존껄로하기">삭제</button>
                        <button id="cmtDel" onclick="밑에껄로하기">수정</button>
                    </div>
                </div>
                <hr>
            </div>
             -->
            <!-- 더보기 -->
            <div id="cmtListBox"></div>
            <div id="divSelMoreCtn"></div> 
            <!-- 작업공간 -->
            
            <div class="detailFooter"></div>
        </div>	
        
<script src="https://code.iconify.design/1/1.0.6/iconify.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
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
	
	
	
	
	// 댓글기능 시작
	//ㅡ	ㅡ	ㅡ	ㅡ	ㅡ	ㅡ	ㅡ	ㅡ	ㅡ	ㅡ	ㅡ	ㅡ	ㅡ	ㅡ
	// 업데이트 메소드 만들기 (아작스로)
	function updCmt(ctnt, i_cmt) {
	   frm.ctnt.value = ctnt
	   frm.i_cmt.value = i_cmt
	   cmtSubmit.value = '수정'
	}
	
	
	function clkCmtCancle() {
	   frm.i_cmt.value = 0
	   frm.ctnt.value = ''  //홑따옴표
	   cmtSubmit.value = '등록'
	}
	var cmtList = []
    
	  var cmtCnt = 0;
	   
	   ajaxSelCount();
	
	
   // ajax로 댓글 수 뽑아오기
    function ajaxSelCount() {
    axios.get('/cmt/selCount', {
        params: {
          i_board: `${data.i_board}`,
        }
     
     }).then(function(res) {   
       cmtCnt = res.data;
       cmtCount.innerText = '댓글수' +'(' + cmtCnt + ')';
     })
 }

	
	
	// 댓글 등록 / 수정
	function ajaxPost(i_user, i_board, ctnt, i_cmt) {
      console.log('i_cmt : ' + i_cmt)
      console.log('ctnt : ' + ctnt)
      console.log('i_user : ' + i_user)
      console.log('i_board : ' + i_board)
      
      axios.post('/cmt/cmtReg',{
         i_user : i_user,
         i_board : i_board,
         i_cmt : i_cmt,
         ctnt : ctnt
         
      }).then(function(res) {
         if(res.data == '1') { // 댓글 등록 완료            
            cmtSubmit.value = '등록'
            frm.ctnt.value = ''
            cmtListBox.innerHTML = ''
            ajaxSelCount()
            ajaxSelCmt()
            cmt_pageStart = 0;
            limitCnt = 0;
                  
         } else if(res.data == '3') {
            alert('로그인을 해주세요')
            location.href="/user/login"
            return false;
         }
      })
   }
	
   //댓글 등록
   function cmtReg() {
      const i_user = `${loginUser.i_user}`;
      const i_board = `${data.i_board}`
      const ctnt = frm.ctnt.value
      const i_cmt = frm.i_cmt.value
      
      //console.log('i_cmt : ' + i_cmt)
      //console.log('ctnt : ' + ctnt)
      //console.log('i_user : ' + i_user)
      //console.log('i_board : ' + i_board)
      
      ajaxPost(i_user, i_board, ctnt, i_cmt)
      
   }
	
// 댓글 뿌리기 (첨에 한번 실행 됨)
   function ajaxSelCmt() {
      console.log(`i_board : ${data.i_board}`)
      axios.get('/cmt/selCmt', {
         params: {
            i_board: `${data.i_board}`,
              cmt_pageStart: 0,
              cmt_perPageNum: 5
         }
      
      }).then(function(res) {   
         console.log(res)
         refreshMenu(res.data)
      })
   }
   
   var cmt_pageStart = 0;
   var limitCnt = 0;
   var limit = 0;
   
   // 더보기 기능 페이징
   function ajaxSelMore() {
      axios.get('/cmt/selCmt', {
          params: {
            i_board: `${data.i_board}`,
              cmt_pageStart: cmt_pageStart + 5,
              cmt_perPageNum: 5
          }
       
       }).then(function(res) {   
           cmt_pageStart += 5
           
           ajaxSelCount()
           
        refreshMenu(res.data)
        
         limit = Math.ceil(cmtCnt/5);
         
           if(limitCnt > limit-3) {
              var divSelMoreCtn = document.querySelector("#divSelMoreCtn")
            divSelMoreCtn.innerHTML = '';
           }
           
         limitCnt++
        
       })
   }
   
   function refreshMenu(arr) {
	      for (let i = 0; i<arr.length; i++) {
	         makeCmtList(arr[i])
	      }
	      	      
	      /////////더보기 버튼
	      if(cmtCnt > 5) { 
	         var divSelMoreCtn = document.querySelector("#divSelMoreCtn")
	         
	         divSelMoreCtn.innerHTML = '';
	         
	         var divSelMore =  document.createElement('div')
	         divSelMore.setAttribute('id', 'ajaxSelMore')
	         divSelMore.innerText = '더보기 ▼'
	            divSelMore.onclick = function() {
	                ajaxSelMore();
	         	}
	         
	         divSelMoreCtn.append(divSelMore)
	      }
	}
   
   
   
   	   // 댓글 뿌리는 만드는 공간 ( 12.5 12:10 현재 진행중 )
	   function makeCmtList(arr) {
   		   
		   var cmtList = document.createElement('div')
		   cmtList.setAttribute('class', 'cmtList')
		   cmtListBox.append(cmtList)
		   
		   var cmtImg = document.createElement('img')
		   cmtImg.setAttribute('class', 'cmtImg')
		   if(arr.profile_img != null) {
		       cmtImg.setAttribute('src',`/res/img/HiBaby/profile_img/user/\${arr.i_user}/\${arr.profile_img}`)
	    	  
	       } else {
	          cmtImg.setAttribute('src','/res/img/HiBaby.jpg')
	       }		   
		   cmtList.append(cmtImg)
		   
		   var cmtInfo = document.createElement('div')
		   cmtInfo.setAttribute('class', 'cmtInfo')
		   cmtList.append(cmtInfo)
		   
		   var cmtNick = document.createElement('span')
		   cmtNick.setAttribute('class', 'cmtNick')
		   cmtNick.append(arr.nick)
		   cmtInfo.append(cmtNick)
		   
		   var cmtData = document.createElement('div')
		   cmtData.setAttribute('class', 'cmtData')
		   cmtData.append(arr.r_dt)
		   cmtInfo.append(cmtData)
		   
		   var cmtCmt = document.createElement('div')
		   cmtCmt.setAttribute('class' ,'cmtCmt')
		   cmtCmt.append(arr.ctnt)
		   cmtInfo.append(cmtCmt)
		   
		   // 수정 삭제 hr 만들기 그럼끝
		   var updBtn = document.createElement('a')
		   updBtn.onclick = function(){
	          //////// 수정창으로 올라가게 하기
	          window.scrollTo({top:1, left:0, behavior:'smooth'});
	          updCmt(arr.ctnt, arr.i_cmt);
	       }
		   
		   if(arr.i_user == `${loginUser.i_user}`) {
			   var updBtnSpan = document.createElement('span')
			   updBtnSpan.setAttribute('class', 'updBtnSpan')
			   
			   var updBtnSpanText = document.createElement('span')
			   updBtnSpanText.innerText = '수정하기'
			   
			   var updBtnSpanIconfy = document.createElement('span')
		       updBtnSpanIconfy.setAttribute('class', 'iconify')
		       updBtnSpanIconfy.setAttribute('data-inline', 'false')
		       updBtnSpanIconfy.setAttribute('data-icon', 'si-glyph:arrow-change')
		       updBtnSpanIconfy.setAttribute('style', 'color: #a5a2a2, font-size: 12px, margin-left: 300px, margin-top: 10px')
		      
		       updBtnSpan.append(updBtnSpanIconfy)
		       updBtnSpan.append(updBtnSpanText)
		       updBtn.append(updBtnSpan)
		       
		       cmtInfo.append(updBtn)
			   
		       
		       var delBtn = document.createElement('a')
		       
		       delBtn.onclick = function(){
		         var chkDelCmt = confirm('삭제하시겠습니까?');
		         if(chkDelCmt) {
		          delCmt(arr.i_cmt);           
		         } else {
		           return false;          
		         }
		       }
		       
		       var delBtnSpan = document.createElement('span')
		       delBtnSpan.setAttribute('class', 'delBtnSpan')
		       
		       var delBtnSpanText = document.createElement('span')
		       delBtnSpanText.innerText = '삭제하기'
		       
		       var delBtnSpanIconfy = document.createElement('span')
		       delBtnSpanIconfy.setAttribute('class', 'iconify icon-del')
		       delBtnSpanIconfy.setAttribute('data-inline', 'false')
		       delBtnSpanIconfy.setAttribute('data-icon', 'ant-design:delete-outlined')
		       delBtnSpanIconfy.setAttribute('style', 'color: #a5a2a2, font-size: 16px')
		       
		       delBtnSpan.append(delBtnSpanIconfy)
		       delBtnSpan.append(delBtnSpanText)
		       delBtn.append(delBtnSpan)
		       
		       cmtInfo.append(delBtn)
		   }
	   }
   	   
   	   
   // 댓글 뿌리기
   ajaxSelCmt();

	// 댓글 삭제
   function delCmt(i_cmt) {
      console.log('삭제값 : ' + i_cmt)            
      axios.post('/cmt/delete', {
         i_cmt : i_cmt,
         
      }).then(function(res) {
       
         if(res.data == '1') { // 댓글 삭제 완료
            cmtListBox.innerHTML = '';
            ajaxSelCount();
            console.log('delcnt : ' + cmtCnt);
             if(cmtCnt < 7) {
                divSelMoreCtn.innerHTML = '';
             }
             cmt_pageStart = 0;
             limitCnt = 0;
            ajaxSelCmt();
         } else if(res.data == '2') {
            alert("잘못된 접근방식 입니다");
            location.href="/user/login";
            return false;
         } 
      })
   }
		
	//	ㅡ	ㅡ	ㅡ	ㅡ	ㅡ	ㅡ	ㅡ	ㅡ	ㅡ	ㅡ	ㅡ	ㅡ	ㅡ	ㅡ
</script>
</body>
</html>