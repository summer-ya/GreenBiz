package myPage.dto;

import java.sql.Timestamp;
import lombok.Data;

@Data
public class Leave {
	
	private  int leaveNo;
	private  String memberNo;
	private int leaveTotal; 
	private int leaveUse; 
	private int leaveRemain;
	private Timestamp leaveDay;
	private String leaveReason;
	private String leaveConfirm;
	private String leaveForm;
	
}
