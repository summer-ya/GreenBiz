package leave.service.face;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import approval.dto.Paging;
import leave.dto.Leave;
import leave.dto.Member;

public interface LeaveService {

//	public Paging getPaging(int curPage);

	public List<HashMap<String, String>> leavelist(Map<String, Object> map);

	public void leaveWrite(Leave leave);

	public int findnextno();

	public Paging getMainPaging(int curPage, String loginId);

	public List<Member> getDetpList(String deptnum);

	public Member getApprovalMember(String deptnum); 
	
	public List<HashMap<String, String>> requestLeaveList(Map<String, Object> map);
}
