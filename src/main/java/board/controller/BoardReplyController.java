package board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import board.dto.Reply;
import board.service.face.BoardReplyService;

@Controller
@RequestMapping("/board/reply")
public class BoardReplyController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired BoardReplyService boardReplyService;
	

	//댓글 등록
	// http method: post
	// url : /board
	@PostMapping({"/",""})
	public ResponseEntity<String> insert(Reply reply) {
		logger.debug("댓글 등록 실행");
		ResponseEntity<String> entity = null;
	
		try {
			boardReplyService.insertCmt(reply);
			
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
	
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>("failed", HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	//댓글 목록 조회
	// http method: get
	// url : /board
	@GetMapping({"/",""})
	@ResponseBody
	public Map<String, Object> cmtList(@RequestParam int bno) {
		Map<String, Object> resultMap = new HashMap<>();
			
		try {
			List<Reply> list = boardReplyService.getList(bno);
			resultMap.put("list", list);
			resultMap.put("result", true);
		
		}catch(Exception e) {
			e.printStackTrace();
			resultMap.put("result", false);
		}
		
		return resultMap;
	}
	
	//댓글 수정
	@PostMapping("/update")
	public ResponseEntity<String> update(Reply reply) {
		System.out.println("reply : "+ reply);
		
		ResponseEntity<String> entity = null;
	
		try {
			logger.debug("댓글 수정 실행");
			
			boardReplyService.updateCmt(reply);
			
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>("failed", HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}

	//댓글 삭제
	@GetMapping("/delete")
	public ResponseEntity<String> delete(@RequestParam int no) {
		
		ResponseEntity<String> entity = null;
		
		try {
			logger.debug("댓글 수정 실행");
				
			boardReplyService.deleteCmt(no);
				
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
			
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>("failed", HttpStatus.BAD_REQUEST);
		}
			
			return entity;
		}	
}