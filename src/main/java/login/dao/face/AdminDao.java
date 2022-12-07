package login.dao.face;

import login.dto.Admin;

public interface AdminDao {

	/**
	 * 사원번호랑 관리자 권한 부여된 사용자 일치
	 *  -> 관리자 인증에 사용
	 * 
	 * @param admin - 관리자 인증 정보
	 * @return 일치하는 행의 수
	 */
	public int selectCntByAdminIdPw(Admin admin);
}
