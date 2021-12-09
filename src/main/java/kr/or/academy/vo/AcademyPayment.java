package kr.or.academy.vo;

import lombok.Data;

@Data
public class AcademyPayment {
	private long paymentNo;
	private int paymentSelect;
	private int academyNo;
	private int exhibitionNo;
	private int paymentPrice;
	private String paymentDate;
	private int paymentCancel;
	private int paymentQuantity;
	private String academyTitle;
	private String academyPhoto;
	private String academyTeacher;
	private int memberNo;
}
