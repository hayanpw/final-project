package show.vo;

import lombok.Data;

@Data
public class Seat {
	private int keyNo;
	private int reservNo;
	private int showNo;
	private String reservDate;
	private String seatNo;
	private int seatPrice;
	private int seatLevel;
}
