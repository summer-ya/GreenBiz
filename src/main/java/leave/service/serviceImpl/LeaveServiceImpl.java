package leave.service.serviceImpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import approval.dto.Paging;
import leave.dao.face.LeaveDao;
import leave.dto.Leave;
import leave.dto.Member;
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
	public HashMap<String, Object> leavelist(String memberNo) {
		return leaveDao.leaveMainList(memberNo);
	}
	
	@Override
	public int findnextno() {
		return leaveDao.findleaveNo();
	}
	

	@Override
	public Paging getMainPaging(int curPage, String deptName) {
		
		//총 게시글 수 조회
				int totalCount = leaveDao.selectCntAll(deptName);
				
		//페이징 계산
				Paging paging = new Paging(totalCount, curPage);
				
		return paging;
	}
	
	//부서원 리스트 불러오기
	@Override
	public List<Member> getDetpList(String deptnum) {
		
		return leaveDao.selectDeptList(deptnum);
	}

	@Override
	public Member getApprovalMember(String deptnum) {
		return leaveDao.getApprovalMember(deptnum);
	}

	@Override
	public List<HashMap<String, Object>> requestLeaveList(Map<String, Object> map) {
		return leaveDao.requestLeaveList(map);
	}

	@Override
	public void confirmLeave(Map<String, Object> map) {
		leaveDao.confirmLeave(map);
	}

	@Override
	public Leave getLeaveByNo(int no) {
		return leaveDao.getLeaveByNo(no);
	}

	@Override
	public List<Leave> getLeaveListByMemberNo(String memberNo) {
		return leaveDao.getLeaveListByMemberNo(memberNo);
	}

	@Override
	public Paging getLeaveListByMemberNoCnt(int curPage, String memberNo) {
		
		//총 게시글 수 조회
		int totalCount = leaveDao.getLeaveListByMemberNoCnt(memberNo);
		
		//페이징 계산
				Paging paging = new Paging(totalCount, curPage);
				
		return paging;
	}
	
	
}
