package com.jy.hibaby.header;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jy.hibaby.user.UserService;
import com.jy.hibaby.user.model.UserPARAM;

@Controller
@RequestMapping("/header")
public class HeaderController {
	
	@Autowired
	private UserService userService;
	
	
	@RequestMapping(value="/insFr", method=RequestMethod.POST)
	@ResponseBody	
	public String insFr(@RequestBody UserPARAM param) {
		int result = 0;
		result = userService.frUniqueChk(param);
		return String.valueOf(result);
	}
	
	/*
	 * 	 상대방이 친추요청했을때 1이면 친추 alert창 띄우기 
	 */
	
	
	@RequestMapping(value="/selFr", method=RequestMethod.GET)
	private @ResponseBody List<UserPARAM> selFr(Model model, UserPARAM param){
		return userService.selFr(param);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
