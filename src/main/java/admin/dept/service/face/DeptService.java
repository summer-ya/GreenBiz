package admin.dept.service.face;

import java.util.List;
import java.util.Map;

import admin.dept.dto.Dept;

public interface DeptService {

	/**
	 * 페이징이 적용된 게시글 목록 조회
	 * 
	 * @param paging - 페이징 정보 객체
	 * @return 페이징이 적용된 게시글 목록
	 */
	public List<Dept> list(Dept deptNum);

	/**
	 * 게시글 상세보기
	 * 
	 * @param viewBoard - 상세 조회할 게시글 번호 객체
	 * @return 조회된 상세 게시글 객체
	 */
	public Dept view(Dept viewDept);

	public List<Dept> deptList();

	public List<Map<String, Object>> memberByDeptNum(Map<String, Object> map);
}
