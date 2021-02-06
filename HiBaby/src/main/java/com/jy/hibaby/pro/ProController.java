package com.jy.hibaby.pro;

import java.util.ArrayList;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jy.hibaby.ViewRef;
import com.jy.hibaby.chat.model.ChatChkPARAM;
import com.jy.hibaby.chat.model.ChatPARAM;
import com.jy.hibaby.pro.model.ProPARAM;
import com.jy.hibaby.user.model.UserPARAM;

@Controller
@RequestMapping("/pro")
public class ProController {

	// pro_num.jsp(get,post) 에 사용될 static 값
	// 멤버필드값은 public이 되면 추후 다른사람이 사용할경우 위험함
	// 지금은 public으로 했지만 추후 이과정을통해서 private set,get을 활용하자
	public static int level = 0;
	public static int count = 21;
	public static int gameResult = 0;
	public static int userResult = 0;
	public static int comResult = 0;
	
	public static String oneNick = "";
	public static String twoNick = "";
	 
	
	
	@Autowired
	private ProService service;
	
	@RequestMapping(value="/main", method = RequestMethod.GET)
	public String main(Model model) {
		service.staticZero();
		
		model.addAttribute("view", ViewRef.PRO_MAIN);
		return ViewRef.DEFAULT_TEMP;
	}
	
	// level 1,2,3 = 스무고개 , 4 = ??, 5 = ??, 6 = ?? 쭉 만들기
	@RequestMapping(value="/main", method = RequestMethod.POST)
	public String main(Model model, ProPARAM param,
			HttpServletRequest request) {
		
		level = 0;
		oneNick = request.getParameter("oneNick");
		twoNick = request.getParameter("twoNick");
		
		
		if(param.getLevel() == 1) {	// 랜덤값 미리 찍어서 static 에다가 넣기
			level = 1;
			return "redirect:/" + ViewRef.PRO_NUM;
			
		} else if(param.getLevel() == 2) {  // level 2,3,4   2p 스무고개 용
			level = 2;
			return "redirect:/" + ViewRef.PEOPLEGAME;
			
		} else if(param.getLevel() == 3) { // 다른 거 나오면 else if로 계속 분기하기
			level = 3;
			return "redirect:/" + ViewRef.PEOPLEGAME;
			
		} else if(param.getLevel() == 4) {
			level = 4;
			return "redirect:/" + ViewRef.PEOPLEGAME;
			
		} else {
			return "redirect:/" + ViewRef.PRO_MAIN;
		}
	}
	

	// 스무고개 화면
	@RequestMapping(value="/pro_num", method = RequestMethod.GET)
	public String pro_num(Model model, ProPARAM param) {		
		if(level == 1) {			
			// gameResult가 0일경우 랜덤값을 박음   그이후 그 랜덤값은 계속 유지
			if(gameResult == 0) {
				int ranNum = (int)(Math.random() * 100) + 1;
				gameResult = ranNum;
			}			
			model.addAttribute("levelAlert", "1~100 까지 맞추기");

		} 

		// -	-	-	-	- level end -	-	-	-	-
		
		
		count--;
		// 유저 관련
		if(param.getUserResult() < gameResult) {
			model.addAttribute("msgResult", param.getUserResult()
					+ " 보다 큰숫자 입니다.");
			
		} else if(param.getUserResult() > gameResult) {
			model.addAttribute("msgResult", param.getUserResult()
					+ " 보다 작은 숫자 입니다.");
			
		} else {
			model.addAttribute("msgResult","유저 정답!");
			model.addAttribute("gameEnd", "유저 승리!");
			model.addAttribute("view", ViewRef.PRO_NUM);
			return ViewRef.DEFAULT_TEMP; 
		}
	
	
	
		// 컴퓨터 관련
		if(param.getUserResult() < gameResult) {	// 유저가 값이 작다면
			
			int maxmin = param.getUserResult() + 1;
			int a = (101 - maxmin);
			
			
			comResult = (int)(Math.random() * a) + maxmin;
			
			if(comResult == gameResult) {
				model.addAttribute("msgResult","컴퓨터 정답!");
				model.addAttribute("gameEnd", "컴퓨터 승리!");
			}
			model.addAttribute("comResult", comResult);
			

		} else if(param.getUserResult() > gameResult) {	 // 유저가 값이 크다면
	
			int maxmin = param.getUserResult() - 1;
			int a = (param.getUserResult() - maxmin);
			comResult = (int)(Math.random() * param.getUserResult()) + 1;
			
			if(comResult == gameResult) {
				model.addAttribute("msgResult","컴퓨터 정답!");
				model.addAttribute("gameEnd", "컴퓨터 승리!");
			}
			model.addAttribute("comResult", comResult);
		}
		
		model.addAttribute("gameResult", gameResult); // 게임정답
		model.addAttribute("count", count); // 총 횟수		
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
	
	
	// 2인용 스무고개 
	@RequestMapping(value="/peopleGame", method=RequestMethod.GET)
	private String peopleGame(ProPARAM param, Model model,
			HttpServletRequest request) {
		--count;
		if(count == 0) {
			model.addAttribute("draw", "무승부");
			model.addAttribute("view", ViewRef.PEOPLEGAME);
			return ViewRef.DEFAULT_TEMP;
			
		}
		if(level == 2) {			
			// gameResult가 0일경우 랜덤값을 박음   그이후 그 랜덤값은 계속 유지
			if(gameResult == 0) {
				int ranNum = (int)(Math.random() * 100) + 1;
				gameResult = ranNum;
			}			
			model.addAttribute("levelAlert", "1~100 까지 맞추기");

		} else if(level == 3) {
			// gameResult가 0일경우 랜덤값을 박음   그이후 그 랜덤값은 계속 유지
			if(gameResult == 0) {
				int ranNum = (int)(Math.random() * 500) + 1;
				gameResult = ranNum;
			}			
			model.addAttribute("levelAlert", "1~500 까지 맞추기");
			
		} else if(level == 4) {
			// gameResult가 0일경우 랜덤값을 박음   그이후 그 랜덤값은 계속 유지
			if(gameResult == 0) {
				int ranNum = (int)(Math.random() * 1000) + 1;
				gameResult = ranNum;
			}			
			model.addAttribute("levelAlert", "1~1000 까지 맞추기");
		}
		
	
		model.addAttribute("count", count);
		model.addAttribute("oneNick", oneNick);
		model.addAttribute("twoNick", twoNick);
		model.addAttribute("gameResult", gameResult);
		model.addAttribute("view", ViewRef.PEOPLEGAME);
		return ViewRef.DEFAULT_TEMP;
	}
	
	
	@RequestMapping(value="/peopleGame", method=RequestMethod.POST)
	public String peopleGame(Model model, HttpServletRequest request,
			ProPARAM param, RedirectAttributes ra) {
				
		// 1p 값 입력
		if(param.getOneResult() != 0) {
			if(param.getOneResult() < gameResult) {
				ra.addFlashAttribute("msgResult", param.getOneResult()
						+ " 보다 큰숫자 입니다.");
				
			} else if(param.getOneResult() > gameResult) {
				ra.addFlashAttribute("msgResult", param.getOneResult()
						+ " 보다 작은 숫자 입니다.");
				
			} else {
				ra.addFlashAttribute("msgResult", oneNick + " 정답!");
				ra.addFlashAttribute("gameEnd", oneNick + " 승리!");
			}
		}
		
		// 2p 값 입력
		if(param.getTwoResult() != 0) {
			if(param.getTwoResult() < gameResult) {
				ra.addFlashAttribute("msgResult", param.getTwoResult()
						+ " 보다 큰숫자 입니다.");
			
			} else if(param.getTwoResult() > gameResult) {
				ra.addFlashAttribute("msgResult", param.getTwoResult()
						+ " 보다 작은 숫자 입니다.");
			
			} else {
				ra.addFlashAttribute("msgResult",twoNick + " 정답!");
				ra.addFlashAttribute("gameEnd", twoNick + " 승리!");
			}
		}
		return "redirect:/" + ViewRef.PEOPLEGAME;
	}
	
	
	// 로또 페이지 열기
	@RequestMapping(value="/lotto", method=RequestMethod.GET)
	public String lotto(Model model, HttpSession hs) {
		
		model.addAttribute("view", ViewRef.PRO_LOTTO);
		return ViewRef.DEFAULT_TEMP;
	}
	
	
	// 로또 값 추출하는 ajax
	@RequestMapping(value="/startLotto", method=RequestMethod.GET)
	private @ResponseBody List<ProPARAM> selLotto(Model model, HttpServletRequest request,
			HttpSession hs, UserPARAM userParam, ProPARAM param){
		List<ProPARAM> list = service.lottoNumbers(); 
		
		return list;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/*
	// DB에 저장하는 ajax 
	@RequestMapping(value="/selLotto", method=RequestMethod.POST) 
    private @ResponseBody String startLotto(@RequestBody ChatPARAM param, ChatChkPARAM chkParam){
		
		int result = 0;
		
		return String.valueOf(result);
    }
	*/
	
}
