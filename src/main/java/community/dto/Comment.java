package community.dto;

public class Comment {
	
	private int cono; //댓번호
	private int cno; //게시글 번호
	private String memberno; //사원번호
	private String cocontent; //댓글내용
	private String cocreatedate; //작성일
	
	private String memberName;
	
	public Comment() {}

	public Comment(int cono, int cno, String memberno, String cocontent, String cocreatedate, int parent_no,
			String memberName) {
		super();
		this.cono = cono;
		this.cno = cno;
		this.memberno = memberno;
		this.cocontent = cocontent;
		this.cocreatedate = cocreatedate;
		this.memberName = memberName;
	}

	@Override
	public String toString() {
		return "Comment [cono=" + cono + ", cno=" + cno + ", memberno=" + memberno + ", cocontent=" + cocontent
				+ ", cocreatedate=" + cocreatedate + ", parent_no=" + memberName + "]";
	}

	public int getCono() {
		return cono;
	}

	public void setCono(int cono) {
		this.cono = cono;
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

	public String getCocontent() {
		return cocontent;
	}

	public void setCocontent(String cocontent) {
		this.cocontent = cocontent;
	}

	public String getCocreatedate() {
		return cocreatedate;
	}

	public void setCocreatedate(String cocreatedate) {
		this.cocreatedate = cocreatedate;
	}

	
	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	
	

}
