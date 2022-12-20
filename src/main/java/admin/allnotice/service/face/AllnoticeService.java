package admin.allnotice.service.face;

import java.util.List;


import org.springframework.web.multipart.MultipartFile;

import admin.allnotice.dto.Allnotice;
import admin.allnotice.dto.AllnoticeFile;
import admin.allnotice.util.Apaging;

public interface AllnoticeService {

	/**
	 * 게시글 목록을 위한 페이징 객체를 생성한다
	 * 
	 * 파라미터 curPage(현재 페이지) DB에서 조회한 totalCount(총 게시글 수) 두 가지 데이터를 활용하여 페이징객체를 생성하여
	 * 반환한다
	 * 
	 * @param curPage - 요청 페이지 번호
	 * @return 계산이 완료된 Paging객체
	 */
	public Apaging getPaging(int curPage);

	/**
	 * 페이징이 적용된 게시글 목록 조회
	 * 
	 * @param aPaging - 페이징 정보 객체
	 * @return 페이징이 적용된 게시글 목록
	 */
	public List<Allnotice> list(Apaging aPaging);

	/**
	 * 게시글 상세보기
	 * 
	 * @param viewBoard - 상세 조회할 게시글 번호 객체
	 * @return 조회된 상세 게시글 객체
	 */
	public Allnotice view(Allnotice viewAllnotice);

	/**
	 * 게시글 정보, 첨부파일을 함께 처리한다
	 * 
	 * @param board - 게시글 정보 객체
	 * @param file - 첨부파일 정보 객체
	 */
	public void write(Allnotice allnotice, MultipartFile file);

	/**
	 * 게시글 번호를 이용하여 업로드된 파일 정보를 조회한다
	 * 
	 * @param viewBoard - 조회할 게시글 번호 객체
	 * @return 첨부 파일 정보
	 */
	public AllnoticeFile getAttachFile(Allnotice viewAllnotice);

	/**
	 * 파일 번호를 이용하여 업로드된 파일 정보를 조회한다
	 * 
	 * @param boardFile - 조회할 파일 번호 객체
	 * @return 첨부 파일 정보
	 */
	public AllnoticeFile getFile(AllnoticeFile allnoticeFile);

	/**
	 * 게시글 정보, 첨부파일을 함께 처리한다
	 * 
	 * @param board - 게시글 정보 객체
	 * @param file - 첨부파일 정보 객체
	 */
	public void update(Allnotice allnotice, MultipartFile file);

	/**
	 * 게시글 삭제 + 첨부파일 삭제
	 * 
	 * @param board
	 */
	public void delete(Allnotice allnotice);
	
	//슬기추가
	public List<mainPage.dto.Allnotice> allnoticelist();
}
