package board.dto;

import java.sql.Timestamp;

public class Board {
	
	private int bno;
	private String memberno;
	private String btitle;
	private String bcontent;
	private int bhit;
	private Timestamp bdate;
	private String storedname;
	private String memberName; 
	private int recnt;
	
	
	public Board() {}


	public Board(int bno, String memberno, String btitle, String bcontent, int bhit, Timestamp bdate, String storedname,
			String memberName, int recnt) {
		super();
		this.bno = bno;
		this.memberno = memberno;
		this.btitle = btitle;
		this.bcontent = bcontent;
		this.bhit = bhit;
		this.bdate = bdate;
		this.storedname = storedname;
		this.memberName = memberName;
		this.recnt = recnt;
	}


	@Override
	public String toString() {
		return "Board [bno=" + bno + ", memberno=" + memberno + ", btitle=" + btitle + ", bcontent=" + bcontent
				+ ", bhit=" + bhit + ", bdate=" + bdate + ", storedname=" + storedname + ", memberName=" + memberName
				+ ", recnt=" + recnt + "]";
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


	public String getStoredname() {
		return storedname;
	}


	public void setStoredname(String storedname) {
		this.storedname = storedname;
	}


	public String getMemberName() {
		return memberName;
	}


	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}


	public int getRecnt() {
		return recnt;
	}


	public void setRecnt(int recnt) {
		this.recnt = recnt;

	}
}


	