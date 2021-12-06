package kr.or.addition.model.vo;

import java.util.ArrayList;

import lombok.Data;

@Data
public class Board {

	private int boardNo;
	private String boardWriter;
	private String boardTitle;
	private String boardContent;
	private int readCount;
	private String regDate;
	private int boardType;
	private int bnum;
	private int commentCount;
	private ArrayList<FileVO> list;
}
