package com.jy.hibaby.study;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jy.hibaby.ViewRef;

@Controller
@RequestMapping("/study")
public class StudyController {

	@Autowired
	private StudyService service;
	
	@RequestMapping(value="/main", method = RequestMethod.GET)
	public String main(Model model) {
		model.addAttribute("view", ViewRef.STUDY_MAIN);
		return ViewRef.DEFAULT_TEMP;
	}
}
