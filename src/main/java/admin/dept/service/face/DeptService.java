package admin.dept.service.face;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import admin.allnotice.dto.Allnotice;
import admin.allnotice.dto.AllnoticeFile;
import admin.dept.dto.Dept;
import admin.dept.dto.DeptFile;

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

	
	
	/**
	 * 게시글 정보, 첨부파일을 함께 처리한다
	 * 
	 * @param board - 게시글 정보 객체
	 * @param file - 첨부파일 정보 객체
	 */
	public void write(Dept dept, MultipartFile file);

	/**
	 * 게시글 번호를 이용하여 업로드된 파일 정보를 조회한다
	 * 
	 * @param viewBoard - 조회할 게시글 번호 객체
	 * @return 첨부 파일 정보
	 */
	public DeptFile getAttachFile(Dept viewDept);

	/**
	 * 파일 번호를 이용하여 업로드된 파일 정보를 조회한다
	 * 
	 * @param boardFile - 조회할 파일 번호 객체
	 * @return 첨부 파일 정보
	 */
	public DeptFile getFile(DeptFile deptFile);

	/**
	 * 게시글 정보, 첨부파일을 함께 처리한다
	 * 
	 * @param board - 게시글 정보 객체
	 * @param file - 첨부파일 정보 객체
	 */
	public void update(Dept dept, MultipartFile file);

	/**
	 * 게시글 삭제 + 첨부파일 삭제
	 * 
	 * @param board
	 */
	public void delete(Dept dept);

	public List<Map<String, Object>> memberBydeptNum(Map<String, Object> map);

	
}
