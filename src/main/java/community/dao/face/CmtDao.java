package community.dao.face;

import java.util.List;
import java.util.Map;

import community.dto.Comment;

public interface CmtDao {

	public void insertCmt(Comment comment);

	public int getCntByCno(int cno);

	//public List<Comment> list(int cno, int start, int end);

	public Comment view(int cono);

	public void update(Comment comment);

//	public void delete(int no);

	public List<Comment> selectListByCno(int cono);

	public List<Comment> list(Map<String, Object> map);

	public void deleteCmt(int no);

	//public List<Comment> selectListByCno(int cno);
	

}
