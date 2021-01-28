package com.jy.hibaby.chat;

import java.util.ArrayList;
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
import com.jy.hibaby.chat.model.ChatChkDMI;
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
		
		service.insChatChk(param);
		service.updChatChk(param);
		
		/*
		chkParam = service.selChatPk(param);	// chkParam이 null 일때 insChatChk 한번만 실행
		
		if(chkParam == null) {	// t_chatChk에 pk값이 없을때 한번만 insert함
			
			service.insChatChk(param);
			service.updChatChk(param);
			
		} else {
			service.updChatChk(param);	// chkParam이 null 이 아니라면 to_user pk값은 계속 박혀있고 계속 to_chk 값을 1로 만듬
		}
		*/
		
		return String.valueOf(result);
    }
	

	/*
	 * 	1.  로그인한 유저 pk값이랑 to_user pk값이랑 일치할때
	 *  2.  다시 if문을 줘서 selChatPk where = to_user 에서 to_chk 가 1일경우
	 *  3.  메소드 실행 ( result 1로 줘서 jsp에서 처리를 하든 )
	 */
	// 챗 알림
	@RequestMapping(value="/selChatChk", method=RequestMethod.POST) 
    private @ResponseBody List<ChatChkDMI> selChatChk(@RequestBody ChatChkPARAM chkParam, HttpSession hs){
		
		//ChatChkPARAM param = new ChatChkPARAM();	// mapper 실행 시키기 위한 객체
		List<ChatChkDMI> dmi = new ArrayList<ChatChkDMI>();		// mapper 의 return 값을 받기 위한 객체
		UserPARAM userParam = (UserPARAM)hs.getAttribute(Const.LOGIN_USER);	// 접속한 유저를 where to_user = #{to_user} 박기위한용 

		int result = 0;
		int i_pk = userParam.getI_user();

		chkParam.setTo_user(i_pk); // 로그인한 유저 pk값을 mapper 쿼리 돌리기위해 ChatChkPARAM 객체값에 넣음 

		dmi = service.selChatChk(chkParam);
		
		
		if(dmi.size() != 0) {	// 아무것도 쪽지온게 없다면 result = 0
			System.out.println("dmi size : " + dmi.size());
			System.out.println("dmi : " + dmi);
			result = 0;
			return service.selChatChk(chkParam);
		} 
		
		/*
		if(dmi.getTo_chk() == 1) { // 쪽지가 왔다면 result = 1
			result = 1;
		}
		*/
		return null;
    }	
	
	
	// 채팅 알람 취소 (친구목록 눌렀을시 해당유저의 to_user 값을 삭제함)
	@RequestMapping(value="/delChatChk", method=RequestMethod.POST) 
    private @ResponseBody String delChatChk(@RequestBody ChatChkPARAM param, HttpSession hs){
		
		UserPARAM userParam = (UserPARAM)hs.getAttribute(Const.LOGIN_USER);	// 접속한 유저를 where to_user = #{to_user} 박기위한용
		param.setTo_user(userParam.getI_user());
		int result = service.delChatChk(param); 
		
		return String.valueOf(result);
	}
	
	
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
