package myPage.dao.face;

import java.util.List;

import myPage.controller.MyPageController;
import myPage.dto.Leave;
import myPage.dto.Member;

public interface MyPageDao {

	/**
	 * 
	 * @return
	 */
	public List<Leave> selectLeave();

	/**
	 * 
	 * @return
	 */
	public List<MyPageController> selectMyPageByMemNo();

	/**
	 * 
	 * @return
	 */
	public List<Member> selectMemberNo();
	
	/**
	 * 
	 * @param member
	 */
	public void myPageModify(Member member);

	/**
	 * 
	 * @param member
	 * @return
	 */
	public Member selectMemberNo(Member member);
	
	

}
