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
public class ProfileAttachment implements Serializable{
	private int no;
	private String memberId;
	private int srNo;
	private String originalFilename;
	private String renamedFilename;
	private String filePath;
}
