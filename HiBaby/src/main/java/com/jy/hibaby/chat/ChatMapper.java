package com.jy.hibaby.chat;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jy.hibaby.chat.model.ChatPARAM;

@Mapper
public interface ChatMapper {

	List<ChatPARAM> selChat(ChatPARAM param);
	
	ChatPARAM selChatTop(ChatPARAM param);
	
	int insChat(ChatPARAM param);
}
