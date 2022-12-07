package login.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import login.dao.face.MemberDao;
import login.dto.Member;
import login.service.face.MemberService;


@Service
public class MemberServiceImpl implements MemberService{

	// 로그 객체
	private static final Logger logger = LoggerFactory.getLogger(MemberService.class);

		// DAO 객체
		@Autowired private MemberDao memberDao;
		
		@Override
		public boolean login(Member member) {

			logger.info("login() {}", member);
			
			if(memberDao.selectCntByIdPw(member) > 0) {
				return true;
			}
		
			return false;
		}
		
		@Override
		public boolean findNo(Member member) {
			logger.info("findNo: {}", member);
			
			if(memberDao.selectLoginCntByNameEmail(member) > 0) {
				return true;
			}
			return false;
		}
		
		@Override
		public Member info(Member member) {

			logger.info("info() FindName :{}", member.getMemberName());
			logger.info("info() FindEmail :{}", member.getEmail());
			
			return memberDao.selectFindByName(member);
		}
		
		@Override
		public boolean findPw(Member member) {
			logger.info("findPw: {}", member);
			if(memberDao.selectCntByNoEmail(member) > 0) {
				return true;
			}
			
			return false;
		}
		
		@Override
		public Member infoPw(Member member) {
			logger.info("info() FindNo :{}", member.getMemberNo());
			logger.info("info() FindEmail :{}", member.getEmail());
			return memberDao.selectFindByNameEmail(member);
		}
		
		@Override
		public void changePassword(Member member) {
			logger.info("info() changePassword/memberNo :{}", member.getMemberNo());
			logger.info("info() changePassword/email :{}", member.getEmail());
			memberDao.updatePw(member);
		}
		
		@Override
		public List<Member> list() {
			List<Member> list = memberDao.selectAll();
			return list;
		}

}
