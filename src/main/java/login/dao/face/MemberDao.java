package login.dao.face;

import login.dto.Admin;

import java.util.HashMap;
import java.util.List;

import login.dto.Member;

public interface MemberDao {

	/**
	 * 로그인 사원번호랑 일치하는 행의 수 구하기
	 *  -> 로그인 인증에 사용
	 * 
	 * @param loginParam - 로그인 정보
	 * @return 일치하는 행의 수
	 */
	public int selectCntByIdPw(Member member);

	/**
	 * 사원 이름과 이메일이 일치하는 행의 수 구하기
	 * 
	 * @param loginParam - 회원 정보
	 * @return 일치하는 행의 수
	 */
	public int selectLoginCntByNameEmail(Member member);

	/**
	 * 전달된 사원 이름을 이용하여 사원정보 조회
	 * 
	 * @param member - 조회하려는 대상의 사원이름
	 * @return 조회된 사원 정보
	 */
	public Member selectFindByName(Member member);

	/**
	 * 사원번호와 이메일이 일치하는 행의 수 구하기
	 * 
	 * @param loginParam - 사원 정보
	 * @return 일치하는 행의 갯수
	 */
	public int selectCntByNoEmail(Member member);

	/**
	 * 전달된 사원이름과 이메일을 이용하여 비밀번호 찾기
	 * 
	 * @param member 조회하려는 사원 정보
	 * @return 조회된 사원 정보
	 */
	public Member selectFindByNameEmail(Member member);

	/**
	 * 전달된 사원의 이름과 이메일을 이용하여 비밀번호 변경하기
	 * 
	 * @param member 조회하려는 사원 정보
	 * @return 조회된 사원 정보
	 */
	public void updatePw(Member member);


	/**
	 * 
	 * @return
	 */
	public List<Member> selectMemberNo();

	/**
	 * 
	 * @param member
	 * @return
	 */
	public Member selectMyPageByMemberNo(Member member);

	/**
	 * 사원 정보 전체 조회
	 * @return
	 */
	public List<Member> selectAll();

	public HashMap<String, String> selectByMemberno(String member);
}
