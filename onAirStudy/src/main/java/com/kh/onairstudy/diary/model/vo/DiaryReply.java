package com.kh.onairstudy.diary.model.vo;

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
public class DiaryReply implements Serializable{

	private int no; //댓글 번호
	private String memberId;
	private int diaryNo; //게시글 번호
	private String replyContent;
	private Date replyDate;
	
	
}
