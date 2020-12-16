package com.jy.hibaby;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;

public class CommonUtils {
	public static int parseStringToInt(String str) {
		try {
			return Integer.parseInt(str);
		} catch(Exception e) {}
		return 0;
	}
	
	public static double parseStringToDouble(String str) {
		try {
			return Double.parseDouble(str);
		} catch(Exception e) {}
		return 0;
	}
	
	public static int getIntParameter(String key, HttpServletRequest request) {
		return parseStringToInt(request.getParameter(key));
	}
	
	// 사진 추가 
	public static int getIntParameter(String key, MultipartRequest request) {
		return parseStringToInt(request.getParameter(key));
	}
	
	public static double getDoubleParameter(String key, HttpServletRequest request) {
		return parseStringToDouble(request.getParameter(key));
	}
	

	//검색값을 공백 기준으로 문자열을 나눠줌
	public static String[] getSearchNm(String key) {
		String[] split = key.split(" ");
		return split;
		
	}
	
	// 욕 필터링
	public static String[] filter() {
		String[] filters = {"개새끼", "미친년", "ㄱ ㅐ ㅅ ㅐ ㄲ ㅣ", "씨발년", "병신",
			"씨발", "시발", "ㅅㅂ", "ㅄ", "좆", "존만아", "존나", "또라이", "니미", "엿"};
		
		return filters;
	}
	
	
}
