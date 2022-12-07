package approval.dto;

import lombok.Builder;
import lombok.Data;


@Builder
@Data
public class Approval {
	private int approvalNo; //기안 번호
	private String memberNo; //기안자 사번
	private String memberName; //기안자
	private String appTitle; //기안 제목
	private String appTime;  //기안 작성 시간
	private String appContent; //기안 내용
	private String deptName; //부서 이름

	public Approval(int approvalNo, String memberNo, String memberName, String appTitle, String appTime,
			String appContent, String deptName) {
		super();
		this.approvalNo = approvalNo;
		this.memberNo = memberNo;
		this.memberName = memberName;
		this.appTitle = appTitle;
		this.appTime = appTime;
		this.appContent = appContent;
		this.deptName = deptName;
	}
	
	public Approval() {}

	
	
	

}
