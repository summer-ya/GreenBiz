package login.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import login.dao.face.AdminDao;
import login.dto.Admin;
import login.service.face.AdminService;
import login.service.face.MemberService;

@Service
public class AdminServiceImpl implements AdminService {
	
	// 로그 객체
	private static final Logger logger = LoggerFactory.getLogger(MemberService.class);

		// DAO 객체
	@Autowired private AdminDao adminDao;

	@Override
	public boolean adminLogin(Admin admin) {

		logger.info("adminlogin() {}", admin);
		
		if(adminDao.selectCntByAdminIdPw(admin) > 0) {
			return true;
		}
		return false;
	}

}
