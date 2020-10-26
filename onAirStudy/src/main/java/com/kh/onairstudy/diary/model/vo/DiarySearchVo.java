package com.kh.onairstudy.diary.model.vo;

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
public class DiarySearchVo extends ListPageVo {

	private String title;
	private String memberId;
	private long bbs_sno;		//
	private long blt_rsrc_sno; //게시글번호


}
