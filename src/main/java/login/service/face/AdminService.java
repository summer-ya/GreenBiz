package login.service.face;

import login.dto.Admin;

public interface AdminService {

	/**
	 * 관리자 로그인 인증 처리
	 * 사원번호와 관리자 권한이 부여된 사원번호가 일치하는 행의 숫자를 반환
	 * 
	 * @param member - 사원번호와 관리자 권한이 부여된 사원번호
	 * @return 로그인 인증 결과 (true - 로그인 인증 성공, false - 로그인 인증 실패)
	 */
	public boolean adminLogin(Admin admin);
}
