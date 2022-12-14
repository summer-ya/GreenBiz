package leave.dto;

import java.sql.Timestamp;

import lombok.Builder;
import lombok.Data;

@Builder
@Data
public class Leave {
	
	private  int leaveNo;
	private String memberNo;
	private String memberName;
	private int leaveTotal; 
	private int leaveUse; 
	private int leaveRemain;
	private String leaveReason;
	private String leaveConfirm;
	private String deptName;
	private String leaveTime;
	private String leaveStart;
	private String leaveEnd;
	private String leaveEtc;
	
//	private int id;
//	private String ApprovalNo;
//	private String ApprovalName;
//	private String ApprovalRank;
//	private int leaveState;
	
	public Leave(int leaveNo, String memberNo, String memberName, int leaveTotal, int leaveUse, int leaveRemain,
			String leaveReason, String leaveConfirm, String deptName, String leaveTime, String leaveStart,
			String leaveEnd, String leaveEtc) {
		super();
		this.leaveNo = leaveNo;
		this.memberNo = memberNo;
		this.memberName = memberName;
		this.leaveTotal = leaveTotal;
		this.leaveUse = leaveUse;
		this.leaveRemain = leaveRemain;
		this.leaveReason = leaveReason;
		this.leaveConfirm = leaveConfirm;
		this.deptName = deptName;
		this.leaveTime = leaveTime;
		this.leaveStart = leaveStart;
		this.leaveEnd = leaveEnd;
		this.leaveEtc = leaveEtc;
	}

	public Leave() {
		super();
	}

	
}


