package com.jy.hibaby.message;

import java.util.List;

import com.jy.hibaby.message.model.MessagePARAM;

public interface MessageMapper {

	int insMessage(MessagePARAM param);
	
	List<MessagePARAM> selMessage();
}
