package com.artauction.socketHandler;

import java.io.IOException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.artauction.domain.UserVO;
import com.artauction.service.MemberService;
import com.artauction.domain.Alarm;

@Repository
public class WebSocketHandler extends TextWebSocketHandler {
	
	//세션 리스트
    private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
    
    @Autowired
    private MemberService memberService;

    private static Logger logger = LoggerFactory.getLogger(WebSocketHandler.class);
    
    //웹소켓 아이디 가져오기
  	private String getId(WebSocketSession session) {
  		
  		Map<String, Object> httpSession = session.getAttributes();
  		
  		System.out.println(httpSession.get("SPRING_SECURITY_CONTEXT").toString());
  		String a = httpSession.get("SPRING_SECURITY_CONTEXT").toString();
  		String[] b = a.split("Username: ");
  		String[] c = b[1].split(";");
  		String userid = c[0];
  		
  		System.out.println(userid);
  		int getAlarm = memberService.getAlarm(userid);
  		System.out.println(getAlarm);
  		if(getAlarm>0) {
  			System.out.println("알람이 전달될 유저입니다 : " +userid );
  			try {
				session.sendMessage(new TextMessage("마이페이지를 확인하세요"));
			} catch (IOException e) {
				e.printStackTrace();
			}
  		}
  		
  		if(userid == null) {
  			return session.getId();
  		} else {
  			return userid;
  		}
  	}
    
    //클라이언트가 연결 되었을 때 실행
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
    	
        sessionList.add(session);
        
        String senderId = getId(session);
        //System.out.println("접속자 세션id:"+session.getId());
        //System.out.println("접속자id:"+senderId);
        //System.out.println(session.getId()+"가 연결됨");
    }

    //클라이언트가 웹소켓 서버로 메시지를 전송했을 때 실행
    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
    	/*
    	System.out.println("2");
        logger.info("{}로 부터 {} 받음", session.getId(), message.getPayload());
        
        System.out.println("{"+session.getId()+"}로 부터 {"+message.getPayload()+"} 받음");
        //모든 유저에게 메세지 출력
        for(WebSocketSession sess : sessionList){
            //sess.sendMessage(new TextMessage(message.getPayload()));
        	if(sess.getId().equals(message.getPayload())) {
        		//getMessage(sess, message.getPayload());
        		sess.sendMessage(new TextMessage(message.getPayload()));
        		System.out.println(message.getPayload() +"/"+sess.getId());
        	}
        	
        }
        */
    }
    
    //클라이언트 연결을 끊었을 때 실행
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        sessionList.remove(session);
        //logger.info("{} 연결 끊김.", session.getId());
    }
	
}
