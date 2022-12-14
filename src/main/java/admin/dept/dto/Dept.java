package admin.dept.dto;

import lombok.AllArgsConstructor;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Dept {
	private int deptNum;
	private String adminNo;
	private String deptName;
	
	private String memberNo;
	private String memberName;
	private String rank;
	private String memState;
	private String birth;
	private String phone;
	private String address;
	private String email;
	private String leaveTotal;
	
}


