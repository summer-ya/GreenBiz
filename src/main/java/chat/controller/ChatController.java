package chat.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import admin.dept.dto.Dept;
import admin.dept.dto.DeptFile;
import admin.dept.service.face.DeptService;
import chat.service.face.ChatService;
import login.dto.Member;
import login.service.face.MemberService;

@Controller
public class ChatController {
   
   private Logger logger = LoggerFactory.getLogger(this.getClass());
   
   @Autowired ChatService chatService;
   @Autowired MemberService memberService;
   @Autowired DeptService deptService;
   
   @RequestMapping("/chat/main")
   public void chatMain(Model model, Member member, HttpServletRequest req) {
      
      List<Member> list = memberService.list();
      model.addAttribute("list", list);
      
      
      //로그인 프로필 사진
      HttpSession session = req.getSession();
      String loginId = (String) session.getAttribute("loginId");
      HashMap<String, String> memInfo = memberService.getMemInfo(loginId);

      Dept dept = new Dept();
      // System.out.println("member : "+ member);
      dept.setMemberNo(memInfo.get("MEMBERNO"));
      DeptFile deptFile = deptService.getAttachFile(dept);
      model.addAttribute("file", deptFile);
   }

   //--------------------------------------------------------------
   
   @RequestMapping(value="/chat/chat", method=RequestMethod.GET)
   public void chat() {
      
   }

   
}