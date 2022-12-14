package leave.dao.face;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import leave.dto.Leave;

public interface LeaveDao {


	public int findleaveNo();

	public void insertLeave(Leave leave);

	public List<HashMap<String, String>> leaveMainList(Map<String, Object> map);

	public int selectCntAll(String loginId);
	
	

}
