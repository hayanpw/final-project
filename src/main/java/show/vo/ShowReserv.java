package show.vo;

import lombok.Data;

@Data
public class ShowReserv {
	private int reservNo;
	private int showNo;
	private String memberId;
	private String showDate;
	private String reservDate;
}
