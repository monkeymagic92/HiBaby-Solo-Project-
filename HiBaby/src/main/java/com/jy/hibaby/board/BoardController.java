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
import com.jy.hibaby.user.model.UserPARAM;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	private BoardService service;
	
	// 게시글 전체 목록
	@RequestMapping(value="/list", method = RequestMethod.GET)
	public String boardList(Model model) {
		List<BoardDMI> list = new ArrayList<BoardDMI>();
		
		list = service.selBoard();
		model.addAttribute("list", list);
		model.addAttribute("view", ViewRef.BOARD_LIST);
		return ViewRef.DEFAULT_TEMP;
	}
	
	
	// 게시글 등록
	@RequestMapping(value="/insBoard", method = RequestMethod.GET) 
	public String insBoard(Model model, BoardDMI param,
			HttpSession hs, RedirectAttributes ra) {
		
		System.out.println("param user : " + param.getI_user());
		model.addAttribute("view", ViewRef.BOARD_INSBOARD);
		return ViewRef.DEFAULT_TEMP;
	}
	
	@RequestMapping(value="/insBoard", method = RequestMethod.POST) 
	public String insBoard(Model model, BoardDMI param, MultipartHttpServletRequest mReq,
			HttpSession hs, RedirectAttributes ra, UserPARAM vo) {
		
		System.out.println("param user : " + param.getI_user());
		int result = service.insBoard(param, mReq, hs);
		model.addAttribute("view", ViewRef.BOARD_INSBOARD);
		return "redirect:/" + ViewRef.BOARD_LIST;
	}
	
	
}
