package board.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import board.dao.face.BoardReplyDao;
import board.dto.Reply;
import board.service.face.BoardReplyService;

@Service
public class BoardReplyServiceImpl implements BoardReplyService {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired BoardReplyDao boardReplyDao;

	@Override
	public void cmtList(Reply reply) {
		boardReplyDao.insert(reply);
		
	}

	@Override
	public List<Reply> getList(int bno) {
		return boardReplyDao.selectRlistByBno(bno);
	}

	@Override
	public void insertCmt(Reply reply) {
		boardReplyDao.insertCmt(reply);
	}

	@Override
	public void updateCmt(Reply reply) {
		boardReplyDao.updateCmt(reply);
	}

	@Override
	public void deleteCmt(int no) {
		boardReplyDao.deleteCmt(no);
		boardReplyDao.deleteChildCmt(no);
	}



}
