package com.jy.hibaby.chat;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jy.hibaby.chat.model.ChatPARAM;

@Service
public class ChatService {

	@Autowired
	private ChatMapper mapper;
	
	// 챗 입력
	public int insChat(ChatPARAM param) {
		return mapper.insChat(param);
	}
	
	// 챗 뿌리기
	public List<ChatPARAM> selChat(ChatPARAM param) {
		return mapper.selChat(param);
	}
	
	public ChatPARAM selChatTop(ChatPARAM param) {
		return mapper.selChatTop(param);
	}
}
