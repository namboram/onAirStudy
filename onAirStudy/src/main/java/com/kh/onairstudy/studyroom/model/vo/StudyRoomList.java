package com.kh.onairstudy.studyroom.model.vo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

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

public class StudyRoomList implements Serializable{
	
	private int srNo;
	private String memberId;
	private Date srEnrollDate;
	private int srCategory;
	private int srHeadCnt;
	private char srOpenedYN;
	private char srEndedYN;
	private char srSort;
	
	private String sTitle;
	private String srPic;
	private String mPic;
	private int srRanking;
	private int wishNo;

	private List <ProfileAttachment> proList;
	private List <StudyRoom> sRoom;
	private List <StudyRoomLog> srLog;


}
