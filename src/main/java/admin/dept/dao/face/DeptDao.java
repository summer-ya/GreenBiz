package admin.dept.dao.face;

import java.util.List;
import java.util.Map;

import admin.allnotice.util.Paging;
import admin.dept.dto.Dept;


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
	public Dept selectDept(Dept viewDept);

	/**
	 * 게시글 정보를 삽입한다
	 * 
	 * @param board - 삽입할 게시글 정보
	 */
	public void insertDept(Dept dept);

	/**
	 * 게시글 정보를 수정한다
	 * 
	 * @param board - 수정할 게시글 정보
	 */
	public void updateDept(Dept dept);

	/**
	 * 게시글 삭제
	 * 
	 * @param board - 삭제할 게시글 번호
	 */
	public void delete(Dept dept);
	
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
	
}
