package approval.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import approval.dao.face.ApprovalDao;
import approval.dto.AppDetail;
import approval.dto.AppFile;
import approval.dto.Approval;
import approval.dto.CompanyModel;
import approval.dto.Member;
import approval.dto.Paging;
import approval.service.face.ApprovalService;

@Service
public class ApprovalServiceImpl implements ApprovalService {

	@Autowired ApprovalDao approvalDao;
	private Logger logger = LoggerFactory.getLogger(ApprovalServiceImpl.class);
	//서블릿 컨텍스트 객체
		@Autowired ServletContext context;
	
	@Override
	public List<HashMap<String, Object>> selectTreeList() {

		logger.info("ApprovalServiceImpl 실행");
		return approvalDao.selectDeptList();
		
	}

	@Override
	public List<CompanyModel> getCompanyTree() {
		logger.info("ApprovalServiceImpl 실행");
		return approvalDao.getCompanyTree();
	}


	//아이디로 멤버리스트 받아오기
	@Override
	public List<Member> getMemberList(String memid) {
		return approvalDao.selectMemberList( memid );
	}

	//기안자 결재자 저장
	@Override
	public void appWriterSave(Approval approval) {
		approvalDao.insertWriter(approval);
	}
	
	//저장할 기안 번호 받아오기
	@Override
	public int findnextno() {
		return approvalDao.findApprovalNo();
	}
	
	@Override
	public void appDetailSave(Map<String, Object> map) {
		approvalDao.insertApprovalConfirm(map);
		
	}
	
	@Override
	public Approval selectApprovalWriter(Approval approval) {
		return approvalDao.selectapproval(approval);
	}

    @Override
    public Paging getPaging(int curPage) {

      int totalCount = approvalDao.selectAll();
      Paging paging = new Paging(totalCount, curPage);
      return paging ;
    }

    @Override
    public List<HashMap<String, String>> applist(Map<String, Object> map) {
      return approvalDao.appList(map);
    }
    
    @Override
    public List<AppDetail> selectAppDetail(Approval approval) {
    	return approvalDao.selectByApprovalNo(approval);
    }
    
    @Override
    public void rejectUpdate(AppDetail reject) {
    	approvalDao.updateAppDetailReject(reject);
    }
    
    @Override
    public void confirmOkUpdate(AppDetail confirmOk) {
    	approvalDao.updateAppDetailOk(confirmOk);
    	
    }
    
    //결재함 리스트(결재완료, 결재 대상건)
   @Override
   public List<HashMap<String, String>> listpage(Paging paging) {
        return approvalDao.listpage(paging);
   }
   
   //로그인 사번자 결재 상태 받아오기
   @Override
   public AppDetail selecConfirmInfo(Map<String,Object> map) {
	return approvalDao.selectAppStatebyloginId(map);
   }
  
   //결재완료 리스트 받아오기
   @Override
	public List<HashMap<String, String>> appOklist(Map<String, Object> map) {
		return approvalDao.selectAppOkList(map);
	}
   
   //기안별 첨부파일 저장
   @Override
   public void fileSave(int approvalno, MultipartFile file) {
	   logger.info("filesave() {}", file);
		if(file.getSize() <= 0) {
			logger.info("파일의 크기가 0, 처리 중단");
			
			return;
		}
		
		//파일이 저장될 경로(RealPath)
		String storedPath = context.getRealPath("upload");
		logger.info("upload realPath: {}", storedPath);
		
		//upload폴더가 존재하지 않으면 생성한다
		File storedFolder = new File(storedPath);
		if( !storedFolder.exists() ) {
			storedFolder.mkdir();
		}
		
		//저장될 파일이름 생성하기
		String storedName = file.getOriginalFilename(); //원본 파일명
		storedName += UUID.randomUUID().toString().split("-")[0];
		logger.info("storedName : {} " , storedName);
		
		//실제 저장될 파일의 객체
		File dest = new File( storedFolder,storedName);
		
		try {
			//업로드된 파일 upload폴더에 저장하기
			file.transferTo(dest);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		
		//DB에 기록할 정보 객체 - DTO
		AppFile storedfile = new AppFile();
		
		storedfile.setApprovalNo(approvalno);
		storedfile.setAppFileName(file.getOriginalFilename());
		storedfile.setAppFileSaveName(storedName);
		
		approvalDao.insertFile( storedfile);
	
   }
   
   //기안별 첨부파일 가져오기
    @Override
	public AppFile selectAppFile(Approval approval) {
		return approvalDao.selectFileByApprovalNo(approval);
	}
    
  //결재 승인전 내용(Content) 수정
    @Override
    public void approvalUpdate(Approval readUpdate) {
       approvalDao.appUpdate(readUpdate);
       
    }
    //기안 삭제
	@Override
	public void approvalDelete(Approval approvalDelete) {
		approvalDao.appDelete(approvalDelete);
		
	}

	//appdetail 삭제
	@Override
	public void appdetailDelete(AppDetail detailDelete) {
		approvalDao.detailDelete(detailDelete);
	}

	//첨부파일 삭제
	@Override
	public void appfileDelete(AppFile appfileDelete) {
		approvalDao.appfileDelete(appfileDelete);
	}
    
	//listpaging
    @Override
    public Paging getListPaging(int curPage) {

      int totalCount = approvalDao.selectCntListPaging();
      Paging paging = new Paging(totalCount, curPage);
      return paging ;
    }
    
    //mainpaging
    @Override
    public Paging getMainPaging(int curPage, String loginId) {
    	int totalCount = approvalDao.selectCntMainPaging(loginId);
        Paging paging = new Paging(totalCount, curPage);
        return paging ;
    }
	
}
