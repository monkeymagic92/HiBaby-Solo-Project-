package com.jy.hibaby.pro;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jy.hibaby.ViewRef;
import com.jy.hibaby.pro.model.ProPARAM;
import com.jy.hibaby.pro.model.ProVO;

@Controller
@RequestMapping("/pro")
public class ProController {

	// pro_num.jsp(get,post) 에 사용될 static 값
	private static int level = 0;
	private static int turn = 1; // 홀수턴 = user / 짝수턴 = com
	private static int count = 0;
	private static int gameResult = 0;
	private static int userResult = 0;
	private static int comResult = 0;
	 
	
	
	@Autowired
	private ProService service;
	
	@RequestMapping(value="/main", method = RequestMethod.GET)
	public String main(Model model) {
		model.addAttribute("view", ViewRef.PRO_MAIN);
		return ViewRef.DEFAULT_TEMP;
	}
	
	// level 1,2,3 = 스무고개 , 4 = ??, 5 = ??, 6 = ?? 쭉 만들기
	@RequestMapping(value="/main", method = RequestMethod.POST)
	public String main(Model model, ProPARAM param) {
		
		level = 0;
		
		if(param.getLevel() == 1) {	// 랜덤값 미리 찍어서 static 에다가 넣기
			System.out.println("1~100");			 
			level = 1;
			
			return "redirect:/" + ViewRef.PRO_NUM;
			
		} else if(param.getLevel() == 2) {
			System.out.println("1~500");
			level = 2;
			return "redirect:/" + ViewRef.PRO_NUM;
			
		} else {
			System.out.println("1~1000");
			level = 3;
			return "redirect:/" + ViewRef.PRO_NUM;
		}
		
	}
	

	// 스무고개 화면
	@RequestMapping(value="/pro_num", method = RequestMethod.GET)
	public String pro_num(Model model) {
		
		if(level == 1) {
			
			// 정답이 0일경우 랜덤값을 박음   그이후 그 랜덤값은 계속 유지
			if(gameResult == 0) {
				int ranNum = (int)(Math.random() * 100) + 1;
				gameResult = ranNum;
			}
			
			
			++count;
			++turn;
			System.out.println("num부분 level 1");
			System.out.println("count 값 : " + count);
			System.out.println("turn 값 : " + turn);
			
			model.addAttribute("gameResult", gameResult);
			model.addAttribute("count", count);
			model.addAttribute("turn", turn);
			model.addAttribute("levelAlert", "1~100 까지 맞추기");
			
			
			
			
			
			
		} else if(level == 2) {
			System.out.println("num부분 level 2");
			model.addAttribute("levelAlert", "1~500 까지 맞추기");
			
			
		} else {
			System.out.println("num부분 level 3");
			model.addAttribute("levelAlert", "1~1000 까지 맞추기");
			
		}
		
		model.addAttribute("view", ViewRef.PRO_NUM);
		return ViewRef.DEFAULT_TEMP;
	}
	
	
	
	
	// 스무고개 post
	/*
	 *	pro_num.jsp 에서 넘어온값 홀짝 구별해서 get, post 에서 홀 짝 구분값 줌
	 *
	 *	정답 일시 모든 스태틱값 초기화 시키기 (메소드 하나 만들어서 스태틱 초기화 메소드 사용)
	 *
	 *	index/select 가더라도 모든 스태틱값 초기화하는 메소드 사용하기
	 */

	@RequestMapping(value="/pro_num", method=RequestMethod.POST) 
    private String pro_num(ProPARAM param, HttpSession hs,
    		 HttpServletRequest request){
		
		System.out.println("userResult 값 :" + param.getUserResult());
		
		return "redirect:/" + ViewRef.PRO_NUM;
	}
	
}
