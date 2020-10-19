package com.kh.onairstudy.servicecenter.model.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
//@NoArgsConstructor
//@AllArgsConstructor
@ToString


public class ServiceContent {
	private int no;
	private int category;
	private String title;
	private String content;
	
}
