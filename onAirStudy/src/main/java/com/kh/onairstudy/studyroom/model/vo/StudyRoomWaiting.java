package com.kh.onairstudy.studyroom.model.vo;

import java.io.Serializable;

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

public class StudyRoomWaiting implements Serializable{
	
	private int no;
	private String memberId;
	private int srNo;
	private String aTitle;
	private String aComment;
	
	private String aCategory;
	private char aStatus;
}
