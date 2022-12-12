package leave.service.serviceImpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import approval.dto.Paging;
import leave.dao.face.LeaveDao;
import leave.dto.Leave;
import leave.service.face.LeaveService;

@Service
public class LeaveServiceImpl implements LeaveService{
	
	@Autowired LeaveDao leaveDao;
	
	/*
	 * @Override public Paging getPaging(int curPage) {
	 * 
	 * return leaveDao.listpage(paging);
	 * 
	 * }
	 */
	
	//listpaging
	/*
	 * @Override public Paging getListPaging(int curPage) {
	 * 
	 * int totalCount = approvalDao.selectCntListPaging(); Paging paging = new
	 * Paging(totalCount, curPage); return paging ; }
	 */
	
	/*
	 * @Override public List<HashMap<String, String>> leavelist(Map<String, Object>
	 * map) {
	 * 
	 * return LeaveDao.; }
	 */
	
	@Override
	public void leaveWrite(Leave leave) {
		leaveDao.insertLeave(leave);
	}

	@Override
	public List<HashMap<String, String>> leavelist(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public int findnextno() {
		return leaveDao.findleaveNo();
	}

}
