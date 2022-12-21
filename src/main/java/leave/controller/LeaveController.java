package leave.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import approval.dto.Paging;
import leave.dto.Leave;
import leave.dto.LeaveDetail;
import leave.dto.Member;
import leave.service.face.LeaveService;
import login.service.face.MemberService;

@Controller
public class LeaveController {

	private Logger logger = LoggerFactory.getLogger(LeaveController.class);
	@Autowired LeaveService leaveService;
	@Autowired MemberService memberService;
	
	//연차 목록 보여주기
	@RequestMapping(value = "/leave/LeaveMain", method = RequestMethod.GET)
	public void leaveMain(@RequestParam(defaultValue = "0") int curPage, Model model, HttpSession session) {
		
		try {
			//로그인 세션
			String loginId = (String) session.getAttribute("loginId");
			
			/*
			 * HashMap<String,String> memInfo = memberService.getMemInfo(loginId);
			 * logger.info("memInfo : {}", memInfo);
			 * session.setAttribute("memInfo",memInfo); // 왜 다시 셋?
			 * 
			 * Paging paging = leaveService.getMainPaging(curPage, loginId);
			 * model.addAttribute("paging", paging); logger.info("paging 확인");
			 */
			
			List<Leave> list = leaveService.getLeaveListByMemberNo(loginId);
			logger.info("list : {}", list);
			Paging paging = leaveService.getLeaveListByMemberNoCnt(curPage, loginId);
			model.addAttribute("paging", paging);
			model.addAttribute("list", list);
			logger.info("paging 확인");
			 
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("loginId", loginId);
			HashMap<String, Object> leaveMap = leaveService.leavelist(loginId);
			model.addAttribute("leaveMap", leaveMap); logger.info("리스트 확인{}", map);
			 
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	//연차 작성폼
	@RequestMapping(value = "/leave/LeaveApplication", method =
	RequestMethod.GET) public void leaveList(Model model, HttpSession session) {
	 
		//로그인 세션
		String loginId = (String) session.getAttribute("loginId");
		logger.info("@@@@@@@@@ {}", loginId );
		
		HashMap<String,String> memInfo = memberService.getMemInfo(loginId);
        logger.info("memInfo : {}", memInfo);
        
        String deptnum = String.valueOf(  memInfo.get("DEPTNUM") );

        logger.info("deptnum {}",deptnum);
        List<Member> memList = leaveService.getDetpList(deptnum); //부서원 리스트 받아오기

        logger.info("memList {}", memList);
        
        Member approvalMember = leaveService.getApprovalMember(deptnum);
        
		//이름, 부서명, 직급
        model.addAttribute("memInfo", memInfo);
        //부서원리스트
        model.addAttribute("memList", memList);
        model.addAttribute("approvalMember", approvalMember);
	 
	 }
	 
	//연차 작성폼
	@RequestMapping(value = "/leave/LeaveApplication", method = RequestMethod.POST)
	public String leaveListView(Model model, HttpSession session, LeaveDetail leaveDetail,@RequestParam HashMap<String, String> params, Leave leave) {
		
		int leaveNo = leaveService.findnextno();
		
		//로그인 세션
		String loginId = (String) session.getAttribute("loginId");
		 
		logger.info("############## params : {}",params);
		// #{memberName}, #{deptName}, #{leaveUse}
		leave = Leave.builder()
					 .leaveNo(leaveNo)
					 .memberNo(loginId)
					 .leaveStart(params.get("leaveStart"))
					 .leaveEnd(params.get("leaveEnd"))
					 .leaveEtc(params.get("leaveEtc"))
					 .leaveUse(Integer.parseInt(params.get("leaveuse").toString()))
					 .deptName(params.get("deptname"))
					 .leaveRemain(Integer.parseInt(params.get("leaveremain").toString()))
					 .leaveTotal(Integer.parseInt(params.get("leavetotal").toString()))
					 .memberName(params.get("memberName"))
					 .leaveReason(params.get("leaveReason"))
					 .build();
			 
	
		// params : {Approval=, approvalName=이과장, approvalNo=A181230, memberName=김팀장, leavetotal=-, leaveuse=1, leaveremain=NaN, leaveStart=2022-12-16, leaveEnd=2022-12-16, leaveReason=연차, leaveEtc=아픔, proposerText=, appKinds=휴가신청서}
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
			return "leave/LeaveMain";
		  }
	 
	//연차 결재 확인
	
	@RequestMapping(value = "/leave/LeaveMain", method = RequestMethod.POST)
	  public void leaveCheck(@RequestParam HashMap<String, String> params, Leave leave) {
	  System.out.println(params);
		  
	 }
	

	@RequestMapping(value="/leave/confirm")
	@ResponseBody
	public String confirmAjax(@RequestParam Map<String, Object> map, HttpServletRequest req) {
		
		try {
			
			logger.info("map {}", map);
			
			int no = Integer.parseInt(map.get("no").toString());
			Leave leave = leaveService.getLeaveByNo(no);
			logger.info("leave : {}", leave);
			map.put("memberNo", leave.getMemberNo());
			
			// 파라미터로 들어온  값
			String confirm = map.get("confirm").toString().trim();
			// 원래 값
			String oState = leave.getLeaveConfirm();
			// 0: 결재중 1: 반려 2: 승인
			// 결재중0 > 반려1 (연차 수정사항 없음, confirm 변경) .
			// 결재중0 > 승인2 (연차 -, confirm 변경) member.total = leave.remain
			
			// 반려1 > 승인2(연차 -, confirm 변경) member.total = leave.remain
			// 반려1 > 결재중0 (연차 수정사항 없음, confirm 변경)  .
		
			// 승인2 > 반려1 (연차 +, confirm 변경) member.total = leave.total
			// 승인2 > 결재중0 (연차 +, confirm 변경) member.total = leave.total
			
			if(confirm.equals(oState)) {
				return "success";
			}
			
			if(confirm.equals("0")) { 
				if (oState.equals("2")){
					map.put("leaveTotal", leave.getLeaveTotal());
					//member 업데이트
					memberService.updateLeave(map);
				} 
			} else if(confirm.equals("1")) {
				if (oState.equals("2")){
					map.put("leaveTotal", leave.getLeaveTotal());
					//member 업데이트
					memberService.updateLeave(map);
				} 
			} else {
				if (oState.equals("1") || oState.equals("0")){
					map.put("leaveTotal", leave.getLeaveRemain());
					//member 업데이트
					memberService.updateLeave(map);
				} 
			}
			
			// confirm 업데이트
			leaveService.confirmLeave(map);
			
		
			
			
		}catch(Exception e) {
			e.printStackTrace();
			return "failed";
		}
		
		
		
		
		return "success";
	}
	
	 
	 
	//연차 확인서(결재권한자)
	  @RequestMapping(value = "/leave/LeaveConfirm", method = RequestMethod.GET)
	  public void leaveConfirm(@RequestParam(defaultValue = "1") int curPage, HttpServletRequest req, Model model) {
		//연차 목록 보여주기
				
				try {
					HttpSession session = req.getSession();
					//로그인 세션
					String loginId = (String) session.getAttribute("loginId");
					
					
					HashMap<String,String> memInfo = memberService.getMemInfo(loginId);
					logger.info("member : {}", memInfo);
					String rank =  memInfo.get("RANK").toString().trim();
					logger.info("rank : {}", rank);
					if(rank.equals("과장")) {
						String deptName = memInfo.get("NAME").toString();
						Paging paging = leaveService.getMainPaging(curPage, deptName);
						model.addAttribute("paging", paging);
						logger.info("paging : {}",paging);
						Map<String,Object> map = new HashMap<String,Object>();
						map.put("startNo", paging.getStartNo());
						map.put("endNo", paging.getEndNo());
						map.put("deptName", deptName);
						
						List<HashMap<String, Object>> list = leaveService.requestLeaveList(map);
						model.addAttribute("list", list);
						model.addAttribute("team", deptName);
						model.addAttribute("result",true);
						
						
					}else{
						model.addAttribute("result",false);
					}
					
				
				}catch(Exception e) {
					e.printStackTrace();
				}
			}
	}
