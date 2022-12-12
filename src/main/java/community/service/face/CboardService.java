package community.service.face;

import java.util.HashMap;
import java.util.List;


import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import board.dto.Board;
import community.util.CmtPaging;
import community.dto.CommImg;
import community.dto.Comment;
import community.dto.Community;
import community.dto.Favorite;
import community.util.Cpaging;

public interface CboardService {

	public Cpaging getPaging(Cpaging cpage);

	public List<Community> list(Cpaging cpaging);

	public Community view(Community cboard);

	public void write(Community cboard, MultipartFile file);

	public CommImg getAttachFile(Community cboard);
	
	public CommImg getFile(CommImg commImg);
	
	public void update(Community cboard, MultipartFile file);
	
	public void delete(Community cboard);

	//좋아요
	public boolean favorite(Favorite favorite);

	public boolean isFav(Favorite favorite);

	public int getTotalCntFavorite(Favorite favorite);


	public int getCntCmt(int cno);
	
	public List<HashMap<String, Object>> cmtList(CmtPaging cmtPaging, int cno);
	
	public void cboardCmt(int cno);

	public CmtPaging getCmtPaging(int curPage, int cno);
	
	public Comment writeCmt(Comment cmt);

	public void updateCommt(Comment cmt);

	public void deleteCmt(int cono);


	


}
