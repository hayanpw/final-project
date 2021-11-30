package kr.or.reading.model.vo;

import lombok.Data;

@Data
public class ReadingBlack {

	private int blackNo;
	private String blackStart;
	private String blackEnd;
	private String blackId;
	
//	BLACK_NO	    number	        primary key,
//	BLACK_START	    date	        NOT NULL,	-- '관리자에 의해 등록된 시점'
//	BLACK_END	    date	        NOT NULL,	-- '등록일자+7일후 00시'
//	BLACK_ID	    varchar2(20)	NOT NULL    REFERENCES MEMBER(MEMBER_ID) ON DELETE CASCADE
}
