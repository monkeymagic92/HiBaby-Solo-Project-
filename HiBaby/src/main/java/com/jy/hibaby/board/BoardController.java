package com.jy.hibaby.board;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jy.hibaby.Pagination;
import com.jy.hibaby.SecurityUtils;
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
	public String boardReg(Model model, UserPARAM param, HttpSession hs) {
		try { // 비로그인 상태로 접근시 로그인페이지로		
			int i_user = SecurityUtils.getLoginUserPk(hs);
			param.setI_user(i_user);
			
		} catch (Exception e) {
			model.addAttribute("loginMsg", "로그인을 해주세요");
			return ViewRef.BOARD_REG;
		}
		
		model.addAttribute("view", ViewRef.BOARD_REG);
		return ViewRef.DEFAULT_TEMP;
	}
	
	@RequestMapping(value="/boardReg", method = RequestMethod.POST)
	public String boardReg(Model model, BoardDMI param, 
			UserPARAM userParam, HttpSession hs, MultipartHttpServletRequest mReq,
			RedirectAttributes ra) {
			
		try {
			int result = 0;
			result = service.insBoard(param, mReq, hs);
			System.out.println("result :" + result );
		
			if(result == 1) {
				// DETAIL.GET 에서 index/main, mypage, SalaReg 모두다 request.getParameter()로 받게하기위해
				int i_board = (int)hs.getAttribute("i_board");
				ra.addAttribute("i_board",i_board);
				return "redirect:/" + ViewRef.BOARD_DETAIL;
				
			} else if(result == 2){
				ra.addFlashAttribute("ImageFail","입력되지 않은 항목 이 있습니다");
				return "redirect:/" + ViewRef.BOARD_REG;
				
			} else {
				ra.addFlashAttribute("ImageFail","서버에러 다시 다시 시도해주세요");
				return "redirect:/" + ViewRef.BOARD_REG;
			}
			
		} catch(Exception e) {
			ra.addFlashAttribute("serverErr","서버에러 다시 시도해주세요");
			return "redirect:/" + ViewRef.BOARD_REG;
		}
		
	}
	
	
	// 게시글 상세페이지
	@RequestMapping(value="/detail", method = RequestMethod.GET)
	public String detailBoard(Model model, UserPARAM param, 
			BoardPARAM bp) {
		System.out.println("i_board 값 : " + bp.getI_board());
		
		model.addAttribute("data", service.detailBoard(bp));
		model.addAttribute("view", ViewRef.BOARD_DETAIL);
		return ViewRef.DEFAULT_TEMP;
	}
	
	
	// 게시글 삭제
	@RequestMapping(value="/delete", method = RequestMethod.GET)
	public String boardDelete(BoardPARAM param, HttpServletRequest request,
			Model model, RedirectAttributes ra) {
	
		int i_board = Integer.parseInt(request.getParameter("i_board"));
		param.setI_board(i_board);
		System.out.println("삭제 i_board값 : " + i_board);
		
		int result = service.boardDelete(param);
		System.out.println("글삭제 result:" + result);
		//result = 0;  에러테스트용
		
		if(result == 1) {
			String path = "/resources/img/board/" + i_board;
			String realPath =  request.getServletContext().getRealPath(path);
			System.out.println("파일 경로realPath:" + realPath);
			File file = new File(realPath);
			
			if(file.exists()) {
				if(file.isDirectory()) {
					File[] files = file.listFiles();
					for(int i=0;  i<files.length;  i++) {
						if(files[i].delete()) {
							System.out.println(files[i].getName()+"폴더 안의 파일 삭제 성공");
						} else {
							System.out.println(files[i].getName()+"폴더 안의 파일 삭제 실패");
						}
					}
				}
			
				if(file.delete()) {
					System.out.println("파일 삭제 성공");
					return "redirect:/" + ViewRef.BOARD_LIST;
					
				} else {
					System.out.println("파일 삭제 실패");
				}	
			}
		}
		return "redirect:/" + ViewRef.BOARD_LIST;
	}
}
