package admin.dept.dao.face;

import java.util.List;

import java.util.Map;
import admin.dept.dto.Dept;
import admin.dept.dto.DeptFile;
import login.dto.Member;


public interface DeptDao {
	
	
	/**
	 * 전체 게시글 수를 조회한다
	 * 
	 * @return 총 게시글 수
	 */
	public int selectCntDept();

	/**
	 * 페이징을 적용하여 게시글 목록 조회
	 * 
	 * @param paging - 페이징 정보 객체
	 * @return 페이징이 적용된 게시글 목록
	 */
	public List<Dept> selectDeptList(Dept deptNum);

	/**
	 * 게시글 번호를 이용하여 게시글을 조회한다
	 * 
	 * @param viewBoard - 조회하려는 게시글 번호
	 * @return 조회된 게시글 정보
	 */
	public Dept selectDeptView(Dept viewDept);

	/**
	 * 게시글 정보를 삽입한다
	 * 
	 * @param board - 삽입할 게시글 정보
	 */
	public void insertDept(Member member);
	
	/**
	 * 부서 리스트
	 * 
	 */
	public List<Dept> deptList();
	
	/**
	 * 부서 그리고 사원이름 직급에 따라 사원 검색
	 * 
	 * @param map(deptnum, [type, keyword]) //대괄호는 선택사항 
	 */
	public List<Map<String, Object>> memberByDeptNum(Map<String, Object> map);
	
	/**
	 * 게시글 번호를 이용하여 게시글을 조회한다
	 * 
	 * @param viewBoard - 조회하려는 게시글 번호
	 * @return 조회된 게시글 정보
	 */
	public Dept selectDept(Dept viewDept);

	/**
	 * 첨부파일 정보를 삽입한다
	 * 
	 * @param boardFile
	 */
	public void insertFile(DeptFile deptFile);

	/**
	 * 게시글 번호를 이용하여 첨부파일 정보를 조회한다
	 * 
	 * @param viewBoard - 조회할 게시글 번호
	 * @return 조회된 첨부파일 정보
	 */
	public DeptFile selectDeptFileByDeptNo(Dept dept);

	/**
	 * 파일 번호를 이용하여 첨부파일 정보를 조회한다
	 * 
	 * @param boardFile - 조회할 첨부파일 객체
	 * @return 조회된 첨부파일 정보
	 */
	public DeptFile selectDeptFileByFileNo(DeptFile deptFile);

	/**
	 * 게시글 정보를 수정한다
	 * 
	 * @param board - 수정할 게시글 정보
	 */
	public void updateDept(Dept dept);

	/**
	 * 사원을 참조하고 있는 모든 첨부파일 삭제
	 */
	public void deleteFile(String no);

	/**
	 * 사원 삭제
	 * 
	 * @param 삭제할 사원 번호
	 */
	public void delete(String no);

	public List<Map<String, Object>> memberByid(Map<String, Object> map);
	
}
