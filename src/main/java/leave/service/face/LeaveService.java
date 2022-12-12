package leave.service.face;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import approval.dto.Paging;
import leave.dto.Leave;

public interface LeaveService {

//	public Paging getPaging(int curPage);

	public List<HashMap<String, String>> leavelist(Map<String, Object> map);

	public void leaveWrite(Leave leave);

	public int findnextno(); 
}
