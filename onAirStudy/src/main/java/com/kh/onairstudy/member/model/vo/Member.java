package com.kh.onairstudy.member.model.vo;

import java.io.Serializable;
import java.util.Date;

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

public class Member implements Serializable{

		   private String memberId;
		   private String memberName;
		   private String password;
		   private String memberRole;
		   private String phone;
		   private int diligentPoint;
		   private String blacklist;
		   private String withdraw;
		   private String comment;
		   private int category;
		   private Date enrollDate;
		   
		   private String mPic;

		
	}


