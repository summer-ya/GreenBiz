package board.dto;



public class Reply {
	
	private int replyno; //댓글 번호
	private int bno; //게시글 번호
	private String memberno; //작성자 사원번호
	private String recontent; //댓글 내용
	private String recreatedate; //댓글 작성일
	private int parentno; // 원댓글 번호 (원댓글일 경우 0)
	
	
	private String memberName; // 작성자 이름
	
	public Reply() {}


	public int getReplyno() {
		return replyno;
	}

	public void setReplyno(int replyno) {
		this.replyno = replyno;
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

	public String getRecontent() {
		return recontent;
	}

	public void setRecontent(String recontent) {
		this.recontent = recontent;
	}

	
	public int getParentno() {
		return parentno;
	}
	public void setParentno(int parentno) {
		this.parentno = parentno;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}


	public String getRecreatedate() {
		return recreatedate;
	}


	public void setRecreatedate(String recreatedate) {
		this.recreatedate = recreatedate;
	}


	public Reply(int replyno, int bno, String memberno, String recontent, String recreatedate, int parentno,
			String memberName) {
		super();
		this.replyno = replyno;
		this.bno = bno;
		this.memberno = memberno;
		this.recontent = recontent;
		this.recreatedate = recreatedate;
		this.parentno = parentno;
		this.memberName = memberName;
	}


	@Override
	public String toString() {
		return "Reply [replyno=" + replyno + ", bno=" + bno + ", memberno=" + memberno + ", recontent=" + recontent
				+ ", recreatedate=" + recreatedate + ", parentno=" + parentno + ", memberName=" + memberName + "]";
	}





}
