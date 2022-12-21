package myPage.controller;

import java.util.HashMap;
import java.util.List;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import admin.dept.dto.Dept;
import admin.dept.dto.DeptFile;
import admin.dept.service.face.DeptService;
import login.dao.face.MemberDao;
import myPage.dao.face.MyPageDao;
import myPage.dto.Leave;
import myPage.dto.Member;
import myPage.service.face.MyPageService;

@Controller
public class MyPageController {
   
   private static final Logger LOGGER = LoggerFactory.getLogger(MyPageController.class);
   
   //MyPageSerice 객체를 스프링에서 생성하여 주입시킴
   @Autowired public MyPageService myPageService;
   @Autowired DeptService deptService;
   @Autowired MyPageDao myPagedao;
   @Autowired MemberDao memberdao;
   
   //01 회원 상세정보 조회
   //url pattern mapping
   @RequestMapping(value = "/myPage/myPage")
   public String memberView(Model model, HttpSession session) {
     
      
     //LOGGER.info("리스트 확인");      
      //회원정보를 model에 저장
      //controller => service => dao 요청
      // 잠시 주석처리!
      //List<Leave> list = myPagedao.selectLeave();
      
      List<Member> listMember = myPagedao.selectMemberNo();
      
      // 잠시 주석처리!
      //model.addAttribute("list", list);
      //LOGGER.info("연차 {} :", list );
      
      model.addAttribute("listMember", listMember);
//      LOGGER.info("멤버{} : ", listMember );
      
      //아이디 세션
   //   HashMap<String,String>  member = (  HashMap<String,String> )session.getAttribute("memberInfo");
      Dept dept = new Dept();
   //   System.out.println("member : "+ member);
      dept.setMemberNo(listMember.get(0).getMemberNo());
      DeptFile deptFile = deptService.getAttachFile(dept);
      
      model.addAttribute("file", deptFile);
      System.out.println("file : "+ deptFile);
      return "/myPage/myPage"; 
   }
   
   //02_02 회원 정보 수정 페이지
   @RequestMapping(value = "/myPage/myPageModify", method = RequestMethod.GET)
      public String memberUpdate(Model model, HttpSession session, Member member) {
      
      //아이디 세션
      member.setMemberNo((String) session.getAttribute("loginId"));
//      LOGGER.info("로그인 사번 {}", (String) session.getAttribute("loginId"));
      
      //멤버 정보 조회
      Member memberData = myPagedao.selectmyPage(member);
//      LOGGER.info("사원 조회 {}", memberData);
      
      //모델값 전달
      model.addAttribute("myPageModify", memberData);
      
      return "/myPage/myPageModify";
   }
   
   @RequestMapping(value = "/myPage/myPageModify", method=RequestMethod.POST)
      public String memberUpdateView(Member member, HttpSession session) {
      //아이디 세션
//      LOGGER.info("수정확인{}", member);
      member.setMemberNo((String) session.getAttribute("loginId"));
      
      
      myPagedao.myPageModify(member);
      
      return "redirect:/myPage/myPage?memberNo=" + member.getMemberNo();
   
   }
   
   
   
}