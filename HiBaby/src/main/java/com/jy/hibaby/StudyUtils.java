package com.jy.hibaby;

import javax.servlet.http.HttpSession;

import com.jy.hibaby.study.model.StudyPARAM;
import com.jy.hibaby.user.model.UserPARAM;

public class StudyUtils {
	
	// 수학 문제 메소드
	public static StudyPARAM studyMath(StudyPARAM param, HttpSession hs) {
		
		int q1 = 0;
		int q1_1 = 0;
		int q2 = 0;
		int q2_2 = 0;
		int q3 = 0;
		int q3_3 = 0;
		int q4 = 0;
		int q4_4 = 0;
		int q5 = 0;
		int q5_5 = 0;
		int q6 = 0;
		int q6_6 = 0;
		int q7 = 0;
		int q7_7 = 0;
		int q8 = 0;
		int q8_8 = 0;
		int q9 = 0;
		int q9_9 = 0;
		int q10 = 0;
		int q10_10 = 0;
		
		if(param.getLevel() == 1) { // 하
			
			q1 = (int)(Math.random() * 9) + 1;
			q1_1 = (int)(Math.random() * 9) + 1;
			q2 = (int)(Math.random() * 9) + 1;
			q2_2 = (int)(Math.random() * 9) + 1;
			q3 = (int)(Math.random() * 9) + 1;
			q3_3 = (int)(Math.random() * 9) + 1;
			q4 = (int)(Math.random() * 9) + 1;
			q4_4 = (int)(Math.random() * 9) + 1;
			q5 = (int)(Math.random() * 9) + 1;
			q5_5 = (int)(Math.random() * 9) + 1;
			q6 = (int)(Math.random() * 9) + 1;
			q6_6 = (int)(Math.random() * 9) + 1;
			q7 = (int)(Math.random() * 9) + 1;
			q7_7 = (int)(Math.random() * 9) + 1;
			q8 = (int)(Math.random() * 9) + 1;
			q8_8 = (int)(Math.random() * 9) + 1;
			q9 = (int)(Math.random() * 9) + 1;
			q9_9 = (int)(Math.random() * 9) + 1;
			q10 = (int)(Math.random() * 9) + 1;
			q10_10 = (int)(Math.random() * 9) + 1;
			
		
		} else if(param.getLevel() == 2) {  // 중
			
			q1 = (int)(Math.random() * 50) + 11;
			q1_1 = (int)(Math.random() * 50) + 11;
			q2 = (int)(Math.random() * 50) + 11;
			q2_2 = (int)(Math.random() * 50) + 11;
			q3 = (int)(Math.random() * 50) + 11;
			q3_3 = (int)(Math.random() * 50) + 11;
			q4 = (int)(Math.random() * 50) + 11;
			q4_4 = (int)(Math.random() * 50) + 11;
			q5 = (int)(Math.random() * 50) + 11;
			q5_5 = (int)(Math.random() * 50) + 11;
			q6 = (int)(Math.random() * 50) + 11;
			q6_6 = (int)(Math.random() * 50) + 11;
			q7 = (int)(Math.random() * 50) + 11;
			q7_7 = (int)(Math.random() * 50) + 11;
			q8 = (int)(Math.random() * 50) + 11;
			q8_8 = (int)(Math.random() * 50) + 11;
			q9 = (int)(Math.random() * 50) + 11;
			q9_9 = (int)(Math.random() * 50) + 11;
			q10 = (int)(Math.random() * 50) + 11;
			q10_10 = (int)(Math.random() * 50) + 11;
			
			
		} else {  // 상
			
			q1 = (int)(Math.random() * 9999) + 100;
			q1_1 = (int)(Math.random() * 9999) + 100;
			q2 = (int)(Math.random() * 9999) + 100;
			q2_2 = (int)(Math.random() * 9999) + 100;
			q3 = (int)(Math.random() * 9999) + 100;
			q3_3 = (int)(Math.random() * 9999) + 100;
			q4 = (int)(Math.random() * 9999) + 100;
			q4_4 = (int)(Math.random() * 9999) + 100;
			q5 = (int)(Math.random() * 9999) + 100;
			q5_5 = (int)(Math.random() * 9999) + 100;
			q6 = (int)(Math.random() * 9999) + 100;
			q6_6 = (int)(Math.random() * 9999) + 100;
			q7 = (int)(Math.random() * 9999) + 100;
			q7_7 = (int)(Math.random() * 9999) + 100;
			q8 = (int)(Math.random() * 9999) + 100;
			q8_8 = (int)(Math.random() * 9999) + 100;
			q9 = (int)(Math.random() * 9999) + 100;
			q9_9 = (int)(Math.random() * 9999) + 100;
			q10 = (int)(Math.random() * 9999) + 100;
			q10_10 = (int)(Math.random() * 9999) + 100;
			
		}
		
		// 문제
		param.setQ1(q1);
		param.setQ1_1(q1_1);
		param.setQ2(q2);
		param.setQ2_2(q2_2);
		param.setQ3(q3);
		param.setQ3_3(q3_3);
		param.setQ4(q4);
		param.setQ4_4(q4_4);
		param.setQ5(q5);
		param.setQ5_5(q5_5);
		param.setQ6(q6);
		param.setQ6_6(q6_6);
		param.setQ7(q7);
		param.setQ7_7(q7_7);
		param.setQ8(q8);
		param.setQ8_8(q8_8);
		param.setQ9(q9);
		param.setQ9_9(q9_9);
		param.setQ10(q10);
		param.setQ10_10(q10_10);
		
		// 정답
		param.setA1(q1 + q1_1);
		param.setA2(q2 + q2_2);
		param.setA3(q3 + q3_3);
		param.setA4(q4 + q4_4);
		param.setA5(q5 - q5_5);
		param.setA6(q6 - q6_6);
		param.setA7(q7 - q7_7);
		param.setA8(q8 - q8_8);
		param.setA9(q9 * q9_9);
		param.setA10(q10 * q10_10);
		
		// jsp로 보내기위한 세션값 (return 대신용)
		hs.setAttribute("a1", param.getA1());
		hs.setAttribute("a2", param.getA2());
		hs.setAttribute("a3", param.getA3());
		hs.setAttribute("a4", param.getA4());
		hs.setAttribute("a5", param.getA5());
		hs.setAttribute("a6", param.getA6());
		hs.setAttribute("a7", param.getA7());
		hs.setAttribute("a8", param.getA8());
		hs.setAttribute("a9", param.getA9());
		hs.setAttribute("a10", param.getA10());
		
		return param;
	}
	
	
	// 수학 정답용 메소드
	public static StudyPARAM ansMath(HttpSession hs, StudyPARAM param,
			PointVO vo, UserPARAM userParam) {
		
		int point = 0;
		System.out.println("param.getLevel = " + param.getLevel());
		
		
		int a1 = (int)hs.getAttribute("a1");
		int a2 = (int)hs.getAttribute("a2");
		int a3 = (int)hs.getAttribute("a3");
		int a4 = (int)hs.getAttribute("a4");
		int a5 = (int)hs.getAttribute("a5");
		int a6 = (int)hs.getAttribute("a6");
		int a7 = (int)hs.getAttribute("a7");
		int a8 = (int)hs.getAttribute("a8");
		int a9 = (int)hs.getAttribute("a9");
		int a10 = (int)hs.getAttribute("a10");
		
		
		if(param.getLevel() == 1) {	// 난이도 하 정답
			if(param.getA1() == a1) {
				point += 10;
				vo.setTotalPoint(point);
				vo.setMyPoint(point);
				vo.setI_user(userParam.getI_user());
			} 
			
			if(param.getA2() == a2) {
				point += 10;
				vo.setTotalPoint(point);
				vo.setMyPoint(point);
				vo.setI_user(userParam.getI_user());
				
			}
			
			if(param.getA3() == a3) {
				point += 10;
				vo.setTotalPoint(point);
				vo.setMyPoint(point);
				vo.setI_user(userParam.getI_user());
				
			}
			
			if(param.getA4() == a4) {
				point += 10;
				vo.setTotalPoint(point);
				vo.setMyPoint(point);
				vo.setI_user(userParam.getI_user());
			}
			
			if(param.getA5() == a5) {
				point += 10;
				vo.setTotalPoint(point);
				vo.setMyPoint(point);
				vo.setI_user(userParam.getI_user());
			}
			
			if(param.getA6() == a6) {
				point += 10;
				vo.setTotalPoint(point);
				vo.setMyPoint(point);
				vo.setI_user(userParam.getI_user());
			}
			
			
			if(param.getA7() == a7) {
				point += 10;
				vo.setTotalPoint(point);
				vo.setMyPoint(point);
				vo.setI_user(userParam.getI_user());
			}
			
			if(param.getA8() == a8) {
				point += 10;
				vo.setTotalPoint(point);
				vo.setMyPoint(point);
				vo.setI_user(userParam.getI_user());
			}
			
			if(param.getA9() == a9) {
				point += 10;
				vo.setTotalPoint(point);
				vo.setMyPoint(point);
				vo.setI_user(userParam.getI_user());
			}
			
			if(param.getA10() == a10) {
				point += 10;
				vo.setTotalPoint(point);
				vo.setMyPoint(point);
				vo.setI_user(userParam.getI_user());
			}
			
		}
		
		else if(param.getLevel() == 2) { //난이도 중 정답
			
			if(param.getA1() == a1) {
				point += 15;
				vo.setTotalPoint(point);
				vo.setMyPoint(point);
				vo.setI_user(userParam.getI_user());
			}
			
			if(param.getA2() == a2) {
				point += 15;
				vo.setTotalPoint(point);
				vo.setMyPoint(point);
				vo.setI_user(userParam.getI_user());
				
			}
			
			if(param.getA3() == a3) {
				point += 15;
				vo.setTotalPoint(point);
				vo.setMyPoint(point);
				vo.setI_user(userParam.getI_user());
				
			}
			
			if(param.getA4() == a4) {
				point += 15;
				vo.setTotalPoint(point);
				vo.setMyPoint(point);
				vo.setI_user(userParam.getI_user());
			}
			
			if(param.getA5() == a5) {
				point += 15;
				vo.setTotalPoint(point);
				vo.setMyPoint(point);
				vo.setI_user(userParam.getI_user());
			}
			
			if(param.getA6() == a6) {
				point += 15;
				vo.setTotalPoint(point);
				vo.setMyPoint(point);
				vo.setI_user(userParam.getI_user());
			}
			
			if(param.getA7() == a7) {
				point += 15;
				vo.setTotalPoint(point);
				vo.setI_user(userParam.getI_user());
			}
			
			if(param.getA8() == a8) {
				point += 15;
				vo.setTotalPoint(point);
				vo.setMyPoint(point);
				vo.setI_user(userParam.getI_user());
			}
			
			if(param.getA9() == a9) {
				point += 15;
				vo.setTotalPoint(point);
				vo.setMyPoint(point);
				vo.setI_user(userParam.getI_user());
			}
			
			if(param.getA10() == a10) {
				point += 15;
				vo.setTotalPoint(point);
				vo.setMyPoint(point);
				vo.setI_user(userParam.getI_user());
			}
			
		} else {
			// 난이도 상 정답
			if(param.getA1() == a1) {
				point += 20;
				vo.setTotalPoint(point);
				vo.setMyPoint(point);
				vo.setI_user(userParam.getI_user());
			}
			
			if(param.getA2() == a2) {
				point += 20;
				vo.setTotalPoint(point);
				vo.setMyPoint(point);
				vo.setI_user(userParam.getI_user());
				
			}
			
			if(param.getA3() == a3) {
				point += 20;
				vo.setTotalPoint(point);
				vo.setMyPoint(point);
				vo.setI_user(userParam.getI_user());
				
			}
			
			if(param.getA4() == a4) {
				point += 20;
				vo.setTotalPoint(point);
				vo.setMyPoint(point);
				vo.setI_user(userParam.getI_user());
			}
			
			if(param.getA5() == a5) {
				point += 20;
				vo.setTotalPoint(point);
				vo.setMyPoint(point);
				vo.setI_user(userParam.getI_user());
			}
			
			if(param.getA6() == a6) {
				point += 20;
				vo.setTotalPoint(point);
				vo.setMyPoint(point);
				vo.setI_user(userParam.getI_user());
			}
			
			if(param.getA7() == a7) {
				point += 20;
				vo.setTotalPoint(point);
				vo.setMyPoint(point);
				vo.setI_user(userParam.getI_user());
			}
			
			if(param.getA8() == a8) {
				point += 20;
				vo.setTotalPoint(point);
				vo.setMyPoint(point);
				vo.setI_user(userParam.getI_user());
			}
			
			if(param.getA9() == a9) {
				point += 20;
				vo.setTotalPoint(point);
				vo.setMyPoint(point);
				vo.setI_user(userParam.getI_user());
			}
			
			if(param.getA10() == a10) {
				point += 20;
				vo.setTotalPoint(point);
				vo.setMyPoint(point);
				vo.setI_user(userParam.getI_user());
			}
		}
		
				
		return param;
	}
	
	
	// 아직안쓰는중(없어도 문제는 없어보임)
	public static void removeSession(HttpSession hs) {
		hs.removeAttribute("a1");
		hs.removeAttribute("a2");
		hs.removeAttribute("a3");
		hs.removeAttribute("a4");
		hs.removeAttribute("a5");
		hs.removeAttribute("a6");
		hs.removeAttribute("a7");
		hs.removeAttribute("a8");
		hs.removeAttribute("a9");
		hs.removeAttribute("a10");
	}
	
	
	
	
	
	
	
	///////////////////////// 영어 문제제출
	
	public static StudyPARAM studyEng(StudyPARAM param, HttpSession hs) {
		
		if(param.getLevel() == 1) {
		
		/*
		 * 		배열 길이만큼 eArray1, eArray2 맞춰주고 a1,a2도 맞춰주고 int a[] 길이도 맞춰주고 ran 반복돌 숫자도 맞춰줘야됨
		 */
		String[] eArray1 = {"고양이", "사자", "호랑이","강아지", "여자", "자동차", "지구", "피아노", "컴퓨터", "꽃", "아기"};
		
		String[] eArray2 = {"cat", "lion", "tiger","dog","girl","car", "earth","piano","computer","flower", "baby"};
		
		String[] a1 = new String[11];
		String[] a2 = new String[11];
		
		int a[] = new int[11]; 
        int ran = 0;
        
        for(int i=0;i<10;i++) { 
        	ran = (int)(Math.random() * 11) + 0;
            a[i] = ran;
            
			a1[i] = eArray1[ran];
			a2[i] = eArray2[ran]; 
            
			
            for(int j=0;j<i;j++) { // 중복제거
                    
                if(a[i]==a[j]) {  
                
                    i--;
                }
            }
            
            // 1번문제 / 정답
            param.setEq1(a1[0]);
            param.setEa1(a2[0]);
            
            param.setEq2(a1[1]);
			param.setEa2(a2[1]);
			
			param.setEq3(a1[2]);
			param.setEa3(a2[2]);
			
			param.setEq4(a1[3]);
			param.setEa4(a2[3]);
			
			param.setEq5(a1[4]);
			param.setEa5(a2[4]);
			
			param.setEq6(a1[5]);
			param.setEa6(a2[5]);
			
			param.setEq7(a1[6]);
			param.setEa7(a2[6]);
			
			param.setEq8(a1[7]);
			param.setEa8(a2[7]);
			
			param.setEq9(a1[8]);
			param.setEa9(a2[8]);
			
			param.setEq10(a1[9]);
			param.setEa10(a2[9]);
			
        }
	}
			
		
		
		hs.setAttribute("a1", param.getEa1());
		hs.setAttribute("a2", param.getEa2());
		hs.setAttribute("a3", param.getEa3());
		hs.setAttribute("a4", param.getEa4());
		hs.setAttribute("a5", param.getEa5());
		hs.setAttribute("a6", param.getEa6());
		hs.setAttribute("a7", param.getEa7());
		hs.setAttribute("a8", param.getEa8());
		hs.setAttribute("a9", param.getEa9());
		hs.setAttribute("a10", param.getEa10());
		
		
		return param;
	}
	
	
	
	// 영어정답
	public static StudyPARAM ansEng(HttpSession hs, StudyPARAM param,
			PointVO vo, UserPARAM userParam) {
					
		int point = 0;
		System.out.println("영어 param.getLevel = " + param.getLevel());
		
		String a1 = (String)hs.getAttribute("a1");
		String a2 = (String)hs.getAttribute("a2");
		String a3 = (String)hs.getAttribute("a3");
		String a4 = (String)hs.getAttribute("a4");
		String a5 = (String)hs.getAttribute("a5");
		String a6 = (String)hs.getAttribute("a6");
		String a7 = (String)hs.getAttribute("a7");
		String a8 = (String)hs.getAttribute("a8");
		String a9 = (String)hs.getAttribute("a9");
		String a10 = (String)hs.getAttribute("a10");
		
		System.out.println("a1값 : " + a1);
		System.out.println("userEa1 값 : " + param.getUserEa1());
		
		if(param.getLevel() == 1) {
			// 정답에서
			if(a1.equals(param.getUserEa1())) {
				point += 10;
				vo.setTotalPoint(point);
				vo.setMyPoint(point);
				vo.setI_user(userParam.getI_user());
			}
			
			if(a2.equals(param.getUserEa2())) {
				point += 10;
				vo.setTotalPoint(point);
				vo.setMyPoint(point);
				vo.setI_user(userParam.getI_user());
			}
			
			if(a3.equals(param.getUserEa3())) {
				point += 10;
				vo.setTotalPoint(point);
				vo.setMyPoint(point);
				vo.setI_user(userParam.getI_user());
			}
			
			if(a4.equals(param.getUserEa4())) {
				point += 10;
				vo.setTotalPoint(point);
				vo.setMyPoint(point);
				vo.setI_user(userParam.getI_user());
			}
			
			if(a5.equals(param.getUserEa5())) {
				point += 10;
				vo.setTotalPoint(point);
				vo.setMyPoint(point);
				vo.setI_user(userParam.getI_user());
			}
			
			if(a6.equals(param.getUserEa6())) {
				point += 10;
				vo.setTotalPoint(point);
				vo.setMyPoint(point);
				vo.setI_user(userParam.getI_user());
			}
			
			if(a7.equals(param.getUserEa7())) {
				point += 10;
				vo.setTotalPoint(point);
				vo.setMyPoint(point);
				vo.setI_user(userParam.getI_user());
			}
			
			if(a8.equals(param.getUserEa8())) {
				point += 10;
				vo.setTotalPoint(point);
				vo.setMyPoint(point);
				vo.setI_user(userParam.getI_user());
			}
			
			if(a9.equals(param.getUserEa9())) {
				point += 10;
				vo.setTotalPoint(point);
				vo.setMyPoint(point);
				vo.setI_user(userParam.getI_user());
			}
			
			if(a10.equals(param.getUserEa10())) {
				point += 10;
				vo.setTotalPoint(point);
				vo.setMyPoint(point);
				vo.setI_user(userParam.getI_user());
			}
			
		}
		return param;
	}
}
