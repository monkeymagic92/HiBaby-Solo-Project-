package com.jy.hibaby.chat;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jy.hibaby.Const;
import com.jy.hibaby.chat.model.ChatChkPARAM;
import com.jy.hibaby.chat.model.ChatPARAM;
import com.jy.hibaby.user.model.UserPARAM;

@Controller
@RequestMapping("/chat")
public class ChatController {

	@Autowired
	private ChatService service;
	
	/*
	 * 	1. 채팅 등록하면 t_chatChk 에 해당 to_user(pk)값을 한번 등록
	 *     (insChatChk() 메소드가 실행되면서 만약 t_chatChk에 pk값이 없으면 한번 등록하는거임)
	 *     
	 */
	// 챗 입력 (1.22 정상 작동)
	@RequestMapping(value="/insChat", method=RequestMethod.POST) 
    private @ResponseBody String insChat(@RequestBody ChatPARAM param, ChatChkPARAM chkParam){
		
		int result = service.insChat(param);    // 채팅 내용 입력
		
		chkParam = service.selChatPk(param);	// chkParam이 null 일때 insChatChk 한번만 실행
		
		if(chkParam == null) {	// t_chatChk에 pk값이 없을때 한번만 insert함
			
			service.insChatChk(param);
			service.updChatChk(param);
			
		} else {
			service.updChatChk(param);	// chkParam이 null 이 아니라면 to_user pk값은 계속 박혀있고 계속 to_chk 값을 1로 만듬
		}
		
		return String.valueOf(result);
    }
	
	
	
	
	
	
	
	
	
	
	//////////////////
	////////////////////////////////////
	// 챗 체크 입력한후 뿌리기 (여기에러 다시 하기@@@@@@@@@@@@@@@@@@@@@)
	/*
	 * 	1.  로그인한 유저 pk갑싱랑 to_user pk값이랑 일치할때
	 *  2.  다시 if문을 줘서 selChatPk where = to_user 에서 to_chk 가 1일경우
	 *  3.  메소드 실행 ( result 1로 줘서 jsp에서 처리를 하든 )
	 */
	// 챗 입력
	@RequestMapping(value="/selChatChk", method=RequestMethod.POST) 
    private @ResponseBody String selChatChk(@RequestBody ChatChkPARAM chkParam){
		
		int result = 0;
		return String.valueOf(result);
    }
	/////////// 위에 작업하기
	///////////////////////////////

	
	
	
	
	
	
	
	
	
	
	
	
	
	// 챗 뿌리기
	@RequestMapping(value="/selChat", method=RequestMethod.GET)
	private @ResponseBody List<ChatPARAM> selChat(Model model, ChatPARAM param, HttpServletRequest request, HttpSession hs){
		
		return service.selChat(param);
	}
	
	
	// 채팅 상대방 정보 뿌리기
	@RequestMapping(value="/selChatTop", method=RequestMethod.GET)
	private @ResponseBody ChatPARAM selChatTop(ChatPARAM param){
		
		return service.selChatTop(param);
	}
	
}
