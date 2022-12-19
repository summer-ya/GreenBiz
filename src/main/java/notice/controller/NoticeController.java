
package notice.controller;

import java.util.List;


import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import admin.allnotice.dto.Allnotice;
import admin.allnotice.dto.AllnoticeFile;
import admin.allnotice.service.face.AllnoticeService;
import admin.allnotice.util.Apaging;



@Controller
@RequestMapping("/notice")
public class NoticeController {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired AllnoticeService allnoticeService;
	
	@RequestMapping("/NoticeList")
	public void list(
			@RequestParam(defaultValue = "0") int curPage
			, Model model ) {
		
		Apaging aPaging = allnoticeService.getPaging(curPage);
		logger.debug("{}", aPaging);
		model.addAttribute("paging", aPaging);
		
		List<Allnotice> list = allnoticeService.list(aPaging);
		for( Allnotice a : list )	logger.debug("{}", a);
		model.addAttribute("list", list);
		
	}
	
	
	@RequestMapping("/NoticeView")
	public String view(@RequestParam int allnoticNo, Model model, HttpSession session) {
		logger.info("viewAllnotice {}", allnoticNo);
		
		//잘못된 게시글 번호 처리
		if( allnoticNo < 0 ) {
			return "redirect:/notice/NoticeList";
		}
		
		Allnotice paramNotice = new Allnotice();
		paramNotice.setAllnoticeNo(allnoticNo);
		
		//게시글 조회
		Allnotice viewAllnotice = allnoticeService.view(paramNotice);
		logger.info("조회된 게시글 {}", viewAllnotice);
		
		//로그인세션
//		Member member = new Member();
//		member.setMemberNo((String) session.getAttribute("memberNo"));
//		member.setMemberNo((String) session.getAttribute("memberName"));
		
		//모델값 전달
		model.addAttribute("viewAllnotice", viewAllnotice);
		//logger.info("제목없음{}",viewAllnotice);
		
		//첨부파일 모델값 전달
		AllnoticeFile allnoticeFile = allnoticeService.getAttachFile(viewAllnotice);
		model.addAttribute("allnoticeFile", allnoticeFile);
		model.addAttribute("nFileNo", allnoticeFile.getNFileNo());
		
		
		return "/notice/NoitceView";
	}
}