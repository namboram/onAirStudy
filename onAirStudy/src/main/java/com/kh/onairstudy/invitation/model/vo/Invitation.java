package com.kh.onairstudy.invitation.model.vo;

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

public class Invitation implements Serializable{

	private int no;
	private String hostingId;
	private String invitiedId;
	private int srNo;
	private Date invitationDate;
	private char invitationYN;
	
	private String sTitle;
	private String sGoal;
	
	private String catetory;
	
}
