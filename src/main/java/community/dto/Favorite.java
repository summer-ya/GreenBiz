package community.dto;

public class Favorite {
	
	private int hno;
	private int cno;
	private String memberno;
	
	public Favorite() {}

	public Favorite(int hno, int cno, String memberno) {
		super();
		this.hno = hno;
		this.cno = cno;
		this.memberno = memberno;
	}

	@Override
	public String toString() {
		return "Like [hno=" + hno + ", cno=" + cno + ", memberno=" + memberno + "]";
	}

	public int getHno() {
		return hno;
	}

	public void setHno(int hno) {
		this.hno = hno;
	}

	public int getcno() {
		return cno;
	}

	public void setcno(int cno) {
		this.cno = cno;
	}

	public String getMemberno() {
		return memberno;
	}

	public void setMemberno(String memberno) {
		this.memberno = memberno;
	}
	
	

}
