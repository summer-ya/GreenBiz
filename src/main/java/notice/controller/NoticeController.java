package notice.controller;

import java.util.List;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import notice.dto.NoticeDTO;
import notice.service.face.NoticeService;
import notice.util.NoticePaging;


@Controller
@RequestMapping("/notice")
public class NoticeController<Paging> {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired NoticeService noticeService;
	
	
	
	@RequestMapping("/noticeList")
	public void list(@RequestParam(defaultValue = "1") int curPage, Model model ) {
		// try문 안의 구문에서 에러가 발생하면
		try {
			NoticePaging paging = noticeService.getPaging(curPage);
			System.out.println("paging :"+ paging);
			model.addAttribute("paging", paging);
			
			List<NoticeDTO> list = noticeService.list(paging);
			System.out.println("result : "+ list);
			for( NoticeDTO n : list ) {
				System.out.println("NoticeDTO : "+ n);
			}	
			model.addAttribute("list", list);	
			
			/*
			 * ModelAndView mav = new ModelAndView(); 
			 * mav.setViewName("fileName");
			 */
			
		
		}catch(Exception e) {
			// 에러를 catch하여 에러 파일 위치, 에러 사유를 프린트 함
			// 인자로 받는 Exception 객체는, 에러 객체의 최상위 객체로 어떠한 에러든 해당 객체가 모두 받을 수 있음
			// ex) NullPointerException, IllegalArgumentException... 등 어떤 에러가 발생하더라도
			// 	   Exception 객체로 받아서 에러 상황 파악 가능함
			e.printStackTrace();
		}
	}
	
	


	
	@RequestMapping("/notcieView")
	public String view(NoticeDTO viewNotice, Model model) {
		logger.info("/notice/notcieView - {}", viewNotice);
		
		//잘못된 게시글 번호 처리
		if( viewNotice.getAllNotice_no() < 0 ) {
			return "redirect:/notice/notcieView";
		}
		
		//게시글 조회
		viewNotice = noticeService.view(viewNotice);
		logger.info("조회된 게시글 {}", viewNotice);
		
		//모델값 전달
		model.addAttribute("viewNotice", viewNotice);
		
		return "/notice/notcieView";
	}
	
}
