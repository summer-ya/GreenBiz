package leave.dao.face;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import leave.dto.Leave;
import leave.dto.Member;

public interface LeaveDao {


	public int findleaveNo();

	public void insertLeave(Leave leave);

	public HashMap<String, Object> leaveMainList(String membrNo);

	public int selectCntAll(String loginId);

	public List<Member> selectDeptList(String deptnum);

	public Member getApprovalMember(String deptnum);

	public List<HashMap<String, Object>> requestLeaveList(Map<String, Object> map);

	public void confirmLeave(Map<String, Object> map);
	
	public Leave getLeaveByNo(int no);
	
	public List<Leave> getLeaveListByMemberNo(String memberNo);

	public int getLeaveListByMemberNoCnt(String memberNo);

}
