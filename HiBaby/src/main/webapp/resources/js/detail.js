/**
 * 
 */

function makeCmtList(arr) {
	      
      var divCommentWrap = document.createElement('div')
      divCommentWrap.setAttribute('id', 'commentWrap')
   
      var divCommentProfileImg = document.createElement('div')
      divCommentProfileImg.setAttribute('class', 'comment-profile-img')
      
      var profileImg = document.createElement('img')
      profileImg.setAttribute('class', 'profileImg')
      
      if(arr.profile_img != null) {
	      profileImg.setAttribute('src',`/res/img/HiBaby/profile_img/user/\${arr.i_user}/\${arr.profile_img}`)
    	  
      } else {
         profileImg.setAttribute('src','/res/img/lion.jpg')
      }
      
      
      divCommentProfileImg.append(profileImg)
      divCommentWrap.append(divCommentProfileImg)
      
      
      var divCommentProfileDesc = document.createElement('div')
      divCommentProfileDesc.setAttribute('class','comment-profile-desc')
      
      var divNick = document.createElement('div')
      divNick.setAttribute('class','nick')
      divNick.append(arr.nick)
      var spanDate = document.createElement('span')
      spanDate.setAttribute('class', 'date')
      spanDate.append(arr.r_dt)
      divNick.append(spanDate)
      
      divCommentProfileDesc.append(divNick)
      
      var divComment = document.createElement('div')
      divComment.setAttribute('class', 'comment')
      divComment.append(arr.ctnt)
      
      divCommentProfileDesc.append(divComment)
      
      var divEtc = document.createElement('div')
      divEtc.setAttribute('class', 'etc')
      
      var updBtn = document.createElement('a')
      updBtn.onclick = function(){
         //////// 수정창으로 올라가게 하기
        window.scrollTo({top:10, left:5, behavior:'smooth'});
         updCmt(arr.ctnt, arr.i_cmt);
      }
      
      if(arr.i_user == `${loginUser.i_user}`) {
         console.log('내가 댓글 쓴 갯수');
      var updBtnSpan = document.createElement('span')
      updBtnSpan.setAttribute('class', 'updBtnSpan')
      
      var updBtnSpanText = document.createElement('span')
      updBtnSpanText.innerText = '수정하기'
      
      var updBtnSpanIconfy = document.createElement('span')
      updBtnSpanIconfy.setAttribute('class', 'iconify')
      updBtnSpanIconfy.setAttribute('data-inline', 'false')
      updBtnSpanIconfy.setAttribute('data-icon', 'si-glyph:arrow-change')
      updBtnSpanIconfy.setAttribute('style', 'color: #a5a2a2, font-size: 12px')
            
      updBtnSpan.append(updBtnSpanIconfy)
      updBtnSpan.append(updBtnSpanText)
      updBtn.append(updBtnSpan)
      
      divEtc.append(updBtn)
      
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
      divEtc.append(delBtn)
      
      divCommentProfileDesc.append(divEtc)
      }
      
      divCommentWrap.append(divCommentProfileDesc)
      
      var cmtListBox = document.querySelector('#cmtListBox')
      cmtListBox.append(divCommentWrap)
     
      
   }

