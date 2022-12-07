package community.dto;


public class CommImg {

	private int cfileno;
	private int cno;
	private String coriginname;
	private String cstoredname;
	private int cfilesize;

	
	public CommImg() {}

	public CommImg(int cfileno, int cno, String coriginname, String cstoredname, int cfilesize, String cthumbnail) {
		super();
		this.cfileno = cfileno;
		this.cno = cno;
		this.coriginname = coriginname;
		this.cstoredname = cstoredname;
		this.cfilesize = cfilesize;

	}

	@Override
	public String toString() {
		return "CommImg [cfileno=" + cfileno + ", cno=" + cno + ", coriginname=" + coriginname + ", cstoredname="
				+ cstoredname + ", cfilesize=" + cfilesize + "]";
	}

	public int getCfileno() {
		return cfileno;
	}

	public void setCfileno(int cfileno) {
		this.cfileno = cfileno;
	}

	public int getCno() {
		return cno;
	}

	public void setCno(int cno) {
		this.cno = cno;
	}

	public String getCoriginname() {
		return coriginname;
	}

	public void setCoriginname(String coriginname) {
		this.coriginname = coriginname;
	}

	public String getCstoredname() {
		return cstoredname;
	}

	public void setCstoredname(String cstoredname) {
		this.cstoredname = cstoredname;
	}

	public int getCfilesize() {
		return cfilesize;
	}

	public void setCfilesize(int cfilesize) {
		this.cfilesize = cfilesize;
	}

	

	
		
	}


