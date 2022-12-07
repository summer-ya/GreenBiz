package board.service.face;

import java.util.List;

import board.dto.Reply;

public interface BoardReplyService {

	public void cmtList(Reply reply);

	public List<Reply> getList(int bno);

	public void insertCmt(Reply reply);

	public void updateCmt(Reply reply);

	public void deleteCmt(int no);



}
