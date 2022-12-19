package mainPage.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Allnotice {
	private int allnoticeNo;
	private String adminNo;
	private int noticeScope;
	private String noticeTitle;
	private Timestamp noticeDate;
	private String noticeContent;
}
