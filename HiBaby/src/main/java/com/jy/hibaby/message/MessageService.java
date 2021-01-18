package com.jy.hibaby.message;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jy.hibaby.message.model.MessagePARAM;

@Service
public class MessageService {

	@Autowired
	private MessageMapper mapper;
	
	public int intMessage(MessagePARAM param) {
		return mapper.insMessage(param);
	}
	
	public List<MessagePARAM> selMessage() {
		return mapper.selMessage();
	}
	
}
