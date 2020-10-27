package com.kh.onairstudy.studyroom.model.vo;

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
public class StudyRoomInfo {

	private int srNo;
	private String srTitle;
	private String srGoal;
	private String srComment;
	private int attendanceCnt;
	private String attendDay;
	private String attendTime;
	private int ranking;
	private int forceExitOpt;
	private String forceExitYN;
	private String srOpenedYN;
	private String category;
	
}
