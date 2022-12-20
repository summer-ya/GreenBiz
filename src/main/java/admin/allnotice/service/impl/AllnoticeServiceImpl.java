package admin.allnotice.service.impl;

import java.io.File;



import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import admin.allnotice.dao.face.AllnoticeDao;
import admin.allnotice.dto.Allnotice;
import admin.allnotice.dto.AllnoticeFile;
import admin.allnotice.service.face.AllnoticeService;
import admin.allnotice.util.Apaging;

@Service
public class AllnoticeServiceImpl implements AllnoticeService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired AllnoticeDao allnoticeDao;

	@Autowired ServletContext context;
	
	@Override
	public Apaging getPaging(int curPage) {
		
		//총 게시글 수 조회
		int totalCount = allnoticeDao.selectCntAll();
		
		//페이징 계산
		Apaging aPaging = new Apaging(totalCount, curPage);
		
		return aPaging;
	}

	@Override
	public List<Allnotice> list(Apaging aPaging) {
		return allnoticeDao.selectAllList(aPaging);
	}
	
	@Override
	public Allnotice view(Allnotice viewAllnotice) {
		
		//상세보기 조회 결과 리턴
		return allnoticeDao.selectAllnotice(viewAllnotice);
	}

	@Override
	public void write(Allnotice allnotice, MultipartFile file) {
		logger.info("write start");
		//게시글 처리
		if( "".equals( allnotice.getNoticeTitle() ) ) {
			allnotice.setNoticeTitle("(제목없음)");
		}
		
		allnoticeDao.insertAllnotice(allnotice);
		
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
		AllnoticeFile allnoticeFile = new AllnoticeFile();
		allnoticeFile.setAllnoticeNo( allnotice.getAllnoticeNo() );
		allnoticeFile.setOriginName(originName);
		allnoticeFile.setStoredName(storedName);
		
		allnoticeDao.insertFile(allnoticeFile);		
		
	}
	
	@Override
	public AllnoticeFile getAttachFile(Allnotice viewAllnotice) {
		return allnoticeDao.selectAllnoticeFileByAllnoticeNo(viewAllnotice);
	}
	
	@Override
	public AllnoticeFile getFile(AllnoticeFile allnoticeFile) {
		return allnoticeDao.selectAllnoticeFileByFileNo(allnoticeFile);
	}
	
	@Override
	public void update(Allnotice allnotice, MultipartFile file) {
		
		//게시글 처리
		if( "".equals( allnotice.getNoticeTitle() ) ) {
			allnotice.setNoticeTitle("(제목없음)");
		}
		
		allnoticeDao.updateAllnotice(allnotice);
		
		//--------------------------------------------
		
		//첨부파일 처리
		
		logger.info("file {}", file);
		
		//빈 파일일 경우
		if( file == null || file.getSize() <= 0 ) {
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
		AllnoticeFile allnoticeFile = new AllnoticeFile();
		allnoticeFile.setAllnoticeNo( allnotice.getAllnoticeNo() );
		allnoticeFile.setOriginName(originName);
		allnoticeFile.setStoredName(storedName);
		
		//기존에 게시글에 연결된 첨부파일을 삭제한다
		allnoticeDao.deleteFile(allnotice);
		
		allnoticeDao.insertFile(allnoticeFile);		
		
	}
	
	@Override
	public void delete(Allnotice allnotice) {
		
		//첨부파일 삭제
		allnoticeDao.deleteFile(allnotice);
		
		//게시글 삭제
		allnoticeDao.delete(allnotice);
		
	}

	public Logger getLogger() {
		return logger;
	}

	public void setLogger(Logger logger) {
		this.logger = logger;
	}
	
	

	//슬기추가
	@Override
	public List<mainPage.dto.Allnotice> allnoticelist() {
    // TODO Auto-generated method stub
	return allnoticeDao.selectAllNotice();
	}

}




