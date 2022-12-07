package login.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class AdminLoginInterceptor implements HandlerInterceptor{
	private static final Logger logger = LoggerFactory.getLogger(AdminLoginInterceptor.class);

	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		logger.info("+ + + 인터셉터 시작 + + +");

		HttpSession session = request.getSession();
		
		if(session.getAttribute("login") == null) { // 1. 비 로그인 상태
			
			logger.info(">> 접속 불가 : 비 로그인 상태");
			
//			response.sendRedirect("/interceptor/main");
			response.sendRedirect("/login/fail");
			
			return false; // 컨트롤러 접근 금지 시키기
//			return true; // 컨트롤러 접근 허용
			
		} else { // 2. 로그인 상태

			logger.info(">>로그인 상태");

			//	2-1. 일반 사용자 로그인 상태
			if(!"admin".equals(session.getAttribute("loginAdId"))) {
				logger.info(">> 접속불가 : 일반 사용자 로그인");

				response.sendRedirect("/login/fail");
				return false; // 컨트롤러 접근 금지 시키기
			}
		}
		
		//	2-2. 관리자 로그인 상태
		logger.info(">> 정상접근 : 관리자 로그인");

		
		return HandlerInterceptor.super.preHandle(request, response, handler);
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

		logger.info("+ + + 인터셉터 종료 + + +");

		
		HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
	}

}
