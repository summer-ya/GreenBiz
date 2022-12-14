package leave.dto;

import lombok.Data;

@Data
public class CompanyModel {
	private String id;
	private String name;
	private int depth;
	private String parentid;
}
