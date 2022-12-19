package leave.service.face;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import approval.dto.Paging;
import leave.dto.Leave;
import leave.dto.Member;

public interface LeaveService {

//	public Paging getPaging(int curPage);

	public HashMap<String, Object> leavelist(String memberNo);

	public void leaveWrite(Leave leave);

	public int findnextno();

	public Paging getMainPaging(int curPage, String loginId);

	public List<Member> getDetpList(String deptnum);

	public Member getApprovalMember(String deptnum); 
	
	public List<HashMap<String, Object>> requestLeaveList(Map<String, Object> map);

	public void confirmLeave(Map<String, Object> map);
	
	public Leave getLeaveByNo(int no);
	
	public List<Leave> getLeaveListByMemberNo(String memberNo);
	
	public Paging getLeaveListByMemberNoCnt(int curPage, String memberNo);
}
