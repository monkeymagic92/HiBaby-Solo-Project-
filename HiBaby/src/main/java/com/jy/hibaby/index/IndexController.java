package com.jy.hibaby.index;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jy.hibaby.pro.ProService;

@Controller
@RequestMapping("/index")
public class IndexController {
	
	@Autowired
	private ProService proService;
	
	@RequestMapping("/select")
	public String index(Model model) {
		proService.staticZero();	// pro 컨트롤러 static값 초기화
		return "/index/select";
	}
}
