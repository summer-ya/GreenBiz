package approval.dto;

import lombok.Builder;
import lombok.Data;

@Builder
@Data
public class AppFile {
	
	private String appFileNo; //파일저장번호
	private int approvalNo; //기안번호
	private String appFileName;  //originName
	private String appFileSaveName; //storedName
	

	public AppFile() {}


	public AppFile(String appFileNo, int approvalNo, String appFileName, String appFileSaveName) {
		super();
		this.appFileNo = appFileNo;
		this.approvalNo = approvalNo;
		this.appFileName = appFileName;
		this.appFileSaveName = appFileSaveName;
	}

	
}
