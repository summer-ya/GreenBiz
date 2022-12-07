package community.service.face;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import board.dto.Board;
import community.dto.CommImg;
import community.dto.Community;
import community.util.Cpaging;

public interface CboardService {

	public Cpaging getPaging(Cpaging cpage);

	public List<Community> list(Cpaging cpaging);


	public Community view(Community cboard);


	public void write(Community cboard, MultipartFile file);

	public CommImg getAttachFile(Community cboard);
	
	public CommImg getFile(CommImg commImg);
	
	public void update(Community cboard, MultipartFile file);
	

	public void delete(Community cboard);


	


}
