
package admin.allnotice.controller;

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
import admin.allnotice.util.Paging;



@Controller
@RequestMapping("/admin/Allnotice")
public class AllnoticeController {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired AllnoticeService allnoticeService;
	
	@RequestMapping("/adminAllnoticeList")
	public void list(
			@RequestParam(defaultValue = "0") int curPage
			, Model model ) {
		
		Paging paging = allnoticeService.getPaging(curPage);
		logger.debug("{}", paging);
		model.addAttribute("paging", paging);
		
		List<Allnotice> list = allnoticeService.list(paging);
		for( Allnotice a : list )	logger.debug("{}", a);
		model.addAttribute("list", list);
		
	}
	
	
	@RequestMapping("/adminAllnoticeView")
	public String view(@RequestParam int allnoticNo, Model model, HttpSession session) {
		logger.info("viewAllnotice {}", allnoticNo);
		
		//잘못된 게시글 번호 처리
		if( allnoticNo < 0 ) {
			return "redirect:/admin/Allnotice/adminAllnoticeList";
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
		
		
		return "/admin/Allnotice/adminAllnoticeView";
	}
	  
	@GetMapping("/adminAllnoticeWrite")
	public void write() {}
	
	@PostMapping("/adminAllnoticeWrite")
	public String writeProcess(Allnotice allnotice, MultipartFile noticeFile, HttpSession session) {
		logger.debug("{}", allnotice);
		logger.debug("{}", noticeFile);
		
		//게시글, 첨부파일 처리
		allnoticeService.write(allnotice, noticeFile);
		logger.info("write out");
		return "redirect:/admin/Allnotice/adminAllnoticeList";
	}
	
	@RequestMapping("/download")
	public String download(AllnoticeFile allnoticeFile, Model model) {
		
		//첨부파일 정보 객체
		allnoticeFile = allnoticeService.getFile(allnoticeFile);
		logger.debug("{}", allnoticeFile);
		
		//모델값 전달
		model.addAttribute("downFile", allnoticeFile);
		
		return "down";
	}
	
	@GetMapping("/adminAllnoticeUpdate")
	public String update(Allnotice allnotice, Model model) {
		logger.debug("{}", allnotice);
		
		//잘못된 게시글 번호 처리
		if( allnotice.getAllnoticeNo() < 0 ) {
			return "redirect:/admin/Allnotice/adminAllnoticeList";
		}
		
		//게시글 조회
		allnotice = allnoticeService.view(allnotice);
		logger.debug("조회된 게시글 {}", allnotice);
		
		//모델값 전달
		model.addAttribute("updateAllnotice", allnotice);
		
		
		//첨부파일 모델값 전달
		AllnoticeFile allnoticefile = allnoticeService.getAttachFile(allnotice);
		model.addAttribute("allnoticeFile", allnoticeService);
		
		
		return "/admin/Allnotice/adminAllnoticeUpdate";

	}
	
	@PostMapping("/adminAllnoticeUpdate")
	public String updateProcess(Allnotice allnotice, MultipartFile file) {
		logger.debug("{}", allnotice);
		
		allnoticeService.update(allnotice, file);
		
		return "redirect:/admin/Allnotice/adminAllnoticeView?allnoticeNo=" + allnotice.getAllnoticeNo();
	}
	
	@RequestMapping("/adminAllnoticeDelete")
	public String delete(Allnotice allnotice) {
		
		allnoticeService.delete(allnotice);
		
		return "redirect:/admin/Allnotice/adminAllnoticeList";
	}
}



