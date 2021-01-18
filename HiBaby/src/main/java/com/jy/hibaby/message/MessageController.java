package com.jy.hibaby.message;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jy.hibaby.message.model.MessagePARAM;

@RequestMapping("/message")
@Controller
public class MessageController {

	@Autowired
	private MessageService service;
	
	// 댓글 뿌리기
	@RequestMapping(value="/selMessage", method=RequestMethod.GET)
	private @ResponseBody List<MessagePARAM> selMessage(Model model, MessagePARAM param){
		
		return service.selMessage();
	}
}
