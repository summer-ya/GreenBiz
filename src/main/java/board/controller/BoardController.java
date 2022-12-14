package board.controller;



import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import board.dto.Board;
import board.dto.BoardFile;
import board.service.face.BoardService;
import board.util.Paging;
import login.dto.Member;

@Controller
public class BoardController {

	private Logger logger = LoggerFactory.getLogger(BoardController.class);

	@Autowired BoardService boardService;

	@RequestMapping("/board/boardMain")
	public void main(
			@RequestParam(value="curPage", defaultValue = "0") int curPage,
			@RequestParam(value="search", defaultValue="") String search,
			@RequestParam(value="category", defaultValue="") String category
			, Model model ) {

		logger.info("/board/boardMain [GET]");
		logger.info("search값 확인 {}", search);
		logger.info("category값 확인 {} ", category);

		Paging inDate = new Paging();

		inDate.setCurPage(curPage);
		inDate.setSearch(search);
		inDate.setCategory(category);


		//페이징 계산
		Paging paging = boardService.getPaging(inDate);
		paging.setSearch(search);
		paging.setCategory(category);
		logger.info("paging값 확인 {} : ", paging);

		//게시글 목록 조회
		List <Board> list = boardService.list(paging);
		logger.info("게시글 목록 조회 확인 {} :", list);

		//모델값 전달
		model.addAttribute("paging", paging);
		model.addAttribute("list", list);

	}



	@RequestMapping("/board/boardView")
	public String view(Board viewBoard, Model model) {
		//logger.debug("{}", viewBoard);
		logger.info("test");

		//잘못된 게시글 번호 처리
		if(viewBoard.getBno() < 0) {
			return "redirect:/board/boardMain";

		}
		//게시글 조회
		viewBoard = boardService.view(viewBoard);
		logger.debug("조회된 게시글 {}", viewBoard);

		//모델값 전달
		model.addAttribute("viewBoard", viewBoard);

		//첨부파일 모델값 전달
		
		BoardFile boardFile = boardService.getAttachFile(viewBoard);
		model.addAttribute("boardFile", boardFile);

		return "board/boardView";
	}

	@RequestMapping(value="/board/boardWrite", method = RequestMethod.GET)
	public void bwrite() {
		logger.info("/board/boardWrite - 와아아아testㅅㅅㅅ");
		logger.info("test");
	}

	@RequestMapping(value="/board/boardWrite", method = RequestMethod.POST)
	public String mwrite(Board board, @RequestParam("board_filename") MultipartFile file,HttpSession session) {

		logger.debug("{}", board);
		logger.debug("{}", file);

		//작성자 정보 추가
        // String memberno = (String) session.getAttribute("memberno");
//         logger.info("memberno {}", memberno);
		
//		Member member = (Member)session.getAttribute("memberNo");

		
		String loginid = (String)session.getAttribute("loginId");
		
		logger.debug("{}", board);

		//게시글, 첨부파일 처리
		boardService.write(board,file);

		return "redirect:/board/boardMain";


	}
	@RequestMapping("/board/download")
	public String download(BoardFile boardFile, Model model) {

		//첨부파일 정보 객체
		boardFile = boardService.getFile(boardFile);
		logger.debug("{}",  boardFile);

		//모델값 전달
		model.addAttribute("downFile", boardFile);

		return "down";
	}

	@RequestMapping(value="/board/boardUpdate", method = RequestMethod.GET)
	public String update(Board board, Model model) {
		logger.info("/board/boardUpdate - 동작");

		//잘못된 게시글 번호 처리
		if(board.getBno() < 0 ) {
			return "redirect:/board/boardMain";
		}

		//게시글 조회
		board = boardService.view(board);
		logger.debug("조회된 게시글 {}", board);

		//모델값 전달
		model.addAttribute("boardUpdate", board);

		//첨부파일 모델값 전달
		BoardFile boardFile = boardService.getAttachFile(board);
		model.addAttribute("boardFile", boardFile);


		return "/board/boardUpdate";
	}

	@RequestMapping(value="/board/boardUpdate", method = RequestMethod.POST)
	public String updateProcess(Board board, @RequestParam("board_filename") MultipartFile file) {
		//logger.debug("{}", board);
		logger.info("test");

		boardService.update(board, file);

		return "redirect:/board/boardView?bno=" + board.getBno();


	}

	@RequestMapping("/board/delete")
	public String delete(Board viewboard) {

		boardService.delete(viewboard);

		return "redirect:/board/boardMain";
	}

	
	
	@RequestMapping(value="/board/detail", method = RequestMethod.GET)
	public String detail(@RequestParam("cno") long cno, Model model,
			@RequestParam(value="page", required=false, defaultValue="1")int page,
			@RequestParam("memberno") long memberno) {


		return null;


	}

}

