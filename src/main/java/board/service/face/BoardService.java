package board.service.face;



import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import board.dto.BoardFile;
import board.dto.Reply;
import board.dto.Board;
import board.util.Paging;

public interface BoardService {


	/**
	 * 게시글 목록 페이징 객체
	 * 
	 * @param inDate 현제 페이지를 저장하고 있는 페이징 객체
	 * @return 페이징 계산 완료된 페이징 객체
	 */
	public Paging getPaging(Paging inDate);
	
	
	/**
	 * 페이징 적용된 게시글 목록 조회
	 * @param paging - 페이징 정보 객체
	 * @return 페이징 적용된 게시글 목록
	 */
	//public List<Board> list(Paging paging);
	
	/**
	 * 게시글 상세보기
	 * 
	 * @param viewBoard - 상세 조회할 게시글 번호 객체
	 * @return 조회된 상세 게시글 객체
	 */
	public Board view(Board viewBoard);
	
	/**
	 * 게시글 정보, 첨부파일 함께 처리
	 * 
	 * @param board - 게시글 정보 객체
	 * @param file - 첨부파일 정보 객체
	 */
	public void write(Board board, MultipartFile file);


	/**
	 * 게시글 번호를 이용하여 업로드된 파일 정보 조회
	 * 
	 * @param viewBoard - 조회할 게시글 번호 객체
	 * @return 첨부 파일 정보
	 */
	public BoardFile getAttachFile(Board viewBoard);

	/**
	 * 파일 번호를 이용하여 업로드된 파일 정보를 조회한다
	 * 
	 * @param boardFile - 조회할 파일 번호 객체
	 * @return 첨부 파일 정보
	 */
	public BoardFile getFile(BoardFile boardFile);

	/**
	 * 게시글 정보, 첨부파일을 함께 처리한다
	 * 
	 * @param board - 게시글 정보 객체
	 * @param file - 첨부파일 정보 객체
	 */
	public void update(Board board, MultipartFile file);


	/**
	 * 게시글 삭제 + 첨부파일 삭제
	 * 
	 * @param board
	 */
	public void delete(Board board);


	public List<Reply> cmtList(Board board);


	public List<Reply> getCmtsList(Board board);


	//public List<Board> list(Paging paging, String sort);

	
//	public List<Board> hitList();


	public List<Board> list(Paging paging, String category, String sort);
	

	
	


	

}
