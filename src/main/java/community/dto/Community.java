package community.dto;

import java.sql.Timestamp;


public class Community {
	
	private int cno;
	private String memberno;
	private String ctitle;
	private String ccontent;
	private int chit;
	private Timestamp cdate;
	private String cstoredname;
	private int cono;

	public Community() {}

	public Community(int cno, String memberno, String ctitle, String ccontent, int chit, Timestamp cdate,
			String cstoredname, int cono) {
		super();
		this.cno = cno;
		this.memberno = memberno;
		this.ctitle = ctitle;
		this.ccontent = ccontent;
		this.chit = chit;
		this.cdate = cdate;
		this.cstoredname = cstoredname;
		this.cono = cono;
	}

	@Override
	public String toString() {
		return "Community [cno=" + cno + ", memberno=" + memberno + ", ctitle=" + ctitle + ", ccontent=" + ccontent
				+ ", chit=" + chit + ", cdate=" + cdate + ", cstoredname=" + cstoredname + ", cono=" + cono + "]";
	}

	public int getCno() {
		return cno;
	}

	public void setCno(int cno) {
		this.cno = cno;
	}

	public String getMemberno() {
		return memberno;
	}

	public void setMemberno(String memberno) {
		this.memberno = memberno;
	}

	public String getCtitle() {
		return ctitle;
	}

	public void setCtitle(String ctitle) {
		this.ctitle = ctitle;
	}

	public String getCcontent() {
		return ccontent;
	}

	public void setCcontent(String ccontent) {
		this.ccontent = ccontent;
	}

	public int getChit() {
		return chit;
	}

	public void setChit(int chit) {
		this.chit = chit;
	}

	public Timestamp getCdate() {
		return cdate;
	}

	public void setCdate(Timestamp cdate) {
		this.cdate = cdate;
	}

	public String getCstoredname() {
		return cstoredname;
	}

	public void setCstoredname(String cstoredname) {
		this.cstoredname = cstoredname;
	}

	public int getCono() {
		return cono;
	}

	public void setCono(int cono) {
		this.cono = cono;
	}

	
}
