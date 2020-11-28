package com.jy.hibaby.board;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jy.hibaby.ViewRef;
import com.jy.hibaby.board.model.BoardDMI;
import com.jy.hibaby.board.model.BoardPARAM;
import com.jy.hibaby.user.model.UserPARAM;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	private BoardService service;
	
	// 게시글 전체 목록
	@RequestMapping(value="/list", method = RequestMethod.GET)
	public String boardList(Model model, BoardPARAM param) {
		List<BoardDMI> list = new ArrayList<BoardDMI>();
		
		model.addAttribute("list", service.selBoard());
		model.addAttribute("view", ViewRef.BOARD_LIST);
		return ViewRef.DEFAULT_TEMP;
	}
	
	
	// 검색기능(제목, 작성자별로   // 추후 페이징 기능 추가시 페이징 하기) 
	@RequestMapping(value="/search", method = RequestMethod.POST)
	public String boardSearch(Model model, BoardDMI dmi) {
		
		model.addAttribute("list", service.searchBoard(dmi));
		model.addAttribute("view", ViewRef.BOARD_LIST);
		return ViewRef.DEFAULT_TEMP;
	}
	
	
}
