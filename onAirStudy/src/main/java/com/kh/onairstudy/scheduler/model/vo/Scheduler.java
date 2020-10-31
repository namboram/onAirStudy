package com.kh.onairstudy.scheduler.model.vo;

import java.io.Serializable;
import java.sql.Date;

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

public class Scheduler implements Serializable{
	
	private String no;
	private String memberId;
	private String srNo;
	private Date startDate;
	private Date endDate;
	private String content;
	private String colorCode;
	private String scheduleYN;
	private String dYN;
	private String timeOpt;
	private String enabledYN;


}
