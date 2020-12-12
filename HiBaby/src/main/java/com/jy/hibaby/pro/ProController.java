package com.jy.hibaby.pro;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jy.hibaby.ViewRef;

@Controller
@RequestMapping("/pro")
public class ProController {

	@Autowired
	private ProService service;
	
	@RequestMapping("/main")
	public String main(Model model) {
		model.addAttribute("view", ViewRef.PRO_MAIN);
		return ViewRef.DEFAULT_TEMP;
	}
}
