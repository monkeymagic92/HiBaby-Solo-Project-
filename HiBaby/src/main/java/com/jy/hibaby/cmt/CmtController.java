package com.jy.hibaby.cmt;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jy.hibaby.SecurityUtils;
import com.jy.hibaby.board.model.BoardPARAM;
import com.jy.hibaby.cmt.model.CmtDMI;
import com.jy.hibaby.cmt.model.CmtVO;
import com.jy.hibaby.user.model.UserPARAM;

@Controller
@RequestMapping("/cmt")
public class CmtController {

	@Autowired
	private CmtService service;
	
	// 댓글 뿌리기
	@RequestMapping(value="/selCmt", method=RequestMethod.GET)
	private @ResponseBody List<CmtDMI> selCmt(Model model, BoardPARAM param, HttpServletRequest request, HttpSession hs){
		
		return service.selCmt(param);
	}
	
	// 댓글 수 가져오기 뿌리기
	@RequestMapping(value="/selCount", method=RequestMethod.GET)
	private @ResponseBody int selCount(Model model, BoardPARAM param, HttpServletRequest request, HttpSession hs){
		
		return service.countCmt(param);
	}
	
	
	
	// 댓글 등록 / 수정
	@RequestMapping(value="/cmtReg", method=RequestMethod.POST) 
    private @ResponseBody String cmtInsert(@RequestBody CmtVO vo, HttpSession hs, HttpServletRequest request){
		
		int result = 0;
		
		try { // 비로그인 상태로 접근시 로그인페이지로		
			int i_user = SecurityUtils.getLoginUserPk(hs);
			vo.setI_user(i_user);
			
		} catch (Exception e) {
			result = 3;
			return String.valueOf(result);
		}
		
		
		if(vo.getI_cmt() != 0) {
			System.out.println("   글 수 정     ");
			result = service.updCmt(vo);
										
			if(hs.getAttribute("loginUser") == null) {
				result = 3;
			} 
			
			
		} else {
			System.out.println("   글 등 록    ");			
			result = service.insCmt(vo);
							
			if(hs.getAttribute("loginUser") == null) {
				result = 3;
			} 
			 
		}
		return String.valueOf(result);
    }
	
	
	// 댓글 삭제
	@RequestMapping(value="/delete", method=RequestMethod.POST) 
    @ResponseBody
    private String cmtDelete(@RequestBody CmtVO vo, HttpSession hs){
		
		int result = service.delCmt(vo);
		UserPARAM param = (UserPARAM)hs.getAttribute("loginUser");
		
		if(hs.getAttribute("loginUser") == null) {
			result = 2;
			
		} 
		return String.valueOf(result);
	}
	
}
