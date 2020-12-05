package com.jy.hibaby;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.jy.hibaby.board.model.BoardPARAM;

public class Paging {
	
	public static void getPage(int tc, BoardPARAM bparam, int page, int cperPageNum, Model model, HttpServletRequest request, HttpSession hs) {
	
		Criteria cri = new Criteria(page, cperPageNum);
		cri.setPage(page);
		hs.setAttribute("page", cri.getPage());
		PageMaker pageMaker = new PageMaker();
	    pageMaker.setCri(cri);
	    int totalCount = tc;
	    hs.setAttribute("totalCount", totalCount);
	    pageMaker.setTotalCount(totalCount);
	    int pageStart = cri.getPageStart();
	    int perPageNum = cri.getPerPageNum();
	    bparam.setPageStart(pageStart);
	    bparam.setPerPageNum(perPageNum);
	    hs.setAttribute("pageMaker", pageMaker);
	    hs.setAttribute("pageNum", pageMaker);
	}
}
