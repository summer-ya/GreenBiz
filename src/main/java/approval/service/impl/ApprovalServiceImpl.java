package approval.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import approval.dao.face.ApprovalDao;
import approval.dto.AppDetail;
import approval.dto.Approval;
import approval.dto.CompanyModel;
import approval.dto.Member;
import approval.dto.Paging;
import approval.service.face.ApprovalService;

@Service
public class ApprovalServiceImpl implements ApprovalService {

	@Autowired ApprovalDao approvalDao;
	private Logger logger = LoggerFactory.getLogger(ApprovalServiceImpl.class);
	
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
    
}
