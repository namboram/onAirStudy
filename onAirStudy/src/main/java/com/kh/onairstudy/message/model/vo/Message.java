package com.kh.onairstudy.message.model.vo;

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

public class Message implements Serializable{
	
	int no;
	String senderId;
	String receiverId;
	String msgContent;
	Date sendDate;
	String readYN;
	String receiverDelYN;
	String senderDelYN;
	
	String vaildYN;

}
