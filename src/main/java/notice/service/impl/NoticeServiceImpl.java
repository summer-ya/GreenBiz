package notice.service.impl;

import java.util.List;



import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import notice.dao.face.NoticeDao;
import notice.dto.NoticeDTO;
import notice.service.face.NoticeService;
import notice.util.NoticePaging;

@Service
public class NoticeServiceImpl implements NoticeService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired NoticeDao noticeDao;
	
	@Override
	public NoticePaging getPaging(int curPage) {
		
		//총 게시글 수 조회
		int totalCount = noticeDao.selectCntAll();
		
		//페이징 계산
		NoticePaging paging = new NoticePaging(totalCount, curPage);
		
		return paging;
	}

	@Override
	public List<NoticeDTO> list(NoticePaging paging) {
		return noticeDao.selectList(paging);
	}
	
	@Override
	public NoticeDTO view(NoticeDTO viewNotice) {
		return null;
	}
	
	
}
