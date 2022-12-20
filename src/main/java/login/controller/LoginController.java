package login.controller;

import java.util.HashMap;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import login.dto.Member;
import login.service.face.MemberService;

@Controller
public class LoginController {

	// 로그 객체
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

	// 서비스 객체
	@Autowired private MemberService memberService;

	// 로그인
	@RequestMapping(value = "/login/login", method=RequestMethod.GET)
	public void login() {
		logger.info("/login/login [GET]");
	}

	@RequestMapping(value = "/login/login", method=RequestMethod.POST)
	public ModelAndView loginProc(String memberNo, String password, Member member, HttpSession session, HttpServletResponse resp, Model model, boolean memoryId, boolean memoryPw) {
		logger.info("/login/login [POST]");
		logger.info("전달 파라미터 : {}", member);

		boolean islogin = memberService.login(member);
		logger.info("islogin : {}", islogin);
		logger.info("memberNo : {}", member.getMemberNo());

	    String memberno = member.getMemberNo();
		ModelAndView mav = new ModelAndView();

		if(islogin) {

			session.setAttribute("login", islogin);
			session.setAttribute("loginId", member.getMemberNo());
			session.setAttribute("memberName", member.getMemberName());
			
	        //추가한 코드 /
	         HashMap<String,String> memInfo = memberService.getMemInfo(memberno);
	         logger.info("memInfo : {}", memInfo);
	         session.setAttribute("memInfo",memInfo);


			//			아이디 기억
			if(memoryId) {
				Cookie cookie = new Cookie("memberNo", memberNo);
				resp.addCookie(cookie);
				logger.info("cookie :{}",cookie.toString());
			} else {
				Cookie cookie = new Cookie("memberNo", memberNo);
				cookie.setMaxAge(0);
				resp.addCookie(cookie);
			}

			//			비밀번호 기억
			if(memoryPw) {
				Cookie cookie = new Cookie("password", password);
				resp.addCookie(cookie);
				logger.info("cookie :{}",cookie.toString());
			} else {
				Cookie cookie = new Cookie("password", password);
				cookie.setMaxAge(0);
				resp.addCookie(cookie);
			}

			//			mav.addObject("msg", loginParam.getMemberName() +"님, 오늘도 좋은 하루 되세요. ");
			mav.setViewName("redirect:/mainPage/mainPage");
			return mav;

		} else {

			session.invalidate();

			mav.addObject("msg", "사원번호와 비밀번호를 확인해주세요.");
			mav.setViewName("/login/login");

			return mav;
		}
	}

	// 로그아웃
	@RequestMapping("/login/logout")
	public String logout(HttpSession session) {
		logger.info("/login/logout");
		session.invalidate();
		return "redirect:/login/login";
	}

}

