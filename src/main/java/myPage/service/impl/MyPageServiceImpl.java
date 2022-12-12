package myPage.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import myPage.controller.MyPageController;
import myPage.dao.face.MyPageDao;
import myPage.dto.Member;
import myPage.service.face.MyPageService;

@Service
public class MyPageServiceImpl implements MyPageService{
	
	@Autowired MyPageDao myPageDao;

	@Override
	public List<MyPageController> myPageList() {
		
		return myPageDao.selectMyPageByMemNo();
	}

	@Override
	public List<Member> listMember() {
		
		return myPageDao.selectMemberNo();
	}
	
	@Override
	public void myPageModify(Member member) {
		
		myPageDao.myPageModify(member);
		
	}
	
	
	
	
	
}
