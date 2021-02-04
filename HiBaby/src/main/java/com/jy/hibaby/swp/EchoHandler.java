package com.jy.hibaby.swp;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.jy.hibaby.CommonUtils;


public class EchoHandler extends TextWebSocketHandler{
	

	// 세션 리스트
    private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();

    private static Logger logger = LoggerFactory.getLogger(EchoHandler.class);

    // 클라이언트가 연결 되었을 때 실행
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
    	System.out.println("웹소켓 연결이 되었습니다");
        sessionList.add(session);
        logger.info("{} 연결됨", session.getId()); 
    }
    

    // 클라이언트가 웹소켓 서버로 메시지를 전송했을 때 실행
    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
    	
    	String filterCtnt = swearWordFilter(message.getPayload().toLowerCase()); // script 필터링 ( lucy 에서 1차적으로 막았지만 웹소켓에서 한번더 막아야 됬음 )
		String filterCtnt2 = scriptFilter(filterCtnt);
		
        logger.info("{}로 부터 {} 받음", session.getId(), filterCtnt2);	
        
        //모든 유저에게 메세지 출력
        for(WebSocketSession sess : sessionList){
            sess.sendMessage(new TextMessage(filterCtnt2));
        }
    }
    
    
    // 클라이언트 연결을 끊었을 때 실행
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
    	System.out.println("웹소켓 연결이 끊겼습니다!");
        sessionList.remove(session);
        logger.info("{} 연결 끊김.", session.getId());
    }
    
    
    
    // 욕 필터
  	private String swearWordFilter(final String ctnt) {
  		String[] filters = CommonUtils.filter();
  		String result = ctnt;
  		for(int i=0; i<filters.length; i++) {
  			result = result.replace(filters[i], "***");
  		}
  		return result;
  	}
  	
  	//스크립트 필터
  	private String scriptFilter(final String ctnt) {
  		
  		String[] filters = {"<script>", "</script>"};
  		String[] filterReplaces = {"&lt;script&gt;", "&lt;/script&gt;"};
  		
  		String result = ctnt.toLowerCase();
  		System.out.println("result 값 : " + result);
  		
  		for(int i=0; i<filters.length; i++) {
  			
  			result = result.replace(filters[i], filterReplaces[i]);
  		}
  		return result;
  	}

}

