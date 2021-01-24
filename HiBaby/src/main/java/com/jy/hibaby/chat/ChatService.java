package com.jy.hibaby.chat;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jy.hibaby.chat.model.ChatChkDMI;
import com.jy.hibaby.chat.model.ChatChkPARAM;
import com.jy.hibaby.chat.model.ChatPARAM;

@Service
public class ChatService {

	@Autowired
	private ChatMapper mapper;
	
	// 챗 입력
	public int insChat(ChatPARAM param) {
		return mapper.insChat(param);
	}
	
	// 해당유저에 값 박기
	public int insChatChk(ChatPARAM param) {
		return mapper.insChatChk(param);
	}
	
	// to_chk 값을 1기준으로  1 = 챗왔음  0 = 대화없음 나누기
	public ChatChkPARAM selChatPk(ChatPARAM param) {
		return mapper.selChatPk(param);
	}
	
	public ChatChkDMI selChatChk(ChatChkPARAM param) {
		return mapper.selChatChk(param);
	}
	
	// 채팅 알림 취소( 친구목록 눌렀을시 )
	public int delChatChk(ChatChkPARAM param) {
		return mapper.delChatChk(param);
	}
	
	// 상대방이 n번유저에게 대화를 했다면 to_chk값을 = 1로
	public int updChatChk(ChatPARAM param) {
		return mapper.updChatChk(param);
	}
	
	// 챗 뿌리기
	public List<ChatPARAM> selChat(ChatPARAM param) {
		return mapper.selChat(param);
	}
	
	// 챗 상대방 정보 뿌리기
	public ChatPARAM selChatTop(ChatPARAM param) {
		return mapper.selChatTop(param);
	}
}
