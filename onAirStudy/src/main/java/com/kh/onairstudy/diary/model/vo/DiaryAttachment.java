package com.kh.onairstudy.diary.model.vo;

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
public class DiaryAttachment implements Serializable{

	private int no;
	private int diaryNo;
	private String originalFilename;
	private String renamedFilename;
	
	
}
