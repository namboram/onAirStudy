package com.kh.onairstudy.attendance.model.vo;

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

public class Attendance implements Serializable{

	private int no;
	private int srNo;
	private String memberId;
	private int attendCnt;
	private Date attendDate;
	
}
