package com.jy.hibaby.board;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.jy.hibaby.Pagination;
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
	public String boardList(@ModelAttribute("boardVO") BoardDMI dmi,
			 @RequestParam(defaultValue="1") int curPage,
			 HttpServletRequest request,
			 Model model, Pagination p) {
		
		/*
		 * 	 ★ 중요 현재 페이징 부분 값들 다 위로빼서 공통 멤버필드에 놔두기
		 * 			검색 / 전체글 페이징 잘되는데 검색에서 페이징 풀림
		 * 			(list.jsp 에서 자바스크립트 fn_paging() 을 검색 함수로다시만들기)
		 * 
		 */
		
		if(dmi.getSearchResult() == null) { 	// 전체 리스트 (list에서 name="searchResult" 값 보내줌)
			
			// 전체리스트 개수
	        int listCnt = service.totalBoardCount();
	        Pagination pagination = new Pagination(listCnt, curPage);
	        dmi.setStartIndex(pagination.getStartIndex());
	        dmi.setCntPerPage(pagination.getPageSize());
	        //
	        
			model.addAttribute("totalCount", service.totalBoardCount());
			model.addAttribute("list", service.selBoard(pagination));
			model.addAttribute("listCnt", listCnt);
			model.addAttribute("pagination", pagination);
			model.addAttribute("view", ViewRef.BOARD_LIST);
			
			
		} else {	// 검색 리스트
			
			int listCnt = service.totalSearchCount(dmi);
			Pagination pagination = new Pagination(listCnt, curPage);
			
			System.out.println("search 값 : " + p.getSearch());
	        dmi.setStartIndex(pagination.getStartIndex());
	        dmi.setCntPerPage(pagination.getPageSize());
			model.addAttribute("listCnt", listCnt);
			model.addAttribute("pagination", pagination);
			
			model.addAttribute("totalCount", service.totalSearchCount(dmi));
			model.addAttribute("list", service.searchBoard(p));
			model.addAttribute("view", ViewRef.BOARD_LIST);
			
		}
		return ViewRef.DEFAULT_TEMP;
	}
	
	
	// 글쓰기 / 수정 Reg
	@RequestMapping(value="/boardReg", method = RequestMethod.GET)
	public String boardReg(Model model, UserPARAM param) {
		model.addAttribute("view", ViewRef.BOARD_REG);
		return ViewRef.DEFAULT_TEMP;
	}
	
}
