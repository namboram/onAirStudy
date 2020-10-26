package com.kh.onairstudy.diary.model.vo;

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

public class Diary implements Serializable{
	
	private int no;
	private String diaryTitle;
	private String memberId;
	private Date diaryDate;
	private String diaryContent;
	private int readCnt;
	
	private int fileCount;
	private List<DiaryAttachment> attachList;
	
}
