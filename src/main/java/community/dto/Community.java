package community.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class Community {
	
	private int cno;
	private String memberno;
	private String ctitle;
	private String ccontent;
	private int chit;
	private Timestamp cdate;

	public Community() {}

	public Community(int cno, String memberno, String ctitle, String ccontent, int chit, Timestamp cdate) {
		super();
		this.cno = cno;
		this.memberno = memberno;
		this.ctitle = ctitle;
		this.ccontent = ccontent;
		this.chit = chit;
		this.cdate = cdate;
	}

	
	
	
	
	
}
