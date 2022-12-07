package board.dao.face;

import java.util.List;

import board.dto.Reply;

public interface BoardReplyDao {

	//댓글 db삽입
	public void insert(Reply reply);

	//게시글 번호에 맞는 댓글 목록 불러오기
	public List<Reply> selectRlistByBno(int bno);

	// 댓글 작성
	public void insertCmt(Reply reply);
	
	// 댓글 수정
	public void updateCmt(Reply reply);

	// 댓글 삭제
	public void deleteCmt(int no);

	// 자식 댓글 전체 삭제 
	public void deleteChildCmt(int no);


}
