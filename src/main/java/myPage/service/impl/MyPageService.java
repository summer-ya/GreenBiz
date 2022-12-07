package myPage.service.impl;

import java.util.List;

import myPage.controller.MyPageController;
import myPage.dto.Member;

public interface MyPageService {

	List<MyPageController> myPageList();
	
	List<Member> listMember(); //멤버 정보 조회
	
	public void myPageModify(Member member);//마이페이지수정



}
