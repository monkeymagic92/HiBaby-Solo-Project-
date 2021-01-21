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

import com.jy.hibaby.chat.model.ChatPARAM;

@Controller
@RequestMapping("/chat")
public class ChatController {

	@Autowired
	private ChatService service;
	
	// 챗 입력
	@RequestMapping(value="/insChat", method=RequestMethod.POST) 
    private @ResponseBody String cmtInsert(@RequestBody ChatPARAM param){
		
		int result = service.insChat(param);
		
		return String.valueOf(result);
    }
	
	// 댓글 뿌리기
	@RequestMapping(value="/selChat", method=RequestMethod.GET)
	private @ResponseBody List<ChatPARAM> selCmt(Model model, ChatPARAM param, HttpServletRequest request, HttpSession hs){
		
		return service.selChat(param);
	}
	
}
