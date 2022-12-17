package community.service.impl;

import java.io.File;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import board.service.face.BoardService;
import community.dao.face.CboardDao;
import community.dto.CommImg;
import community.dto.Comment;
import community.dto.Community;
import community.dto.Favorite;
import community.service.face.CboardService;
import community.util.CmtPaging;
import community.util.Cpaging;

@Service
public class CboardServiceImpl implements CboardService{

	private static final Logger logger = LoggerFactory.getLogger(BoardService.class);

	@Autowired private CboardDao cboardDao;

	@Autowired ServletContext context;

	@Override
	public Cpaging getPaging(Cpaging cpage) {
		logger.info("cpage값 확인 : {}", cpage);

		//총 게시글 수 조회
		int totalCount = cboardDao.selectCntAll(cpage);

		//페이징 계산
		Cpaging cpaging = new Cpaging(totalCount,cpage.getCurPage(), 8);

		return cpaging;
	}

	@Override
	public List<Community> list(Cpaging cpaging) {
		return cboardDao.selectPageList(cpaging);
	}



	@Override
	public Community view(Community cboard) {

		cboardDao.updateHit(cboard);

		return cboardDao.selectCboard(cboard);
	}

	@Override
	public void write(Community cboard, MultipartFile file) {

		//게시글 처리
		if( "".equals( cboard.getCtitle() ) ) {
			cboard.setCtitle(null);;
		}

		cboardDao.insertBoard(cboard);

		//--------------------------------------------

		//첨부파일 처리

		//빈 파일일 경우
		if( file.getSize() <= 0 ) {
			return;
		}

		//String path = context.getRealPath("/");

		//String path = cboard.getCstoredname();

		//파일이 저장될 경로
		String storedPath = context.getRealPath("/upload");
		logger.info("storedPath:{}", storedPath);
		File storedFolder = new File( storedPath );
		if( !storedFolder.exists() ) {
			storedFolder.mkdir();
		}


		//파일이 저장될 이름
		String coriginname = file.getOriginalFilename();
		String filename = coriginname.substring(0, coriginname.lastIndexOf("."));
		String extension = coriginname.substring(coriginname.lastIndexOf(".") + 1);

		logger.info(" name :{} "+ filename);
		logger.info(" extension :{} "+extension);

		String cstoredname = filename + UUID.randomUUID().toString().split("-")[4] + "." + extension;

		logger.info(" cstoredname :{} "+ cstoredname);

		//저장할 파일의 정보 객체
		File dest = new File( storedFolder, cstoredname );

		try {
			file.transferTo(dest);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		//--------------------------------------------

		//첨부파일 정보 DB 기록
		CommImg commImg = new CommImg();
		commImg.setCno(cboard.getCno());
		commImg.setCoriginname(coriginname);
		commImg.setCstoredname(cstoredname);

		cboardDao.insertFile(commImg);
	}

	@Override
	public CommImg getAttachFile(Community cboard) {

		return cboardDao.selectBoardFileByCno(cboard);
	}

	@Override
	public CommImg getFile(CommImg commImg) {

		return cboardDao.selectBoardFileNo(commImg);
	}

	@Override
	public void update(Community cboard, MultipartFile file) {

		//게시글 처리
		if("".equals(cboard.getCtitle())) {
			cboard.setCtitle("(제목없음)");
		}
		cboardDao.updateCboard(cboard);


		//--------------------------------------------

		//첨부파일 처리

//		//빈 파일일 경우
//		if( file.getSize() <= 0 ) {
//			return;
//		}

		//String path = context.getRealPath("/");

		//String path = cboard.getCstoredname();

		//파일이 저장될 경로
		String storedPath = context.getRealPath("upload");
		logger.info("storedPath:{}", storedPath);
		File storedFolder = new File( storedPath );
		if( !storedFolder.exists() ) {
			storedFolder.mkdir();
		}


		//파일이 저장될 이름
		String coriginname = file.getOriginalFilename();
		String cstoredname = coriginname + UUID.randomUUID().toString().split("-")[4];
		
		
		logger.info(" cstoredname :{} "+ cstoredname);

		//저장할 파일의 정보 객체
		File dest = new File( storedFolder, cstoredname );

		try {
			file.transferTo(dest);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		//--------------------------------------------

		//첨부파일 정보 DB 기록
		CommImg commImg = new CommImg();
		commImg.setCno(cboard.getCno());
		commImg.setCoriginname(coriginname);
		commImg.setCstoredname(cstoredname);

		//기존에 게시글에 연결된 첨부파일을 삭제한다
		cboardDao.deleteFile(cboard);

		cboardDao.insertFile(commImg);		

	}

	@Override
	public void delete(Community cboard) {

		//첨부파일 삭제
		cboardDao.deleteFile(cboard);

		//게시글 삭제
		cboardDao.delete(cboard);

	}

	@Override
	public boolean isFav(Favorite favorite) {
		int cnt = cboardDao.selectCntFavorite(favorite);
		
		if(cnt > 0 ) {
			return true;
		} else {
			
			return false;
		}
	}
	

	@Override
	public boolean favorite(Favorite favorite) {
		if(isFav(favorite)) {
			cboardDao.deleteFavorite(favorite);
			
			return false;
		} else {
			cboardDao.insertFavorite(favorite);
		}
		return true;
	}

	@Override
	public int getTotalCntFavorite(Favorite favorite) {
		return cboardDao.getTotalCntFavorite(favorite);
	}
	
	@Override
	public CmtPaging getCmtPaging(int curPage, int cno) {
		int totalCount = cboardDao.CntCmt(cno);
		CmtPaging cmtPaging = new CmtPaging(totalCount,curPage);
		
		return cmtPaging;
	}
	

	@Override
	public List<HashMap<String, Object>> cmtList(CmtPaging cmtPaging, int cno) {
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("paging", cmtPaging);
		map.put("cno", cno);
		
		return cboardDao.CmtList(map);
	}

	@Override
	public int getCntCmt(int cno) {
		int totalCount = cboardDao.CntCmt(cno);
		return totalCount;
	}

	


	@Override
	public Comment writeCmt(Comment cmt) {
		cboardDao.insertCmt(cmt);
		
		int cono = cmt.getCono();
		System.out.println("<댓글번호> : " + cono );
		Comment cmtInsert = cboardDao.selectCmtByCmtNo(cono);
		return cmtInsert;
		
	}
	
	@Override
	public void cboardCmt(int cno) {
		cboardDao.cboardCmt(cno);
	}

	@Override
	public void updateCommt(Comment cmt) {
		cboardDao.updateCmt(cmt);
		
	}

	@Override
	public void deleteCmt(int cono) {
		cboardDao.deleteCmt(cono);
		
	}


	





	}





