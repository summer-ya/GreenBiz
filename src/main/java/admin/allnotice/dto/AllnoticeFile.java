package admin.allnotice.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class AllnoticeFile {
	private int nFileno;
	private int allnoticeNo;
	private String originName;
	private String storedName;
	private int filSize;
}
