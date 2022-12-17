package leave.dao.face;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import leave.dto.Leave;
import leave.dto.Member;

public interface LeaveDao {


	public int findleaveNo();

	public void insertLeave(Leave leave);

	public List<HashMap<String, String>> leaveMainList(Map<String, Object> map);

	public int selectCntAll(String loginId);

	public List<Member> selectDeptList(String deptnum);

	public Member getApprovalMember(String deptnum);

	public List<HashMap<String, String>> requestLeaveList(Map<String, Object> map);

	public void confirmLeave(Map<String, Object> map);
	
	public Leave getLeaveByNo(int no);

}
