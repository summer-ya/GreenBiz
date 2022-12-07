package board.dao.face;


import java.util.HashMap;

import java.util.List;

import board.dto.Board;
import board.dto.BoardFile;
import board.dto.Reply;
import board.util.Paging;

public interface BoardDao {


	/**
	 * 전체 게시글 수
	 * 
	 * @return
	 */
	public int selectCntAll(Paging inDate);

	/** 
	 * 페이징 적용된 게시글 
	 * @param paging - 페이징 적용 게시글
	 * @return 
	 */
	public List<Board> selectPageList(Paging paging);

	/**
	 * 댓글
	 * @param board
	 * @return
	 */
	public List<HashMap<String, Object>> selectBycomment(Board board);

	/**
	 * 
	 * @param board
	 * @return
	 */
	public List<Integer> selectCommentslist(Board board);

	/**
	 * 조회하려는 게시글의 조회수를 1 증가시킨다
	 * 
	 * @param viewBoard - 조회된 게시글 번호
	 */
	public void updateHit(Board viewBoard);

	/**
	 * 게시글 번호를 이용하여 게시글을 조회한다
	 * 
	 * @param viewBoard - 조회하려는 게시글 번호
	 * @return 조회된 게시글 정보
	 */
	public Board selectBoard(Board viewBoard);

	/**
	 * 게시글 정보를 삽입한다
	 * 
	 * @param board - 삽입할 게시글 정보
	 */
	public void insertBoard(Board board);

	/**
	 * 첨부파일 정보를 삽입한다
	 * 
	 * @param boardFile
	 */
	public void insertFile(BoardFile boardFile);

	/**
	 * 게시글 번호를 이용하여 첨부파일 정보를 조회한다
	 * 
	 * @param viewBoard - 조회할 게시글 번호
	 * @return 조회된 첨부파일 정보
	 */
	public BoardFile selectBoardFileByBoardNo(Board viewBoard);
	
	/**
	 * 파일 번호를 이용하여 첨부파일 정보를 조회한다
	 * 
	 * @param boardFile - 조회할 첨부파일 객체
	 * @return 조회된 첨부파일 정보
	 */
	public BoardFile selectBoardFileByFileNo(BoardFile boardFile);

	/**
	 * 게시글 정보를 수정한다
	 * 
	 * @param board - 수정할 게시글 정보
	 */
	public void updateBoard(Board board);
	
	/**
	 * 게시글을 참조하고 있는 모든 첨부파일 삭제
	 * 
	 * @param board - 첨부파일을 삭제할 게시글 번호
	 */
	public void deleteFile(Board board);

	/**
	 * 게시글 삭제
	 * 
	 * @param board - 삭제할 게시글 번호
	 */
	public void delete(Board board);

	public List<Reply> selectCmtList(Board board);

	public List<Reply> selectCmtsList(Board board);



	


	
}
