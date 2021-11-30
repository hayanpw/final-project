package show.vo;

import lombok.Data;

@Data
public class Show {
	private int showNo;
	private String showName;
	private String showStart;
	private String showEnd;
	private String ShowTime;
	private int showAge;
	private String showContent;
	private int showPrice;
	private int showSeat;
	private String filepath;
	private String showHall;
	private double showStar;
	public Show() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Show(int showNo, String showName, String showStart, String showEnd, String showTime, int showAge,
			String showContent, int showPrice, int showSeat, String filepath, String showHall, double showStar) {
		super();
		this.showNo = showNo;
		this.showName = showName;
		this.showStart = showStart;
		this.showEnd = showEnd;
		ShowTime = showTime;
		this.showAge = showAge;
		this.showContent = showContent;
		this.showPrice = showPrice;
		this.showSeat = showSeat;
		this.filepath = filepath;
		this.showHall = showHall;
		this.showStar = showStar;
	}

	public int getShowNo() {
		return showNo;
	}
	public void setShowNo(int showNo) {
		this.showNo = showNo;
	}
	public String getShowName() {
		return showName;
	}
	public void setShowName(String showName) {
		this.showName = showName;
	}
	public String getShowStart() {
		return showStart;
	}
	public void setShowStart(String showStart) {
		this.showStart = showStart;
	}
	public String getShowEnd() {
		return showEnd;
	}
	public void setShowEnd(String showEnd) {
		this.showEnd = showEnd;
	}
	public String getShowTime() {
		return ShowTime;
	}
	public void setShowTime(String showTime) {
		ShowTime = showTime;
	}
	public int getShowAge() {
		return showAge;
	}
	public void setShowAge(int showAge) {
		this.showAge = showAge;
	}
	public String getShowContent() {
		return showContent;
	}
	public void setShowContent(String showContent) {
		this.showContent = showContent;
	}
	public int getShowPrice() {
		return showPrice;
	}
	public void setShowPrice(int showPrice) {
		this.showPrice = showPrice;
	}
	public int getShowSeat() {
		return showSeat;
	}
	public void setShowSeat(int showSeat) {
		this.showSeat = showSeat;
	}
	public String getFilepath() {
		return filepath;
	}
	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}
	public String getShowHall() {
		return showHall;
	}
	public void setShowHall(String showHall) {
		this.showHall = showHall;
	}
	public double getShowStar() {
		return showStar;
	}
	public void setShowStar(double showStar) {
		this.showStar = showStar;
	}
}
