package notice.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class NoticeDTO {
	private int allNotice_no;
	private String adminNo;
	private String noticeCategory;
	private String noticeTitle;
	private String noticeDate;
	private String noticeContent;
}
