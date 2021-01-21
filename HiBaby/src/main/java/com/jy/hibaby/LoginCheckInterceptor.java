package com.jy.hibaby;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

// HandlerInterceptorAdapter (얘는 스프링자체적으로 있는 내장객체)
public class LoginCheckInterceptor extends HandlerInterceptorAdapter{
	static int chkNum = 0;
	
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		
		String uri = request.getRequestURI();
		String[] uriArr = uri.split("/");
				
		if(uri.equals("/")) {
			return true;
		} else if(uriArr[1].equals("res")) { //리소스 (js, css, img)
			return true;
		}
		
		chkNum++;
		boolean isLogout = SecurityUtils.isLogout(request);		
		
		
			switch(uriArr[2]) {
			case "login": case "join": // 로그인이 되어있다면 login,join 페이지못들어가고 /index/main 으로 가겠다
				if(!isLogout) { // 로그인 되어있는 상태  (!가 붙어있으니, 위에 isLogout 변수참고)
					
					response.sendRedirect("/user/login");
					return false;
				}
			}
		
				/* board */
		switch(uriArr[1]) {
		case "board":// 1차 주소값이 user라면 무조건 로그인이 되어있어야 함
			switch(uriArr[2]) {
			case "boardReg": case "del": case "delete":
				if(isLogout) { // 로그아웃 상태  (!가 붙어있으니, 위에 isLogout 변수참고)
					
					response.sendRedirect("/user/login");
					return false;
				}
			}
		}
		
		
		/* study */
		switch(uriArr[1]) {
		case "study":// 1차 주소값이 user라면 무조건 로그인이 되어있어야 함
			switch(uriArr[2]) {
			case "rank": case "math": case "eng": case "main":
				if(isLogout) { // 로그아웃 상태  (!가 붙어있으니, 위에 isLogout 변수참고)
					
					response.sendRedirect("/user/login");
					return false;
				}
			}
		}
		return true;  // true면 주소값 그대로감  false 면 막아버림
	}
	
}
