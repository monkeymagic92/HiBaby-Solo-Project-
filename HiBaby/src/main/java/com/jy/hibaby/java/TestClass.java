package com.jy.hibaby.java;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import com.jy.hibaby.pro.model.ProPARAM;



public class TestClass {

	public static void main(String[] args) {
		
		/*
		int lotto[] = new int [6];
		
     	  	// 번호 생성
		for(int i=0; i<6; i++) {
			lotto[i] = (int)(Math.random() * 45) + 1;
            
       		  	 // 중복 번호 제거
			for(int j=0; j<i; j++) {
				if(lotto[i] == lotto[j]) {
					i--;
					break;
				}
			}
		}
		
		System.out.print("로또 번호: ");
		
	  	 // 번호 출력
		for(int i=0; i<6; i++) {
			System.out.print(lotto[i] + " ");
		}
		*/
		
		/*
		int userNm = 5;
		
		for (int i=0; i<=userNm; i++) {
			System.out.println(i + "번쨰 : " + lottoNumbers().toString());
		}
		*/
		
		int ran[] = new int[6];
		int ran2[] = new int[6];
		
		for(int i=0; i<6; i++) {
			
			ran[i] = (int)(Math.random() * 45 + 1);
			
			
		}
		Arrays.sort(ran);
		
		for(int i=0; i<ran.length; i++) {
			System.out.println(i + " : " + ran[i]);
		}
	
	}
	
	
	static String lottoNumbers() {
		ProPARAM param = new ProPARAM();
		Set<Integer> set = new HashSet<Integer>();
		
		while(set.size() != 5) {
			set.add((int)(Math.random() * 45 + 1));
		}
		
		List<Integer> list1 = new ArrayList<Integer>(set);
		Collections.sort(list1);
		
		return list1.toString();
	}
	
	
	
	
}








