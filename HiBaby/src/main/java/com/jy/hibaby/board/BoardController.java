package com.jy.hibaby.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jy.hibaby.ViewRef;
import com.jy.hibaby.board.model.BoardDMI;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	private BoardService service;
	
	// 게시글 전체 목록
	@RequestMapping(value="/list", method = RequestMethod.GET)
	public String boardList(Model model, BoardDMI dmi) {
		
		if(dmi.getSearchResult() == null) { 	// 전체 리스트 (list에서 name="searchResult" 값 보내줌)
			model.addAttribute("totalCount", service.totalBoardCount());
			model.addAttribute("list", service.selBoard());
			model.addAttribute("view", ViewRef.BOARD_LIST);
			
			
		} else {	// 검색 리스트
			model.addAttribute("totalCount", service.totalSearchCount(dmi));
			model.addAttribute("list", service.searchBoard(dmi));
			model.addAttribute("view", ViewRef.BOARD_LIST);
			
		}
		return ViewRef.DEFAULT_TEMP;
	}
	
}
