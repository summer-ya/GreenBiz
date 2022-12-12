package community.service.impl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import community.dao.face.CmtDao;
import community.dto.Comment;
import community.service.face.CmtService;

@Service
public class CmtServiceImpl implements CmtService {


	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired CmtDao  cmtDao;

	//댓글 목록
	@Override
	public void cmtWrite(Comment comment) {
		cmtDao.insertCmt(comment);
	}

	//댓글 수
	@Override
	public int getTotal(int cno) {
		return cmtDao.getCntByCno(cno);
	}

	//	//댓글 목록
	//	@Override
	//	public List<Comment> list(int cno, int start, int end, HttpSession session) {
	//		
	//		List<Comment> items = cmtDao.list(cno, start, end);
	//		
	//		//로그인
	//		String memberno = (String) session.getAttribute("loginId");
	//		
	//		return items;
	//	}

	//댓글 내용
	@Override
	public Comment view(int cono) {
		return cmtDao.view(cono);
	}


	//댓글 수정
	@Override
	public void update(Comment comment) {
		cmtDao.update(comment);

	}

	//댓 삭제
	@Override
	public void delete(int cono) {

		cmtDao.delete(cono);
	}

	@Override
	public List<Comment> list(int cono) {
		return cmtDao.selectListByCno(cono);
	}

	@Override
	public List<Comment> list(int cono, int start, int end, HttpSession session) {
		List<Comment> items = cmtDao.list(cono, start, end);

		//로그인
		String memberno = (String) session.getAttribute("loginId");

		return items;
	}
}




