package community.service.face;

import java.util.List;

import javax.servlet.http.HttpSession;

import community.dto.Comment;
import community.util.CmtPaging;

public interface CmtService {

	public void cmtWrite(Comment comment);

	public int getTotal(int cno);

	//public List<Comment> list(int cno, int start, int end, HttpSession session);

	public Comment view(int cono);
	
	public void update(Comment comment);

//	public void delete(int cono);

	public List<Comment> list(int cono);

	public List<Comment> list(int cno, CmtPaging cmtPaging);

	public void deleteCmt(int no);



	//public void deleteCmt(int no);

}
