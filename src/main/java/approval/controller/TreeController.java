package approval.controller;


import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import approval.dto.CompanyModel;
import approval.dto.Member;
import approval.service.face.ApprovalService;

@Controller
public class TreeController {
	
	@Autowired ApprovalService approvalService;
	private Logger logger = LoggerFactory.getLogger(TreeController.class);
	
	
	@RequestMapping("/approval/appline")
	public void jsTree() {
		logger.info("/approval/jsTree 실행" );
	}
	
	@RequestMapping("/approval/userList")
	@ResponseBody
	public List<CompanyModel> jsTreeList(CompanyModel vo,  Model model) {
		logger.info("/approval/jsTreeList 실행" );
		List<CompanyModel> dataList = approvalService.getCompanyTree();
		return dataList;
	}

	@RequestMapping("/approval/memberList")
	public void memberList(@RequestParam(value="memid" , defaultValue = "") String memid, Member mem,  Model model) {
		logger.info("/approval/jsTreeList 실행" );
		logger.info("name:{}",memid);
		
		List<Member> mList = approvalService.getMemberList(memid);
		
		logger.info("dataList : {}",mList);
		model.addAttribute("mList", mList);

	}
	
	

}
