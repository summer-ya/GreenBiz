package board.dto;

import lombok.Data;

@Data
public class BoardFile {
	
	private int bfileno;
	private int bno;
	private String originname;
	private String storedname;
	private int filesize;
	
	public BoardFile() {}

	public BoardFile(int bfileno, int bno, String originname, String storedname, int filesize) {
		super();
		this.bfileno = bfileno;
		this.bno = bno;
		this.originname = originname;
		this.storedname = storedname;
		this.filesize = filesize;
	}
	
	
}