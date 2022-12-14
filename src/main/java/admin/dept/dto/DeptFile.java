package admin.dept.dto;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class DeptFile {
	
	private int mFileNo;
	private String memberNo;
	private String originName;
	private String storedName;
	private int fileSize;
	
}
