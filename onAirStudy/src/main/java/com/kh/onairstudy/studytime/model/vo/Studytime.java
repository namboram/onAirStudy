package com.kh.onairstudy.studytime.model.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
//@NoArgsConstructor
//@AllArgsConstructor
@ToString
public class Studytime {
	
	private int no;
	private String memberId;
	private int studyTime;
	private Date studyDate;
	

}
