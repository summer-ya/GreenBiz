package approval.dto;

import java.util.List;

import lombok.Data;

@Data
public class ResultModel {

	private int page;
	private int rowPerPage;
	private int records;
	private int pageNumber;
	private int total;
	private List<CompanyModel> rows;
}
