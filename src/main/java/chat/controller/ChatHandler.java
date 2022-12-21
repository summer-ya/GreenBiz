package chat.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import admin.dept.dto.Dept;
import admin.dept.dto.DeptFile;
import admin.dept.service.face.DeptService;
import login.service.face.MemberService;

public class ChatHandler extends TextWebSocketHandler {

   // 여러개의 웹소켓 세션을 담도록 리스트를 생성한다.
   List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
   

   @Override
   public void afterConnectionEstablished(WebSocketSession session) throws Exception {
   
      
      // 연결되었을떄
      System.out.println("연결됨 : " + session.getId());
      sessionList.add(session);
      System.out.println("연결된갯수 : " + sessionList.size());
      super.afterConnectionEstablished(session);
   }

   @Override
   public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
      System.out.println("연결끊김 : " + session.getId());
      sessionList.remove(session);
      super.afterConnectionClosed(session, status);
   }
   
   // 클라이언트(브라우저)에서 서버로 메시지를 보냈을때

   
      @Override
      protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
         // 메시지가 들어오는 부분
         String strMessage = message.getPayload();
         System.out.println("메시지 : " + strMessage);
         super.handleTextMessage(session, message);
         
         SimpleDateFormat stf = new SimpleDateFormat("yyy-MM-dd HH:mm:ss");
         String strDate=stf.format(new Date());
         strMessage+="|"+strDate;
         for (WebSocketSession webSocketSession:sessionList) {
            webSocketSession.sendMessage(new TextMessage(strMessage));
         }
         super.handleTextMessage(session, message);

      }

}