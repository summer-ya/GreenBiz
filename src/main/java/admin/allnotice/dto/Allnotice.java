package admin.allnotice.dto;

import java.sql.Timestamp;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Allnotice {
	private int allNoticeNo;
	private String adminNo;
	private String noticeTitle;
	private Timestamp noticeDate;
	private String noticeContent;
}
