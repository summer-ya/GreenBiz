package login.service.face;

import java.util.List;

import login.dto.Member;

public interface MemberService {

	/**
	 * 로그인 인증 처리
	 * 사원번호와 PW를 조회하여 행 Count를 이용하여 처리한다
	 * 
	 * @param member - 로그인에 사용할 사원번호랑 비밀번호 정보
	 * @return 로그인 인증 결과 (true - 로그인 인증 성공, false - 로그인 인증 실패)
	 */
	public boolean login(Member member);

	/**
	 * 사번 찾기
	 * 등록된 사원이름과 이메일로 조회하여 행 카운트를 한다
	 * 
	 * @param member - 사번 찾기 위한 이름과 이메일 정보
	 * @return 로그인 인증 결과 (true-인증 성공, false - 인증 실패)
	 */
	public boolean findNo(Member member);

	/**
	 * 전달된 사원 이름을 이용하여 사원 정보 조회하기
	 * 
	 * @param member - 조회할 사원이름
	 * @return 조회된 사원 정보
	 */
	public Member info(Member member);

	/**
	 * 비밀번호 찾아서 변경하기
	 * 등록된 사원 번호와 이메일을 활용해 조회하여 행 카운드틑 진행
	 * 
	 * @param member - 비밀번호 변경을 위한 사원번호와 이메일 정보
	 * @return 조회 결과 true-인증 성공, false-인증 실패
	 */
	public boolean findPw(Member member);

	/**
	 * 전달된 사원이름과 이메일을 이용하여 비밀번호 찾기
	 * 
	 * @param member - 조회할 사원 정보
	 * @return 조회된 사원 정보
	 */
	public Member infoPw(Member member);

	/**
	 * 전달된 사원이름과 이메일을 이용하여 조회된 회원의 비밀번호 변경하기
	 * 
	 * @param member - 조회할 사원 정보
	 * @return 조회된 사원 정보
	 */
	public void changePassword(Member member);

	/**
	 * 사원의 목록 조회
	 * 
	 * @return 사원 전체 목록
	 */
	public List<Member> list();

}
