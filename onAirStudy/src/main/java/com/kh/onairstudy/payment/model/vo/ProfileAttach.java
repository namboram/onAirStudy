package com.kh.onairstudy.payment.model.vo;

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
public class ProfileAttach implements Serializable{
	private int no;
	private String memberId;
	private String originalFilename;
	private String renamedFilename;
	private String filePath;
}
