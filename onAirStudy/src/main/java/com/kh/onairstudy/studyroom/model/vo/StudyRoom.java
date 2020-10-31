package com.kh.onairstudy.studyroom.model.vo;

import java.io.Serializable;
import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
//@NoArgsConstructor
//@AllArgsConstructor
@ToString

public class StudyRoom implements Serializable{
	
	private int srNo;
	private String srTitle;
	private String srGoal;
	private String srComment;
	private int srAttendanceCnt;
	private int srRanking;
	private String attendDay;
	private String attendTime;
	private int forcedExitOpt;
	private char forcedExitYN;
	
	private int category;
	private String sCategory;
	private String memberId;
	private String wId;
	private String status;
	private char sleader;
	
	private List <ProfileAttachment> proList;
	private List <StudyRoomList> srList;
	private List <StudyRoomLog> srLog;

}
