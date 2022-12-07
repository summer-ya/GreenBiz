package chat.dto;

import login.dto.Admin;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Member {

	private String memberNo;
	private int deptNum;
	private String memberName;
	private String rank;
	private String memState;
	private String hireDate;
	private String leaveDate;
	private String birth;
	private String phone;
	private String address;
	private String password;
	private String gender;
	private String email;
	private String leaveTotal;
	private String memfilePath;
	private String memfileName;
	
	private Admin admin;
	
	
	
}
