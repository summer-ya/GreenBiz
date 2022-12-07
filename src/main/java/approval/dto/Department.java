package approval.dto;

import lombok.Builder;
import lombok.Data;

@Builder
@Data
public class Department {

 private String	deptnum;
 private String	parentno;
 private String	deptname;
 
}
