package community.dao.face;

import java.util.List;

import community.dto.CommImg;
import community.dto.Community;
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


}
