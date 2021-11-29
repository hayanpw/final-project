package kr.or.addition.model.vo;

import lombok.Data;

@Data
public class Board {

	private int boardNo;
	private String boardWriter;
	private String boardTitle;
	private String boardContent;
	private int readCount;
	private String regDate;
	private String filename;
	private String filepath;
	private int boardType;
	private int bnum;
}
