package com.kh.onairstudy.servicecenter.model.vo;

import java.io.Serializable;
import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@Getter
@Setter
//@NoArgsConstructor
//@AllArgsConstructor
@ToString

public class ServiceCenter implements Serializable{
	
	private int no;
	private int category;
	private String serviceStatus;
	private String serviceTitle;
	private String serviceContent;
	private int reply_no;
	private String memberId;
	private Date serviceDate;
	private String read_yn;
	private int serviceLevel;
	
	
}
