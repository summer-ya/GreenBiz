package leave.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class LeaveController {

	//연차 결재 목록 보여주기
	@RequestMapping(value = "/leave/LeaveMain", method = RequestMethod.GET)
	public void leaveMain(Model model, HttpSession session) {
		

		
	}
	
	
	
	//연차 작성폼
	
	 @RequestMapping(value = "/leave/LeaveApplication", method = RequestMethod.GET)
	 public void leaveList(Model model, HttpSession session) {
	 
	 
	 
	  }
	 
	
	//연차 확인서(결재권한자)
	/*
	 * @RequestMapping(value = "/leave/leaveConfirm", method = RequestMethod.GET)
	 * public void leaveConfirm() {
	 * 
	 * 
	 * 
	 * }
	 */}
