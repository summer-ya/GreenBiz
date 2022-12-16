package board.service.impl;


import java.io.File;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import board.dao.face.BoardDao;
import board.dto.Board;
import board.dto.BoardFile;
import board.dto.Reply;
import board.service.face.BoardService;
import board.util.Paging;

@Service
public class BoardServiceImpl implements BoardService {

	private static final Logger logger = LoggerFactory.getLogger(BoardService.class);

	@Autowired private BoardDao boardDao;

	@Autowired ServletContext context;

	@Override
	public Paging getPaging(Paging inDate) {
		logger.info("inDate 값 확인 : {}", inDate);
		
		//총 게시글 수 조회
		int totalCount = boardDao.selectCntAll(inDate);
		
		//페이징 계산
		Paging paging = new Paging(totalCount,inDate.getCurPage());
		
		return paging;
	}

//	@Override
//	public List<Board> list(Paging paging) {
//		return boardDao.selectPageList(paging);
//	}
//	
//	


	@Override
	public Board view(Board viewBoard) {

		//조회수 증가
		boardDao.updateHit(viewBoard);

		//상세보기 조회 결과 리턴
		return boardDao.selectBoard(viewBoard);
	}

	@Override
	public void write(Board board, MultipartFile file) {

		//게시글 처리
		if("".equals(board.getBtitle())) {
			board.setBtitle("제목없음음");
		}
		boardDao.insertBoard(board);

		//-----------------------------

		//첨부파일 처리

		//빈 파일일 경우
		if(file.getSize() <= 0) {
			return;
		}

		//파일이 저장될 경로
		String storedPath = context.getRealPath("upload");
		File storedFolder = new File( storedPath );
		if( !storedFolder.exists() ) { 
			storedFolder.mkdir();
		}

		//파일이 저장될 이름
		String originName = file.getOriginalFilename();
		String storedName = originName + UUID.randomUUID().toString().split("-")[4];

		//저장할 파일의 정보 객체
		File dest = new File(storedFolder, storedName);

		try {
			file.transferTo(dest);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		//----------------------------------

		//첨부파일 정보 DB 기록
		BoardFile boardFile = new BoardFile();
		boardFile.setBno(board.getBno());
		boardFile.setOriginname(originName);
		boardFile.setStoredname(storedName);
		boardFile.setFilesize((int)file.getSize());

		boardDao.insertFile(boardFile);


	}

	@Override
	public BoardFile getAttachFile(Board viewBoard) {
		return boardDao.selectBoardFileByBoardNo(viewBoard);
	}

	@Override
	public BoardFile getFile(BoardFile boardFile) {
		return boardDao.selectBoardFileByFileNo(boardFile);
	}

	@Override
	public void update(Board board, MultipartFile file) {
		//게시글 처리
		if( "".equals( board.getBtitle() ) ) {
			board.setBtitle(null);
		}

		boardDao.updateBoard(board);

		//--------------------------------------------

		//첨부파일 처리

		//빈 파일일 경우
		if( file.getSize() <= 0 ) {
			return;
		}

		//파일이 저장될 경로
		String storedPath = context.getRealPath("upload");
		File storedFolder = new File( storedPath );
		if( !storedFolder.exists() ) {
			storedFolder.mkdir();
		}

		//파일이 저장될 이름
		String originName = file.getOriginalFilename();
		String storedName = originName + UUID.randomUUID().toString().split("-")[4];

		//저장할 파일의 정보 객체
		File dest = new File( storedFolder, storedName );

		try {
			file.transferTo(dest);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		//--------------------------------------------

		//첨부파일 정보 DB 기록
		BoardFile boardFile = new BoardFile();
		boardFile.setBno(board.getBno());
		boardFile.setOriginname(originName);
		boardFile.setStoredname(storedName);
		boardFile.setFilesize((int)file.getSize());

		//기존에 게시글에 연결된 첨부파일을 삭제한다
		boardDao.deleteFile(board);

		boardDao.insertFile(boardFile);		

	}

	@Override
	public void delete(Board board) {
		//첨부파일 삭제
		boardDao.deleteFile(board);

		//게시글 삭제
		boardDao.delete(board);

	}

	@Override
	public List<Reply> cmtList(Board board) {
		
		return boardDao.selectCmtList(board);
	}

	@Override
	public List<Reply> getCmtsList(Board board) {
		return boardDao.selectCmtsList(board);
	}


//	@Override
//	public List<Board> hitList() {
//		return boardDao.selectHitList();
//	}

	
	@Override
	public List<Board> list(Paging paging, String category, String sort) {
		HashMap<String, Object> map = new HashMap<>();
	    map.put("search", paging.getSearch());
		map.put("startNo", paging.getStartNo());
		map.put("endNo", paging.getEndNo());
		map.put("category", category);
		map.put("sort", sort);
		
		return boardDao.selectPageList(map);
	}









}


