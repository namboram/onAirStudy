package com.kh.onairstudy.warning.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@ToString
@Getter
@Setter
public class Warning {

	private int no;
	private String memberId;
	private int srNo;
	private int warningCnt;

}
