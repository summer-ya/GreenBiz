package login.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import login.dto.Member;
import login.service.face.MemberService;

@Controller
public class FindController {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired private MemberService memberService;
	
		// 사번 찾기
		@RequestMapping(value = "/find/memberNo", method=RequestMethod.GET)
		public void lostMemberNo() {
			logger.info("/find/findMemberNo [GET]");
		}

		@RequestMapping(value = "/find/memberNo", method=RequestMethod.POST)
		public ModelAndView findMemberNoProc(
				 Member member
				, HttpSession session
					) {
			logger.info("/find/memberNo [POST]");
			logger.info("전달 파라미터 : {}", member);

			boolean findNo = memberService.findNo(member);
			logger.info("findNo:{}",findNo);
			
			Member memberNo = memberService.info(member);
			ModelAndView mav = new ModelAndView();
			
			if(findNo) {
				session.setAttribute("findNo", findNo);
				session.setAttribute("memberName", memberNo.getMemberName());
				session.setAttribute("email", memberNo.getEmail());
				session.setAttribute("memberNo", memberNo.getMemberNo());
				
//				mav.addObject("msg", member.getMemberName() +"님의 사원번호는 " + member.getMemberNo() + "입니다 ");
				mav.setViewName("redirect:/find/ok");
				
				return mav;
			} else {
				session.invalidate();
				mav.addObject("msg", "이름과 이메일을 확인해주세요.");
				mav.setViewName("/find/memberNo");
				
				return mav;
			}
		}
		
		@RequestMapping("/find/ok")
		public void findOk() {
			logger.info("/find/ok");
		}
		
		//------------------------------------------------------------------------

		// 비밀번호 찾기
		@RequestMapping(value = "/find/password", method=RequestMethod.GET)
		public void findPw() {
			logger.info("/find/password [GET]");
		}
		
		@RequestMapping(value = "/find/password", method=RequestMethod.POST)
		public ModelAndView findPwProc(Member member, HttpSession session) {
			logger.info("/find/password [POST]");
			logger.info("전달 파라미터 : {}", member);

			boolean findPw = memberService.findPw(member);
			logger.info("findPw:{}",findPw);
			
			Member memberPw = memberService.infoPw(member);
			ModelAndView mav = new ModelAndView();
			
			if(findPw) {
				session.setAttribute("findPw", findPw);
				session.setAttribute("memberNo", memberPw.getMemberNo());
				session.setAttribute("email", memberPw.getEmail());
				
				mav.addObject("msg", "비밀번호 재설정해주세요.");
				mav.setViewName("/find/changePw");
				
				return mav;
				
			} else {
				session.invalidate();
				mav.addObject("msg", "사번과 이메일을 확인해주세요.");
				mav.setViewName("/find/password");
				
				return mav;
			}
		}

		//------------------------------------------------------------------------
		
		// 비밀번호 변경
		@GetMapping("/find/changePw")
		public void changePw() {
			logger.info("/find/changePw [GET]");
		}
		
		@PostMapping("/find/changePw")
		public ModelAndView changePwProc(Member member, HttpSession session) {
			logger.info("/find/changePw [POST]");
			logger.info("전달 파라미터 : {}", member);
		
			ModelAndView mav = new ModelAndView();

			member.setMemberNo((String)session.getAttribute("memberNo"));
			member.setEmail((String)session.getAttribute("email"));
			
			logger.debug("{}", member);
			
//			boolean changeChk = memberService.chkPw(login);
			
			memberService.changePassword(member);
			
			mav.setViewName("redirect:/login/login");
			
			return mav;
		}
		
}
