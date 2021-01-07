package com.jy.hibaby.pro;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProService {

	@Autowired
	private ProMapper mapper;
	
	// static 값들 초기화
	public void staticZero() {
		ProController.level = 0;
		ProController.count = 21;
		ProController.gameResult = 0;
		ProController.userResult = 0;
		ProController.comResult = 0;
	}
	
}
