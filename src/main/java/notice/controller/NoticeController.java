package notice.controller;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import admin.allnotice.dto.Allnotice;
import admin.allnotice.dto.AllnoticeFile;
import admin.allnotice.service.face.AllnoticeService;
import admin.allnotice.util.Apaging;
import admin.dept.dto.Dept;
import admin.dept.dto.DeptFile;
import admin.dept.service.face.DeptService;
import login.service.face.MemberService;


@Controller
@RequestMapping("/notice")
public class NoticeController {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired AllnoticeService allnoticeService;
	@Autowired MemberService memberService;
	@Autowired DeptService deptService;
	
	
	@GetMapping("/noticeList")
	public void list(@RequestParam(defaultValue = "1") int curPage, Model model, HttpServletRequest req ) {
		Apaging aPaging = allnoticeService.getPaging(curPage);
		logger.info("aPaging : {}", aPaging);
		model.addAttribute("paging", aPaging);
		
		List<Allnotice> list = allnoticeService.list(aPaging);
		for( Allnotice a : list )	logger.info("data : {}", a);
		model.addAttribute("list", list);
		
		HttpSession session = req.getSession();
		//로그인 세션
		String loginId = (String) session.getAttribute("loginId");
		HashMap<String,String> memInfo = memberService.getMemInfo(loginId);
		Dept dept = new Dept();
	    //   System.out.println("member : "+ member);
	    dept.setMemberNo(memInfo.get("MEMBERNO"));
	    DeptFile deptFile = deptService.getAttachFile(dept);
	    model.addAttribute("file", deptFile);
	}
	
	


	
	@RequestMapping("/noticeView")
	public String view(@RequestParam int viewNoticeNo, Model model, HttpServletRequest req ) {
		logger.info("/notice/notcieView - {}", viewNoticeNo);
		
		//잘못된 게시글 번호 처리
		if( viewNoticeNo < 0 ) {
			return "redirect:/notice/noticeList";
		}
		
		Allnotice paramNotice = new Allnotice();
		paramNotice.setAllnoticeNo(viewNoticeNo);
		
		//게시글 조회
		Allnotice viewAllnotice = allnoticeService.view(paramNotice);
		logger.info("조회된 게시글 {}", viewAllnotice);
		AllnoticeFile allnoticeFile = allnoticeService.getAttachFile(viewAllnotice);
		//모델값 전달
		model.addAttribute("viewNotice", viewAllnotice);
		model.addAttribute("allnoticeFile", allnoticeFile);
		
		HttpSession session = req.getSession();
		String loginId = (String) session.getAttribute("loginId");
		HashMap<String,String> memInfo = memberService.getMemInfo(loginId);
		Dept dept = new Dept();
	    //   System.out.println("member : "+ member);
	    dept.setMemberNo(memInfo.get("MEMBERNO"));
	    DeptFile deptFile = deptService.getAttachFile(dept);
	    model.addAttribute("file", deptFile);
		
		return "/notice/noticeView";
	}
	
}





