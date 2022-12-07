package schedule.dto;

import lombok.Builder;
import lombok.Data;

@Builder
@Data
public class Schedule {

	private int scheduleno;
	private String memberno;
	private String title;
	private String startdate;
	private String enddate;
	private String memo;
	private String scvar;
	private String allDay;
	private String username;
	private String backgroundcolor;
	
	public Schedule(int scheduleno, String memberno, String title, String startdate, String enddate, String memo,
			String scvar, String allDay, String username, String backgroundcolor) {
		super();
		this.scheduleno = scheduleno;
		this.memberno = memberno;
		this.title = title;
		this.startdate = startdate;
		this.enddate = enddate;
		this.memo = memo;
		this.scvar = scvar;
		this.allDay = allDay;
		this.username = username;
		this.backgroundcolor = backgroundcolor;
	}
	public Schedule() {
	}
	
	
	
	
}
