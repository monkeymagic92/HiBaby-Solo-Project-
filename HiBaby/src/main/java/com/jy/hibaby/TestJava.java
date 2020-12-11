package com.jy.hibaby;

import com.jy.hibaby.study.model.StudyPARAM;

public class TestJava {

	
	
	public static void main(String[] args) {
		StudyPARAM param = new StudyPARAM();
		
		String[] eArray1 = {"고양이", "사자", "호랑이","개", "여자", "자동차", "지구", "피아노", "컴퓨터", "꽃", "아기"};
		
		String[] eArray2 = {"cat", "lion", "tiger","dog","girl","car", "earth","piano","computer","flower", "baby"};
		
		String[] a1 = new String[11];
		String[] a2 = new String[11];
		
		int a[] = new int[11]; 
        int ran = 0;
        for(int i=0;i<a1.length;i++) { 
        	ran = (int)(Math.random() * 11) + 0;
            a[i] = ran;
            
			a1[i] = eArray1[ran];
			a2[i] = eArray2[ran]; 
            
            for(int j=0;j<i;j++) { // 중복제거
                    
                if(a[i]==a[j]) {  
                
                    i--;
                }
            }
            
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
        
        
        System.out.println(param.getEq1());
        System.out.println(param.getEa1());
        
        System.out.println(param.getEq2());
    	System.out.println(param.getEa2());
    	
    	System.out.println(param.getEq3());
    	System.out.println(param.getEa3());
    	
    	System.out.println(param.getEq4());
    	System.out.println(param.getEa4());
     	
    	System.out.println(param.getEq5());
     	System.out.println(param.getEa5());
     	
     	System.out.println(param.getEq6());
     	System.out.println(param.getEa6());
     	
     	System.out.println(param.getEq7());
     	System.out.println(param.getEa7());
     	
     	System.out.println(param.getEq8());     	
     	System.out.println(param.getEa8());
     	
     	System.out.println(param.getEq9());     	
     	System.out.println(param.getEa9());
     	
     	System.out.println(param.getEq10());
     	System.out.println(param.getEa10());
    }
	
}



		/*
		StudyPARAM param = new StudyPARAM();
	
		String[] eArray1 = {"고양이", "사자", "호랑이"};
		
		String[] eArray2 = {"cat", "lion", "tiger"};
		
		String[] a1 = new String[3];
		String[] a2 = new String[3];
 		
		int ran = 0;
		boolean cheak;
		int[] arr = new int[3];
		
		for(int i=0; i<eArray2.length; i++) {
			
			ran = (int)(Math.random() * 3) + 0;
			
			arr[i] = ran;
			a1[i] = eArray2[ran];
			
			
			for(int j=0; j<i; j++) {
				if(arr[i] != ran) {
			
					i--;
					break;
				}
			}
			
			
			param.setEa1(a1[0]);
			param.setEa2(a1[1]);
			param.setEa3(a1[2]);
					
			
		}
		System.out.println(param.getEa1());
		
		System.out.println(param.getEa2());
		
		System.out.println(param.getEa3());
			*/
		
		
		
		
		
		
	
		
		
					
			
		
		
 		

