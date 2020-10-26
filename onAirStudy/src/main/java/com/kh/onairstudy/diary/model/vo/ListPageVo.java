package com.kh.onairstudy.diary.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class ListPageVo  {

	private int startRow; 
	private int endRow;
	private int pageIndex=1; //현재페이지
	private int pageSize = 10;  //한페이지에 나오는 게시물
	private int pageGroupSize = 3; //한페이지에 보여지는 번호수  
}
