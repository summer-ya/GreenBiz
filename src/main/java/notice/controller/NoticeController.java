package notice.controller;

import java.util.List;

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


@Controller
@RequestMapping("/notice")
public class NoticeController {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired AllnoticeService allnoticeService;
	
	
	@GetMapping("/noticeList")
	public void list(@RequestParam(defaultValue = "1") int curPage, Model model ) {
		Apaging aPaging = allnoticeService.getPaging(curPage);
		logger.info("aPaging : {}", aPaging);
		model.addAttribute("paging", aPaging);
		
		List<Allnotice> list = allnoticeService.list(aPaging);
		for( Allnotice a : list )	logger.info("data : {}", a);
		model.addAttribute("list", list);
	}
	
	


	
	@RequestMapping("/noticeView")
	public String view(@RequestParam int viewNoticeNo, Model model) {
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
		
		return "/notice/noticeView";
	}
	
}





