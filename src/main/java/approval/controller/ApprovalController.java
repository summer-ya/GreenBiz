package approval.controller;

import java.util.ArrayList;
import java.util.Arrays;
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
import org.springframework.web.bind.support.SessionStatus;

import approval.dto.AppDetail;
import approval.dto.Approval;
import approval.dto.Paging;
import approval.service.face.ApprovalService;

@Controller
public class ApprovalController {

	private Logger logger = LoggerFactory.getLogger(ApprovalController.class);
	@Autowired ApprovalService approvarService;
	
		//결재 기안함
	   @RequestMapping(value = "/approval/main",method = RequestMethod.GET)
	   public void approvalmain( @RequestParam(defaultValue = "0") int curPage, Model model ,HttpSession session) {

	      Paging paging = approvarService.getPaging(curPage);
	      model.addAttribute("paging", paging);
	      
	      String loginId = (String) session.getAttribute("loginId");
	      
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("loginId", loginId);
			map.put("paging", paging);
	      
	      List<HashMap<String, String>> list = approvarService.applist(map); //기안 리스트 불러오기
	      model.addAttribute("list", list);
	      logger.info("list@@#!!! : {}", list);
	   }
	   
	   //결재완료함
	   @RequestMapping(value = "/approval/confirmOk",method = RequestMethod.GET)
	   public void approvalconfirmOk( @RequestParam(defaultValue = "0") int curPage, Model model ,HttpSession session) {
		   
		   Paging paging = approvarService.getPaging(curPage);
		   model.addAttribute("paging", paging);
		   
		   String loginId = (String) session.getAttribute("loginId");
		   
		   Map<String,Object> map = new HashMap<String,Object>();
		   map.put("loginId", loginId);
		   map.put("paging", paging);
		   
		   List<HashMap<String, String>> list = approvarService.appOklist(map); //기안 완료 리스트 불러오기
		   model.addAttribute("list", list);
		   logger.info("list@@#!!! : {}", list);
	   }

	@RequestMapping(value = "/approval/main" , method = RequestMethod.POST)
	public String formdata(
			@RequestParam HashMap<String, String> params ,
			Approval approval,
			AppDetail appDetail
			, String[] memberNo
			, String[] confirmName
			, String[] rank
			, HttpSession session
			)throws Exception {
		
		logger.info("/approval/main");
		 System.out.println(params);

		 logger.info("memberNos : {}", Arrays.toString(memberNo));
		 logger.info("memberNos : {}", Arrays.toString(confirmName));
		 
		 //저장할 기안 번호(sequence)
		 int approvalno = approvarService.findnextno();
		 System.out.println("approvalno "+approvalno); //출력해서 확인 - 지우기
		 
		 //기안자 지정 세션으로 기안자 사번 저장 후 받기
		approval = Approval.builder()
				.approvalNo(approvalno) //기안번호 pk
				.appTitle( params.get("appTitle"))
				.memberName( params.get("memberName")) //기안자 이름
				.memberNo( (String) session.getAttribute("loginId")) //기안자사번
				.appContent( params.get("appContent"))
				.deptName( params.get("deptName"))
				.build();
		
		
		List<AppDetail> appDetailList = new ArrayList<>();
		//결재자 지정
		for(int i=0 ; i<memberNo.length;i++) {
			appDetailList.add( AppDetail.builder()
							.memberNo(memberNo[i]) //결재자 사번
							.confirmName(confirmName[i]) //결재자이름
							.approvalNo(approvalno) //기안번호 fk
							.rank(rank[i]) //직급
							.status(i+1)
							.build());
		}
		

		 logger.info("appDetailList {} :", appDetailList); //출력해서 확인 - 지우기
		 Map<String,Object> map = new HashMap<>();
		 map.put("list", appDetailList);
		 
		 
		 //기안자, 결재자 저장
		 approvarService.appWriterSave(approval);
		 approvarService.appDetailSave(map);
		 
		 
		return null;
	}

	 @RequestMapping("/approval/ReadConfirm")
	   public void Read(Model model, Approval approval, HttpSession session) {
	      logger.info("/approval/confirmRead");
	      
	      //기안번호로 기안내용 가져오기
	      Approval appconfirm = approvarService.selectApprovalWriter(approval);
	      
	      logger.info("approvalList {} :",appconfirm);
	      model.addAttribute("appconfirm", appconfirm);
	      
	      //기안번호로 결재자 List 가져오기
	      List<AppDetail> confirmList = approvarService.selectAppDetail(approval);
	      String loginId = (String) session.getAttribute("loginId");
	      System.out.println("loginId 2222222" + loginId);

	      //기안번호 로그인사번 map에 담기
	      Map<String,Object>map = new HashMap<String,Object>();
	      map.put("loginId", loginId);
	      map.put("approvalNo", approval.getApprovalNo());
	      
	      //기안번호, 로그인사번으로 로그인 사번자 기안 결재 상태 받아오기
	      AppDetail confirmInfo = approvarService.selecConfirmInfo(map);
	      logger.info("ReadConfirm_Info : {}",confirmInfo);
	      
	      logger.info("ReadConfirm_List {} :",confirmList);
	      model.addAttribute("confirmList", confirmList);
	      
	   }
	
	@RequestMapping("/approval/confirm")
	public void appConfirm(Model model, Approval approval, HttpSession session) {
		logger.info("/approval/confirm");
		
		//기안번호로 기안내용 가져오기
		Approval appconfirm = approvarService.selectApprovalWriter(approval);
		
		logger.info("approvalList {} :",appconfirm);
		model.addAttribute("appconfirm", appconfirm);
		
		//기안번호로 결재자 List 가져오기
		List<AppDetail> confirmList = approvarService.selectAppDetail(approval);
		String loginId = (String) session.getAttribute("loginId");
		System.out.println("loginId 2222222" + loginId);

		//기안번호 로그인사번 map에 담기
		Map<String,Object>map = new HashMap<String,Object>();
		map.put("loginId", loginId);
		map.put("approvalNo", approval.getApprovalNo());
		
		//기안번호, 로그인사번으로 로그인 사번자 기안 결재 상태 받아오기
		AppDetail confirmInfo = approvarService.selecConfirmInfo(map);
		logger.info("confirmInfo : {}",confirmInfo);
		
		logger.info("confirmList {} :",confirmList);
		model.addAttribute("confirmList", confirmList);
		
		
	}

	@RequestMapping("/approval/form")
	public void appform() {
		logger.info("/approval/form");
	}

	   @RequestMapping(value="/approval/list", method = RequestMethod.GET)
	   public void applist(@RequestParam(defaultValue = "0") int curPage, Model model) {
	      logger.info("/approval/list");
	      Paging paging = approvarService.getPaging(curPage);
	       model.addAttribute("paging", paging);
	         
	       List<HashMap<String, String>> list = approvarService.listpage(paging);
	       model.addAttribute("list", list);
	       logger.info("listPage{}", list);
	       
	   }

	@RequestMapping("/approval/reject")
	public String appReject( AppDetail appDetail,HttpSession session ) {
		logger.info("/approval/reject");
		
		//로그인 사번
		String loginId = (String) session.getAttribute("loginId");
		
		//결재 반려자 , 사유, 기안번호 지정
		AppDetail reject = AppDetail.builder()
								.approvalNo(appDetail.getApprovalNo())
								.memberNo(loginId)  //반려자 세션값으로 가져오기
								.appReject(appDetail.getAppReject())
								.build();
		
		//반려 업데이트
		approvarService.rejectUpdate(reject);
		
		return "redirect:/approval/main";
	}
	
	//결재 컨트롤러
	@RequestMapping("/approval/approvalOk")
	public String approvalOk( AppDetail appDetail,HttpSession session ) {
		logger.info("/approval/approvalOk");
		
		//로그인 사번
		String loginId = (String) session.getAttribute("loginId");
		
		//결재 승인자,기안번호 
		AppDetail confirmOk = AppDetail.builder()
						.approvalNo(appDetail.getApprovalNo())
						.memberNo(loginId)  //승인자 세션값으로 가져오기
						.appComment(appDetail.getAppComment())
						.build();
		
		//승인 업데이트
		approvarService.confirmOkUpdate(confirmOk);
		
		return "redirect:/approval/main";
		
		}
	
	
}
