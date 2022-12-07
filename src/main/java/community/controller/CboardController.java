package community.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import community.dto.CommImg;
import community.dto.Community;
import community.service.face.CboardService;
import community.util.Cpaging;

@Controller
public class CboardController {

	private Logger logger = LoggerFactory.getLogger(CboardController.class);

	@Autowired CboardService cboardService;

	@RequestMapping("/community/cList")
	public void list(
			@RequestParam(value="curPage", defaultValue = "0") int curPage,
			@RequestParam(value="search", defaultValue="") String search,
			@RequestParam(value="category", defaultValue="") String category
			, Model model ) {


		logger.info("/community/cList [GET]");
		logger.info("search값 확인 {}", search);
		logger.info("category값 확인 {}", category);

		Cpaging cpage = new Cpaging();

		cpage.setCurPage(curPage);
		cpage.setSearch(search);
		cpage.setCategory(category);

		//페이징계산
		Cpaging cpaging = cboardService.getPaging(cpage);
		cpaging.setSearch(search);
		cpaging.setCategory(category);
		logger.info("paging값 확인 {} : ", cpaging);

		//게시글 목록 조회
		List<Community> list = cboardService.list(cpaging);
		logger.info("게시글 목록 조회 확인 {}:", list);

		//모델값 전달
		model.addAttribute("cpaging", cpaging);
		model.addAttribute("list", list);
	}



	//게시글 상세보기
	@RequestMapping("/community/cView")
	public String detail(Community cboard, Model model) {
		logger.info("cView 성공");

		if(cboard.getCno() < 0 ) {
			return "redirect:/community/cList";
		}

		//게시글 조회
		cboard = cboardService.view(cboard);
		logger.debug("조회된 게시글 {}", cboard);

		//모델값 전달
		model.addAttribute("cboard", cboard);

		//첨부파일 모델값 전달

		CommImg commImg = cboardService.getAttachFile(cboard);
		model.addAttribute("commImg", commImg);

		return "community/cView";


	}



	//게시판 글쓰기 Get
	@RequestMapping(value="/community/cWrite", method = RequestMethod.GET)
	public void cwrite() {}

	//게시판 글쓰기 Post
	@RequestMapping(value="/community/cWrite", method = RequestMethod.POST)
	public String cwriter(Community cboard, MultipartFile file, HttpSession session) {



		//유저정보

		//첨부파일
		cboardService.write(cboard, file);



		return "redirect:/community/cList";	
	}



	@RequestMapping(value="community/cUpdate", method = RequestMethod.GET)
	public String cupdate(Community cboard, Model model) {
		logger.debug("{}", cboard);

		//잘못된 게시글 번호 처리
		if(cboard.getCno() < 0 ) {
			return "redirect:/community/cList";
		}

		//게시글 조회
		cboard = cboardService.view(cboard);
		logger.debug("조회된 게시글 {}", cboard);

		//모델값 전달
		model.addAttribute("updateCboard", cboard);

		//첨부파일 모델값 전달
		CommImg commImg = cboardService.getAttachFile(cboard);
		model.addAttribute("commImg", commImg);

		return "community/cUpdate";
	}
		
		@RequestMapping(value="community/cUpdate", method = RequestMethod.POST)
		public String cupdateProcess(Community cboard, MultipartFile file) {
			logger.debug("{}", cboard);
			
			return "redirect:/community/cView?cno=" +cboard.getCno();
		}
		
		@RequestMapping("community/delete")
		public String delete(Community cboard) {
			
			cboardService.delete(cboard);
			
			return "redirect:/community/cList";
			
		}

	



	}

