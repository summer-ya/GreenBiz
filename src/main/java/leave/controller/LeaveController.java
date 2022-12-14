package leave.controller;

import java.util.HashMap;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import approval.controller.ApprovalController;
import approval.dto.Paging;
import leave.dto.Leave;
import leave.dto.LeaveDetail;
import leave.service.face.LeaveService;
import login.service.face.MemberService;

@Controller
public class LeaveController {

	private Logger logger = LoggerFactory.getLogger(ApprovalController.class);
	@Autowired LeaveService leaveService;
	@Autowired MemberService memberService;
	
	//연차 목록 보여주기
	@RequestMapping(value = "/leave/LeaveMain", method = RequestMethod.GET)
	public void leaveMain(@RequestParam(defaultValue = "0") int curPage, Model model, HttpSession session) {
		
		//로그인 세션
		String loginId = (String) session.getAttribute("loginId");
		
		HashMap<String,String> memInfo = memberService.getMemInfo(loginId);
        logger.info("memInfo : {}", memInfo);
        session.setAttribute("memInfo",memInfo);
		
		Paging paging = leaveService.getMainPaging(curPage, loginId);
		model.addAttribute("paging", paging);
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("loginId", loginId);
		map.put("paging", paging);
		
		List<HashMap<String, String>> list = leaveService.leavelist(map);		

		
	}
	
	
	
	//연차 작성폼
	@RequestMapping(value = "/leave/LeaveApplication", method =
	RequestMethod.GET) public void leaveList(Model model, HttpSession session) {
	 
		//로그인 세션
		String loginId = (String) session.getAttribute("loginId");
		logger.info("@@@@@@@@@ {}", loginId );
		
		HashMap<String,String> memInfo = memberService.getMemInfo(loginId);
        logger.info("memInfo : {}", memInfo);
//        session.setAttribute("memInfo",memInfo);

		//이름, 부서명, 직급
        model.addAttribute("memInfo", memInfo);
	 
	 }
	 
	//연차 작성폼
	@RequestMapping(value = "/leave/LeaveApplication", method = RequestMethod.POST)
	public void leaveListView(Model model, HttpSession session, LeaveDetail leaveDetail,@RequestParam HashMap<String, String> params, Leave leave) {
		
		int leaveNo = leaveService.findnextno();
		
		//로그인 세션
		String loginId = (String) session.getAttribute("loginId");
		 
		leave = Leave.builder()
					 .leaveNo(leaveNo)
					 .memberNo(loginId)
					 .leaveStart(params.get("leaveStart"))
					 .leaveEnd(params.get("leaveEnd"))
					 .leaveEtc(params.get("leaveEtc"))
					 .leaveReason(params.get("leaveReason"))
					 .build();
			 
		logger.info("############## {}",leave);
		leaveService.leaveWrite(leave);
		
		
//		leaveDetail = LeaveDetail.builder()
//				.id(id)
//				.leaveNo(leaveNo)
//				.memberNo(params.get("ApprovalNo"))
//				.memberName(params.get("ApprovalName")
//				.rank(params.get("ApprovalRank"))
//				.leaveState("0")
//				.build();
		
		  }
	 
	//연차 결재 확인
	
	  @RequestMapping(value = "/leave/LeaveMain", method = RequestMethod.POST)
	  public void leaveCheck(@RequestParam HashMap<String, String> params, Leave leave) {
	  System.out.println(params);
		  
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
