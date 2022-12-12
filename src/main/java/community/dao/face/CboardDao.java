package community.dao.face;

import java.util.HashMap;

import java.util.List;

import community.dto.CommImg;
import community.dto.Comment;
import community.dto.Community;
import community.dto.Favorite;
import community.util.Cpaging;

public interface CboardDao {
	//
	public int selectCntAll(Cpaging cpage);
	//
	public List<Community> selectPageList(Cpaging cpaging);
	
	public void updateHit(Community cboard);
	
	public Community selectCboard(Community cboard);

	public void insertBoard(Community cboard);
	
	public void insertFile(CommImg commImg);
	
	public CommImg selectBoardFileByCno(Community cboard);
	
	public CommImg selectBoardFileNo(CommImg commImg);
	
	public void updateCboard(Community cboard);
	
	public void deleteFile(Community cboard);
	
	public void delete(Community cboard);
	
	public int selectCntFavorite(Favorite favorite);

	public void deleteFavorite(Favorite favorite);
	
	public void insertFavorite(Favorite favorite);
	
	public int getTotalCntFavorite(Favorite favorite);
	
	//댓글
	public int CntCmt(int cno);
	
	public List<HashMap<String, Object>> CmtList(HashMap<String, Object> map);

	public void cboardCmt(int cno);

	public void insertCmt(Comment cmt);
	
	public Comment selectCmtByCmtNo(int cono);
	
	public void updateCmt(Comment cmt);
	
	public void deleteCmt(int cono);


}
