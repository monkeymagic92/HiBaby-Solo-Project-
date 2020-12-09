package com.jy.hibaby;

import javax.servlet.http.HttpSession;

import com.jy.hibaby.study.model.StudyPARAM;
import com.jy.hibaby.user.model.UserPARAM;

public class StudyUtils {
	
	// 수학 문제 메소드
	public static StudyPARAM studyMath(StudyPARAM param, HttpSession hs) {
		
		if(param.getLevel() == 1) { // 하
			int q1 = (int)(Math.random() * 9) + 1;
			int q1_1 = (int)(Math.random() * 9) + 1;
			int q2 = (int)(Math.random() * 9) + 1;
			int q2_2 = (int)(Math.random() * 9) + 1;
			int q3 = (int)(Math.random() * 9) + 1;
			int q3_3 = (int)(Math.random() * 9) + 1;
			int q4 = (int)(Math.random() * 9) + 1;
			int q4_4 = (int)(Math.random() * 9) + 1;
			
			// 문제
			param.setQ1(q1);
			param.setQ1_1(q1_1);
			param.setQ2(q2);
			param.setQ2_2(q2_2);
			param.setQ3(q3);
			param.setQ3_3(q3_3);
			param.setQ4(q4);
			param.setQ4_4(q4_4);
			
			// 정답
			param.setA1(q1 + q1_1);
			param.setA2(q2 + q2_2);
			param.setA3(q3 + q3_3);
			param.setA4(q4 - q4_4);
			
			// jsp로 보내기위한 세션값 (return 대신용)
			hs.setAttribute("a1", param.getA1());
			hs.setAttribute("a2", param.getA2());
			hs.setAttribute("a3", param.getA3());
			hs.setAttribute("a4", param.getA4());
			
			return param;
			
			
		} else if(param.getLevel() == 2) {  // 중
			
			
			return param;
			
		} else {  // 상
			
			
			return param;
		}
	}
	
	
	// 수학 정답용 메소드
	public static StudyPARAM ansMath(HttpSession hs, StudyPARAM param,
			PointVO vo, UserPARAM userParam) {
		
		int point = 0;
		
		int a1 = (int)hs.getAttribute("a1");
		int a2 = (int)hs.getAttribute("a2");
		int a3 = (int)hs.getAttribute("a3");
		int a4 = (int)hs.getAttribute("a4");
		
		if(param.getA1() == a1) {
			System.out.println("1번 정답");
			point += 10;
			vo.setTotalPoint(point);
			vo.setI_user(userParam.getI_user());
		}
		
		if(param.getA2() == a2) {
			System.out.println("2번 정답");
			point += 10;
			vo.setTotalPoint(point);
			vo.setI_user(userParam.getI_user());
			
		}
		
		if(param.getA3() == a3) {
			System.out.println("3번 정답");
			point += 10;
			vo.setTotalPoint(point);
			vo.setI_user(userParam.getI_user());
			
		}
		
		if(param.getA4() == a4) {
			System.out.println("4번 정답");
			point += 10;
			vo.setTotalPoint(point);
			vo.setI_user(userParam.getI_user());
		}
		
		return param;
	}
}
