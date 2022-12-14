package approval.service.face;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import approval.dto.AppDetail;
import approval.dto.AppFile;
import approval.dto.Approval;
import approval.dto.CompanyModel;
import approval.dto.Member;
import approval.dto.Paging;

public interface ApprovalService {

	public List<HashMap<String, Object>> selectTreeList();

	public List<CompanyModel> getCompanyTree();

	public List<Member> getMemberList(String name);

	//기안자 저장
	public void appWriterSave(Approval approval);

	//기안번호 받아오기
	public int findnextno();

	//결재자 저장
	public void appDetailSave(Map<String, Object> map);

	public Approval selectApprovalWriter(Approval approval);

	public Paging getPaging(int curPage);

	public List<HashMap<String, String>> applist(Map<String, Object> map);

	//기안번호로 결재자 리스트 가져오기
	public List<AppDetail> selectAppDetail(Approval approval);

	//기안 반려 처리
	public void rejectUpdate(AppDetail reject);

	//기안 승인 처리
	public void confirmOkUpdate(AppDetail confirmOk);
	
	public List<HashMap<String, String>> listpage(Paging paging);

	//로그인 사번자 결재 상태 받아오기
	public AppDetail selecConfirmInfo(Map<String, Object> map);

	public List<HashMap<String, String>> appOklist(Map<String, Object> map);

	//파일 저장
	public void fileSave(int approvalno, MultipartFile file);

	//파일 불러오기
	public AppFile selectAppFile(Approval approval);
	
	//기안내용 수정
	public void approvalUpdate(Approval readUpdate);

	//기안 삭제
	public void approvalDelete(Approval approvalDelete);
	public void appdetailDelete(AppDetail detailDelete);
	public void appfileDelete(AppFile appfileDelete);

	//listpaging
	public Paging getListPaging(int curPage);

	//mainpaging
	public Paging getMainPaging(int curPage, String loginId);
}
