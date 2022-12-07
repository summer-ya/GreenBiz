package board.dto;

import java.sql.Timestamp;

public class Board {
	
	private int bno;
	private String memberno;
	private String btitle;
	private String bcontent;
	private int bhit;
	private Timestamp bdate;
	
	
	public Board() {}
	
	public Board(int bno, String memberno, String btitle, String bcontent, int bhit, Timestamp bdate) {
		super();
		this.bno = bno;
		this.memberno = memberno;
		this.btitle = btitle;
		this.bcontent = bcontent;
		this.bhit = bhit;
		this.bdate = bdate;
	}

	@Override
	public String toString() {
		return "Board [bno=" + bno + ", memberno=" + memberno + ", btitle=" + btitle + ", bcontent=" + bcontent
				+ ", bhit=" + bhit + ", bdate=" + bdate + "]";
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getMemberno() {
		return memberno;
	}

	public void setMemberno(String memberno) {
		this.memberno = memberno;
	}

	public String getBtitle() {
		return btitle;
	}

	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}

	public String getBcontent() {
		return bcontent;
	}

	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}

	public int getBhit() {
		return bhit;
	}

	public void setBhit(int bhit) {
		this.bhit = bhit;
	}

	public Timestamp getBdate() {
		return bdate;
	}

	public void setBdate(Timestamp bdate) {
		this.bdate = bdate;
	}
	
	
}

	