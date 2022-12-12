package community.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import community.dao.face.CmtDao;
import community.dto.Comment;
import community.service.face.CmtService;
import community.util.CmtPaging;

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
//	@Override
//	public void delete(int cono) {
//
//		cmtDao.delete(cono);
//	}

	@Override
	public List<Comment> list(int cono) {
		return cmtDao.selectListByCno(cono);
	}

	@Override
	public List<Comment> list(int cno,  CmtPaging cmtPaging) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cno", cno);
		map.put("paging", cmtPaging);
		
		List<Comment> items = cmtDao.list(map);

	

		return items;
	}

	@Override
	public void deleteCmt(int no) {
		cmtDao.deleteCmt(no);
		
	}
}




