package com.jy.hibaby.chat;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jy.hibaby.chat.model.ChatChkDMI;
import com.jy.hibaby.chat.model.ChatChkPARAM;
import com.jy.hibaby.chat.model.ChatPARAM;

@Mapper
public interface ChatMapper {

	List<ChatPARAM> selChat(ChatPARAM param);	// n : n 채팅 값 뿌리기
	
	ChatPARAM selChatTop(ChatPARAM param);		// 채팅 상단 상대방 유저 정보
	
	ChatChkPARAM selChatPk(ChatPARAM param);
	
	List<ChatChkDMI> selChatChk(ChatChkPARAM param);
	
	int insChat(ChatPARAM param);			// 채팅 등록
	
	int insChatChk(ChatPARAM param);
	
	int updChatChk(ChatPARAM param);
	
	int delChatChk(ChatChkPARAM param);
	
	
}
