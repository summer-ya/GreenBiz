package leave.dto;

import lombok.Builder;
import lombok.Data;

@Builder
@Data
public class LeaveDetail {
	
	private int id;
	private int leaveNo;
	private String memberNo;
	private String memberName;
	private String rank;
	private int leaveState;
	public LeaveDetail(int id, int leaveNo, String memberNo, String memberName, String rank, int leaveState) {
		super();
		this.id = id;
		this.leaveNo = leaveNo;
		this.memberNo = memberNo;
		this.memberName = memberName;
		this.rank = rank;
		this.leaveState = leaveState;
	}
	public LeaveDetail() {
		super();
	}
	
	
	
	
}
