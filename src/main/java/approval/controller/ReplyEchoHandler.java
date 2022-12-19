package approval.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.util.StringUtils;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import login.dto.Member;



public class ReplyEchoHandler extends TextWebSocketHandler {

	List<WebSocketSession> sessions = new ArrayList<>();
	Map<String, WebSocketSession> userSessions = new HashMap<String, WebSocketSession>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println("afterConnectionEstablished : " + session);
		sessions.add(session);
		String senderId = getId(session);
		if(senderId != null) {
			System.out.println( senderId + "연결 됨");
			userSessions.put(senderId, session);
		}
		WebSocketSession appWriterSession =	userSessions.get(senderId);
		System.out.println("확인 >>>>>>>>"+appWriterSession);
		
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.println("handleTextMessage :" + session +":"+ message);
		
		String senderId = getId(session);

		String msg = message.getPayload();
		if(StringUtils.hasText(msg)) {
			
			String[] strs = msg.split(",");
			if(strs != null && strs.length == 5) {
				String cmd = strs[0];
				String replyWriter = strs[1]; //결재자 이름
				String appWriter = strs[2]; //기안자사번 
				String apptitle = strs[3]; //기안 제목
				String approvalNo = strs[4]; //기안 제목
				
				WebSocketSession appWriterSession =	userSessions.get(appWriter);
				if("reply".equals(cmd) && appWriterSession != null) {
					TextMessage tmpMsg = new TextMessage(replyWriter +" 님이 <a href=/approval/confirm?approvalNo=" + approvalNo +">" +apptitle+"</a> 을 결재 하였습니다");
					appWriterSession.sendMessage(tmpMsg);
				} else if("reject".equals(cmd) && appWriterSession != null) {
					TextMessage tmpMsg = new TextMessage(replyWriter +" 님이 <a href=/approval/confirm?approvalNo=" + approvalNo +">" +apptitle+"</a> 을 반려 하였습니다");
					appWriterSession.sendMessage(tmpMsg);
					
				}
			}
		}
	}
	
	private String getId(WebSocketSession session) {
		Map<String,Object> httpSession = session.getAttributes();
		
		
		String loginId = (String) httpSession.get("loginId"); // 세션에 저장된 loginId 기준 조회
		return loginId==null? null: loginId;
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println("afterConnectionClosed :" + session +":"+ status);
	}
}

