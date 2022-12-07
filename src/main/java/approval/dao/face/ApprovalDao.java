package approval.dao.face;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import approval.dto.AppDetail;
import approval.dto.Approval;
import approval.dto.CompanyModel;
import approval.dto.Member;
import approval.dto.Paging;

public interface ApprovalDao {

	public List<HashMap<String, Object>> selectDeptList();

	public List<CompanyModel> getCompanyTree();

	public List<Member> selectMemberList(String memid);

	public int findApprovalNo();

	/**
	 * 기안자 저장
	 * @param approval
	 */
	public void insertWriter(Approval approval);

	/**
	 * 결재자 저장
	 * @param map
	 */
	public void insertApprovalConfirm(Map<String, Object> map);
	
	/**기안번호로 기안가져오기
	 * 
	 * @param approval
	 * @return
	 */
	public Approval selectapproval(Approval approval);
	
    public int selectAll();

    public List<HashMap<String, String>> appList(Map<String, Object> map);

    /**기안번호로 결재자 리스트 받아오기
     * 
     * @param approval
     * @return
     */
	public List<AppDetail> selectByApprovalNo(Approval approval);

	/**
	 * 기안번호,반려자사번,반려 사유 처리
	 * 
	 * @param reject
	 */
	public void updateAppDetailReject(AppDetail reject);
	
	/**
	 * 기안번호, 승인자 사번 , 승인 의견
	 * 
	 * @param confirmOk
	 */
	public void updateAppDetailOk(AppDetail confirmOk);
	
    /**
     * 결재함 리스트(결재완료, 결재 대상건)
     * 
     * @param paging
     * @return
     */
    public List<HashMap<String, String>> listpage(Paging paging);

	/**로그인 사번, 기안번호로 기안 결재 상태 가져오기
	 * 
	 * @param loginId
	 * @param approval
	 * @return
	 */
	public AppDetail selectAppStatebyloginId(Map<String, Object> map);

	/**
	 * 결재완료 리스트 받기
	 * 
	 * @param map
	 * @return
	 */
	public List<HashMap<String, String>> selectAppOkList(Map<String, Object> map);


}
