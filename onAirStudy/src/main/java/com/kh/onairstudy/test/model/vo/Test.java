package com.kh.onairstudy.test.model.vo;

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

public class Test implements Serializable{
	
	private int no;
	private int testNo;
	private String memberId;
	private int srNo;
	private String testQuestion;
	private int testAnswer;
	private String testChoice_1;
	private String testChoice_2;
	private String testChoice_3;
	private String testChoice_4;
	private String filePath;
	private String renamedFilename;
	

}
