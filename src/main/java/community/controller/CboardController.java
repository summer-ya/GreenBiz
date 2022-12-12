package community.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import community.dto.CommImg;
import community.dto.Comment;
import community.dto.Community;
import community.dto.Favorite;
import community.service.face.CboardService;
import community.util.CmtPaging;
import community.util.Cpaging;

@Controller
public class CboardController {

	private Logger logger = LoggerFactory.getLogger(CboardController.class);

	@Autowired CboardService cboardService;

	@Autowired ServletContext context;

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
	public String detail(Community cboard, Favorite favorite, Model model, HttpSession session) {
		logger.info("cView 성공");

		//찜상태 확인용 로그인
		favorite.setMemberno((String)session.getAttribute("loginId").toString());



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


		//찜상태 모델값
		model.addAttribute("isFav", cboardService.isFav(favorite));
		//좋아요 수 모델값
		model.addAttribute("cnt", cboardService.getTotalCntFavorite(favorite));



		return "community/cView";


	}



	//게시판 글쓰기 Get
	@RequestMapping(value="/community/cWrite", method = RequestMethod.GET)
	public void cwrite() {}

	//게시판 글쓰기 Post
	@RequestMapping(value="/community/cWrite", method = RequestMethod.POST)
	public String cwriter(
			HttpServletRequest request,
			Community cboard, MultipartFile file, HttpSession session) {

		//작성자 
		cboard.setMemberno((String)session.getAttribute("loginId")); 

		logger.info(" cboard :{} ", cboard);

		cboard.setCstoredname(request.getContextPath());

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

		cboardService.update(cboard, file);

		return "redirect:/community/cView?cno=" +cboard.getCno();
	}

	@RequestMapping("community/delete")
	public String delete(Community cboard) {

		cboardService.delete(cboard);

		return "redirect:/community/cList";

	}

	@RequestMapping(value="/community/favorite")
	public ModelAndView favorite(Favorite favorite, ModelAndView mav, HttpSession session) {

		//좋아요 하트
		favorite.setMemberno((String)session.getAttribute("loginId").toString());

		//좋아요 상태 확인
		boolean isFav = cboardService.isFav(favorite);

		boolean result = cboardService.favorite(favorite);

		//좋아요 수 조회
		int cnt = cboardService.getTotalCntFavorite(favorite);

		mav.addObject("result", result);
		mav.addObject("cnt", cnt);

		//			mav.addObject("jsonView");
		mav.setViewName("jsonView");

		return mav;

	}
}

//	@RequestMapping("/cmtPage")
//	public void cmtListPaging(int curPage, Model model, int cno) {
//		logger.info("댓글 게시글 {}", cno);
//		logger.info("curpage - {}", curPage);
//
//		CmtPaging cmtPaging = cboardService.getCmtPaging(curPage, cno);
////		CmtPaging cmtPaging = cboardService.getCmtPaging(curPage, cno);
//		model.addAttribute("cmtPaging", cmtPaging);
//
//		List<HashMap<String,Object>> cmtList = cboardService.cmtList(cmtPaging,cno);
//		logger.info("조회된 댓글 {}", cmtList);
//		model.addAttribute("cmtList", cmtList);
//
//		//댓글 수
//		int CntCmt = cboardService.getCntCmt(cno);
//		logger.info("댓글 갯수 : {}", CntCmt);
//		model.addAttribute("CntCmt", CntCmt);
//
//		cboardService.cboardCmt(cno);
//
//
//
//	}
//
//	//댓글 등록
//	@PostMapping("/writeCmt")
//	@ResponseBody
//	public String CmtWrtie( @RequestParam Map<String,Object> map, HttpServletRequest req) {
//
//		try {
//
//			HttpSession session = req.getSession();
//			String no = session.getAttribute("memberno").toString();
//			int memberno = Integer.parseInt(no);
//
//			logger.info("글번호: {}", map.get("cno"));
//			logger.info("회원번호 : {}", memberno);
//			logger.info("댓글내용 : {}", map);
//
//			Comment cmt = new Comment();
//			cmt.setCno(Integer.parseInt(map.get("cno").toString()));
//			cmt.setCocontent(map.get("cocontent").toString());
//			cmt.setMemberno(map.get("memberno").toString());
//
//			cboardService.writeCmt(cmt);
//
//			return "success";
//
//
//		} catch(Exception e) {
//			return "failed";
//		}
//
//	}
//	@PostMapping("/updateCmt")
//	@ResponseBody
//	public String updateCmt(@RequestParam Map<String, Object> map,HttpServletRequest req) {
//		try {
//			HttpSession session = req.getSession();
//			String no = session.getAttribute("memberno").toString();
//			int memberno = Integer.parseInt(no);
//
//			logger.info("전송 완료");
//			logger.info("댓글내용 : {}", map);
//			logger.info("멤버번호 : {}", memberno);
//
//
//			Comment cmt = new Comment();
//			cmt.setCono(Integer.parseInt(map.get("cono").toString()));
//			cmt.setCocontent(map.get("cocontent").toString());
//			cmt.setMemberno(map.get("memberno").toString());
//
//			cboardService.updateCommt(cmt);
//
//			return "success";
//		}catch(Exception e) {
//			return "failed";
//		}
//
//	}
//
//	@GetMapping("/deleteCmt")
//	@ResponseBody
//	public String deleteCommt(@RequestParam int cono) {
//		try {
//			logger.info("댓번호 : {}", cono);
//			cboardService.deleteCmt(cono);
//			return "success";
//
//		}catch(Exception e) {
//			return "failed";
//		}
//	}
//}
//
//

