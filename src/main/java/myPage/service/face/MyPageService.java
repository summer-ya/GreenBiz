package myPage.service.face;

import java.util.List;

import myPage.controller.MyPageController;
import myPage.dto.Member;

public interface MyPageService {

	List<MyPageController> myPageList();
	
	/**
	 * 
	 * @return
	 */
	List<Member> listMember(); //멤버 정보 조회
	
	public void myPageModify(Member member);//마이페이지수정



}
