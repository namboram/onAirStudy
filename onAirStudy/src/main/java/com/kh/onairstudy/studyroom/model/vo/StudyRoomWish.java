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

public class StudyRoomWish implements Serializable{
	
	private int no;
	private String memberId;
	private int srNo;
	private String wTitle;
	private String wComment;
	
	private String wCategory;
	private char wStatus;

}
