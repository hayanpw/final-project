package kr.or.space.model.vo;

import java.util.ArrayList;

import lombok.Data;

@Data
public class SpacePageNavi {
	private ArrayList<UseBoard> list;
	private String pageNavi;
	private int start;
}
