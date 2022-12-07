package approval.dto;

import lombok.Builder;
import lombok.Data;

@Builder
@Data
public class AppDetail {
	private int id;  //pk
	private int approvalNo;  //FK 기안번호
	private String memberNo; //결재자 사번
	private String confirmName; //결재자 이름
	private int appState; //결재 상태 0: 대기 , 1: 결재 , 2:반려
	private String appReject; //반려 사유
	private String appComment; //결재 의견
	private int status; //결재순번
	private String rank; //
	
	public AppDetail(int id, int approvalNo, String memberNo, String confirmName, int appState, String appReject,
			String appComment, int status, String rank) {
		super();
		this.approvalNo = approvalNo;
		this.memberNo = memberNo;
		this.confirmName = confirmName;
		this.appState = appState;
		this.appReject = appReject;
		this.appComment = appComment;
		this.status = status;
		this.rank = rank;
	}
	


	public AppDetail() {}
	


}
