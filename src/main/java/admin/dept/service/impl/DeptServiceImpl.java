package admin.dept.service.impl;

import java.io.File;

import java.io.IOException;
import java.util.List;

import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import admin.allnotice.dto.Allnotice;
import admin.allnotice.dto.AllnoticeFile;
import admin.dept.dao.face.DeptDao;
import admin.dept.dto.Dept;
import admin.dept.dto.DeptFile;
import admin.dept.service.face.DeptService;

@Service
public class DeptServiceImpl implements DeptService {
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired DeptDao deptDao;

	@Autowired ServletContext context;

	@Override
	public List<Dept> list(Dept deptNum) {
		return deptDao.selectDeptList(deptNum);
	}
	
	@Override
	public Dept view(Dept viewDept) {
		logger.info("view test");
		//상세보기 조회 결과 리턴
		return deptDao.selectDeptView(viewDept);
	}

	@Override
	public List<Dept> deptList() {
		return deptDao.deptList() ;
	}

	

	@Override
	public void write(Dept dept, MultipartFile file) {
		
		deptDao.insertDept(dept);
		
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
		DeptFile deptFile = new DeptFile();
		deptFile.setMemberNo(dept.getMemberNo());
		deptFile.setOriginName(originName);
		deptFile.setStoredName(storedName);
		
		deptDao.insertFile(deptFile);		
		
	}
	
	@Override
	public DeptFile getAttachFile(Dept viewDept) {
		return deptDao.selectDeptFileByDeptNo(viewDept);
	}
	
	@Override
	public DeptFile getFile(DeptFile deptFile) {
		return deptDao.selectDeptFileByFileNo(deptFile);
	}
	
	@Override
	public void update(Dept dept, MultipartFile file) {
	
		//게시글 처리
		deptDao.updateDept(dept);
		
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
		DeptFile deptFile = new DeptFile();
		deptFile.setMemberNo(dept.getMemberNo());
		deptFile.setOriginName(originName);
		deptFile.setStoredName(storedName);
		
		//기존에 게시글에 연결된 첨부파일을 삭제한다
		deptDao.deleteFile(dept);
		
		deptDao.insertFile(deptFile);
		
	}
	
	@Override
	public void delete(Dept dept) {
		
		//첨부파일 삭제
		deptDao.deleteFile(dept);
		
		//게시글 삭제
		deptDao.delete(dept);
		
	}

	public Logger getLogger() {
		return logger;
	}

	public void setLogger(Logger logger) {
		this.logger = logger;
	}

//	@Override
//	public List<Map<String, Object>> memberById(Map<String, Object> map) {
//		// TODO Auto-generated method stub
//		return null;
//	}
//	
	@Override
	public List<Map<String, Object>> memberBydeptNum(Map<String, Object> map) {
		return deptDao.memberByid(map);
	}
	
}
