package myPage.controller;

import java.util.List;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import login.dao.face.MemberDao;
import myPage.dao.face.MyPageDao;
import myPage.dto.Leave;
import myPage.dto.Member;
import myPage.service.impl.MyPageService;

@Controller
public class MyPageController {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(MyPageController.class);
	
	//MyPageSerice 객체를 스프링에서 생성하여 주입시킴
	@Autowired public MyPageService myPageService;
	@Autowired MyPageDao myPagedao;
	@Autowired MemberDao memberdao;
	
	//01 회원 상세정보 조회
	//url pattern mapping
	@RequestMapping(value = "/myPage/myPage")
	public String memberView(Model model, HttpSession session) {
		LOGGER.info("리스트 확인");		
		//회원정보를 model에 저장
		//controller => service => dao 요청
		List<Leave> list = myPagedao.selectLeave();
		
		List<Member> listMember = myPagedao.selectMemberNo();
		
		model.addAttribute("list", list);
		LOGGER.info("연차 {} :", list );
		
		model.addAttribute("listMember", listMember);
		LOGGER.info("멤버{} : ", listMember );
		
		//아이디 세션
		Member member = new Member();
		member.setMemberNo((String) session.getAttribute("memberNo"));
		
		return "/myPage/myPage"; 
	}
	
	//02_02 회원 정보 수정 페이지
	@RequestMapping(value = "/myPage/myPageModify", method=RequestMethod.GET)
		public String memberUpdate(Model model, HttpSession session) {
		
		//아이디 세션
		Member member = new Member();
		member.setMemberNo((String) session.getAttribute("memberNo"));
		
		Member myPageModify = myPagedao.selectMemberNo(member);
		
		LOGGER.info("업데이트");
		model.addAttribute("memberUpdate", member);
		
		return "/myPage/myPageModify";
	}
	
	@RequestMapping(value = "/myPage/myPageModify", method=RequestMethod.POST)
		public String memberUpdate(Member member, HttpSession session) {
		
		LOGGER.info("수정확인");
		myPageService.myPageModify(member);
		
		return "/myPage/myPage";
	
	}
	
	
	
}
