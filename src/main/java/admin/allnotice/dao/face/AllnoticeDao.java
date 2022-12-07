package admin.allnotice.dao.face;

import java.util.List;

import admin.allnotice.dto.Allnotice;
import admin.allnotice.dto.AllnoticeFile;
import admin.allnotice.util.Paging;

public interface AllnoticeDao {

	/**
	 * 전체 게시글 수를 조회한다
	 * 
	 * @return 총 게시글 수
	 */
	public int selectCntAll();

	/**
	 * 페이징을 적용하여 게시글 목록 조회
	 * 
	 * @param paging - 페이징 정보 객체
	 * @return 페이징이 적용된 게시글 목록
	 */
	public List<Allnotice> selectAllList(Paging paging);

	/**
	 * 조회하려는 게시글의 조회수를 1 증가시킨다
	 * 
	 * @param viewBoard - 조회된 게시글 번호
	 */
//	public void updateHit(Allnotice viewAllnotice);

	/**
	 * 게시글 번호를 이용하여 게시글을 조회한다
	 * 
	 * @param viewBoard - 조회하려는 게시글 번호
	 * @return 조회된 게시글 정보
	 */
	public Allnotice selectAllnotice(Allnotice viewAllnotice);

	/**
	 * 게시글 정보를 삽입한다
	 * 
	 * @param board - 삽입할 게시글 정보
	 */
	public void insertAllnotice(Allnotice allnotice);

	/**
	 * 첨부파일 정보를 삽입한다
	 * 
	 * @param boardFile
	 */
	public void insertFile(AllnoticeFile allnoticeFile);

	/**
	 * 게시글 번호를 이용하여 첨부파일 정보를 조회한다
	 * 
	 * @param viewBoard - 조회할 게시글 번호
	 * @return 조회된 첨부파일 정보
	 */
	public AllnoticeFile selectAllnoticeFileByAllnoticeNo(Allnotice viewAllnotice);

	/**
	 * 파일 번호를 이용하여 첨부파일 정보를 조회한다
	 * 
	 * @param boardFile - 조회할 첨부파일 객체
	 * @return 조회된 첨부파일 정보
	 */
	public AllnoticeFile selectAllnoticeFileByFileNo(AllnoticeFile allnoticeFile);

	/**
	 * 게시글 정보를 수정한다
	 * 
	 * @param board - 수정할 게시글 정보
	 */
	public void updateAllnotice(Allnotice allnotice);

	/**
	 * 게시글을 참조하고 있는 모든 첨부파일 삭제
	 * @param allnotice 
	 * 
	 * @param board - 첨부파일을 삭제할 게시글 번호
	 */
	public void deleteFile(Allnotice allnotice);

	/**
	 * 게시글 삭제
	 * 
	 * @param board - 삭제할 게시글 번호
	 */
	public void delete(Allnotice allnotice);
	
}
