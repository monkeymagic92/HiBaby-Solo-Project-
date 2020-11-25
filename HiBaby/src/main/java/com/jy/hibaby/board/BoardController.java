package com.jy.hibaby.board;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jy.hibaby.board.model.BoardDMI;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	private BoardService service;
	
	@RequestMapping(value="/list", method = RequestMethod.GET)
	public String boardList(Model model) {
		List<BoardDMI> list = new ArrayList<BoardDMI>();
		
		list = service.selBoard();
		model.addAttribute("list", list);
		model.addAttribute("view", "/board/list");
		return "/temp/defaultTemp";
	}
	
	
}
